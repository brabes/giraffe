signature GDK_BYTE_ORDER =
  sig
    datatype enum =
      LSB_FIRST
    | MSB_FIRST
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end