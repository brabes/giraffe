signature PANGO_TAB_ALIGN =
  sig
    datatype enum =
      LEFT
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
