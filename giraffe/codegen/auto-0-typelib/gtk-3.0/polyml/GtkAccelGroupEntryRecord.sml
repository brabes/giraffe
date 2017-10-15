structure GtkAccelGroupEntryRecord :> GTK_ACCEL_GROUP_ENTRY_RECORD =
  struct
    structure Pointer = CPointerInternal
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p
    val cPtr = Pointer.PolyML.cVal
    local
      open PolyMLFFI
    in
      val new_ = call (getSymbol "giraffe_gtk_accel_group_entry_new") (cVoid --> cPtr)
      val copy_ = call (getSymbol "giraffe_gtk_accel_group_entry_copy") (cPtr &&> cPtr --> cVoid)
      val free_ = call (getSymbol "giraffe_gtk_accel_group_entry_free") (cPtr --> cVoid)
      val size_ = call (getSymbol "giraffe_gtk_accel_group_entry_size") (cVoid --> GUInt.PolyML.cVal)
    end
    structure Record =
      BoxedValueRecord(
        structure Pointer = Pointer
        type notnull = notnull
        type 'a p = 'a p
        val new_ = new_
        val copy_ = copy_
        val take_ = ignore
        val clear_ = ignore
        val free_ = free_
        val size_ = size_
      )
    open Record
  end