structure GioDBusObject :>
  GIO_D_BUS_OBJECT
    where type 'a class_t = 'a GioDBusObjectClass.t
    where type 'a d_bus_interface_class_t = 'a GioDBusInterfaceClass.t =
  struct
    val getType_ = _import "g_dbus_object_get_type" : unit -> GObjectType.C.val_;
    val getInterface_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_dbus_object_get_interface" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getObjectPath_ = _import "g_dbus_object_get_object_path" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    type 'a class_t = 'a GioDBusObjectClass.t
    type 'a d_bus_interface_class_t = 'a GioDBusInterfaceClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getInterface self interfaceName = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> GioDBusInterfaceClass.C.fromPtr true) getInterface_ (self & interfaceName)
    fun getObjectPath self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getObjectPath_ self
    local
      open ClosureMarshal Signal
    in
      fun interfaceAddedSig f = signal "interface-added" (get 0w1 GioDBusInterfaceClass.t ---> ret_void) f
      fun interfaceRemovedSig f = signal "interface-removed" (get 0w1 GioDBusInterfaceClass.t ---> ret_void) f
    end
  end
