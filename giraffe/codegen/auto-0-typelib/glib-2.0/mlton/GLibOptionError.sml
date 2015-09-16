structure GLibOptionError :>
  sig
    include
      G_LIB_OPTION_ERROR
        where type error_record_handler = GLibErrorRecord.handler
  end =
  struct
    datatype t =
      UNKNOWN_OPTION
    | BAD_VALUE
    | FAILED
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            UNKNOWN_OPTION => f 0
          | BAD_VALUE => f 1
          | FAILED => f 2
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => UNKNOWN_OPTION
          | 1 => BAD_VALUE
          | 2 => FAILED
          | n => raise Value n
      end
    exception Error of t
    type error_record_handler = GLibErrorRecord.handler
    val handler =
      GLibErrorRecord.makeHandler
        (
          "g-option-context-error-quark",
          C.fromVal,
          Error
        )
  end
exception GLibOptionError = GLibOptionError.Error
