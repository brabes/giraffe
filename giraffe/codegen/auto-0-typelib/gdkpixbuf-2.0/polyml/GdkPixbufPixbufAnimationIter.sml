structure GdkPixbufPixbufAnimationIter :>
  GDK_PIXBUF_PIXBUF_ANIMATION_ITER
    where type 'a class = 'a GdkPixbufPixbufAnimationIterClass.class
    where type 'a pixbuf_class = 'a GdkPixbufPixbufClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_pixbuf_animation_iter_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val advance_ = call (getSymbol "gdk_pixbuf_animation_iter_advance") (GdkPixbufPixbufAnimationIterClass.PolyML.cPtr &&> GLibTimeValRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getDelayTime_ = call (getSymbol "gdk_pixbuf_animation_iter_get_delay_time") (GdkPixbufPixbufAnimationIterClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getPixbuf_ = call (getSymbol "gdk_pixbuf_animation_iter_get_pixbuf") (GdkPixbufPixbufAnimationIterClass.PolyML.cPtr --> GdkPixbufPixbufClass.PolyML.cPtr)
      val onCurrentlyLoadingFrame_ = call (getSymbol "gdk_pixbuf_animation_iter_on_currently_loading_frame") (GdkPixbufPixbufAnimationIterClass.PolyML.cPtr --> GBool.PolyML.cVal)
    end
    type 'a class = 'a GdkPixbufPixbufAnimationIterClass.class
    type 'a pixbuf_class = 'a GdkPixbufPixbufClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun advance self currentTime = (GdkPixbufPixbufAnimationIterClass.FFI.withPtr &&&> GLibTimeValRecord.FFI.withPtr ---> GBool.FFI.fromVal) advance_ (self & currentTime)
    fun getDelayTime self = (GdkPixbufPixbufAnimationIterClass.FFI.withPtr ---> GInt32.FFI.fromVal) getDelayTime_ self
    fun getPixbuf self = (GdkPixbufPixbufAnimationIterClass.FFI.withPtr ---> GdkPixbufPixbufClass.FFI.fromPtr false) getPixbuf_ self
    fun onCurrentlyLoadingFrame self = (GdkPixbufPixbufAnimationIterClass.FFI.withPtr ---> GBool.FFI.fromVal) onCurrentlyLoadingFrame_ self
  end
