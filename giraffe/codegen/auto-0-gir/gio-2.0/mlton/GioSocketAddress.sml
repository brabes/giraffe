structure GioSocketAddress :>
  GIO_SOCKET_ADDRESS
    where type 'a class_t = 'a GioSocketAddressClass.t
    where type 'a socket_connectable_class_t = 'a GioSocketConnectableClass.t
    where type socket_family_t = GioSocketFamily.t =
  struct
    val getType_ = _import "g_socket_address_get_type" : unit -> GObjectType.C.val_;
    val getFamily_ = _import "g_socket_address_get_family" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GioSocketFamily.C.val_;
    val getNativeSize_ = _import "g_socket_address_get_native_size" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.SSize.C.val_;
    type 'a class_t = 'a GioSocketAddressClass.t
    type 'a socket_connectable_class_t = 'a GioSocketConnectableClass.t
    type socket_family_t = GioSocketFamily.t
    type t = base class_t
    fun asSocketConnectable self = (GObjectObjectClass.C.withPtr ---> GioSocketConnectableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getFamily self = (GObjectObjectClass.C.withPtr ---> GioSocketFamily.C.fromVal) getFamily_ self
    fun getNativeSize self = (GObjectObjectClass.C.withPtr ---> FFI.SSize.C.fromVal) getNativeSize_ self
    local
      open Property
    in
      val familyProp = {get = fn x => get "family" GioSocketFamily.t x}
    end
  end
