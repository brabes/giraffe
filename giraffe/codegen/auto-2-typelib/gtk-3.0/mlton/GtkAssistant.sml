structure GtkAssistant :>
  GTK_ASSISTANT
    where type 'a class_t = 'a GtkAssistantClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type assistantpagetype_t = GtkAssistantPageType.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t =
  struct
    val getType_ = _import "gtk_assistant_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_assistant_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val addActionWidget_ = fn x1 & x2 => (_import "gtk_assistant_add_action_widget" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val appendPage_ = fn x1 & x2 => (_import "gtk_assistant_append_page" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.C.val_;) (x1, x2)
    val commit_ = _import "gtk_assistant_commit" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val getCurrentPage_ = _import "gtk_assistant_get_current_page" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.C.val_;
    val getNPages_ = _import "gtk_assistant_get_n_pages" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.C.val_;
    val getNthPage_ = fn x1 & x2 => (_import "gtk_assistant_get_nth_page" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int32.C.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getPageComplete_ = fn x1 & x2 => (_import "gtk_assistant_get_page_complete" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val getPageTitle_ = fn x1 & x2 => (_import "gtk_assistant_get_page_title" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;) (x1, x2)
    val getPageType_ = fn x1 & x2 => (_import "gtk_assistant_get_page_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkAssistantPageType.C.val_;) (x1, x2)
    val insertPage_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_assistant_insert_page" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.C.val_
               -> FFI.Int32.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val nextPage_ = _import "gtk_assistant_next_page" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val prependPage_ = fn x1 & x2 => (_import "gtk_assistant_prepend_page" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.C.val_;) (x1, x2)
    val previousPage_ = _import "gtk_assistant_previous_page" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val removeActionWidget_ = fn x1 & x2 => (_import "gtk_assistant_remove_action_widget" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val removePage_ = fn x1 & x2 => (_import "gtk_assistant_remove_page" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setCurrentPage_ = fn x1 & x2 => (_import "gtk_assistant_set_current_page" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setPageComplete_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_assistant_set_page_complete" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Bool.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setPageTitle_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_assistant_set_page_title" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setPageType_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_assistant_set_page_type" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkAssistantPageType.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val updateButtonsState_ = _import "gtk_assistant_update_buttons_state" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    type 'a class_t = 'a GtkAssistantClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type assistantpagetype_t = GtkAssistantPageType.t
    type 'a widgetclass_t = 'a GtkWidgetClass.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkAssistantClass.C.fromPtr false) new_ ()
    fun addActionWidget self child = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) addActionWidget_ (self & child)
    fun appendPage self page = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) appendPage_ (self & page)
    fun commit self = (GObjectObjectClass.C.withPtr ---> I) commit_ self
    fun getCurrentPage self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getCurrentPage_ self
    fun getNPages self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getNPages_ self
    fun getNthPage self pageNum = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> GtkWidgetClass.C.fromPtr false) getNthPage_ (self & pageNum)
    fun getPageComplete self page = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getPageComplete_ (self & page)
    fun getPageTitle self page = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getPageTitle_ (self & page)
    fun getPageType self page = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> GtkAssistantPageType.C.fromVal) getPageType_ (self & page)
    fun insertPage self page position =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         ---> FFI.Int32.C.fromVal
      )
        insertPage_
        (
          self
           & page
           & position
        )
    fun nextPage self = (GObjectObjectClass.C.withPtr ---> I) nextPage_ self
    fun prependPage self page = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) prependPage_ (self & page)
    fun previousPage self = (GObjectObjectClass.C.withPtr ---> I) previousPage_ self
    fun removeActionWidget self child = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) removeActionWidget_ (self & child)
    fun removePage self pageNum = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) removePage_ (self & pageNum)
    fun setCurrentPage self pageNum = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setCurrentPage_ (self & pageNum)
    fun setPageComplete self page complete =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        setPageComplete_
        (
          self
           & page
           & complete
        )
    fun setPageTitle self page title =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         ---> I
      )
        setPageTitle_
        (
          self
           & page
           & title
        )
    fun setPageType self page type' =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GtkAssistantPageType.C.withVal
         ---> I
      )
        setPageType_
        (
          self
           & page
           & type'
        )
    fun updateButtonsState self = (GObjectObjectClass.C.withPtr ---> I) updateButtonsState_ self
    local
      open ClosureMarshal Signal
    in
      fun applySig f = signal "apply" (void ---> ret_void) f
      fun cancelSig f = signal "cancel" (void ---> ret_void) f
      fun closeSig f = signal "close" (void ---> ret_void) f
      fun prepareSig f = signal "prepare" (get 0w1 GtkWidgetClass.t ---> ret_void) f
    end
  end