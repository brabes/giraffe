structure GioFileMonitorEvent :>
  sig
    include GIO_FILE_MONITOR_EVENT
  end =
  struct
    datatype t =
      CHANGED
    | CHANGES_DONE_HINT
    | DELETED
    | CREATED
    | ATTRIBUTE_CHANGED
    | PRE_UNMOUNT
    | UNMOUNTED
    | MOVED
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            CHANGED => f 0
          | CHANGES_DONE_HINT => f 1
          | DELETED => f 2
          | CREATED => f 3
          | ATTRIBUTE_CHANGED => f 4
          | PRE_UNMOUNT => f 5
          | UNMOUNTED => f 6
          | MOVED => f 7
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => CHANGED
          | 1 => CHANGES_DONE_HINT
          | 2 => DELETED
          | 3 => CREATED
          | 4 => ATTRIBUTE_CHANGED
          | 5 => PRE_UNMOUNT
          | 6 => UNMOUNTED
          | 7 => MOVED
          | n => raise Value n
      end
    val getType_ = _import "g_file_monitor_event_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = CHANGED
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
