structure GioUnixFDList :>
  GIO_UNIX_F_D_LIST
    where type 'a class = 'a GioUnixFDListClass.class =
  struct
    structure GInt32CVectorNType =
      CValueCVectorNType(
        structure CElemType = GInt32Type
        structure ElemSequence = CValueVectorSequence(GInt32Type)
      )
    structure GInt32CVectorN = CVectorN(GInt32CVectorNType)
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_unix_fd_list_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_unix_fd_list_new") (PolyMLFFI.cVoid --> GioUnixFDListClass.PolyML.cPtr)
      val newFromArray_ = call (load_sym libgio "g_unix_fd_list_new_from_array") (GInt32CVectorN.PolyML.cInPtr &&> GInt32.PolyML.cVal --> GioUnixFDListClass.PolyML.cPtr)
      val append_ =
        call (load_sym libgio "g_unix_fd_list_append")
          (
            GioUnixFDListClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt32.PolyML.cVal
          )
      val get_ =
        call (load_sym libgio "g_unix_fd_list_get")
          (
            GioUnixFDListClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt32.PolyML.cVal
          )
      val getLength_ = call (load_sym libgio "g_unix_fd_list_get_length") (GioUnixFDListClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val peekFds_ = call (load_sym libgio "g_unix_fd_list_peek_fds") (GioUnixFDListClass.PolyML.cPtr &&> GInt32.PolyML.cRef --> GInt32CVectorN.PolyML.cOutPtr)
      val stealFds_ = call (load_sym libgio "g_unix_fd_list_steal_fds") (GioUnixFDListClass.PolyML.cPtr &&> GInt32.PolyML.cRef --> GInt32CVectorN.PolyML.cOutPtr)
    end
    type 'a class = 'a GioUnixFDListClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioUnixFDListClass.FFI.fromPtr true) new_ ()
    fun newFromArray fds =
      let
        val nFds = LargeInt.fromInt (GInt32CVectorN.length fds)
        val retVal = (GInt32CVectorN.FFI.withPtr &&&> GInt32.FFI.withVal ---> GioUnixFDListClass.FFI.fromPtr true) newFromArray_ (fds & nFds)
      in
        retVal
      end
    fun append self fd =
      (
        GioUnixFDListClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GInt32.FFI.fromVal
      )
        append_
        (
          self
           & fd
           & []
        )
    fun get self index =
      (
        GioUnixFDListClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GInt32.FFI.fromVal
      )
        get_
        (
          self
           & index
           & []
        )
    fun getLength self = (GioUnixFDListClass.FFI.withPtr ---> GInt32.FFI.fromVal) getLength_ self
    fun peekFds self =
      let
        val length & retVal = (GioUnixFDListClass.FFI.withPtr &&&> GInt32.FFI.withRefVal ---> GInt32.FFI.fromVal && GInt32CVectorN.FFI.fromPtr 0) peekFds_ (self & GInt32.null)
      in
        retVal (LargeInt.toInt length)
      end
    fun stealFds self =
      let
        val length & retVal = (GioUnixFDListClass.FFI.withPtr &&&> GInt32.FFI.withRefVal ---> GInt32.FFI.fromVal && GInt32CVectorN.FFI.fromPtr 1) stealFds_ (self & GInt32.null)
      in
        retVal (LargeInt.toInt length)
      end
  end
