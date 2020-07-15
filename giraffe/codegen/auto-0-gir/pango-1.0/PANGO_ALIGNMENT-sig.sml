signature PANGO_ALIGNMENT =
  sig
    datatype enum =
      LEFT
    | CENTER
    | RIGHT
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end