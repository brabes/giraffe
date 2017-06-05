signature GTK_SOURCE_GUTTER_RENDERER_ALIGNMENT_MODE =
  sig
    datatype enum =
      CELL
    | FIRST
    | LAST
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
