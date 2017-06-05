structure GtkPlug :>
  GTK_PLUG
    where type 'a class = 'a GtkPlugClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_plug_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_plug_new") (GUInt64.PolyML.cVal --> GtkWidgetClass.PolyML.cPtr)
      val newForDisplay_ = call (load_sym libgtk "gtk_plug_new_for_display") (GdkDisplayClass.PolyML.cPtr &&> GUInt64.PolyML.cVal --> GtkWidgetClass.PolyML.cPtr)
      val construct_ = call (load_sym libgtk "gtk_plug_construct") (GtkPlugClass.PolyML.cPtr &&> GUInt64.PolyML.cVal --> PolyMLFFI.cVoid)
      val constructForDisplay_ =
        call (load_sym libgtk "gtk_plug_construct_for_display")
          (
            GtkPlugClass.PolyML.cPtr
             &&> GdkDisplayClass.PolyML.cPtr
             &&> GUInt64.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val getEmbedded_ = call (load_sym libgtk "gtk_plug_get_embedded") (GtkPlugClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getId_ = call (load_sym libgtk "gtk_plug_get_id") (GtkPlugClass.PolyML.cPtr --> GUInt64.PolyML.cVal)
      val getSocketWindow_ = call (load_sym libgtk "gtk_plug_get_socket_window") (GtkPlugClass.PolyML.cPtr --> GdkWindowClass.PolyML.cPtr)
    end
    type 'a class = 'a GtkPlugClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new socketId = (GUInt64.FFI.withVal ---> GtkPlugClass.FFI.fromPtr false) new_ socketId
    fun newForDisplay display socketId = (GdkDisplayClass.FFI.withPtr &&&> GUInt64.FFI.withVal ---> GtkPlugClass.FFI.fromPtr false) newForDisplay_ (display & socketId)
    fun construct self socketId = (GtkPlugClass.FFI.withPtr &&&> GUInt64.FFI.withVal ---> I) construct_ (self & socketId)
    fun constructForDisplay self display socketId =
      (
        GtkPlugClass.FFI.withPtr
         &&&> GdkDisplayClass.FFI.withPtr
         &&&> GUInt64.FFI.withVal
         ---> I
      )
        constructForDisplay_
        (
          self
           & display
           & socketId
        )
    fun getEmbedded self = (GtkPlugClass.FFI.withPtr ---> GBool.FFI.fromVal) getEmbedded_ self
    fun getId self = (GtkPlugClass.FFI.withPtr ---> GUInt64.FFI.fromVal) getId_ self
    fun getSocketWindow self = (GtkPlugClass.FFI.withPtr ---> GdkWindowClass.FFI.fromPtr false) getSocketWindow_ self
    local
      open ClosureMarshal Signal
    in
      fun embeddedSig f = signal "embedded" (void ---> ret_void) f
    end
    local
      open Property
    in
      val embeddedProp = {get = fn x => get "embedded" boolean x}
      val socketWindowProp = {get = fn x => get "socket-window" GdkWindowClass.tOpt x}
    end
  end
