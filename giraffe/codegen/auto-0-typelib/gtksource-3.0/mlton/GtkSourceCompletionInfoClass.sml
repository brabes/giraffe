structure GtkSourceCompletionInfoClass :>
  GTK_SOURCE_COMPLETION_INFO_CLASS
    where type C.notnull = GtkWindowClass.C.notnull
    where type 'a C.p = 'a GtkWindowClass.C.p =
  struct
    type 'a completion_info = unit
    type 'a t = 'a completion_info GtkWindowClass.t
    fun toBase obj = obj
    val t = GtkWindowClass.t
    val tOpt = GtkWindowClass.tOpt
    structure C = GtkWindowClass.C
  end
