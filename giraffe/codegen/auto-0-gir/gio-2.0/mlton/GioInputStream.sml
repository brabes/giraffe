structure GioInputStream :>
  GIO_INPUT_STREAM
    where type 'a class = 'a GioInputStreamClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    val getType_ = _import "g_input_stream_get_type" : unit -> GObjectType.FFI.val_;
    val clearPending_ = _import "g_input_stream_clear_pending" : GioInputStreamClass.FFI.notnull GioInputStreamClass.FFI.p -> unit;
    val close_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_input_stream_close" :
              GioInputStreamClass.FFI.notnull GioInputStreamClass.FFI.p
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val closeFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_input_stream_close_finish" :
              GioInputStreamClass.FFI.notnull GioInputStreamClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val hasPending_ = _import "g_input_stream_has_pending" : GioInputStreamClass.FFI.notnull GioInputStreamClass.FFI.p -> GBool.FFI.val_;
    val isClosed_ = _import "g_input_stream_is_closed" : GioInputStreamClass.FFI.notnull GioInputStreamClass.FFI.p -> GBool.FFI.val_;
    val readFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_input_stream_read_finish" :
              GioInputStreamClass.FFI.notnull GioInputStreamClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GSSize.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setPending_ = fn x1 & x2 => (_import "g_input_stream_set_pending" : GioInputStreamClass.FFI.notnull GioInputStreamClass.FFI.p * (unit, unit) GLibErrorRecord.FFI.r -> GBool.FFI.val_;) (x1, x2)
    val skip_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_input_stream_skip" :
              GioInputStreamClass.FFI.notnull GioInputStreamClass.FFI.p
               * GSize.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GSSize.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val skipFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_input_stream_skip_finish" :
              GioInputStreamClass.FFI.notnull GioInputStreamClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GSSize.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioInputStreamClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun clearPending self = (GioInputStreamClass.FFI.withPtr ---> I) clearPending_ self
    fun close self cancellable =
      (
        GioInputStreamClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
      )
        close_
        (
          self
           & cancellable
           & []
        )
    fun closeFinish self result =
      (
        GioInputStreamClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
      )
        closeFinish_
        (
          self
           & result
           & []
        )
    fun hasPending self = (GioInputStreamClass.FFI.withPtr ---> GBool.FFI.fromVal) hasPending_ self
    fun isClosed self = (GioInputStreamClass.FFI.withPtr ---> GBool.FFI.fromVal) isClosed_ self
    fun readFinish self result =
      (
        GioInputStreamClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GSSize.FFI.fromVal
      )
        readFinish_
        (
          self
           & result
           & []
        )
    fun setPending self = (GioInputStreamClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GBool.FFI.fromVal) setPending_ (self & [])
    fun skip self count cancellable =
      (
        GioInputStreamClass.FFI.withPtr
         &&&> GSize.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GSSize.FFI.fromVal
      )
        skip_
        (
          self
           & count
           & cancellable
           & []
        )
    fun skipFinish self result =
      (
        GioInputStreamClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GSSize.FFI.fromVal
      )
        skipFinish_
        (
          self
           & result
           & []
        )
  end
