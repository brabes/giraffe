structure GtkSourceGutter :>
  GTK_SOURCE_GUTTER
    where type 'a class_t = 'a GtkSourceGutterClass.t
    where type 'a gutter_renderer_class_t = 'a GtkSourceGutterRendererClass.t
    where type 'a view_class_t = 'a GtkSourceViewClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_gutter_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getRendererAtPos_ =
        call (load_sym libgtksourceview "gtk_source_gutter_get_renderer_at_pos")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> GObjectObjectClass.PolyML.PTR
          )
      val getWindow_ = call (load_sym libgtksourceview "gtk_source_gutter_get_window") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val insert_ =
        call (load_sym libgtksourceview "gtk_source_gutter_insert")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             --> FFI.Bool.PolyML.VAL
          )
      val queueDraw_ = call (load_sym libgtksourceview "gtk_source_gutter_queue_draw") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val remove_ = call (load_sym libgtksourceview "gtk_source_gutter_remove") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val reorder_ =
        call (load_sym libgtksourceview "gtk_source_gutter_reorder")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setPadding_ =
        call (load_sym libgtksourceview "gtk_source_gutter_set_padding")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
    end
    type 'a class_t = 'a GtkSourceGutterClass.t
    type 'a gutter_renderer_class_t = 'a GtkSourceGutterRendererClass.t
    type 'a view_class_t = 'a GtkSourceViewClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getRendererAtPos self x y =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> GtkSourceGutterRendererClass.C.fromPtr false
      )
        getRendererAtPos_
        (
          self
           & x
           & y
        )
    fun getWindow self = (GObjectObjectClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getWindow_ self
    fun insert self renderer position =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        insert_
        (
          self
           & renderer
           & position
        )
    fun queueDraw self = (GObjectObjectClass.C.withPtr ---> I) queueDraw_ self
    fun remove self renderer = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) remove_ (self & renderer)
    fun reorder self renderer position =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        reorder_
        (
          self
           & renderer
           & position
        )
    fun setPadding self xpad ypad =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        setPadding_
        (
          self
           & xpad
           & ypad
        )
    local
      open Property
    in
      val viewProp =
        {
          get = fn x => get "view" GtkSourceViewClass.tOpt x,
          set = fn x => set "view" GtkSourceViewClass.tOpt x
        }
      val windowTypeProp =
        {
          get = fn x => get "window-type" GtkTextWindowType.t x,
          set = fn x => set "window-type" GtkTextWindowType.t x
        }
      val xpadProp =
        {
          get = fn x => get "xpad" int x,
          set = fn x => set "xpad" int x
        }
      val ypadProp =
        {
          get = fn x => get "ypad" int x,
          set = fn x => set "ypad" int x
        }
    end
  end
