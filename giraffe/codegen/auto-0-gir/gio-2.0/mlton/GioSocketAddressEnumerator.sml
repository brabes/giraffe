structure GioSocketAddressEnumerator :>
  GIO_SOCKET_ADDRESS_ENUMERATOR
    where type 'a class_t = 'a GioSocketAddressEnumeratorClass.t
    where type 'a cancellableclass_t = 'a GioCancellableClass.t
    where type 'a socketaddressclass_t = 'a GioSocketAddressClass.t
    where type 'a asyncresultclass_t = 'a GioAsyncResultClass.t =
  struct
    val getType_ = _import "g_socket_address_enumerator_get_type" : unit -> GObjectType.C.val_;
    val next_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_socket_address_enumerator_next" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val nextFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_socket_address_enumerator_next_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class_t = 'a GioSocketAddressEnumeratorClass.t
    type 'a cancellableclass_t = 'a GioCancellableClass.t
    type 'a socketaddressclass_t = 'a GioSocketAddressClass.t
    type 'a asyncresultclass_t = 'a GioAsyncResultClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun next self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> GioSocketAddressClass.C.fromPtr true
      )
        next_
        (
          self
           & cancellable
           & []
        )
    fun nextFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> GioSocketAddressClass.C.fromPtr true
      )
        nextFinish_
        (
          self
           & result
           & []
        )
  end