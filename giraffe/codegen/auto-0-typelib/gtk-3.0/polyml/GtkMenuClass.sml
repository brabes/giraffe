structure GtkMenuClass :>
  GTK_MENU_CLASS
    where type 'a menushellclass_t = 'a GtkMenuShellClass.t
    where type C.notnull = GtkMenuShellClass.C.notnull
    where type 'a C.p = 'a GtkMenuShellClass.C.p =
  struct
    type 'a menu = unit
    type 'a menushellclass_t = 'a GtkMenuShellClass.t
    type 'a t = 'a menu menushellclass_t
    fun toBase obj = obj
    val t = GtkMenuShellClass.t
    val tOpt = GtkMenuShellClass.tOpt
    structure C = GtkMenuShellClass.C
  end