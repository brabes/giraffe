signature GTK_PATH_TYPE =
  sig
    datatype enum =
      WIDGET
    | WIDGET_CLASS
    | CLASS
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end