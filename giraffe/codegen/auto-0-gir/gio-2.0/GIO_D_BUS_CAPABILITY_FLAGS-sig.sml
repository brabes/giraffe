signature GIO_D_BUS_CAPABILITY_FLAGS =
  sig
    include FLAGS
    val NONE : t
    val UNIX_FD_PASSING : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end