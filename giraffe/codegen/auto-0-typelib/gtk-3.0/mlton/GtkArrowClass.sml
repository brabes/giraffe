structure GtkArrowClass :>
  GTK_ARROW_CLASS
    where type 'a misc_class_t = 'a GtkMiscClass.t
    where type C.notnull = GtkMiscClass.C.notnull
    where type 'a C.p = 'a GtkMiscClass.C.p =
  struct
    type 'a arrow = unit
    type 'a misc_class_t = 'a GtkMiscClass.t
    type 'a t = 'a arrow misc_class_t
    fun toBase obj = obj
    val t = GtkMiscClass.t
    val tOpt = GtkMiscClass.tOpt
    structure C = GtkMiscClass.C
  end
