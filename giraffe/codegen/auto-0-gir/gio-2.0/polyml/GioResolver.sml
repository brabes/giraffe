structure GioResolver :>
  GIO_RESOLVER
    where type 'a class_t = 'a GioResolverClass.t
    where type 'a cancellableclass_t = 'a GioCancellableClass.t
    where type 'a inetaddressclass_t = 'a GioInetAddressClass.t
    where type 'a asyncresultclass_t = 'a GioAsyncResultClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_resolver_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getDefault_ = call (load_sym libgio "g_resolver_get_default") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val lookupByAddress_ =
        call (load_sym libgio "g_resolver_lookup_by_address")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.String.PolyML.RETPTR
          )
      val lookupByAddressFinish_ =
        call (load_sym libgio "g_resolver_lookup_by_address_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.String.PolyML.RETPTR
          )
      val setDefault_ = call (load_sym libgio "g_resolver_set_default") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GioResolverClass.t
    type 'a cancellableclass_t = 'a GioCancellableClass.t
    type 'a inetaddressclass_t = 'a GioInetAddressClass.t
    type 'a asyncresultclass_t = 'a GioAsyncResultClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getDefault () = (I ---> GioResolverClass.C.fromPtr true) getDefault_ ()
    fun lookupByAddress self address cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.String.C.fromPtr true
      )
        lookupByAddress_
        (
          self
           & address
           & cancellable
           & []
        )
    fun lookupByAddressFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.String.C.fromPtr true
      )
        lookupByAddressFinish_
        (
          self
           & result
           & []
        )
    fun setDefault self = (GObjectObjectClass.C.withPtr ---> I) setDefault_ self
    local
      open ClosureMarshal Signal
    in
      fun reloadSig f = signal "reload" (void ---> ret_void) f
    end
  end