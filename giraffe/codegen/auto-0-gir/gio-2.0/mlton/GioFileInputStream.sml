structure GioFileInputStream :>
  GIO_FILE_INPUT_STREAM
    where type 'a class_t = 'a GioFileInputStreamClass.t
    where type 'a seekable_class_t = 'a GioSeekableClass.t
    where type 'a cancellable_class_t = 'a GioCancellableClass.t
    where type 'a file_info_class_t = 'a GioFileInfoClass.t
    where type 'a async_result_class_t = 'a GioAsyncResultClass.t =
  struct
    val getType_ = _import "g_file_input_stream_get_type" : unit -> GObjectType.C.val_;
    val queryInfo_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_g_file_input_stream_query_info" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val queryInfoFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_input_stream_query_info_finish" :
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
    type 'a class_t = 'a GioFileInputStreamClass.t
    type 'a seekable_class_t = 'a GioSeekableClass.t
    type 'a cancellable_class_t = 'a GioCancellableClass.t
    type 'a file_info_class_t = 'a GioFileInfoClass.t
    type 'a async_result_class_t = 'a GioAsyncResultClass.t
    type t = base class_t
    fun asSeekable self = (GObjectObjectClass.C.withPtr ---> GioSeekableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun queryInfo self attributes cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> GioFileInfoClass.C.fromPtr true
      )
        queryInfo_
        (
          self
           & attributes
           & cancellable
           & []
        )
    fun queryInfoFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> GioFileInfoClass.C.fromPtr true
      )
        queryInfoFinish_
        (
          self
           & result
           & []
        )
  end
