structure GdkPixbufPixbufSimpleAnim :>
  GDK_PIXBUF_PIXBUF_SIMPLE_ANIM
    where type 'a class = 'a GdkPixbufPixbufSimpleAnimClass.class
    where type 'a pixbuf_class = 'a GdkPixbufPixbufClass.class =
  struct
    val getType_ = _import "gdk_pixbuf_simple_anim_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_pixbuf_simple_anim_new" :
              GInt.FFI.val_
               * GInt.FFI.val_
               * GFloat.FFI.val_
               -> GdkPixbufPixbufSimpleAnimClass.FFI.notnull GdkPixbufPixbufSimpleAnimClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val addFrame_ = fn x1 & x2 => (_import "gdk_pixbuf_simple_anim_add_frame" : GdkPixbufPixbufSimpleAnimClass.FFI.notnull GdkPixbufPixbufSimpleAnimClass.FFI.p * GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p -> unit;) (x1, x2)
    val getLoop_ = _import "gdk_pixbuf_simple_anim_get_loop" : GdkPixbufPixbufSimpleAnimClass.FFI.notnull GdkPixbufPixbufSimpleAnimClass.FFI.p -> GBool.FFI.val_;
    val setLoop_ = fn x1 & x2 => (_import "gdk_pixbuf_simple_anim_set_loop" : GdkPixbufPixbufSimpleAnimClass.FFI.notnull GdkPixbufPixbufSimpleAnimClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GdkPixbufPixbufSimpleAnimClass.class
    type 'a pixbuf_class = 'a GdkPixbufPixbufClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new width height rate =
      (
        GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GFloat.FFI.withVal
         ---> GdkPixbufPixbufSimpleAnimClass.FFI.fromPtr true
      )
        new_
        (
          width
           & height
           & rate
        )
    fun addFrame self pixbuf = (GdkPixbufPixbufSimpleAnimClass.FFI.withPtr &&&> GdkPixbufPixbufClass.FFI.withPtr ---> I) addFrame_ (self & pixbuf)
    fun getLoop self = (GdkPixbufPixbufSimpleAnimClass.FFI.withPtr ---> GBool.FFI.fromVal) getLoop_ self
    fun setLoop self loop = (GdkPixbufPixbufSimpleAnimClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setLoop_ (self & loop)
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
