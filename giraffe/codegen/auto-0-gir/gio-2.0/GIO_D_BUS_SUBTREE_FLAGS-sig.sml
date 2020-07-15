signature GIO_D_BUS_SUBTREE_FLAGS =
  sig
    include FLAGS
    val NONE : t
    val DISPATCH_TO_UNENUMERATED_NODES : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end