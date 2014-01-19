structure GtkIconInfo :>
  GTK_ICON_INFO
    where type record_t = GtkIconInfoRecord.t
    where type 'a iconthemeclass_t = 'a GtkIconThemeClass.t
    where type 'a stylecontextclass_t = 'a GtkStyleContextClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_icon_info_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val newForPixbuf_ = call (load_sym libgtk "gtk_icon_info_new_for_pixbuf") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> GtkIconInfoRecord.PolyML.PTR)
      val copy_ = call (load_sym libgtk "gtk_icon_info_copy") (GtkIconInfoRecord.PolyML.PTR --> GtkIconInfoRecord.PolyML.PTR)
      val getBaseSize_ = call (load_sym libgtk "gtk_icon_info_get_base_size") (GtkIconInfoRecord.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val getBuiltinPixbuf_ = call (load_sym libgtk "gtk_icon_info_get_builtin_pixbuf") (GtkIconInfoRecord.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getDisplayName_ = call (load_sym libgtk "gtk_icon_info_get_display_name") (GtkIconInfoRecord.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getEmbeddedRect_ = call (load_sym libgtk "gtk_icon_info_get_embedded_rect") (GtkIconInfoRecord.PolyML.PTR &&> GdkRectangleRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getFilename_ = call (load_sym libgtk "gtk_icon_info_get_filename") (GtkIconInfoRecord.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val loadIcon_ = call (load_sym libgtk "gtk_icon_info_load_icon") (GtkIconInfoRecord.PolyML.PTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> GObjectObjectClass.PolyML.PTR)
      val loadSymbolic_ =
        call (load_sym libgtk "gtk_icon_info_load_symbolic")
          (
            GtkIconInfoRecord.PolyML.PTR
             &&> GdkRgbaRecord.PolyML.PTR
             &&> GdkRgbaRecord.PolyML.OPTPTR
             &&> GdkRgbaRecord.PolyML.OPTPTR
             &&> GdkRgbaRecord.PolyML.OPTPTR
             &&> FFI.Bool.PolyML.REF
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val loadSymbolicForContext_ =
        call (load_sym libgtk "gtk_icon_info_load_symbolic_for_context")
          (
            GtkIconInfoRecord.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Bool.PolyML.REF
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val setRawCoordinates_ = call (load_sym libgtk "gtk_icon_info_set_raw_coordinates") (GtkIconInfoRecord.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type record_t = GtkIconInfoRecord.t
    type 'a iconthemeclass_t = 'a GtkIconThemeClass.t
    type 'a stylecontextclass_t = 'a GtkStyleContextClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun newForPixbuf iconTheme pixbuf = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> GtkIconInfoRecord.C.fromPtr true) newForPixbuf_ (iconTheme & pixbuf)
    fun copy self = (GtkIconInfoRecord.C.withPtr ---> GtkIconInfoRecord.C.fromPtr true) copy_ self
    fun getBaseSize self = (GtkIconInfoRecord.C.withPtr ---> FFI.Int.C.fromVal) getBaseSize_ self
    fun getBuiltinPixbuf self = (GtkIconInfoRecord.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr false) getBuiltinPixbuf_ self
    fun getDisplayName self = (GtkIconInfoRecord.C.withPtr ---> FFI.String.C.fromPtr false) getDisplayName_ self
    fun getEmbeddedRect self =
      let
        val rectangle & retVal = (GtkIconInfoRecord.C.withPtr &&&> GdkRectangleRecord.C.withNewPtr ---> GdkRectangleRecord.C.fromPtr true && FFI.Bool.C.fromVal) getEmbeddedRect_ (self & ())
      in
        if retVal then SOME rectangle else NONE
      end
    fun getFilename self = (GtkIconInfoRecord.C.withPtr ---> FFI.String.C.fromPtr false) getFilename_ self
    fun loadIcon self = (GtkIconInfoRecord.C.withPtr &&&> GLibErrorRecord.C.handleError ---> GdkPixbufPixbufClass.C.fromPtr true) loadIcon_ (self & [])
    fun loadSymbolic self fg successColor warningColor errorColor =
      let
        val wasSymbolic & retVal =
          (
            GtkIconInfoRecord.C.withPtr
             &&&> GdkRgbaRecord.C.withPtr
             &&&> GdkRgbaRecord.C.withOptPtr
             &&&> GdkRgbaRecord.C.withOptPtr
             &&&> GdkRgbaRecord.C.withOptPtr
             &&&> FFI.Bool.C.withRefVal
             &&&> GLibErrorRecord.C.handleError
             ---> FFI.Bool.C.fromVal && GdkPixbufPixbufClass.C.fromPtr true
          )
            loadSymbolic_
            (
              self
               & fg
               & successColor
               & warningColor
               & errorColor
               & FFI.Bool.null
               & []
            )
      in
        (retVal, wasSymbolic)
      end
    fun loadSymbolicForContext self context =
      let
        val wasSymbolic & retVal =
          (
            GtkIconInfoRecord.C.withPtr
             &&&> GObjectObjectClass.C.withPtr
             &&&> FFI.Bool.C.withRefVal
             &&&> GLibErrorRecord.C.handleError
             ---> FFI.Bool.C.fromVal && GdkPixbufPixbufClass.C.fromPtr true
          )
            loadSymbolicForContext_
            (
              self
               & context
               & FFI.Bool.null
               & []
            )
      in
        (retVal, wasSymbolic)
      end
    fun setRawCoordinates self rawCoordinates = (GtkIconInfoRecord.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setRawCoordinates_ (self & rawCoordinates)
  end