signature GTK_PATH_PRIORITY_TYPE =
  sig
    datatype enum =
      LOWEST
    | GTK
    | APPLICATION
    | THEME
    | RC
    | HIGHEST
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end