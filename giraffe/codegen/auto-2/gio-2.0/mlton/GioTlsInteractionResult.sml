structure GioTlsInteractionResult :>
  sig
    include GIO_TLS_INTERACTION_RESULT
  end =
  struct
    datatype t =
      UNHANDLED
    | HANDLED
    | FAILED
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            UNHANDLED => f 0
          | HANDLED => f 1
          | FAILED => f 2
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => UNHANDLED
          | 1 => HANDLED
          | 2 => FAILED
          | n => raise Value n
      end
    val getType_ = _import "g_tls_interaction_result_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = UNHANDLED
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
