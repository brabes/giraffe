structure GioNetworkAddress :>
  GIO_NETWORK_ADDRESS
    where type 'a class_t = 'a GioNetworkAddressClass.t
    where type 'a socketconnectableclass_t = 'a GioSocketConnectableClass.t =
  struct
    val getType_ = _import "g_network_address_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_network_address_new" :
              cstring
               * unit CPointer.t
               * FFI.UInt16.C.val_
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val parse_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_g_network_address_parse" :
              cstring
               * unit CPointer.t
               * FFI.UInt16.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val parseUri_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_g_network_address_parse_uri" :
              cstring
               * unit CPointer.t
               * FFI.UInt16.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getHostname_ = _import "g_network_address_get_hostname" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getPort_ = _import "g_network_address_get_port" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.UInt16.C.val_;
    val getScheme_ = _import "g_network_address_get_scheme" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    type 'a class_t = 'a GioNetworkAddressClass.t
    type 'a socketconnectableclass_t = 'a GioSocketConnectableClass.t
    fun asSocketConnectable self = (GObjectObjectClass.C.withPtr ---> GioSocketConnectableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new hostname port = (FFI.String.C.withConstPtr &&&> FFI.UInt16.C.withVal ---> GioSocketConnectableClass.C.fromPtr true) new_ (hostname & port)
    fun parse hostAndPort defaultPort =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.UInt16.C.withVal
         &&&> GLibErrorRecord.C.handleError
         ---> GioSocketConnectableClass.C.fromPtr true
      )
        parse_
        (
          hostAndPort
           & defaultPort
           & []
        )
    fun parseUri uri defaultPort =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.UInt16.C.withVal
         &&&> GLibErrorRecord.C.handleError
         ---> GioSocketConnectableClass.C.fromPtr true
      )
        parseUri_
        (
          uri
           & defaultPort
           & []
        )
    fun getHostname self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getHostname_ self
    fun getPort self = (GObjectObjectClass.C.withPtr ---> FFI.UInt16.C.fromVal) getPort_ self
    fun getScheme self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getScheme_ self
    local
      open Property
    in
      val hostnameProp =
        {
          get = fn x => get "hostname" stringOpt x,
          set = fn x => set "hostname" stringOpt x
        }
      val portProp =
        {
          get = fn x => get "port" uint x,
          set = fn x => set "port" uint x
        }
      val schemeProp =
        {
          get = fn x => get "scheme" stringOpt x,
          set = fn x => set "scheme" stringOpt x
        }
    end
  end