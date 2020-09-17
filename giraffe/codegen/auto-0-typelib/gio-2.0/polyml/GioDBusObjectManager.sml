structure GioDBusObjectManager :>
  GIO_D_BUS_OBJECT_MANAGER
    where type 'a class = 'a GioDBusObjectManagerClass.class
    where type 'a d_bus_interface_class = 'a GioDBusInterfaceClass.class
    where type 'a d_bus_object_class = 'a GioDBusObjectClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_dbus_object_manager_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getInterface_ =
        call (getSymbol "g_dbus_object_manager_get_interface")
          (
            GioDBusObjectManagerClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> GioDBusInterfaceClass.PolyML.cPtr
          )
      val getObject_ = call (getSymbol "g_dbus_object_manager_get_object") (GioDBusObjectManagerClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioDBusObjectClass.PolyML.cPtr)
      val getObjectPath_ = call (getSymbol "g_dbus_object_manager_get_object_path") (GioDBusObjectManagerClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
    end
    type 'a class = 'a GioDBusObjectManagerClass.class
    type 'a d_bus_interface_class = 'a GioDBusInterfaceClass.class
    type 'a d_bus_object_class = 'a GioDBusObjectClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getInterface self (objectPath, interfaceName) =
      (
        GioDBusObjectManagerClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         ---> GioDBusInterfaceClass.FFI.fromPtr true
      )
        getInterface_
        (
          self
           & objectPath
           & interfaceName
        )
    fun getObject self objectPath = (GioDBusObjectManagerClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GioDBusObjectClass.FFI.fromPtr true) getObject_ (self & objectPath)
    fun getObjectPath self = (GioDBusObjectManagerClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getObjectPath_ self before GioDBusObjectManagerClass.FFI.touchPtr self
    local
      open ClosureMarshal Signal
    in
      fun interfaceAddedSig f = signal "interface-added" (get 0w1 GioDBusObjectClass.t &&&> get 0w2 GioDBusInterfaceClass.t ---> ret_void) (fn object & interface => f (object, interface))
      fun interfaceRemovedSig f = signal "interface-removed" (get 0w1 GioDBusObjectClass.t &&&> get 0w2 GioDBusInterfaceClass.t ---> ret_void) (fn object & interface => f (object, interface))
      fun objectAddedSig f = signal "object-added" (get 0w1 GioDBusObjectClass.t ---> ret_void) f
      fun objectRemovedSig f = signal "object-removed" (get 0w1 GioDBusObjectClass.t ---> ret_void) f
    end
  end
