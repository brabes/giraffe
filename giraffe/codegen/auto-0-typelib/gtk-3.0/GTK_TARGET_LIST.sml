signature GTK_TARGET_LIST =
  sig
    type record_t
    type 'a textbufferclass_t
    val getType : unit -> GObject.Type.t
    val add :
      record_t
       -> Gdk.AtomRecord.t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val addImageTargets :
      record_t
       -> LargeInt.int
       -> bool
       -> unit
    val addRichTextTargets :
      record_t
       -> LargeInt.int
       -> bool
       -> 'a textbufferclass_t
       -> unit
    val addTextTargets :
      record_t
       -> LargeInt.int
       -> unit
    val addUriTargets :
      record_t
       -> LargeInt.int
       -> unit
    val remove :
      record_t
       -> Gdk.AtomRecord.t
       -> unit
  end