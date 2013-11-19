structure GtkTreeSortable :>
  GTK_TREE_SORTABLE
    where type 'a class_t = 'a GtkTreeSortableClass.t
    where type sorttype_t = GtkSortType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_tree_sortable_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getSortColumnId_ =
        call (load_sym libgtk "gtk_tree_sortable_get_sort_column_id")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.REF
             &&> GtkSortType.PolyML.REF
             --> FFI.Bool.PolyML.VAL
          )
      val hasDefaultSortFunc_ = call (load_sym libgtk "gtk_tree_sortable_has_default_sort_func") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val setSortColumnId_ =
        call (load_sym libgtk "gtk_tree_sortable_set_sort_column_id")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> GtkSortType.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val sortColumnChanged_ = call (load_sym libgtk "gtk_tree_sortable_sort_column_changed") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkTreeSortableClass.t
    type sorttype_t = GtkSortType.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getSortColumnId self =
      let
        val sortColumnId
         & order
         & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> GtkSortType.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && GtkSortType.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            getSortColumnId_
            (
              self
               & FFI.Int32.null
               & GtkSortType.null
            )
      in
        if retVal then SOME (sortColumnId, order) else NONE
      end
    fun hasDefaultSortFunc self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) hasDefaultSortFunc_ self
    fun setSortColumnId self sortColumnId order =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> GtkSortType.C.withVal
         ---> I
      )
        setSortColumnId_
        (
          self
           & sortColumnId
           & order
        )
    fun sortColumnChanged self = (GObjectObjectClass.C.withPtr ---> I) sortColumnChanged_ self
    local
      open ClosureMarshal Signal
    in
      fun sortColumnChangedSig f = signal "sort-column-changed" (void ---> ret_void) f
    end
  end