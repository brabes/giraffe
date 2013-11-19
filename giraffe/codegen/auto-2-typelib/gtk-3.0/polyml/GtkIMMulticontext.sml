structure GtkIMMulticontext :>
  GTK_I_M_MULTICONTEXT
    where type 'a class_t = 'a GtkIMMulticontextClass.t
    where type 'a menushellclass_t = 'a GtkMenuShellClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_im_multicontext_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_im_multicontext_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val appendMenuitems_ = call (load_sym libgtk "gtk_im_multicontext_append_menuitems") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val getContextId_ = call (load_sym libgtk "gtk_im_multicontext_get_context_id") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val setContextId_ = call (load_sym libgtk "gtk_im_multicontext_set_context_id") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkIMMulticontextClass.t
    type 'a menushellclass_t = 'a GtkMenuShellClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkIMMulticontextClass.C.fromPtr true) new_ ()
    fun appendMenuitems self menushell = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) appendMenuitems_ (self & menushell)
    fun getContextId self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getContextId_ self
    fun setContextId self contextId = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setContextId_ (self & contextId)
  end