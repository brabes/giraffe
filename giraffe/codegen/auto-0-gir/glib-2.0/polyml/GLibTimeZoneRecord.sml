structure GLibTimeZoneRecord :> G_LIB_TIME_ZONE_RECORD =
  struct
    structure Pointer = CPointerInternal
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p
    val cPtr = Pointer.PolyML.cVal
    local
      open PolyMLFFI
    in
      val dup_ = call (getSymbol "g_time_zone_ref") (cPtr --> cPtr)
      val free_ = call (getSymbol "g_time_zone_unref") (cPtr --> cVoid)
    end
    structure Record =
      BoxedRecord(
        structure Pointer = Pointer
        type notnull = notnull
        type 'a p = 'a p
        val dup_ = dup_
        val take_ = ignore
        val free_ = free_
      )
    open Record
  end
