signature VTE_CURSOR_SHAPE =
  sig
    datatype enum =
      BLOCK
    | IBEAM
    | UNDERLINE
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end