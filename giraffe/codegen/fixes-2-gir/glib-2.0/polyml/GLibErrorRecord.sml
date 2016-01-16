structure GLibErrorRecord :>
  sig
    include G_LIB_ERROR_RECORD
      where type quark_t = GLibQuark.t

    structure PolyML :
      sig
        val PTR : C.notnull C.p PolyMLFFI.conversion
        val OPTPTR : unit C.p PolyMLFFI.conversion
        val OUTOPTREF : (unit, unit) C.r PolyMLFFI.conversion
      end
  end =
  struct
    type notnull = CPointer.notnull

    type 'a p = 'a CPointer.t
    val PTR = CPointer.PolyML.POINTER : notnull p PolyMLFFI.conversion
    val OPTPTR = CPointer.PolyML.POINTER : unit p PolyMLFFI.conversion

    type ('a, 'b) r = CPointer.PolyML.ref_
    val REF = CPointer.PolyML.cRef : ('a, 'b) r PolyMLFFI.conversion

    local
      open PolyMLFFI
    in
      val copy_ =
        call
          (load_sym libglib "g_error_copy")
          (PTR --> PTR)

      val free_ =
        call
          (load_sym libglib "g_error_free")
          (PTR --> FFI.PolyML.VOID)
    end

    type t = notnull p Finalizable.t
    type handler = t -> exn option

    exception Error of exn * t

    fun makeErrorExn handlers err =
      case List.mapPartial ($ err) handlers of
        []              => Error (Fail "unknown domain", err)
      | domainExn :: [] => Error (domainExn, err)
      | _ :: _ :: _     => Error (Fail "internal error: multiple domains", err)

    structure C =
      struct
        structure Pointer = CPointer
        type notnull = notnull
        type 'a p = 'a p

        fun withPtr f x = Finalizable.withValue (x, f)

        fun withOptPtr f =
          fn
            SOME ptr => withPtr (f o Pointer.toOptNull) ptr
          | NONE     => f Pointer.null


        type ('a, 'b) r = ('a, 'b) r

        fun withRefPtr f = withPtr (Pointer.PolyML.withRef f)

        fun withRefOptPtr f = withOptPtr (Pointer.PolyML.withRef f)


        fun fromPtr transfer ptr =
          let
            val object =
              Finalizable.new (
                if transfer
                then ptr  (* take the existing reference *)
                else copy_ ptr
              )
          in
            Finalizable.addFinalizer (object, free_);
            object
          end

        fun fromOptPtr transfer optptr =
          Option.map (fromPtr transfer) (Pointer.toOpt optptr)


        fun handleError f handlers =
          let
            val p & retVal = withRefOptPtr f NONE
          in
            case fromOptPtr true p of
              NONE     => retVal
            | SOME err => raise (makeErrorExn handlers err)
          end
      end

    structure PolyML =
      struct
        val PTR = PTR
        val OPTPTR = OPTPTR
        val OUTOPTREF = REF
      end

    local
      open PolyMLFFI
    in
      val getDomain_ =
        call
          (load_sym libgiraffeglib "giraffe_get_g_error_domain")
          (PolyML.PTR --> GLibQuark.PolyML.VAL)

      val getCode_ =
        call
          (load_sym libgiraffeglib "giraffe_get_g_error_code")
          (PolyML.PTR --> FFI.Enum.PolyML.VAL)

      val getMessage_ =
        call
          (load_sym libgiraffeglib "giraffe_get_g_error_message")
          (PolyML.PTR --> FFI.String.PolyML.RETPTR)
    end

    type quark_t = GLibQuark.t

    val domain =
      {
        get = fn self => (C.withPtr ---> GLibQuark.C.fromVal) getDomain_ self
      }

    val code =
      {
        get = fn self => (C.withPtr ---> I) getCode_ self
      }

    val message =
      {
        get = fn self => (C.withPtr ---> FFI.String.C.fromPtr false) getMessage_ self
      }

    fun makeHandler (domainName, fromVal, domainExn) =
      let
        fun domainHandler err =
          let
            val errQuark = #get domain err
          in 
            if errQuark = GLibQuark.fromString domainName
            then
              SOME (domainExn (fromVal (#get code err)))
                handle
                  Subscript =>
                    let
                      val msg = concat [
                        "internal error in error handler: unknown error code ",
                        Int32.toString (#get code err), " in error domain \"",
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
