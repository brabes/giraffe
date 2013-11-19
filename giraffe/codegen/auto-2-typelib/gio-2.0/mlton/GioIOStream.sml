structure GioIOStream :>
  GIO_I_O_STREAM
    where type 'a class_t = 'a GioIOStreamClass.t
    where type 'a cancellableclass_t = 'a GioCancellableClass.t
    where type 'a asyncresultclass_t = 'a GioAsyncResultClass.t
    where type 'a inputstreamclass_t = 'a GioInputStreamClass.t
    where type 'a outputstreamclass_t = 'a GioOutputStreamClass.t =
  struct
    val getType_ = _import "g_io_stream_get_type" : unit -> GObjectType.C.val_;
    val spliceFinish_ = fn x1 & x2 => (_import "g_io_stream_splice_finish" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * (unit, unit) GLibErrorRecord.C.r -> FFI.Bool.C.val_;) (x1, x2)
    val clearPending_ = _import "g_io_stream_clear_pending" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val close_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_io_stream_close" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
            _import "g_io_stream_close_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getInputStream_ = _import "g_io_stream_get_input_stream" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getOutputStream_ = _import "g_io_stream_get_output_stream" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val hasPending_ = _import "g_io_stream_has_pending" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val isClosed_ = _import "g_io_stream_is_closed" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val setPending_ = fn x1 & x2 => (_import "g_io_stream_set_pending" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * (unit, unit) GLibErrorRecord.C.r -> FFI.Bool.C.val_;) (x1, x2)
    type 'a class_t = 'a GioIOStreamClass.t
    type 'a cancellableclass_t = 'a GioCancellableClass.t
    type 'a asyncresultclass_t = 'a GioAsyncResultClass.t
    type 'a inputstreamclass_t = 'a GioInputStreamClass.t
    type 'a outputstreamclass_t = 'a GioOutputStreamClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun spliceFinish result = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.C.handleError ---> FFI.Bool.C.fromVal) spliceFinish_ (result & [])
    fun clearPending self = (GObjectObjectClass.C.withPtr ---> I) clearPending_ self
    fun close self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        close_
        (
          self
           & cancellable
           & []
        )
    fun closeFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        closeFinish_
        (
          self
           & result
           & []
        )
    fun getInputStream self = (GObjectObjectClass.C.withPtr ---> GioInputStreamClass.C.fromPtr false) getInputStream_ self
    fun getOutputStream self = (GObjectObjectClass.C.withPtr ---> GioOutputStreamClass.C.fromPtr false) getOutputStream_ self
    fun hasPending self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) hasPending_ self
    fun isClosed self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isClosed_ self
    fun setPending self = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.C.handleError ---> FFI.Bool.C.fromVal) setPending_ (self & [])
    local
      open Property
    in
      val closedProp =
        {
          get = fn x => get "closed" boolean x,
          set = fn x => set "closed" boolean x
        }
      val inputStreamProp = {get = fn x => get "input-stream" GioInputStreamClass.tOpt x}
      val outputStreamProp = {get = fn x => get "output-stream" GioOutputStreamClass.tOpt x}
    end
  end