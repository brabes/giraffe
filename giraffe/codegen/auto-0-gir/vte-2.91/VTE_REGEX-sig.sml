signature VTE_REGEX =
  sig
    type t
    val getType : unit -> GObject.Type.t
    val newForMatch :
      string
       * int
       * LargeInt.int
       -> t
    val newForSearch :
      string
       * int
       * LargeInt.int
       -> t
    val jit :
      t
       -> LargeInt.int
       -> unit
  end