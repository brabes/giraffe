structure GIRepositoryRepository :>
  G_I_REPOSITORY_REPOSITORY
    where type 'a class = 'a GIRepositoryRepositoryClass.class
    where type base_info_t = GIRepositoryBaseInfoRecord.t
    where type typelib_t = GIRepositoryTypelibRecord.t
    where type repository_load_flags_t = GIRepositoryRepositoryLoadFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_irepository_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val dump_ = call (getSymbol "g_irepository_dump") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GBool.PolyML.cVal)
      val getDefault_ = call (getSymbol "g_irepository_get_default") (cVoid --> GIRepositoryRepositoryClass.PolyML.cPtr)
      val prependLibraryPath_ = call (getSymbol "g_irepository_prepend_library_path") (Utf8.PolyML.cInPtr --> cVoid)
      val prependSearchPath_ = call (getSymbol "g_irepository_prepend_search_path") (Utf8.PolyML.cInPtr --> cVoid)
      val findByErrorDomain_ = call (getSymbol "g_irepository_find_by_error_domain") (GIRepositoryRepositoryClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val findByGtype_ = call (getSymbol "g_irepository_find_by_gtype") (GIRepositoryRepositoryClass.PolyML.cPtr &&> GObjectType.PolyML.cVal --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val findByName_ =
        call (getSymbol "g_irepository_find_by_name")
          (
            GIRepositoryRepositoryClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> GIRepositoryBaseInfoRecord.PolyML.cPtr
          )
      val getCPrefix_ = call (getSymbol "g_irepository_get_c_prefix") (GIRepositoryRepositoryClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getDependencies_ = call (getSymbol "g_irepository_get_dependencies") (GIRepositoryRepositoryClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8CPtrArray.PolyML.cOutPtr)
      val getImmediateDependencies_ = call (getSymbol "g_irepository_get_immediate_dependencies") (GIRepositoryRepositoryClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8CPtrArray.PolyML.cOutPtr)
      val getInfo_ =
        call (getSymbol "g_irepository_get_info")
          (
            GIRepositoryRepositoryClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             --> GIRepositoryBaseInfoRecord.PolyML.cPtr
          )
      val getLoadedNamespaces_ = call (getSymbol "g_irepository_get_loaded_namespaces") (GIRepositoryRepositoryClass.PolyML.cPtr --> Utf8CPtrArray.PolyML.cOutPtr)
      val getNInfos_ = call (getSymbol "g_irepository_get_n_infos") (GIRepositoryRepositoryClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GInt32.PolyML.cVal)
      val getSharedLibrary_ = call (getSymbol "g_irepository_get_shared_library") (GIRepositoryRepositoryClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getTypelibPath_ = call (getSymbol "g_irepository_get_typelib_path") (GIRepositoryRepositoryClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getVersion_ = call (getSymbol "g_irepository_get_version") (GIRepositoryRepositoryClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val isRegistered_ =
        call (getSymbol "g_irepository_is_registered")
          (
            GIRepositoryRepositoryClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             --> GBool.PolyML.cVal
          )
      val loadTypelib_ =
        call (getSymbol "g_irepository_load_typelib")
          (
            GIRepositoryRepositoryClass.PolyML.cPtr
             &&> GIRepositoryTypelibRecord.PolyML.cPtr
             &&> GIRepositoryRepositoryLoadFlags.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val require_ =
        call (getSymbol "g_irepository_require")
          (
            GIRepositoryRepositoryClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GIRepositoryRepositoryLoadFlags.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GIRepositoryTypelibRecord.PolyML.cPtr
          )
      val requirePrivate_ =
        call (getSymbol "g_irepository_require_private")
          (
            GIRepositoryRepositoryClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GIRepositoryRepositoryLoadFlags.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GIRepositoryTypelibRecord.PolyML.cPtr
          )
    end
    type 'a class = 'a GIRepositoryRepositoryClass.class
    type base_info_t = GIRepositoryBaseInfoRecord.t
    type typelib_t = GIRepositoryTypelibRecord.t
    type repository_load_flags_t = GIRepositoryRepositoryLoadFlags.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun dump arg = (Utf8.FFI.withPtr 0 &&&> GLibErrorRecord.handleError ---> ignore) dump_ (arg & [])
    fun getDefault () = (I ---> GIRepositoryRepositoryClass.FFI.fromPtr false) getDefault_ ()
    fun prependLibraryPath directory = (Utf8.FFI.withPtr 0 ---> I) prependLibraryPath_ directory
    fun prependSearchPath directory = (Utf8.FFI.withPtr 0 ---> I) prependSearchPath_ directory
    fun findByErrorDomain self domain = (GIRepositoryRepositoryClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) findByErrorDomain_ (self & domain)
    fun findByGtype self gtype = (GIRepositoryRepositoryClass.FFI.withPtr false &&&> GObjectType.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) findByGtype_ (self & gtype)
    fun findByName self (namespace, name) =
      (
        GIRepositoryRepositoryClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true
      )
        findByName_
        (
          self
           & namespace
           & name
        )
    fun getCPrefix self namespace = (GIRepositoryRepositoryClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr 0) getCPrefix_ (self & namespace) before GIRepositoryRepositoryClass.FFI.touchPtr self before Utf8.FFI.touchPtr namespace
    fun getDependencies self namespace = (GIRepositoryRepositoryClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> Utf8CPtrArray.FFI.fromPtr ~1) getDependencies_ (self & namespace)
    fun getImmediateDependencies self namespace = (GIRepositoryRepositoryClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> Utf8CPtrArray.FFI.fromPtr ~1) getImmediateDependencies_ (self & namespace)
    fun getInfo self (namespace, index) =
      (
        GIRepositoryRepositoryClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt32.FFI.withVal
         ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true
      )
        getInfo_
        (
          self
           & namespace
           & index
        )
    fun getLoadedNamespaces self = (GIRepositoryRepositoryClass.FFI.withPtr false ---> Utf8CPtrArray.FFI.fromPtr ~1) getLoadedNamespaces_ self
    fun getNInfos self namespace = (GIRepositoryRepositoryClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GInt32.FFI.fromVal) getNInfos_ (self & namespace)
    fun getSharedLibrary self namespace = (GIRepositoryRepositoryClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr 0) getSharedLibrary_ (self & namespace) before GIRepositoryRepositoryClass.FFI.touchPtr self before Utf8.FFI.touchPtr namespace
    fun getTypelibPath self namespace = (GIRepositoryRepositoryClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr 0) getTypelibPath_ (self & namespace) before GIRepositoryRepositoryClass.FFI.touchPtr self before Utf8.FFI.touchPtr namespace
    fun getVersion self namespace = (GIRepositoryRepositoryClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr 0) getVersion_ (self & namespace) before GIRepositoryRepositoryClass.FFI.touchPtr self before Utf8.FFI.touchPtr namespace
    fun isRegistered self (namespace, version) =
      (
        GIRepositoryRepositoryClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withOptPtr 0
         ---> GBool.FFI.fromVal
      )
        isRegistered_
        (
          self
           & namespace
           & version
        )
    fun loadTypelib self (typelib, flags) =
      (
        GIRepositoryRepositoryClass.FFI.withPtr false
         &&&> GIRepositoryTypelibRecord.FFI.withPtr false
         &&&> GIRepositoryRepositoryLoadFlags.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> Utf8.FFI.fromPtr 0
      )
        loadTypelib_
        (
          self
           & typelib
           & flags
           & []
        )
       before GIRepositoryRepositoryClass.FFI.touchPtr self
       before GIRepositoryTypelibRecord.FFI.touchPtr typelib
    fun require
      self
      (
        namespace,
        version,
        flags
      ) =
      (
        GIRepositoryRepositoryClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withOptPtr 0
         &&&> GIRepositoryRepositoryLoadFlags.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GIRepositoryTypelibRecord.FFI.fromPtr false
      )
        require_
        (
          self
           & namespace
           & version
           & flags
           & []
        )
       before GIRepositoryRepositoryClass.FFI.touchPtr self
       before Utf8.FFI.touchPtr namespace
       before Utf8.FFI.touchOptPtr version
    fun requirePrivate
      self
      (
        typelibDir,
        namespace,
        version,
        flags
      ) =
      (
        GIRepositoryRepositoryClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withOptPtr 0
         &&&> GIRepositoryRepositoryLoadFlags.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GIRepositoryTypelibRecord.FFI.fromPtr false
      )
        requirePrivate_
        (
          self
           & typelibDir
           & namespace
           & version
           & flags
           & []
        )
       before GIRepositoryRepositoryClass.FFI.touchPtr self
       before Utf8.FFI.touchPtr typelibDir
       before Utf8.FFI.touchPtr namespace
       before Utf8.FFI.touchOptPtr version
  end
