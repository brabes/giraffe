structure GioUnixSocketAddress :>
  GIO_UNIX_SOCKET_ADDRESS
    where type 'a class_t = 'a GioUnixSocketAddressClass.t
    where type 'a socketconnectableclass_t = 'a GioSocketConnectableClass.t
    where type unixsocketaddresstype_t = GioUnixSocketAddressType.t =
  struct
    val getType_ = _import "g_unix_socket_address_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "mlton_g_unix_socket_address_new" : cstring * unit CPointer.t -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val abstractNamesSupported_ = _import "g_unix_socket_address_abstract_names_supported" : unit -> FFI.Bool.val_;
    val getAddressType_ = _import "g_unix_socket_address_get_address_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GioUnixSocketAddressType.C.val_;
    val getPath_ = _import "g_unix_socket_address_get_path" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    val getPathLen_ = _import "g_unix_socket_address_get_path_len" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.UInt64.val_;
    type 'a class_t = 'a GioUnixSocketAddressClass.t
    type 'a socketconnectableclass_t = 'a GioSocketConnectableClass.t
    type unixsocketaddresstype_t = GioUnixSocketAddressType.t
    fun asSocketConnectable self = (GObjectObjectClass.C.withPtr ---> GioSocketConnectableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new path = (FFI.String.withConstPtr ---> GioUnixSocketAddressClass.C.fromPtr true) new_ path
    fun abstractNamesSupported () = (I ---> FFI.Bool.fromVal) abstractNamesSupported_ ()
    fun getAddressType self = (GObjectObjectClass.C.withPtr ---> GioUnixSocketAddressType.C.fromVal) getAddressType_ self
    fun getPath self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getPath_ self
    fun getPathLen self = (GObjectObjectClass.C.withPtr ---> FFI.UInt64.fromVal) getPathLen_ self
    local
      open Property
    in
      val abstractProp =
        {
          get = fn x => get "abstract" boolean x,
          set = fn x => set "abstract" boolean x
        }
      val addressTypeProp =
        {
          get = fn x => get "address-type" GioUnixSocketAddressType.t x,
          set = fn x => set "address-type" GioUnixSocketAddressType.t x
        }
      val pathProp =
        {
          get = fn x => get "path" stringOpt x,
          set = fn x => set "path" stringOpt x
        }
    end
  end
