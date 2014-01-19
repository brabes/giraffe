structure GioVfs :>
  GIO_VFS
    where type 'a class_t = 'a GioVfsClass.t
    where type 'a fileclass_t = 'a GioFileClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_vfs_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getDefault_ = call (load_sym libgio "g_vfs_get_default") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getLocal_ = call (load_sym libgio "g_vfs_get_local") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getFileForPath_ = call (load_sym libgio "g_vfs_get_file_for_path") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val getFileForUri_ = call (load_sym libgio "g_vfs_get_file_for_uri") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val isActive_ = call (load_sym libgio "g_vfs_is_active") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val parseName_ = call (load_sym libgio "g_vfs_parse_name") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
    end
    type 'a class_t = 'a GioVfsClass.t
    type 'a fileclass_t = 'a GioFileClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getDefault () = (I ---> GioVfsClass.C.fromPtr false) getDefault_ ()
    fun getLocal () = (I ---> GioVfsClass.C.fromPtr false) getLocal_ ()
    fun getFileForPath self path = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GioFileClass.C.fromPtr true) getFileForPath_ (self & path)
    fun getFileForUri self uri = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GioFileClass.C.fromPtr true) getFileForUri_ (self & uri)
    fun isActive self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isActive_ self
    fun parseName self parseName = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GioFileClass.C.fromPtr true) parseName_ (self & parseName)
  end