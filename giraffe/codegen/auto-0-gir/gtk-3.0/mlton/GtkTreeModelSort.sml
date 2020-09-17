structure GtkTreeModelSort :>
  GTK_TREE_MODEL_SORT
    where type 'a class = 'a GtkTreeModelSortClass.class
    where type 'a tree_drag_source_class = 'a GtkTreeDragSourceClass.class
    where type 'a tree_sortable_class = 'a GtkTreeSortableClass.class
    where type tree_path_t = GtkTreePathRecord.t
    where type tree_iter_t = GtkTreeIterRecord.t
    where type 'a tree_model_class = 'a GtkTreeModelClass.class =
  struct
    val getType_ = _import "gtk_tree_model_sort_get_type" : unit -> GObjectType.FFI.val_;
    val clearCache_ = _import "gtk_tree_model_sort_clear_cache" : GtkTreeModelSortClass.FFI.non_opt GtkTreeModelSortClass.FFI.p -> unit;
    val convertChildIterToIter_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_model_sort_convert_child_iter_to_iter" :
              GtkTreeModelSortClass.FFI.non_opt GtkTreeModelSortClass.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val convertChildPathToPath_ = fn x1 & x2 => (_import "gtk_tree_model_sort_convert_child_path_to_path" : GtkTreeModelSortClass.FFI.non_opt GtkTreeModelSortClass.FFI.p * GtkTreePathRecord.FFI.non_opt GtkTreePathRecord.FFI.p -> GtkTreePathRecord.FFI.opt GtkTreePathRecord.FFI.p;) (x1, x2)
    val convertIterToChildIter_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_model_sort_convert_iter_to_child_iter" :
              GtkTreeModelSortClass.FFI.non_opt GtkTreeModelSortClass.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val convertPathToChildPath_ = fn x1 & x2 => (_import "gtk_tree_model_sort_convert_path_to_child_path" : GtkTreeModelSortClass.FFI.non_opt GtkTreeModelSortClass.FFI.p * GtkTreePathRecord.FFI.non_opt GtkTreePathRecord.FFI.p -> GtkTreePathRecord.FFI.opt GtkTreePathRecord.FFI.p;) (x1, x2)
    val getModel_ = _import "gtk_tree_model_sort_get_model" : GtkTreeModelSortClass.FFI.non_opt GtkTreeModelSortClass.FFI.p -> GtkTreeModelClass.FFI.non_opt GtkTreeModelClass.FFI.p;
    val iterIsValid_ = fn x1 & x2 => (_import "gtk_tree_model_sort_iter_is_valid" : GtkTreeModelSortClass.FFI.non_opt GtkTreeModelSortClass.FFI.p * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val resetDefaultSortFunc_ = _import "gtk_tree_model_sort_reset_default_sort_func" : GtkTreeModelSortClass.FFI.non_opt GtkTreeModelSortClass.FFI.p -> unit;
    type 'a class = 'a GtkTreeModelSortClass.class
    type 'a tree_drag_source_class = 'a GtkTreeDragSourceClass.class
    type 'a tree_sortable_class = 'a GtkTreeSortableClass.class
    type tree_path_t = GtkTreePathRecord.t
    type tree_iter_t = GtkTreeIterRecord.t
    type 'a tree_model_class = 'a GtkTreeModelClass.class
    type t = base class
    fun asTreeDragSource self = (GObjectObjectClass.FFI.withPtr false ---> GtkTreeDragSourceClass.FFI.fromPtr false) I self
    fun asTreeModel self = (GObjectObjectClass.FFI.withPtr false ---> GtkTreeModelClass.FFI.fromPtr false) I self
    fun asTreeSortable self = (GObjectObjectClass.FFI.withPtr false ---> GtkTreeSortableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun clearCache self = (GtkTreeModelSortClass.FFI.withPtr false ---> I) clearCache_ self
    fun convertChildIterToIter self childIter =
      let
        val sortIter & retVal =
          (
            GtkTreeModelSortClass.FFI.withPtr false
             &&&> GtkTreeIterRecord.FFI.withNewPtr
             &&&> GtkTreeIterRecord.FFI.withPtr false
             ---> GtkTreeIterRecord.FFI.fromPtr true && GBool.FFI.fromVal
          )
            convertChildIterToIter_
            (
              self
               & ()
               & childIter
            )
      in
        if retVal then SOME sortIter else NONE
      end
    fun convertChildPathToPath self childPath = (GtkTreeModelSortClass.FFI.withPtr false &&&> GtkTreePathRecord.FFI.withPtr false ---> GtkTreePathRecord.FFI.fromOptPtr true) convertChildPathToPath_ (self & childPath)
    fun convertIterToChildIter self sortedIter =
      let
        val childIter & () =
          (
            GtkTreeModelSortClass.FFI.withPtr false
             &&&> GtkTreeIterRecord.FFI.withNewPtr
             &&&> GtkTreeIterRecord.FFI.withPtr false
             ---> GtkTreeIterRecord.FFI.fromPtr true && I
          )
            convertIterToChildIter_
            (
              self
               & ()
               & sortedIter
            )
      in
        childIter
      end
    fun convertPathToChildPath self sortedPath = (GtkTreeModelSortClass.FFI.withPtr false &&&> GtkTreePathRecord.FFI.withPtr false ---> GtkTreePathRecord.FFI.fromOptPtr true) convertPathToChildPath_ (self & sortedPath)
    fun getModel self = (GtkTreeModelSortClass.FFI.withPtr false ---> GtkTreeModelClass.FFI.fromPtr false) getModel_ self before GtkTreeModelSortClass.FFI.touchPtr self
    fun iterIsValid self iter = (GtkTreeModelSortClass.FFI.withPtr false &&&> GtkTreeIterRecord.FFI.withPtr false ---> GBool.FFI.fromVal) iterIsValid_ (self & iter)
    fun resetDefaultSortFunc self = (GtkTreeModelSortClass.FFI.withPtr false ---> I) resetDefaultSortFunc_ self
    local
      open ValueAccessor
    in
      val modelProp =
        {
          name = "model",
          gtype = fn () => C.gtype GtkTreeModelClass.tOpt (),
          get = fn x => fn () => C.get GtkTreeModelClass.tOpt x,
          set = ignore,
          init = fn x => C.set GtkTreeModelClass.tOpt x
        }
    end
  end
