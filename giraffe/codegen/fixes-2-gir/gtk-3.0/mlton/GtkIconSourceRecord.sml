structure GtkIconSourceRecord :> GTK_ICON_SOURCE_RECORD =
  struct
    structure Pointer = CPointerInternal
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p

    val dup_ = _import "gtk_icon_source_copy" : notnull p -> notnull p;
    val free_ = _import "gtk_icon_source_free" : notnull p -> unit;
    val getType_ = _import "gtk_icon_source_get_type" : unit -> GObjectType.FFI.val_;

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

    structure Type =
      BoxedType(
        structure Record = Record
        type t = t
        val getType_ = getType_
      )
    open Type
  end
