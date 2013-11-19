signature PANGO_TAB_ARRAY =
  sig
    type record_t
    type tabalign_t
    val getType : unit -> GObject.Type.t
    val new :
      LargeInt.int
       -> bool
       -> record_t
    val copy : record_t -> record_t
    val getPositionsInPixels : record_t -> bool
    val getSize : record_t -> LargeInt.int
    val getTab :
      record_t
       -> LargeInt.int
       -> tabalign_t * LargeInt.int
    val resize :
      record_t
       -> LargeInt.int
       -> unit
    val setTab :
      record_t
       -> LargeInt.int
       -> tabalign_t
       -> LargeInt.int
       -> unit
  end