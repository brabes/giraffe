structure GLibShellError :>
  sig
    include
      G_LIB_SHELL_ERROR
        where type errorrecord_handler = GLibErrorRecord.handler
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      BADQUOTING
    | EMPTYSTRING
    | FAILED
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            BADQUOTING => f 0
          | EMPTYSTRING => f 1
          | FAILED => f 2
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => BADQUOTING
          | 1 => EMPTYSTRING
          | 2 => FAILED
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.Enum.PolyML.VAL
        val REF = FFI.Enum.PolyML.REF
      end
    exception Error of t
    type errorrecord_handler = GLibErrorRecord.handler
    val handler =
      GLibErrorRecord.makeHandler
        (
          "g-shell-error-quark",
          C.fromVal,
          Error
        )
  end
exception GLibShellError = GLibShellError.Error