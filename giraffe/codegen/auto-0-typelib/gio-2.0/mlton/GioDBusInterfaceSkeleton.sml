structure GioDBusInterfaceSkeleton :>
  GIO_D_BUS_INTERFACE_SKELETON
    where type 'a class = 'a GioDBusInterfaceSkeletonClass.class
    where type 'a d_bus_interface_class = 'a GioDBusInterfaceClass.class
    where type d_bus_interface_info_t = GioDBusInterfaceInfoRecord.t
    where type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class
    where type 'a d_bus_method_invocation_class = 'a GioDBusMethodInvocationClass.class
    where type d_bus_interface_skeleton_flags_t = GioDBusInterfaceSkeletonFlags.t =
  struct
    val getType_ = _import "g_dbus_interface_skeleton_get_type" : unit -> GObjectType.FFI.val_;
    val export_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_dbus_interface_skeleton_export" :
              GioDBusInterfaceSkeletonClass.FFI.non_opt GioDBusInterfaceSkeletonClass.FFI.p
               * GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val flush_ = _import "g_dbus_interface_skeleton_flush" : GioDBusInterfaceSkeletonClass.FFI.non_opt GioDBusInterfaceSkeletonClass.FFI.p -> unit;
    val getConnection_ = _import "g_dbus_interface_skeleton_get_connection" : GioDBusInterfaceSkeletonClass.FFI.non_opt GioDBusInterfaceSkeletonClass.FFI.p -> GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p;
    val getFlags_ = _import "g_dbus_interface_skeleton_get_flags" : GioDBusInterfaceSkeletonClass.FFI.non_opt GioDBusInterfaceSkeletonClass.FFI.p -> GioDBusInterfaceSkeletonFlags.FFI.val_;
    val getInfo_ = _import "g_dbus_interface_skeleton_get_info" : GioDBusInterfaceSkeletonClass.FFI.non_opt GioDBusInterfaceSkeletonClass.FFI.p -> GioDBusInterfaceInfoRecord.FFI.non_opt GioDBusInterfaceInfoRecord.FFI.p;
    val getObjectPath_ = _import "g_dbus_interface_skeleton_get_object_path" : GioDBusInterfaceSkeletonClass.FFI.non_opt GioDBusInterfaceSkeletonClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getProperties_ = _import "g_dbus_interface_skeleton_get_properties" : GioDBusInterfaceSkeletonClass.FFI.non_opt GioDBusInterfaceSkeletonClass.FFI.p -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
    val hasConnection_ = fn x1 & x2 => (_import "g_dbus_interface_skeleton_has_connection" : GioDBusInterfaceSkeletonClass.FFI.non_opt GioDBusInterfaceSkeletonClass.FFI.p * GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val setFlags_ = fn x1 & x2 => (_import "g_dbus_interface_skeleton_set_flags" : GioDBusInterfaceSkeletonClass.FFI.non_opt GioDBusInterfaceSkeletonClass.FFI.p * GioDBusInterfaceSkeletonFlags.FFI.val_ -> unit;) (x1, x2)
    val unexport_ = _import "g_dbus_interface_skeleton_unexport" : GioDBusInterfaceSkeletonClass.FFI.non_opt GioDBusInterfaceSkeletonClass.FFI.p -> unit;
    val unexportFromConnection_ = fn x1 & x2 => (_import "g_dbus_interface_skeleton_unexport_from_connection" : GioDBusInterfaceSkeletonClass.FFI.non_opt GioDBusInterfaceSkeletonClass.FFI.p * GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GioDBusInterfaceSkeletonClass.class
    type 'a d_bus_interface_class = 'a GioDBusInterfaceClass.class
    type d_bus_interface_info_t = GioDBusInterfaceInfoRecord.t
    type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class
    type 'a d_bus_method_invocation_class = 'a GioDBusMethodInvocationClass.class
    type d_bus_interface_skeleton_flags_t = GioDBusInterfaceSkeletonFlags.t
    type t = base class
    fun asDBusInterface self = (GObjectObjectClass.FFI.withPtr false ---> GioDBusInterfaceClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun export self (connection, objectPath) =
      (
        GioDBusInterfaceSkeletonClass.FFI.withPtr false
         &&&> GioDBusConnectionClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        export_
        (
          self
           & connection
           & objectPath
           & []
        )
    fun flush self = (GioDBusInterfaceSkeletonClass.FFI.withPtr false ---> I) flush_ self
    fun getConnection self = (GioDBusInterfaceSkeletonClass.FFI.withPtr false ---> GioDBusConnectionClass.FFI.fromPtr false) getConnection_ self
    fun getFlags self = (GioDBusInterfaceSkeletonClass.FFI.withPtr false ---> GioDBusInterfaceSkeletonFlags.FFI.fromVal) getFlags_ self
    fun getInfo self = (GioDBusInterfaceSkeletonClass.FFI.withPtr false ---> GioDBusInterfaceInfoRecord.FFI.fromPtr false) getInfo_ self
    fun getObjectPath self = (GioDBusInterfaceSkeletonClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getObjectPath_ self
    fun getProperties self = (GioDBusInterfaceSkeletonClass.FFI.withPtr false ---> GLibVariantRecord.FFI.fromPtr true) getProperties_ self
    fun hasConnection self connection = (GioDBusInterfaceSkeletonClass.FFI.withPtr false &&&> GioDBusConnectionClass.FFI.withPtr false ---> GBool.FFI.fromVal) hasConnection_ (self & connection)
    fun setFlags self flags = (GioDBusInterfaceSkeletonClass.FFI.withPtr false &&&> GioDBusInterfaceSkeletonFlags.FFI.withVal ---> I) setFlags_ (self & flags)
    fun unexport self = (GioDBusInterfaceSkeletonClass.FFI.withPtr false ---> I) unexport_ self
    fun unexportFromConnection self connection = (GioDBusInterfaceSkeletonClass.FFI.withPtr false &&&> GioDBusConnectionClass.FFI.withPtr false ---> I) unexportFromConnection_ (self & connection)
    local
      open ClosureMarshal Signal
    in
      fun gAuthorizeMethodSig f = signal "g-authorize-method" (get 0w1 GioDBusMethodInvocationClass.t ---> ret boolean) f
    end
    local
      open ValueAccessor
    in
      val gFlagsProp =
        {
          name = "g-flags",
          gtype = fn () => C.gtype GioDBusInterfaceSkeletonFlags.t (),
          get = fn x => fn () => C.get GioDBusInterfaceSkeletonFlags.t x,
          set = fn x => C.set GioDBusInterfaceSkeletonFlags.t x,
          init = fn x => C.set GioDBusInterfaceSkeletonFlags.t x
        }
    end
  end
