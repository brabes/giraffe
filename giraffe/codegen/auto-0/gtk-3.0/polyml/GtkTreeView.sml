structure GtkTreeView :>
  GTK_TREE_VIEW
    where type 'a class_t = 'a GtkTreeViewClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a scrollableclass_t = 'a GtkScrollableClass.t
    where type 'a treeselectionclass_t = 'a GtkTreeSelectionClass.t
    where type treeviewdropposition_t = GtkTreeViewDropPosition.t
    where type 'a entryclass_t = 'a GtkEntryClass.t
    where type 'a cellrendererclass_t = 'a GtkCellRendererClass.t
    where type 'a tooltipclass_t = 'a GtkTooltipClass.t
    where type movementstep_t = GtkMovementStep.t
    where type treepathrecord_t = GtkTreePathRecord.t
    where type treeiterrecord_t = GtkTreeIterRecord.t
    where type treeviewgridlines_t = GtkTreeViewGridLines.t
    where type 'a treeviewcolumnclass_t = 'a GtkTreeViewColumnClass.t
    where type 'a treemodelclass_t = 'a GtkTreeModelClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_tree_view_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_tree_view_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val newWithModel_ = call (load_sym libgtk "gtk_tree_view_new_with_model") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val appendColumn_ = call (load_sym libgtk "gtk_tree_view_append_column") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val collapseAll_ = call (load_sym libgtk "gtk_tree_view_collapse_all") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val collapseRow_ = call (load_sym libgtk "gtk_tree_view_collapse_row") (GObjectObjectClass.PolyML.PTR &&> GtkTreePathRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val columnsAutosize_ = call (load_sym libgtk "gtk_tree_view_columns_autosize") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val convertBinWindowToTreeCoords_ =
        call (load_sym libgtk "gtk_tree_view_convert_bin_window_to_tree_coords")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val convertBinWindowToWidgetCoords_ =
        call (load_sym libgtk "gtk_tree_view_convert_bin_window_to_widget_coords")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val convertTreeToBinWindowCoords_ =
        call (load_sym libgtk "gtk_tree_view_convert_tree_to_bin_window_coords")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val convertTreeToWidgetCoords_ =
        call (load_sym libgtk "gtk_tree_view_convert_tree_to_widget_coords")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val convertWidgetToBinWindowCoords_ =
        call (load_sym libgtk "gtk_tree_view_convert_widget_to_bin_window_coords")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val convertWidgetToTreeCoords_ =
        call (load_sym libgtk "gtk_tree_view_convert_widget_to_tree_coords")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val createRowDragIcon_ = call (load_sym libgtk "gtk_tree_view_create_row_drag_icon") (GObjectObjectClass.PolyML.PTR &&> GtkTreePathRecord.PolyML.PTR --> CairoSurfaceRecord.PolyML.PTR)
      val expandAll_ = call (load_sym libgtk "gtk_tree_view_expand_all") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val expandRow_ =
        call (load_sym libgtk "gtk_tree_view_expand_row")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreePathRecord.PolyML.PTR
             &&> FFI.Bool.PolyML.VAL
             --> FFI.Bool.PolyML.VAL
          )
      val expandToPath_ = call (load_sym libgtk "gtk_tree_view_expand_to_path") (GObjectObjectClass.PolyML.PTR &&> GtkTreePathRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val getBackgroundArea_ =
        call (load_sym libgtk "gtk_tree_view_get_background_area")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreePathRecord.PolyML.OPTPTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> CairoRectangleIntRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val getBinWindow_ = call (load_sym libgtk "gtk_tree_view_get_bin_window") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getCellArea_ =
        call (load_sym libgtk "gtk_tree_view_get_cell_area")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreePathRecord.PolyML.OPTPTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> CairoRectangleIntRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val getColumn_ = call (load_sym libgtk "gtk_tree_view_get_column") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val getCursor_ =
        call (load_sym libgtk "gtk_tree_view_get_cursor")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreePathRecord.PolyML.OUTREF
             &&> GObjectObjectClass.PolyML.OUTREF
             --> FFI.PolyML.VOID
          )
      val getDestRowAtPos_ =
        call (load_sym libgtk "gtk_tree_view_get_dest_row_at_pos")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             &&> GtkTreePathRecord.PolyML.OUTREF
             &&> GtkTreeViewDropPosition.PolyML.REF
             --> FFI.Bool.PolyML.VAL
          )
      val getDragDestRow_ =
        call (load_sym libgtk "gtk_tree_view_get_drag_dest_row")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreePathRecord.PolyML.OUTREF
             &&> GtkTreeViewDropPosition.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val getEnableSearch_ = call (load_sym libgtk "gtk_tree_view_get_enable_search") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getEnableTreeLines_ = call (load_sym libgtk "gtk_tree_view_get_enable_tree_lines") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getExpanderColumn_ = call (load_sym libgtk "gtk_tree_view_get_expander_column") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getFixedHeightMode_ = call (load_sym libgtk "gtk_tree_view_get_fixed_height_mode") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getGridLines_ = call (load_sym libgtk "gtk_tree_view_get_grid_lines") (GObjectObjectClass.PolyML.PTR --> GtkTreeViewGridLines.PolyML.VAL)
      val getHeadersClickable_ = call (load_sym libgtk "gtk_tree_view_get_headers_clickable") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getHeadersVisible_ = call (load_sym libgtk "gtk_tree_view_get_headers_visible") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getHoverExpand_ = call (load_sym libgtk "gtk_tree_view_get_hover_expand") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getHoverSelection_ = call (load_sym libgtk "gtk_tree_view_get_hover_selection") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getLevelIndentation_ = call (load_sym libgtk "gtk_tree_view_get_level_indentation") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getModel_ = call (load_sym libgtk "gtk_tree_view_get_model") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getPathAtPos_ =
        call (load_sym libgtk "gtk_tree_view_get_path_at_pos")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             &&> GtkTreePathRecord.PolyML.OUTREF
             &&> GObjectObjectClass.PolyML.OUTREF
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.Bool.PolyML.VAL
          )
      val getReorderable_ = call (load_sym libgtk "gtk_tree_view_get_reorderable") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getRubberBanding_ = call (load_sym libgtk "gtk_tree_view_get_rubber_banding") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getRulesHint_ = call (load_sym libgtk "gtk_tree_view_get_rules_hint") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getSearchColumn_ = call (load_sym libgtk "gtk_tree_view_get_search_column") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getSearchEntry_ = call (load_sym libgtk "gtk_tree_view_get_search_entry") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getSelection_ = call (load_sym libgtk "gtk_tree_view_get_selection") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getShowExpanders_ = call (load_sym libgtk "gtk_tree_view_get_show_expanders") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getTooltipColumn_ = call (load_sym libgtk "gtk_tree_view_get_tooltip_column") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getTooltipContext_ =
        call (load_sym libgtk "gtk_tree_view_get_tooltip_context")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Bool.PolyML.VAL
             &&> GObjectObjectClass.PolyML.OUTREF
             &&> GtkTreePathRecord.PolyML.OUTREF
             &&> GtkTreeIterRecord.PolyML.PTR
             --> FFI.Bool.PolyML.VAL
          )
      val getVisibleRange_ =
        call (load_sym libgtk "gtk_tree_view_get_visible_range")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreePathRecord.PolyML.OUTREF
             &&> GtkTreePathRecord.PolyML.OUTREF
             --> FFI.Bool.PolyML.VAL
          )
      val getVisibleRect_ = call (load_sym libgtk "gtk_tree_view_get_visible_rect") (GObjectObjectClass.PolyML.PTR &&> CairoRectangleIntRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val insertColumn_ =
        call (load_sym libgtk "gtk_tree_view_insert_column")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             --> FFI.Int32.PolyML.VAL
          )
      val isBlankAtPos_ =
        call (load_sym libgtk "gtk_tree_view_is_blank_at_pos")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             &&> GtkTreePathRecord.PolyML.OUTREF
             &&> GObjectObjectClass.PolyML.OUTREF
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.Bool.PolyML.VAL
          )
      val isRubberBandingActive_ = call (load_sym libgtk "gtk_tree_view_is_rubber_banding_active") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val moveColumnAfter_ =
        call (load_sym libgtk "gtk_tree_view_move_column_after")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             --> FFI.PolyML.VOID
          )
      val removeColumn_ = call (load_sym libgtk "gtk_tree_view_remove_column") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val rowActivated_ =
        call (load_sym libgtk "gtk_tree_view_row_activated")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreePathRecord.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val rowExpanded_ = call (load_sym libgtk "gtk_tree_view_row_expanded") (GObjectObjectClass.PolyML.PTR &&> GtkTreePathRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val scrollToCell_ =
        call (load_sym libgtk "gtk_tree_view_scroll_to_cell")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreePathRecord.PolyML.OPTPTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> FFI.Bool.PolyML.VAL
             &&> FFI.Float.PolyML.VAL
             &&> FFI.Float.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val scrollToPoint_ =
        call (load_sym libgtk "gtk_tree_view_scroll_to_point")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setCursor_ =
        call (load_sym libgtk "gtk_tree_view_set_cursor")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreePathRecord.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> FFI.Bool.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setCursorOnCell_ =
        call (load_sym libgtk "gtk_tree_view_set_cursor_on_cell")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreePathRecord.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> FFI.Bool.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setDragDestRow_ =
        call (load_sym libgtk "gtk_tree_view_set_drag_dest_row")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreePathRecord.PolyML.OPTPTR
             &&> GtkTreeViewDropPosition.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setEnableSearch_ = call (load_sym libgtk "gtk_tree_view_set_enable_search") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setEnableTreeLines_ = call (load_sym libgtk "gtk_tree_view_set_enable_tree_lines") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setExpanderColumn_ = call (load_sym libgtk "gtk_tree_view_set_expander_column") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setFixedHeightMode_ = call (load_sym libgtk "gtk_tree_view_set_fixed_height_mode") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setGridLines_ = call (load_sym libgtk "gtk_tree_view_set_grid_lines") (GObjectObjectClass.PolyML.PTR &&> GtkTreeViewGridLines.PolyML.VAL --> FFI.PolyML.VOID)
      val setHeadersClickable_ = call (load_sym libgtk "gtk_tree_view_set_headers_clickable") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setHeadersVisible_ = call (load_sym libgtk "gtk_tree_view_set_headers_visible") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setHoverExpand_ = call (load_sym libgtk "gtk_tree_view_set_hover_expand") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setHoverSelection_ = call (load_sym libgtk "gtk_tree_view_set_hover_selection") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setLevelIndentation_ = call (load_sym libgtk "gtk_tree_view_set_level_indentation") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.PolyML.VOID)
      val setModel_ = call (load_sym libgtk "gtk_tree_view_set_model") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setReorderable_ = call (load_sym libgtk "gtk_tree_view_set_reorderable") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setRubberBanding_ = call (load_sym libgtk "gtk_tree_view_set_rubber_banding") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setRulesHint_ = call (load_sym libgtk "gtk_tree_view_set_rules_hint") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setSearchColumn_ = call (load_sym libgtk "gtk_tree_view_set_search_column") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.PolyML.VOID)
      val setSearchEntry_ = call (load_sym libgtk "gtk_tree_view_set_search_entry") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setShowExpanders_ = call (load_sym libgtk "gtk_tree_view_set_show_expanders") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setTooltipCell_ =
        call (load_sym libgtk "gtk_tree_view_set_tooltip_cell")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GtkTreePathRecord.PolyML.OPTPTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             --> FFI.PolyML.VOID
          )
      val setTooltipColumn_ = call (load_sym libgtk "gtk_tree_view_set_tooltip_column") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.PolyML.VOID)
      val setTooltipRow_ =
        call (load_sym libgtk "gtk_tree_view_set_tooltip_row")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GtkTreePathRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val unsetRowsDragDest_ = call (load_sym libgtk "gtk_tree_view_unset_rows_drag_dest") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val unsetRowsDragSource_ = call (load_sym libgtk "gtk_tree_view_unset_rows_drag_source") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkTreeViewClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a scrollableclass_t = 'a GtkScrollableClass.t
    type 'a treeselectionclass_t = 'a GtkTreeSelectionClass.t
    type treeviewdropposition_t = GtkTreeViewDropPosition.t
    type 'a entryclass_t = 'a GtkEntryClass.t
    type 'a cellrendererclass_t = 'a GtkCellRendererClass.t
    type 'a tooltipclass_t = 'a GtkTooltipClass.t
    type movementstep_t = GtkMovementStep.t
    type treepathrecord_t = GtkTreePathRecord.t
    type treeiterrecord_t = GtkTreeIterRecord.t
    type treeviewgridlines_t = GtkTreeViewGridLines.t
    type 'a treeviewcolumnclass_t = 'a GtkTreeViewColumnClass.t
    type 'a treemodelclass_t = 'a GtkTreeModelClass.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.C.withPtr ---> GtkScrollableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkTreeViewClass.C.fromPtr false) new_ ()
    fun newWithModel model = (GObjectObjectClass.C.withPtr ---> GtkTreeViewClass.C.fromPtr false) newWithModel_ model
    fun appendColumn self column = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) appendColumn_ (self & column)
    fun collapseAll self = (GObjectObjectClass.C.withPtr ---> I) collapseAll_ self
    fun collapseRow self path = (GObjectObjectClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> FFI.Bool.C.fromVal) collapseRow_ (self & path)
    fun columnsAutosize self = (GObjectObjectClass.C.withPtr ---> I) columnsAutosize_ self
    fun convertBinWindowToTreeCoords self bx by =
      let
        val tx
         & ty
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            convertBinWindowToTreeCoords_
            (
              self
               & bx
               & by
               & 0
               & 0
            )
      in
        (tx, ty)
      end
    fun convertBinWindowToWidgetCoords self bx by =
      let
        val wx
         & wy
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            convertBinWindowToWidgetCoords_
            (
              self
               & bx
               & by
               & 0
               & 0
            )
      in
        (wx, wy)
      end
    fun convertTreeToBinWindowCoords self tx ty =
      let
        val bx
         & by
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            convertTreeToBinWindowCoords_
            (
              self
               & tx
               & ty
               & 0
               & 0
            )
      in
        (bx, by)
      end
    fun convertTreeToWidgetCoords self tx ty =
      let
        val wx
         & wy
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            convertTreeToWidgetCoords_
            (
              self
               & tx
               & ty
               & 0
               & 0
            )
      in
        (wx, wy)
      end
    fun convertWidgetToBinWindowCoords self wx wy =
      let
        val bx
         & by
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            convertWidgetToBinWindowCoords_
            (
              self
               & wx
               & wy
               & 0
               & 0
            )
      in
        (bx, by)
      end
    fun convertWidgetToTreeCoords self wx wy =
      let
        val tx
         & ty
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            convertWidgetToTreeCoords_
            (
              self
               & wx
               & wy
               & 0
               & 0
            )
      in
        (tx, ty)
      end
    fun createRowDragIcon self path = (GObjectObjectClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> CairoSurfaceRecord.C.fromPtr true) createRowDragIcon_ (self & path)
    fun expandAll self = (GObjectObjectClass.C.withPtr ---> I) expandAll_ self
    fun expandRow self path openAll =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkTreePathRecord.C.withPtr
         &&&> FFI.Bool.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        expandRow_
        (
          self
           & path
           & openAll
        )
    fun expandToPath self path = (GObjectObjectClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> I) expandToPath_ (self & path)
    fun getBackgroundArea self path column =
      let
        val rect & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> GtkTreePathRecord.C.withOptPtr
             &&&> GObjectObjectClass.C.withOptPtr
             &&&> CairoRectangleIntRecord.C.withNewPtr
             ---> CairoRectangleIntRecord.C.fromPtr true && I
          )
            getBackgroundArea_
            (
              self
               & path
               & column
               & ()
            )
      in
        rect
      end
    fun getBinWindow self = (GObjectObjectClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getBinWindow_ self
    fun getCellArea self path column =
      let
        val rect & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> GtkTreePathRecord.C.withOptPtr
             &&&> GObjectObjectClass.C.withOptPtr
             &&&> CairoRectangleIntRecord.C.withNewPtr
             ---> CairoRectangleIntRecord.C.fromPtr true && I
          )
            getCellArea_
            (
              self
               & path
               & column
               & ()
            )
      in
        rect
      end
    fun getColumn self n = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> GtkTreeViewColumnClass.C.fromPtr false) getColumn_ (self & n)
    fun getCursor self =
      let
        val path
         & focusColumn
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> GtkTreePathRecord.C.withRefOptPtr
             &&&> GObjectObjectClass.C.withRefOptPtr
             ---> GtkTreePathRecord.C.fromPtr true
                   && GtkTreeViewColumnClass.C.fromPtr false
                   && I
          )
            getCursor_
            (
              self
               & NONE
               & NONE
            )
      in
        (path, focusColumn)
      end
    fun getDestRowAtPos self dragX dragY =
      let
        val path
         & pos
         & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withVal
             &&&> GtkTreePathRecord.C.withRefOptPtr
             &&&> GtkTreeViewDropPosition.C.withRefVal
             ---> GtkTreePathRecord.C.fromPtr true
                   && GtkTreeViewDropPosition.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            getDestRowAtPos_
            (
              self
               & dragX
               & dragY
               & NONE
               & GtkTreeViewDropPosition.null
            )
      in
        if retVal then SOME (path, pos) else NONE
      end
    fun getDragDestRow self =
      let
        val path
         & pos
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> GtkTreePathRecord.C.withRefOptPtr
             &&&> GtkTreeViewDropPosition.C.withRefVal
             ---> GtkTreePathRecord.C.fromPtr true
                   && GtkTreeViewDropPosition.C.fromVal
                   && I
          )
            getDragDestRow_
            (
              self
               & NONE
               & GtkTreeViewDropPosition.null
            )
      in
        (path, pos)
      end
    fun getEnableSearch self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getEnableSearch_ self
    fun getEnableTreeLines self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getEnableTreeLines_ self
    fun getExpanderColumn self = (GObjectObjectClass.C.withPtr ---> GtkTreeViewColumnClass.C.fromPtr false) getExpanderColumn_ self
    fun getFixedHeightMode self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getFixedHeightMode_ self
    fun getGridLines self = (GObjectObjectClass.C.withPtr ---> GtkTreeViewGridLines.C.fromVal) getGridLines_ self
    fun getHeadersClickable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getHeadersClickable_ self
    fun getHeadersVisible self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getHeadersVisible_ self
    fun getHoverExpand self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getHoverExpand_ self
    fun getHoverSelection self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getHoverSelection_ self
    fun getLevelIndentation self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getLevelIndentation_ self
    fun getModel self = (GObjectObjectClass.C.withPtr ---> GtkTreeModelClass.C.fromPtr false) getModel_ self
    fun getPathAtPos self x y =
      let
        val path
         & column
         & cellX
         & cellY
         & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withVal
             &&&> GtkTreePathRecord.C.withRefOptPtr
             &&&> GObjectObjectClass.C.withRefOptPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> GtkTreePathRecord.C.fromPtr true
                   && GtkTreeViewColumnClass.C.fromPtr false
                   && FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            getPathAtPos_
            (
              self
               & x
               & y
               & NONE
               & NONE
               & 0
               & 0
            )
      in
        if retVal
        then
          SOME
            (
              path,
              column,
              cellX,
              cellY
            )
        else NONE
      end
    fun getReorderable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getReorderable_ self
    fun getRubberBanding self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getRubberBanding_ self
    fun getRulesHint self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getRulesHint_ self
    fun getSearchColumn self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getSearchColumn_ self
    fun getSearchEntry self = (GObjectObjectClass.C.withPtr ---> GtkEntryClass.C.fromPtr false) getSearchEntry_ self
    fun getSelection self = (GObjectObjectClass.C.withPtr ---> GtkTreeSelectionClass.C.fromPtr false) getSelection_ self
    fun getShowExpanders self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowExpanders_ self
    fun getTooltipColumn self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getTooltipColumn_ self
    fun getTooltipContext self x y keyboardTip =
      let
        val x
         & y
         & model
         & path
         & iter
         & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Bool.C.withVal
             &&&> GObjectObjectClass.C.withRefOptPtr
             &&&> GtkTreePathRecord.C.withRefOptPtr
             &&&> GtkTreeIterRecord.C.withNewPtr
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && GtkTreeModelClass.C.fromPtr false
                   && GtkTreePathRecord.C.fromPtr true
                   && GtkTreeIterRecord.C.fromPtr true
                   && FFI.Bool.C.fromVal
          )
            getTooltipContext_
            (
              self
               & x
               & y
               & keyboardTip
               & NONE
               & NONE
               & ()
            )
      in
        (
          if retVal
          then
            SOME
              (
                model,
                path,
                iter
              )
          else NONE,
          x,
          y
        )
      end
    fun getVisibleRange self =
      let
        val startPath
         & endPath
         & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> GtkTreePathRecord.C.withRefOptPtr
             &&&> GtkTreePathRecord.C.withRefOptPtr
             ---> GtkTreePathRecord.C.fromPtr true
                   && GtkTreePathRecord.C.fromPtr true
                   && FFI.Bool.C.fromVal
          )
            getVisibleRange_
            (
              self
               & NONE
               & NONE
            )
      in
        if retVal then SOME (startPath, endPath) else NONE
      end
    fun getVisibleRect self =
      let
        val visibleRect & () = (GObjectObjectClass.C.withPtr &&&> CairoRectangleIntRecord.C.withNewPtr ---> CairoRectangleIntRecord.C.fromPtr true && I) getVisibleRect_ (self & ())
      in
        visibleRect
      end
    fun insertColumn self column position =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         ---> FFI.Int32.C.fromVal
      )
        insertColumn_
        (
          self
           & column
           & position
        )
    fun isBlankAtPos self x y =
      let
        val path
         & column
         & cellX
         & cellY
         & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withVal
             &&&> GtkTreePathRecord.C.withRefOptPtr
             &&&> GObjectObjectClass.C.withRefOptPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> GtkTreePathRecord.C.fromPtr true
                   && GtkTreeViewColumnClass.C.fromPtr true
                   && FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            isBlankAtPos_
            (
              self
               & x
               & y
               & NONE
               & NONE
               & 0
               & 0
            )
      in
        if retVal
        then
          SOME
            (
              path,
              column,
              cellX,
              cellY
            )
        else NONE
      end
    fun isRubberBandingActive self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isRubberBandingActive_ self
    fun moveColumnAfter self column baseColumn =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         ---> I
      )
        moveColumnAfter_
        (
          self
           & column
           & baseColumn
        )
    fun removeColumn self column = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) removeColumn_ (self & column)
    fun rowActivated self path column =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkTreePathRecord.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         ---> I
      )
        rowActivated_
        (
          self
           & path
           & column
        )
    fun rowExpanded self path = (GObjectObjectClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> FFI.Bool.C.fromVal) rowExpanded_ (self & path)
    fun scrollToCell self path column useAlign rowAlign colAlign =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkTreePathRecord.C.withOptPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.Bool.C.withVal
         &&&> FFI.Float.C.withVal
         &&&> FFI.Float.C.withVal
         ---> I
      )
        scrollToCell_
        (
          self
           & path
           & column
           & useAlign
           & rowAlign
           & colAlign
        )
    fun scrollToPoint self treeX treeY =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        scrollToPoint_
        (
          self
           & treeX
           & treeY
        )
    fun setCursor self path focusColumn startEditing =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkTreePathRecord.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        setCursor_
        (
          self
           & path
           & focusColumn
           & startEditing
        )
    fun setCursorOnCell self path focusColumn focusCell startEditing =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkTreePathRecord.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        setCursorOnCell_
        (
          self
           & path
           & focusColumn
           & focusCell
           & startEditing
        )
    fun setDragDestRow self path pos =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkTreePathRecord.C.withOptPtr
         &&&> GtkTreeViewDropPosition.C.withVal
         ---> I
      )
        setDragDestRow_
        (
          self
           & path
           & pos
        )
    fun setEnableSearch self enableSearch = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setEnableSearch_ (self & enableSearch)
    fun setEnableTreeLines self enabled = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setEnableTreeLines_ (self & enabled)
    fun setExpanderColumn self column = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setExpanderColumn_ (self & column)
    fun setFixedHeightMode self enable = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setFixedHeightMode_ (self & enable)
    fun setGridLines self gridLines = (GObjectObjectClass.C.withPtr &&&> GtkTreeViewGridLines.C.withVal ---> I) setGridLines_ (self & gridLines)
    fun setHeadersClickable self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHeadersClickable_ (self & setting)
    fun setHeadersVisible self headersVisible = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHeadersVisible_ (self & headersVisible)
    fun setHoverExpand self expand = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHoverExpand_ (self & expand)
    fun setHoverSelection self hover = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHoverSelection_ (self & hover)
    fun setLevelIndentation self indentation = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setLevelIndentation_ (self & indentation)
    fun setModel self model = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setModel_ (self & model)
    fun setReorderable self reorderable = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setReorderable_ (self & reorderable)
    fun setRubberBanding self enable = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setRubberBanding_ (self & enable)
    fun setRulesHint self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setRulesHint_ (self & setting)
    fun setSearchColumn self column = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setSearchColumn_ (self & column)
    fun setSearchEntry self entry = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setSearchEntry_ (self & entry)
    fun setShowExpanders self enabled = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowExpanders_ (self & enabled)
    fun setTooltipCell self tooltip path column cell =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GtkTreePathRecord.C.withOptPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GObjectObjectClass.C.withOptPtr
         ---> I
      )
        setTooltipCell_
        (
          self
           & tooltip
           & path
           & column
           & cell
        )
    fun setTooltipColumn self column = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setTooltipColumn_ (self & column)
    fun setTooltipRow self tooltip path =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GtkTreePathRecord.C.withPtr
         ---> I
      )
        setTooltipRow_
        (
          self
           & tooltip
           & path
        )
    fun unsetRowsDragDest self = (GObjectObjectClass.C.withPtr ---> I) unsetRowsDragDest_ self
    fun unsetRowsDragSource self = (GObjectObjectClass.C.withPtr ---> I) unsetRowsDragSource_ self
    local
      open ClosureMarshal Signal
    in
      fun columnsChangedSig f = signal "columns-changed" (void ---> ret_void) f
      fun cursorChangedSig f = signal "cursor-changed" (void ---> ret_void) f
      fun expandCollapseCursorRowSig f =
        signal "expand-collapse-cursor-row"
          (
            get 0w1 boolean
             &&&> get 0w2 boolean
             &&&> get 0w3 boolean
             ---> ret boolean
          )
          (
            fn
              object
               & p0
               & p1 =>
                f object p0 p1
          )
      fun moveCursorSig f = signal "move-cursor" (get 0w1 GtkMovementStep.t &&&> get 0w2 int ---> ret boolean) (fn object & p0 => f object p0)
      fun rowActivatedSig f = signal "row-activated" (get 0w1 GtkTreePathRecord.t &&&> get 0w2 GtkTreeViewColumnClass.t ---> ret_void) (fn path & column => f path column)
      fun rowCollapsedSig f = signal "row-collapsed" (get 0w1 GtkTreeIterRecord.t &&&> get 0w2 GtkTreePathRecord.t ---> ret_void) (fn iter & path => f iter path)
      fun rowExpandedSig f = signal "row-expanded" (get 0w1 GtkTreeIterRecord.t &&&> get 0w2 GtkTreePathRecord.t ---> ret_void) (fn iter & path => f iter path)
      fun selectAllSig f = signal "select-all" (void ---> ret boolean) f
      fun selectCursorParentSig f = signal "select-cursor-parent" (void ---> ret boolean) f
      fun selectCursorRowSig f = signal "select-cursor-row" (get 0w1 boolean ---> ret boolean) f
      fun startInteractiveSearchSig f = signal "start-interactive-search" (void ---> ret boolean) f
      fun testCollapseRowSig f = signal "test-collapse-row" (get 0w1 GtkTreeIterRecord.t &&&> get 0w2 GtkTreePathRecord.t ---> ret boolean) (fn iter & path => f iter path)
      fun testExpandRowSig f = signal "test-expand-row" (get 0w1 GtkTreeIterRecord.t &&&> get 0w2 GtkTreePathRecord.t ---> ret boolean) (fn iter & path => f iter path)
      fun toggleCursorRowSig f = signal "toggle-cursor-row" (void ---> ret boolean) f
      fun unselectAllSig f = signal "unselect-all" (void ---> ret boolean) f
    end
    local
      open Property
    in
      val enableGridLinesProp =
        {
          get = fn x => get "enable-grid-lines" GtkTreeViewGridLines.t x,
          set = fn x => set "enable-grid-lines" GtkTreeViewGridLines.t x
        }
      val enableSearchProp =
        {
          get = fn x => get "enable-search" boolean x,
          set = fn x => set "enable-search" boolean x
        }
      val enableTreeLinesProp =
        {
          get = fn x => get "enable-tree-lines" boolean x,
          set = fn x => set "enable-tree-lines" boolean x
        }
      val expanderColumnProp =
        {
          get = fn x => get "expander-column" GtkTreeViewColumnClass.tOpt x,
          set = fn x => set "expander-column" GtkTreeViewColumnClass.tOpt x
        }
      val fixedHeightModeProp =
        {
          get = fn x => get "fixed-height-mode" boolean x,
          set = fn x => set "fixed-height-mode" boolean x
        }
      val headersClickableProp =
        {
          get = fn x => get "headers-clickable" boolean x,
          set = fn x => set "headers-clickable" boolean x
        }
      val headersVisibleProp =
        {
          get = fn x => get "headers-visible" boolean x,
          set = fn x => set "headers-visible" boolean x
        }
      val hoverExpandProp =
        {
          get = fn x => get "hover-expand" boolean x,
          set = fn x => set "hover-expand" boolean x
        }
      val hoverSelectionProp =
        {
          get = fn x => get "hover-selection" boolean x,
          set = fn x => set "hover-selection" boolean x
        }
      val levelIndentationProp =
        {
          get = fn x => get "level-indentation" int x,
          set = fn x => set "level-indentation" int x
        }
      val modelProp =
        {
          get = fn x => get "model" GtkTreeModelClass.tOpt x,
          set = fn x => set "model" GtkTreeModelClass.tOpt x
        }
      val reorderableProp =
        {
          get = fn x => get "reorderable" boolean x,
          set = fn x => set "reorderable" boolean x
        }
      val rubberBandingProp =
        {
          get = fn x => get "rubber-banding" boolean x,
          set = fn x => set "rubber-banding" boolean x
        }
      val rulesHintProp =
        {
          get = fn x => get "rules-hint" boolean x,
          set = fn x => set "rules-hint" boolean x
        }
      val searchColumnProp =
        {
          get = fn x => get "search-column" int x,
          set = fn x => set "search-column" int x
        }
      val showExpandersProp =
        {
          get = fn x => get "show-expanders" boolean x,
          set = fn x => set "show-expanders" boolean x
        }
      val tooltipColumnProp =
        {
          get = fn x => get "tooltip-column" int x,
          set = fn x => set "tooltip-column" int x
        }
    end
  end
