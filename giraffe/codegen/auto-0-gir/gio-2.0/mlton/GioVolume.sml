structure GioVolume :>
  GIO_VOLUME
    where type 'a class = 'a GioVolumeClass.class
    where type 'a file_class = 'a GioFileClass.class
    where type 'a drive_class = 'a GioDriveClass.class
    where type 'a icon_class = 'a GioIconClass.class
    where type 'a mount_class = 'a GioMountClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    structure Utf8CVectorType =
      CPointerCVectorType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVector = CVector(Utf8CVectorType)
    val getType_ = _import "g_volume_get_type" : unit -> GObjectType.FFI.val_;
    val canEject_ = _import "g_volume_can_eject" : GioVolumeClass.FFI.notnull GioVolumeClass.FFI.p -> GBool.FFI.val_;
    val canMount_ = _import "g_volume_can_mount" : GioVolumeClass.FFI.notnull GioVolumeClass.FFI.p -> GBool.FFI.val_;
    val ejectWithOperationFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_volume_eject_with_operation_finish" :
              GioVolumeClass.FFI.notnull GioVolumeClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val enumerateIdentifiers_ = _import "g_volume_enumerate_identifiers" : GioVolumeClass.FFI.notnull GioVolumeClass.FFI.p -> Utf8CVector.FFI.notnull Utf8CVector.FFI.out_p;
    val getActivationRoot_ = _import "g_volume_get_activation_root" : GioVolumeClass.FFI.notnull GioVolumeClass.FFI.p -> GioFileClass.FFI.notnull GioFileClass.FFI.p;
    val getDrive_ = _import "g_volume_get_drive" : GioVolumeClass.FFI.notnull GioVolumeClass.FFI.p -> GioDriveClass.FFI.notnull GioDriveClass.FFI.p;
    val getIcon_ = _import "g_volume_get_icon" : GioVolumeClass.FFI.notnull GioVolumeClass.FFI.p -> GioIconClass.FFI.notnull GioIconClass.FFI.p;
    val getIdentifier_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_volume_get_identifier" :
              GioVolumeClass.FFI.notnull GioVolumeClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getMount_ = _import "g_volume_get_mount" : GioVolumeClass.FFI.notnull GioVolumeClass.FFI.p -> GioMountClass.FFI.notnull GioMountClass.FFI.p;
    val getName_ = _import "g_volume_get_name" : GioVolumeClass.FFI.notnull GioVolumeClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getUuid_ = _import "g_volume_get_uuid" : GioVolumeClass.FFI.notnull GioVolumeClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val mountFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_volume_mount_finish" :
              GioVolumeClass.FFI.notnull GioVolumeClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val shouldAutomount_ = _import "g_volume_should_automount" : GioVolumeClass.FFI.notnull GioVolumeClass.FFI.p -> GBool.FFI.val_;
    type 'a class = 'a GioVolumeClass.class
    type 'a file_class = 'a GioFileClass.class
    type 'a drive_class = 'a GioDriveClass.class
    type 'a icon_class = 'a GioIconClass.class
    type 'a mount_class = 'a GioMountClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun canEject self = (GioVolumeClass.FFI.withPtr ---> GBool.FFI.fromVal) canEject_ self
    fun canMount self = (GioVolumeClass.FFI.withPtr ---> GBool.FFI.fromVal) canMount_ self
    fun ejectWithOperationFinish self result =
      (
        GioVolumeClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
      )
        ejectWithOperationFinish_
        (
          self
           & result
           & []
        )
    fun enumerateIdentifiers self = (GioVolumeClass.FFI.withPtr ---> Utf8CVector.FFI.fromPtr 2) enumerateIdentifiers_ self
    fun getActivationRoot self = (GioVolumeClass.FFI.withPtr ---> GioFileClass.FFI.fromPtr true) getActivationRoot_ self
    fun getDrive self = (GioVolumeClass.FFI.withPtr ---> GioDriveClass.FFI.fromPtr true) getDrive_ self
    fun getIcon self = (GioVolumeClass.FFI.withPtr ---> GioIconClass.FFI.fromPtr true) getIcon_ self
    fun getIdentifier self kind = (GioVolumeClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getIdentifier_ (self & kind)
    fun getMount self = (GioVolumeClass.FFI.withPtr ---> GioMountClass.FFI.fromPtr true) getMount_ self
    fun getName self = (GioVolumeClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getName_ self
    fun getUuid self = (GioVolumeClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getUuid_ self
    fun mountFinish self result =
      (
        GioVolumeClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
      )
        mountFinish_
        (
          self
           & result
           & []
        )
    fun shouldAutomount self = (GioVolumeClass.FFI.withPtr ---> GBool.FFI.fromVal) shouldAutomount_ self
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (void ---> ret_void) f
      fun removedSig f = signal "removed" (void ---> ret_void) f
    end
  end
