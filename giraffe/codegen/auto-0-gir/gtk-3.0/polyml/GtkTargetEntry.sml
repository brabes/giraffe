structure GtkTargetEntry :>
  GTK_TARGET_ENTRY
    where type record_t = GtkTargetEntryRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_target_entry_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ =
        call (load_sym libgtk "gtk_target_entry_new")
          (
            FFI.String.PolyML.INPTR
             &&> FFI.UInt.PolyML.VAL
             &&> FFI.UInt.PolyML.VAL
             --> GtkTargetEntryRecord.PolyML.PTR
          )
      val copy_ = call (load_sym libgtk "gtk_target_entry_copy") (GtkTargetEntryRecord.PolyML.PTR --> GtkTargetEntryRecord.PolyML.PTR)
    end
    type record_t = GtkTargetEntryRecord.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new target flags info =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.UInt.C.withVal
         &&&> FFI.UInt.C.withVal
         ---> GtkTargetEntryRecord.C.fromPtr true
      )
        new_
        (
          target
           & flags
           & info
        )
    fun copy self = (GtkTargetEntryRecord.C.withPtr ---> GtkTargetEntryRecord.C.fromPtr true) copy_ self
  end
