signature GTK_OFFSCREEN_WINDOW =
  sig
    type 'a class_t
    type 'a buildableclass_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val getPixbuf : 'a class_t -> base GdkPixbuf.PixbufClass.t
    val getSurface : 'a class_t -> Cairo.SurfaceRecord.t
  end