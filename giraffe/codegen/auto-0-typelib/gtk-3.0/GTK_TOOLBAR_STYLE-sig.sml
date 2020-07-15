signature GTK_TOOLBAR_STYLE =
  sig
    datatype enum =
      ICONS
    | TEXT
    | BOTH
    | BOTH_HORIZ
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end