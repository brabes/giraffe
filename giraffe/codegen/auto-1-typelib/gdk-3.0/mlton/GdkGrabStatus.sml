structure GdkGrabStatus :>
  sig
    include GDK_GRAB_STATUS
  end =
  struct
    datatype t =
      SUCCESS
    | ALREADYGRABBED
    | INVALIDTIME
    | NOTVIEWABLE
    | FROZEN
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            SUCCESS => f 0
          | ALREADYGRABBED => f 1
          | INVALIDTIME => f 2
          | NOTVIEWABLE => f 3
          | FROZEN => f 4
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => SUCCESS
          | 1 => ALREADYGRABBED
          | 2 => INVALIDTIME
          | 3 => NOTVIEWABLE
          | 4 => FROZEN
          | n => raise Value n
      end
    val getType_ = _import "gdk_grab_status_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = SUCCESS
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end