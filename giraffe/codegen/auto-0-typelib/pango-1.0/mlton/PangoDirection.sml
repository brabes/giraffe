structure PangoDirection :>
  sig
    include PANGO_DIRECTION
  end =
  struct
    datatype t =
      LTR
    | RTL
    | TTB_LTR
    | TTB_RTL
    | WEAK_LTR
    | WEAK_RTL
    | NEUTRAL
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            LTR => f 0
          | RTL => f 1
          | TTB_LTR => f 2
          | TTB_RTL => f 3
          | WEAK_LTR => f 4
          | WEAK_RTL => f 5
          | NEUTRAL => f 6
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => LTR
          | 1 => RTL
          | 2 => TTB_LTR
          | 3 => TTB_RTL
          | 4 => WEAK_LTR
          | 5 => WEAK_RTL
          | 6 => NEUTRAL
          | n => raise Value n
      end
    val getType_ = _import "pango_direction_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = LTR
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
