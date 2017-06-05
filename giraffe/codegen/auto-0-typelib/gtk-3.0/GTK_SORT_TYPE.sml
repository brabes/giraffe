signature GTK_SORT_TYPE =
  sig
    datatype enum =
      ASCENDING
    | DESCENDING
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
