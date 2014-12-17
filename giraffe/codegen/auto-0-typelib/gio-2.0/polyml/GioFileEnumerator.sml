structure GioFileEnumerator :>
  GIO_FILE_ENUMERATOR
    where type 'a class_t = 'a GioFileEnumeratorClass.t
    where type 'a asyncresultclass_t = 'a GioAsyncResultClass.t
    where type 'a fileinfoclass_t = 'a GioFileInfoClass.t
    where type 'a cancellableclass_t = 'a GioCancellableClass.t
    where type 'a fileclass_t = 'a GioFileClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_file_enumerator_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val close_ =
        call (load_sym libgio "g_file_enumerator_close")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val closeFinish_ =
        call (load_sym libgio "g_file_enumerator_close_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val getContainer_ = call (load_sym libgio "g_file_enumerator_get_container") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val hasPending_ = call (load_sym libgio "g_file_enumerator_has_pending") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val isClosed_ = call (load_sym libgio "g_file_enumerator_is_closed") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val nextFile_ =
        call (load_sym libgio "g_file_enumerator_next_file")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val setPending_ = call (load_sym libgio "g_file_enumerator_set_pending") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GioFileEnumeratorClass.t
    type 'a asyncresultclass_t = 'a GioAsyncResultClass.t
    type 'a fileinfoclass_t = 'a GioFileInfoClass.t
    type 'a cancellableclass_t = 'a GioCancellableClass.t
    type 'a fileclass_t = 'a GioFileClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
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
    fun getContainer self = (GObjectObjectClass.C.withPtr ---> GioFileClass.C.fromPtr false) getContainer_ self
    fun hasPending self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) hasPending_ self
    fun isClosed self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isClosed_ self
    fun nextFile self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> GioFileInfoClass.C.fromPtr true
      )
        nextFile_
        (
          self
           & cancellable
           & []
        )
    fun setPending self pending = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setPending_ (self & pending)
    local
      open Property
    in
      val containerProp = {set = fn x => set "container" GioFileClass.tOpt x}
    end
  end
