structure GtkSettingsValueRecord :> GTK_SETTINGS_VALUE_RECORD =
  struct
    structure Pointer = CPointerInternal
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p

    val cPtr = Pointer.PolyML.cVal : notnull p PolyMLFFI.conversion

    local
      open PolyMLFFI
    in
      val new_ =
        call
          (load_sym libgiraffegtk "giraffe_gtk_settings_value_new")
          (cVoid --> cPtr)

      val copy_ =
        call
          (load_sym libgiraffegtk "giraffe_gtk_settings_value_copy")
          (cPtr &&> cPtr --> cVoid)

      val free_ =
        call
          (load_sym libgiraffegtk "giraffe_gtk_settings_value_free")
          (cPtr --> cVoid)

      val size_ =
        call
          (load_sym libgiraffegtk "giraffe_gtk_settings_value_size")
          (cVoid --> GUInt.PolyML.cVal)
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
