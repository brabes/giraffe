structure GtkLayoutClass :>
  GTK_LAYOUT_CLASS
    where type 'a containerclass_t = 'a GtkContainerClass.t
    where type C.notnull = GtkContainerClass.C.notnull
    where type 'a C.p = 'a GtkContainerClass.C.p =
  struct
    type 'a layout = unit
    type 'a containerclass_t = 'a GtkContainerClass.t
    type 'a t = 'a layout containerclass_t
    fun toBase obj = obj
    val t = GtkContainerClass.t
    val tOpt = GtkContainerClass.tOpt
    structure C = GtkContainerClass.C
  end