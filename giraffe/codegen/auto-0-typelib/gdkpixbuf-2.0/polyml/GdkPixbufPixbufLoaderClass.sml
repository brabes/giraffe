structure GdkPixbufPixbufLoaderClass :>
  GDK_PIXBUF_PIXBUF_LOADER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    type 'a pixbuf_loader = unit
    type 'a t = 'a pixbuf_loader GObjectObjectClass.t
    fun toBase obj = obj
    val t = GObjectObjectClass.t
    val tOpt = GObjectObjectClass.tOpt
    structure C = GObjectObjectClass.C
  end
