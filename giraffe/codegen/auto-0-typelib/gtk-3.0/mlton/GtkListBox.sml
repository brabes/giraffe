structure GtkListBox :>
  GTK_LIST_BOX
    where type 'a class = 'a GtkListBoxClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a adjustment_class = 'a GtkAdjustmentClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type movement_step_t = GtkMovementStep.t
    where type 'a list_box_row_class = 'a GtkListBoxRowClass.class
    where type selection_mode_t = GtkSelectionMode.t =
  struct
    val getType_ = _import "gtk_list_box_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_list_box_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val dragHighlightRow_ = fn x1 & x2 => (_import "gtk_list_box_drag_highlight_row" : GtkListBoxClass.FFI.non_opt GtkListBoxClass.FFI.p * GtkListBoxRowClass.FFI.non_opt GtkListBoxRowClass.FFI.p -> unit;) (x1, x2)
    val dragUnhighlightRow_ = _import "gtk_list_box_drag_unhighlight_row" : GtkListBoxClass.FFI.non_opt GtkListBoxClass.FFI.p -> unit;
    val getActivateOnSingleClick_ = _import "gtk_list_box_get_activate_on_single_click" : GtkListBoxClass.FFI.non_opt GtkListBoxClass.FFI.p -> GBool.FFI.val_;
    val getAdjustment_ = _import "gtk_list_box_get_adjustment" : GtkListBoxClass.FFI.non_opt GtkListBoxClass.FFI.p -> GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p;
    val getRowAtIndex_ = fn x1 & x2 => (_import "gtk_list_box_get_row_at_index" : GtkListBoxClass.FFI.non_opt GtkListBoxClass.FFI.p * GInt32.FFI.val_ -> GtkListBoxRowClass.FFI.opt GtkListBoxRowClass.FFI.p;) (x1, x2)
    val getRowAtY_ = fn x1 & x2 => (_import "gtk_list_box_get_row_at_y" : GtkListBoxClass.FFI.non_opt GtkListBoxClass.FFI.p * GInt32.FFI.val_ -> GtkListBoxRowClass.FFI.opt GtkListBoxRowClass.FFI.p;) (x1, x2)
    val getSelectedRow_ = _import "gtk_list_box_get_selected_row" : GtkListBoxClass.FFI.non_opt GtkListBoxClass.FFI.p -> GtkListBoxRowClass.FFI.non_opt GtkListBoxRowClass.FFI.p;
    val getSelectionMode_ = _import "gtk_list_box_get_selection_mode" : GtkListBoxClass.FFI.non_opt GtkListBoxClass.FFI.p -> GtkSelectionMode.FFI.val_;
    val insert_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_list_box_insert" :
              GtkListBoxClass.FFI.non_opt GtkListBoxClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val invalidateFilter_ = _import "gtk_list_box_invalidate_filter" : GtkListBoxClass.FFI.non_opt GtkListBoxClass.FFI.p -> unit;
    val invalidateHeaders_ = _import "gtk_list_box_invalidate_headers" : GtkListBoxClass.FFI.non_opt GtkListBoxClass.FFI.p -> unit;
    val invalidateSort_ = _import "gtk_list_box_invalidate_sort" : GtkListBoxClass.FFI.non_opt GtkListBoxClass.FFI.p -> unit;
    val prepend_ = fn x1 & x2 => (_import "gtk_list_box_prepend" : GtkListBoxClass.FFI.non_opt GtkListBoxClass.FFI.p * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val selectAll_ = _import "gtk_list_box_select_all" : GtkListBoxClass.FFI.non_opt GtkListBoxClass.FFI.p -> unit;
    val selectRow_ = fn x1 & x2 => (_import "gtk_list_box_select_row" : GtkListBoxClass.FFI.non_opt GtkListBoxClass.FFI.p * GtkListBoxRowClass.FFI.opt GtkListBoxRowClass.FFI.p -> unit;) (x1, x2)
    val setActivateOnSingleClick_ = fn x1 & x2 => (_import "gtk_list_box_set_activate_on_single_click" : GtkListBoxClass.FFI.non_opt GtkListBoxClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setAdjustment_ = fn x1 & x2 => (_import "gtk_list_box_set_adjustment" : GtkListBoxClass.FFI.non_opt GtkListBoxClass.FFI.p * GtkAdjustmentClass.FFI.opt GtkAdjustmentClass.FFI.p -> unit;) (x1, x2)
    val setPlaceholder_ = fn x1 & x2 => (_import "gtk_list_box_set_placeholder" : GtkListBoxClass.FFI.non_opt GtkListBoxClass.FFI.p * GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val setSelectionMode_ = fn x1 & x2 => (_import "gtk_list_box_set_selection_mode" : GtkListBoxClass.FFI.non_opt GtkListBoxClass.FFI.p * GtkSelectionMode.FFI.val_ -> unit;) (x1, x2)
    val unselectAll_ = _import "gtk_list_box_unselect_all" : GtkListBoxClass.FFI.non_opt GtkListBoxClass.FFI.p -> unit;
    val unselectRow_ = fn x1 & x2 => (_import "gtk_list_box_unselect_row" : GtkListBoxClass.FFI.non_opt GtkListBoxClass.FFI.p * GtkListBoxRowClass.FFI.non_opt GtkListBoxRowClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GtkListBoxClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a adjustment_class = 'a GtkAdjustmentClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type movement_step_t = GtkMovementStep.t
    type 'a list_box_row_class = 'a GtkListBoxRowClass.class
    type selection_mode_t = GtkSelectionMode.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkListBoxClass.FFI.fromPtr false) new_ ()
    fun dragHighlightRow self row = (GtkListBoxClass.FFI.withPtr false &&&> GtkListBoxRowClass.FFI.withPtr false ---> I) dragHighlightRow_ (self & row)
    fun dragUnhighlightRow self = (GtkListBoxClass.FFI.withPtr false ---> I) dragUnhighlightRow_ self
    fun getActivateOnSingleClick self = (GtkListBoxClass.FFI.withPtr false ---> GBool.FFI.fromVal) getActivateOnSingleClick_ self
    fun getAdjustment self = (GtkListBoxClass.FFI.withPtr false ---> GtkAdjustmentClass.FFI.fromPtr false) getAdjustment_ self
    fun getRowAtIndex self index = (GtkListBoxClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> GtkListBoxRowClass.FFI.fromOptPtr false) getRowAtIndex_ (self & index)
    fun getRowAtY self y = (GtkListBoxClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> GtkListBoxRowClass.FFI.fromOptPtr false) getRowAtY_ (self & y)
    fun getSelectedRow self = (GtkListBoxClass.FFI.withPtr false ---> GtkListBoxRowClass.FFI.fromPtr false) getSelectedRow_ self
    fun getSelectionMode self = (GtkListBoxClass.FFI.withPtr false ---> GtkSelectionMode.FFI.fromVal) getSelectionMode_ self
    fun insert self (child, position) =
      (
        GtkListBoxClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         ---> I
      )
        insert_
        (
          self
           & child
           & position
        )
    fun invalidateFilter self = (GtkListBoxClass.FFI.withPtr false ---> I) invalidateFilter_ self
    fun invalidateHeaders self = (GtkListBoxClass.FFI.withPtr false ---> I) invalidateHeaders_ self
    fun invalidateSort self = (GtkListBoxClass.FFI.withPtr false ---> I) invalidateSort_ self
    fun prepend self child = (GtkListBoxClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> I) prepend_ (self & child)
    fun selectAll self = (GtkListBoxClass.FFI.withPtr false ---> I) selectAll_ self
    fun selectRow self row = (GtkListBoxClass.FFI.withPtr false &&&> GtkListBoxRowClass.FFI.withOptPtr false ---> I) selectRow_ (self & row)
    fun setActivateOnSingleClick self single = (GtkListBoxClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setActivateOnSingleClick_ (self & single)
    fun setAdjustment self adjustment = (GtkListBoxClass.FFI.withPtr false &&&> GtkAdjustmentClass.FFI.withOptPtr false ---> I) setAdjustment_ (self & adjustment)
    fun setPlaceholder self placeholder = (GtkListBoxClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withOptPtr false ---> I) setPlaceholder_ (self & placeholder)
    fun setSelectionMode self mode = (GtkListBoxClass.FFI.withPtr false &&&> GtkSelectionMode.FFI.withVal ---> I) setSelectionMode_ (self & mode)
    fun unselectAll self = (GtkListBoxClass.FFI.withPtr false ---> I) unselectAll_ self
    fun unselectRow self row = (GtkListBoxClass.FFI.withPtr false &&&> GtkListBoxRowClass.FFI.withPtr false ---> I) unselectRow_ (self & row)
    local
      open ClosureMarshal Signal
    in
      fun activateCursorRowSig f = signal "activate-cursor-row" (void ---> ret_void) f
      fun moveCursorSig f = signal "move-cursor" (get 0w1 GtkMovementStep.t &&&> get 0w2 int ---> ret_void) (fn object & p0 => f (object, p0))
      fun rowActivatedSig f = signal "row-activated" (get 0w1 GtkListBoxRowClass.t ---> ret_void) f
      fun rowSelectedSig f = signal "row-selected" (get 0w1 GtkListBoxRowClass.tOpt ---> ret_void) f
      fun selectAllSig f = signal "select-all" (void ---> ret_void) f
      fun selectedRowsChangedSig f = signal "selected-rows-changed" (void ---> ret_void) f
      fun toggleCursorRowSig f = signal "toggle-cursor-row" (void ---> ret_void) f
      fun unselectAllSig f = signal "unselect-all" (void ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val activateOnSingleClickProp =
        {
          name = "activate-on-single-click",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val selectionModeProp =
        {
          name = "selection-mode",
          gtype = fn () => C.gtype GtkSelectionMode.t (),
          get = fn x => fn () => C.get GtkSelectionMode.t x,
          set = fn x => C.set GtkSelectionMode.t x,
          init = fn x => C.set GtkSelectionMode.t x
        }
    end
  end
