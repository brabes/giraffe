signature GTK_I_M_PREEDIT_STYLE =
  sig
    datatype enum =
      NOTHING
    | CALLBACK
    | NONE
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
