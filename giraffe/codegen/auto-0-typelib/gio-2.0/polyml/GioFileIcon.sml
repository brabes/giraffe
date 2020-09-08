structure GioFileIcon :>
  GIO_FILE_ICON
    where type 'a class = 'a GioFileIconClass.class
    where type 'a icon_class = 'a GioIconClass.class
    where type 'a loadable_icon_class = 'a GioLoadableIconClass.class
    where type 'a file_class = 'a GioFileClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_file_icon_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_file_icon_new") (GioFileClass.PolyML.cPtr --> GioFileIconClass.PolyML.cPtr)
      val getFile_ = call (getSymbol "g_file_icon_get_file") (GioFileIconClass.PolyML.cPtr --> GioFileClass.PolyML.cPtr)
    end
    type 'a class = 'a GioFileIconClass.class
    type 'a icon_class = 'a GioIconClass.class
    type 'a loadable_icon_class = 'a GioLoadableIconClass.class
    type 'a file_class = 'a GioFileClass.class
    type t = base class
    fun asIcon self = (GObjectObjectClass.FFI.withPtr false ---> GioIconClass.FFI.fromPtr false) I self
    fun asLoadableIcon self = (GObjectObjectClass.FFI.withPtr false ---> GioLoadableIconClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new file = (GioFileClass.FFI.withPtr false ---> GioFileIconClass.FFI.fromPtr true) new_ file
    fun getFile self = (GioFileIconClass.FFI.withPtr false ---> GioFileClass.FFI.fromPtr false) getFile_ self
    local
      open ValueAccessor
    in
      val fileProp =
        {
          name = "file",
          gtype = fn () => C.gtype GioFileClass.tOpt (),
          get = fn x => fn () => C.get GioFileClass.tOpt x,
          set = ignore,
          init = fn x => C.set GioFileClass.tOpt x
        }
    end
  end
