signature GTK_STATE_FLAGS =
  sig
    include FLAGS
    val NORMAL : t
    val ACTIVE : t
    val PRELIGHT : t
    val SELECTED : t
    val INSENSITIVE : t
    val INCONSISTENT : t
    val FOCUSED : t
    val BACKDROP : t
    val DIR_LTR : t
    val DIR_RTL : t
    val LINK : t
    val VISITED : t
    val CHECKED : t
    val DROP_ACTIVE : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end