structure GioNativeVolumeMonitorClass :>
  GIO_NATIVE_VOLUME_MONITOR_CLASS
    where type 'a volume_monitor_class = 'a GioVolumeMonitorClass.class
    where type C.notnull = GioVolumeMonitorClass.C.notnull
    where type 'a C.p = 'a GioVolumeMonitorClass.C.p =
  struct
    type 'a volume_monitor_class = 'a GioVolumeMonitorClass.class
    open GioVolumeMonitorClass
    type 'a native_volume_monitor = unit
    type 'a class = 'a native_volume_monitor class
    val getType_ = _import "g_native_volume_monitor_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_object" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.notnull FFI.p;
    val getOptValue_ = _import "g_value_get_object" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> unit FFI.p;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_object" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.notnull FFI.p -> unit;) (x1, x2)
    val setOptValue_ = fn x1 & x2 => (_import "g_value_set_object" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * unit FFI.p -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromPtr false) getValue_,
          setValue = (I &&&> FFI.withPtr ---> I) setValue_
        }
    val tOpt =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
          setValue = (I &&&> FFI.withOptPtr ---> I) setOptValue_
        }
  end
