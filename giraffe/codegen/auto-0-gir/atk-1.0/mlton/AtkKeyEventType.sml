structure AtkKeyEventType :>
  sig
    include ATK_KEY_EVENT_TYPE
  end =
  struct
    datatype t =
      PRESS
    | RELEASE
    | LAST_DEFINED
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            PRESS => f 0
          | RELEASE => f 1
          | LAST_DEFINED => f 2
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => PRESS
          | 1 => RELEASE
          | 2 => LAST_DEFINED
          | n => raise Value n
      end
    val getType_ = _import "atk_key_event_type_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = PRESS
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
