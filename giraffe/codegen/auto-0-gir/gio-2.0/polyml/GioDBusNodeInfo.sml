structure GioDBusNodeInfo :>
  GIO_D_BUS_NODE_INFO
    where type t = GioDBusNodeInfoRecord.t
    where type d_bus_interface_info_t = GioDBusInterfaceInfoRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_dbus_node_info_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val newForXml_ = call (getSymbol "g_dbus_node_info_new_for_xml") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GioDBusNodeInfoRecord.PolyML.cPtr)
      val generateXml_ =
        call (getSymbol "g_dbus_node_info_generate_xml")
          (
            GioDBusNodeInfoRecord.PolyML.cPtr
             &&> GUInt.PolyML.cVal
             &&> GLibStringRecord.PolyML.cPtr
             --> cVoid
          )
      val lookupInterface_ = call (getSymbol "g_dbus_node_info_lookup_interface") (GioDBusNodeInfoRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioDBusInterfaceInfoRecord.PolyML.cPtr)
    end
    type t = GioDBusNodeInfoRecord.t
    type d_bus_interface_info_t = GioDBusInterfaceInfoRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newForXml xmlData = (Utf8.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GioDBusNodeInfoRecord.FFI.fromPtr true) newForXml_ (xmlData & [])
    fun generateXml self (indent, stringBuilder) =
      (
        GioDBusNodeInfoRecord.FFI.withPtr
         &&&> GUInt.FFI.withVal
         &&&> GLibStringRecord.FFI.withPtr
         ---> I
      )
        generateXml_
        (
          self
           & indent
           & stringBuilder
        )
    fun lookupInterface self name = (GioDBusNodeInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GioDBusInterfaceInfoRecord.FFI.fromPtr false) lookupInterface_ (self & name)
  end