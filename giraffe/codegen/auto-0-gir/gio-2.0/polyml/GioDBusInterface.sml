structure GioDBusInterface :>
  GIO_D_BUS_INTERFACE
    where type 'a class = 'a GioDBusInterfaceClass.class
    where type d_bus_interface_info_t = GioDBusInterfaceInfoRecord.t
    where type 'a d_bus_object_class = 'a GioDBusObjectClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_dbus_interface_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getInfo_ = call (getSymbol "g_dbus_interface_get_info") (GioDBusInterfaceClass.PolyML.cPtr --> GioDBusInterfaceInfoRecord.PolyML.cPtr)
      val getObject_ = call (getSymbol "g_dbus_interface_get_object") (GioDBusInterfaceClass.PolyML.cPtr --> GioDBusObjectClass.PolyML.cPtr)
      val setObject_ = call (getSymbol "g_dbus_interface_set_object") (GioDBusInterfaceClass.PolyML.cPtr &&> GioDBusObjectClass.PolyML.cPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GioDBusInterfaceClass.class
    type d_bus_interface_info_t = GioDBusInterfaceInfoRecord.t
    type 'a d_bus_object_class = 'a GioDBusObjectClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getInfo self = (GioDBusInterfaceClass.FFI.withPtr ---> GioDBusInterfaceInfoRecord.FFI.fromPtr false) getInfo_ self
    fun getObject self = (GioDBusInterfaceClass.FFI.withPtr ---> GioDBusObjectClass.FFI.fromPtr false) getObject_ self
    fun setObject self object = (GioDBusInterfaceClass.FFI.withPtr &&&> GioDBusObjectClass.FFI.withPtr ---> I) setObject_ (self & object)
  end
