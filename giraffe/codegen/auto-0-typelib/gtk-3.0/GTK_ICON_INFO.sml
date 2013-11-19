signature GTK_ICON_INFO =
  sig
    type record_t
    type 'a stylecontextclass_t
    type 'a iconthemeclass_t
    val getType : unit -> GObject.Type.t
    val newForPixbuf :
      'a iconthemeclass_t
       -> 'b GdkPixbuf.PixbufClass.t
       -> record_t
    val copy : record_t -> record_t
    val getBaseSize : record_t -> LargeInt.int
    val getBuiltinPixbuf : record_t -> base GdkPixbuf.PixbufClass.t
    val getDisplayName : record_t -> string
    val getEmbeddedRect : record_t -> Cairo.RectangleIntRecord.t option
    val getFilename : record_t -> string
    val loadIcon : record_t -> base GdkPixbuf.PixbufClass.t
    val loadSymbolic :
      record_t
       -> Gdk.RgbaRecord.t
       -> Gdk.RgbaRecord.t option
       -> Gdk.RgbaRecord.t option
       -> Gdk.RgbaRecord.t option
       -> base GdkPixbuf.PixbufClass.t * bool
    val loadSymbolicForContext :
      record_t
       -> 'a stylecontextclass_t
       -> base GdkPixbuf.PixbufClass.t * bool
    val setRawCoordinates :
      record_t
       -> bool
       -> unit
  end