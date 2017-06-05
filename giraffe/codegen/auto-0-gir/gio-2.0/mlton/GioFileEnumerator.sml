structure GioFileEnumerator :>
  GIO_FILE_ENUMERATOR
    where type 'a class = 'a GioFileEnumeratorClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class
    where type 'a file_info_class = 'a GioFileInfoClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a file_class = 'a GioFileClass.class =
  struct
    val getType_ = _import "g_file_enumerator_get_type" : unit -> GObjectType.FFI.val_;
    val close_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_enumerator_close" :
              GioFileEnumeratorClass.FFI.notnull GioFileEnumeratorClass.FFI.p
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
            _import "g_file_enumerator_close_finish" :
              GioFileEnumeratorClass.FFI.notnull GioFileEnumeratorClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getContainer_ = _import "g_file_enumerator_get_container" : GioFileEnumeratorClass.FFI.notnull GioFileEnumeratorClass.FFI.p -> GioFileClass.FFI.notnull GioFileClass.FFI.p;
    val hasPending_ = _import "g_file_enumerator_has_pending" : GioFileEnumeratorClass.FFI.notnull GioFileEnumeratorClass.FFI.p -> GBool.FFI.val_;
    val isClosed_ = _import "g_file_enumerator_is_closed" : GioFileEnumeratorClass.FFI.notnull GioFileEnumeratorClass.FFI.p -> GBool.FFI.val_;
    val nextFile_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_enumerator_next_file" :
              GioFileEnumeratorClass.FFI.notnull GioFileEnumeratorClass.FFI.p
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioFileInfoClass.FFI.notnull GioFileInfoClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val setPending_ = fn x1 & x2 => (_import "g_file_enumerator_set_pending" : GioFileEnumeratorClass.FFI.notnull GioFileEnumeratorClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GioFileEnumeratorClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type 'a file_info_class = 'a GioFileInfoClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a file_class = 'a GioFileClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun close self cancellable =
      (
        GioFileEnumeratorClass.FFI.withPtr
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
        GioFileEnumeratorClass.FFI.withPtr
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
    fun getContainer self = (GioFileEnumeratorClass.FFI.withPtr ---> GioFileClass.FFI.fromPtr false) getContainer_ self
    fun hasPending self = (GioFileEnumeratorClass.FFI.withPtr ---> GBool.FFI.fromVal) hasPending_ self
    fun isClosed self = (GioFileEnumeratorClass.FFI.withPtr ---> GBool.FFI.fromVal) isClosed_ self
    fun nextFile self cancellable =
      (
        GioFileEnumeratorClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileInfoClass.FFI.fromPtr true
      )
        nextFile_
        (
          self
           & cancellable
           & []
        )
    fun setPending self pending = (GioFileEnumeratorClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setPending_ (self & pending)
    local
      open Property
    in
      val containerProp = {set = fn x => set "container" GioFileClass.tOpt x}
    end
  end
