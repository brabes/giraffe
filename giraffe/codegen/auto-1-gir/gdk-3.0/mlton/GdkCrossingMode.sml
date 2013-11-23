structure GdkCrossingMode :>
  sig
    include GDK_CROSSING_MODE
  end =
  struct
    datatype t =
      NORMAL
    | GRAB
    | UNGRAB
    | GTKGRAB
    | GTKUNGRAB
    | STATECHANGED
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            NORMAL => f 0
          | GRAB => f 1
          | UNGRAB => f 2
          | GTKGRAB => f 3
          | GTKUNGRAB => f 4
          | STATECHANGED => f 5
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => NORMAL
          | 1 => GRAB
          | 2 => UNGRAB
          | 3 => GTKGRAB
          | 4 => GTKUNGRAB
          | 5 => STATECHANGED
          | n => raise Value n
      end
    val getType_ = _import "gdk_crossing_mode_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = NORMAL
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
