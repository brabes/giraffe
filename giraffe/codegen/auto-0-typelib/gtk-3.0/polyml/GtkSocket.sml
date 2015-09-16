structure GtkSocket :>
  GTK_SOCKET
    where type 'a class_t = 'a GtkSocketClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_socket_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_socket_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val addId_ = call (load_sym libgtk "gtk_socket_add_id") (GObjectObjectClass.PolyML.PTR &&> FFI.UInt64.PolyML.VAL --> FFI.PolyML.VOID)
      val getId_ = call (load_sym libgtk "gtk_socket_get_id") (GObjectObjectClass.PolyML.PTR --> FFI.UInt64.PolyML.VAL)
      val getPlugWindow_ = call (load_sym libgtk "gtk_socket_get_plug_window") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
    end
    type 'a class_t = 'a GtkSocketClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkSocketClass.C.fromPtr false) new_ ()
    fun addId self window = (GObjectObjectClass.C.withPtr &&&> FFI.UInt64.C.withVal ---> I) addId_ (self & window)
    fun getId self = (GObjectObjectClass.C.withPtr ---> FFI.UInt64.C.fromVal) getId_ self
    fun getPlugWindow self = (GObjectObjectClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getPlugWindow_ self
    local
      open ClosureMarshal Signal
    in
      fun plugAddedSig f = signal "plug-added" (void ---> ret_void) f
      fun plugRemovedSig f = signal "plug-removed" (void ---> ret boolean) f
    end
  end
