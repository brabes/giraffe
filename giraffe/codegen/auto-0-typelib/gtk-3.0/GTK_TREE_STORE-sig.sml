signature GTK_TREE_STORE =
  sig
    type 'a class
    type 'a buildable_class
    type 'a tree_drag_dest_class
    type 'a tree_drag_source_class
    type 'a tree_model_class
    type 'a tree_sortable_class
    type tree_iter_t
    type t = base class
    val asBuildable : 'a class -> base buildable_class
    val asTreeDragDest : 'a class -> base tree_drag_dest_class
    val asTreeDragSource : 'a class -> base tree_drag_source_class
    val asTreeModel : 'a class -> base tree_model_class
    val asTreeSortable : 'a class -> base tree_sortable_class
    val getType : unit -> GObject.Type.t
    val new : GObjectTypeCArrayN.t -> base class
    val append :
      'a class
       -> tree_iter_t option
       -> tree_iter_t
    val clear : 'a class -> unit
    val insert :
      'a class
       -> tree_iter_t option * LargeInt.int
       -> tree_iter_t
    val insertAfter :
      'a class
       -> tree_iter_t option * tree_iter_t option
       -> tree_iter_t
    val insertBefore :
      'a class
       -> tree_iter_t option * tree_iter_t option
       -> tree_iter_t
    val insertWithValues :
      'a class
       -> tree_iter_t option
           * LargeInt.int
           * GInt32CArrayN.t
           * GObjectValueRecordCArrayN.t
       -> tree_iter_t
    val isAncestor :
      'a class
       -> tree_iter_t * tree_iter_t
       -> bool
    val iterDepth :
      'a class
       -> tree_iter_t
       -> LargeInt.int
    val iterIsValid :
      'a class
       -> tree_iter_t
       -> bool
    val moveAfter :
      'a class
       -> tree_iter_t * tree_iter_t option
       -> unit
    val moveBefore :
      'a class
       -> tree_iter_t * tree_iter_t option
       -> unit
    val prepend :
      'a class
       -> tree_iter_t option
       -> tree_iter_t
    val remove :
      'a class
       -> tree_iter_t
       -> bool
    val setColumnTypes :
      'a class
       -> GObjectTypeCArrayN.t
       -> unit
    val setValue :
      'a class
       -> tree_iter_t
           * LargeInt.int
           * GObject.ValueRecord.t
       -> unit
    val set :
      'a class
       -> tree_iter_t
           * GInt32CArrayN.t
           * GObjectValueRecordCArrayN.t
       -> unit
    val swap :
      'a class
       -> tree_iter_t * tree_iter_t
       -> unit
  end