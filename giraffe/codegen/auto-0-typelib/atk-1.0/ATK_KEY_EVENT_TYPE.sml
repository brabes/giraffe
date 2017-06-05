signature ATK_KEY_EVENT_TYPE =
  sig
    datatype enum =
      PRESS
    | RELEASE
    | LAST_DEFINED
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
