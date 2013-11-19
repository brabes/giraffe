structure GtkWindowPosition :>
  sig
    include GTK_WINDOW_POSITION
  end =
  struct
    datatype t =
      NONE
    | CENTER
    | MOUSE
    | CENTERALWAYS
    | CENTERONPARENT
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            NONE => f 0
          | CENTER => f 1
          | MOUSE => f 2
          | CENTERALWAYS => f 3
          | CENTERONPARENT => f 4
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => NONE
          | 1 => CENTER
          | 2 => MOUSE
          | 3 => CENTERALWAYS
          | 4 => CENTERONPARENT
          | n => raise Value n
      end
    val getType_ = _import "gtk_window_position_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = NONE
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end