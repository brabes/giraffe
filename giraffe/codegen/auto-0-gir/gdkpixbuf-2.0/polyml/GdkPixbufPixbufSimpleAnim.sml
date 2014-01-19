structure GdkPixbufPixbufSimpleAnim :>
  GDK_PIXBUF_PIXBUF_SIMPLE_ANIM
    where type 'a class_t = 'a GdkPixbufPixbufSimpleAnimClass.t
    where type 'a pixbufclass_t = 'a GdkPixbufPixbufClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdkpixbuf "gdk_pixbuf_simple_anim_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ =
        call (load_sym libgdkpixbuf "gdk_pixbuf_simple_anim_new")
          (
            FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Float.PolyML.VAL
             --> GObjectObjectClass.PolyML.PTR
          )
      val addFrame_ = call (load_sym libgdkpixbuf "gdk_pixbuf_simple_anim_add_frame") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val getLoop_ = call (load_sym libgdkpixbuf "gdk_pixbuf_simple_anim_get_loop") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val setLoop_ = call (load_sym libgdkpixbuf "gdk_pixbuf_simple_anim_set_loop") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GdkPixbufPixbufSimpleAnimClass.t
    type 'a pixbufclass_t = 'a GdkPixbufPixbufClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new width height rate =
      (
        FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Float.C.withVal
         ---> GdkPixbufPixbufSimpleAnimClass.C.fromPtr true
      )
        new_
        (
          width
           & height
           & rate
        )
    fun addFrame self pixbuf = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) addFrame_ (self & pixbuf)
    fun getLoop self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getLoop_ self
    fun setLoop self loop = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setLoop_ (self & loop)
    local
      open Property
    in
      val loopProp =
        {
          get = fn x => get "loop" boolean x,
          set = fn x => set "loop" boolean x
        }
    end
  end