(* Copyright (C) 2013, 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GLibErrorRecord :>
  G_LIB_ERROR_RECORD
    where type quark_t = GLibQuark.t =
  struct
    structure Pointer = CPointerInternal
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p

    val cPtr = Pointer.PolyML.cVal : notnull p PolyMLFFI.conversion

    local
      open PolyMLFFI
    in
      val dup_ =
        call
          (load_sym libglib "g_error_copy")
          (cPtr --> cPtr)

      val free_ =
        call
          (load_sym libglib "g_error_free")
          (cPtr --> cVoid)

      val getType_ =
        call
          (load_sym libglib "g_error_get_type")
          (cVoid --> GObjectType.PolyML.cVal);
    end

    structure Record =
      BoxedRecord(
        structure Pointer = Pointer
        type notnull = notnull
        type 'a p = 'a p
        val dup_ = dup_
        val take_ = ignore
        val free_ = free_
      )
    open Record

    structure Type =
      BoxedType(
        structure Record = Record
        type t = t
        val getType_ = getType_
      )
    open Type

    local
      open PolyMLFFI
    in
      val getDomain_ =
        call
          (load_sym libgiraffeglib "giraffe_get_g_error_domain")
          (PolyML.cPtr --> GLibQuark.PolyML.cVal)

      val getCode_ =
        call
          (load_sym libgiraffeglib "giraffe_get_g_error_code")
          (PolyML.cPtr --> GInt.PolyML.cVal)

      val getMessage_ =
        call
          (load_sym libgiraffeglib "giraffe_get_g_error_message")
          (PolyML.cPtr --> Utf8.PolyML.cOutPtr)
    end

    type quark_t = GLibQuark.t

    val domain =
      {
        get = fn self => (FFI.withPtr ---> GLibQuark.FFI.fromVal) getDomain_ self
      }
    val code =
      {
        get = fn self => (FFI.withPtr ---> GInt.FFI.fromVal) getCode_ self
      }
    val message =
      {
        get = fn self => (FFI.withPtr ---> Utf8.FFI.fromPtr 0) getMessage_ self
      }

    exception Error of exn * t

    type handler = t -> exn option

    fun makeErrorExn handlers err =
      case List.mapPartial (fn handler => handler err) handlers of
        []              => Error (Fail "unknown domain", err)
      | domainExn :: [] => Error (domainExn, err)
      | _ :: _ :: _     => Error (Fail "internal error: multiple domains", err)

    fun handleError f handlers =
      let
        val optErr & retVal = (FFI.withRefOptPtr ---> FFI.fromOptPtr true && I) f NONE
      in
        case optErr of
          NONE     => retVal
        | SOME err => raise (makeErrorExn handlers err)
      end

    fun makeHandler (domainName, fromVal, domainExn) =
      let
        fun domainHandler err =
          let
            val errQuark = #get domain err
          in
            if errQuark = GLibQuark.fromString domainName
            then
              SOME (domainExn ((FFI.withPtr ---> fromVal) getCode_ err))
                handle
                  _ =>
                    let
                      val msg = concat [
                        "internal error in error handler: unknown error code ",
                        LargeInt.toString (#get code err), " in error domain \"",
                        GLibQuark.toString errQuark, "\"\n"
                      ]
                    in
                      GiraffeLog.critical msg;
                      SOME (Fail "unknown code")
                    end
            else
              NONE
          end
      in
        domainHandler
      end
  end
exception GLibError = GLibErrorRecord.Error
