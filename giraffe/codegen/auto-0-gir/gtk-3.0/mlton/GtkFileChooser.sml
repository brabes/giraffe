structure GtkFileChooser :>
  GTK_FILE_CHOOSER
    where type 'a class = 'a GtkFileChooserClass.class
    where type file_chooser_confirmation_t = GtkFileChooserConfirmation.t
    where type file_chooser_action_t = GtkFileChooserAction.t
    where type 'a file_filter_class = 'a GtkFileFilterClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_file_chooser_get_type" : unit -> GObjectType.FFI.val_;
    val addChoice_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & (x6, x7)
         & (x8, x9) =>
          (
            _import "mlton_gtk_file_chooser_add_choice" :
              GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9
            )
    val addFilter_ = fn x1 & x2 => (_import "gtk_file_chooser_add_filter" : GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p * GtkFileFilterClass.FFI.non_opt GtkFileFilterClass.FFI.p -> unit;) (x1, x2)
    val addShortcutFolder_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_file_chooser_add_shortcut_folder" :
              GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val addShortcutFolderUri_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_file_chooser_add_shortcut_folder_uri" :
              GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getAction_ = _import "gtk_file_chooser_get_action" : GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p -> GtkFileChooserAction.FFI.val_;
    val getChoice_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_file_chooser_get_choice" :
              GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getCreateFolders_ = _import "gtk_file_chooser_get_create_folders" : GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p -> GBool.FFI.val_;
    val getCurrentFolder_ = _import "gtk_file_chooser_get_current_folder" : GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getCurrentFolderFile_ = _import "gtk_file_chooser_get_current_folder_file" : GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p -> GioFileClass.FFI.non_opt GioFileClass.FFI.p;
    val getCurrentFolderUri_ = _import "gtk_file_chooser_get_current_folder_uri" : GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getCurrentName_ = _import "gtk_file_chooser_get_current_name" : GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getDoOverwriteConfirmation_ = _import "gtk_file_chooser_get_do_overwrite_confirmation" : GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p -> GBool.FFI.val_;
    val getExtraWidget_ = _import "gtk_file_chooser_get_extra_widget" : GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p -> GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p;
    val getFile_ = _import "gtk_file_chooser_get_file" : GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p -> GioFileClass.FFI.non_opt GioFileClass.FFI.p;
    val getFilename_ = _import "gtk_file_chooser_get_filename" : GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getFilter_ = _import "gtk_file_chooser_get_filter" : GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p -> GtkFileFilterClass.FFI.opt GtkFileFilterClass.FFI.p;
    val getLocalOnly_ = _import "gtk_file_chooser_get_local_only" : GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p -> GBool.FFI.val_;
    val getPreviewFile_ = _import "gtk_file_chooser_get_preview_file" : GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p -> GioFileClass.FFI.opt GioFileClass.FFI.p;
    val getPreviewFilename_ = _import "gtk_file_chooser_get_preview_filename" : GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getPreviewUri_ = _import "gtk_file_chooser_get_preview_uri" : GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getPreviewWidget_ = _import "gtk_file_chooser_get_preview_widget" : GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p -> GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p;
    val getPreviewWidgetActive_ = _import "gtk_file_chooser_get_preview_widget_active" : GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p -> GBool.FFI.val_;
    val getSelectMultiple_ = _import "gtk_file_chooser_get_select_multiple" : GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p -> GBool.FFI.val_;
    val getShowHidden_ = _import "gtk_file_chooser_get_show_hidden" : GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p -> GBool.FFI.val_;
    val getUri_ = _import "gtk_file_chooser_get_uri" : GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getUsePreviewLabel_ = _import "gtk_file_chooser_get_use_preview_label" : GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p -> GBool.FFI.val_;
    val removeChoice_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_file_chooser_remove_choice" :
              GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val removeFilter_ = fn x1 & x2 => (_import "gtk_file_chooser_remove_filter" : GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p * GtkFileFilterClass.FFI.non_opt GtkFileFilterClass.FFI.p -> unit;) (x1, x2)
    val removeShortcutFolder_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_file_chooser_remove_shortcut_folder" :
              GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val removeShortcutFolderUri_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_file_chooser_remove_shortcut_folder_uri" :
              GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val selectAll_ = _import "gtk_file_chooser_select_all" : GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p -> unit;
    val selectFile_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_file_chooser_select_file" :
              GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p
               * GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val selectFilename_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_file_chooser_select_filename" :
              GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val selectUri_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_file_chooser_select_uri" :
              GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setAction_ = fn x1 & x2 => (_import "gtk_file_chooser_set_action" : GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p * GtkFileChooserAction.FFI.val_ -> unit;) (x1, x2)
    val setChoice_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_gtk_file_chooser_set_choice" :
              GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val setCreateFolders_ = fn x1 & x2 => (_import "gtk_file_chooser_set_create_folders" : GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setCurrentFolder_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_file_chooser_set_current_folder" :
              GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setCurrentFolderFile_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_file_chooser_set_current_folder_file" :
              GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p
               * GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setCurrentFolderUri_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_file_chooser_set_current_folder_uri" :
              GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setCurrentName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_file_chooser_set_current_name" :
              GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setDoOverwriteConfirmation_ = fn x1 & x2 => (_import "gtk_file_chooser_set_do_overwrite_confirmation" : GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setExtraWidget_ = fn x1 & x2 => (_import "gtk_file_chooser_set_extra_widget" : GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val setFile_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_file_chooser_set_file" :
              GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p
               * GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setFilename_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_file_chooser_set_filename" :
              GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setFilter_ = fn x1 & x2 => (_import "gtk_file_chooser_set_filter" : GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p * GtkFileFilterClass.FFI.non_opt GtkFileFilterClass.FFI.p -> unit;) (x1, x2)
    val setLocalOnly_ = fn x1 & x2 => (_import "gtk_file_chooser_set_local_only" : GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setPreviewWidget_ = fn x1 & x2 => (_import "gtk_file_chooser_set_preview_widget" : GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val setPreviewWidgetActive_ = fn x1 & x2 => (_import "gtk_file_chooser_set_preview_widget_active" : GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setSelectMultiple_ = fn x1 & x2 => (_import "gtk_file_chooser_set_select_multiple" : GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setShowHidden_ = fn x1 & x2 => (_import "gtk_file_chooser_set_show_hidden" : GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setUri_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_file_chooser_set_uri" :
              GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setUsePreviewLabel_ = fn x1 & x2 => (_import "gtk_file_chooser_set_use_preview_label" : GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val unselectAll_ = _import "gtk_file_chooser_unselect_all" : GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p -> unit;
    val unselectFile_ = fn x1 & x2 => (_import "gtk_file_chooser_unselect_file" : GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p * GioFileClass.FFI.non_opt GioFileClass.FFI.p -> unit;) (x1, x2)
    val unselectFilename_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_file_chooser_unselect_filename" :
              GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val unselectUri_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_file_chooser_unselect_uri" :
              GtkFileChooserClass.FFI.non_opt GtkFileChooserClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkFileChooserClass.class
    type file_chooser_confirmation_t = GtkFileChooserConfirmation.t
    type file_chooser_action_t = GtkFileChooserAction.t
    type 'a file_filter_class = 'a GtkFileFilterClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun addChoice
      self
      (
        id,
        label,
        options,
        optionLabels
      ) =
      (
        GtkFileChooserClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         ---> I
      )
        addChoice_
        (
          self
           & id
           & label
           & options
           & optionLabels
        )
    fun addFilter self filter = (GtkFileChooserClass.FFI.withPtr false &&&> GtkFileFilterClass.FFI.withPtr true ---> I) addFilter_ (self & filter)
    fun addShortcutFolder self folder =
      (
        GtkFileChooserClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        addShortcutFolder_
        (
          self
           & folder
           & []
        )
    fun addShortcutFolderUri self uri =
      (
        GtkFileChooserClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        addShortcutFolderUri_
        (
          self
           & uri
           & []
        )
    fun getAction self = (GtkFileChooserClass.FFI.withPtr false ---> GtkFileChooserAction.FFI.fromVal) getAction_ self
    fun getChoice self id = (GtkFileChooserClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr 0) getChoice_ (self & id) before GtkFileChooserClass.FFI.touchPtr self before Utf8.FFI.touchPtr id
    fun getCreateFolders self = (GtkFileChooserClass.FFI.withPtr false ---> GBool.FFI.fromVal) getCreateFolders_ self
    fun getCurrentFolder self = (GtkFileChooserClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr ~1) getCurrentFolder_ self
    fun getCurrentFolderFile self = (GtkFileChooserClass.FFI.withPtr false ---> GioFileClass.FFI.fromPtr true) getCurrentFolderFile_ self
    fun getCurrentFolderUri self = (GtkFileChooserClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr ~1) getCurrentFolderUri_ self
    fun getCurrentName self = (GtkFileChooserClass.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) getCurrentName_ self
    fun getDoOverwriteConfirmation self = (GtkFileChooserClass.FFI.withPtr false ---> GBool.FFI.fromVal) getDoOverwriteConfirmation_ self
    fun getExtraWidget self = (GtkFileChooserClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getExtraWidget_ self before GtkFileChooserClass.FFI.touchPtr self
    fun getFile self = (GtkFileChooserClass.FFI.withPtr false ---> GioFileClass.FFI.fromPtr true) getFile_ self
    fun getFilename self = (GtkFileChooserClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr ~1) getFilename_ self
    fun getFilter self = (GtkFileChooserClass.FFI.withPtr false ---> GtkFileFilterClass.FFI.fromOptPtr false) getFilter_ self before GtkFileChooserClass.FFI.touchPtr self
    fun getLocalOnly self = (GtkFileChooserClass.FFI.withPtr false ---> GBool.FFI.fromVal) getLocalOnly_ self
    fun getPreviewFile self = (GtkFileChooserClass.FFI.withPtr false ---> GioFileClass.FFI.fromOptPtr true) getPreviewFile_ self
    fun getPreviewFilename self = (GtkFileChooserClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr ~1) getPreviewFilename_ self
    fun getPreviewUri self = (GtkFileChooserClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr ~1) getPreviewUri_ self
    fun getPreviewWidget self = (GtkFileChooserClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getPreviewWidget_ self before GtkFileChooserClass.FFI.touchPtr self
    fun getPreviewWidgetActive self = (GtkFileChooserClass.FFI.withPtr false ---> GBool.FFI.fromVal) getPreviewWidgetActive_ self
    fun getSelectMultiple self = (GtkFileChooserClass.FFI.withPtr false ---> GBool.FFI.fromVal) getSelectMultiple_ self
    fun getShowHidden self = (GtkFileChooserClass.FFI.withPtr false ---> GBool.FFI.fromVal) getShowHidden_ self
    fun getUri self = (GtkFileChooserClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr ~1) getUri_ self
    fun getUsePreviewLabel self = (GtkFileChooserClass.FFI.withPtr false ---> GBool.FFI.fromVal) getUsePreviewLabel_ self
    fun removeChoice self id = (GtkFileChooserClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) removeChoice_ (self & id)
    fun removeFilter self filter = (GtkFileChooserClass.FFI.withPtr false &&&> GtkFileFilterClass.FFI.withPtr false ---> I) removeFilter_ (self & filter)
    fun removeShortcutFolder self folder =
      (
        GtkFileChooserClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        removeShortcutFolder_
        (
          self
           & folder
           & []
        )
    fun removeShortcutFolderUri self uri =
      (
        GtkFileChooserClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        removeShortcutFolderUri_
        (
          self
           & uri
           & []
        )
    fun selectAll self = (GtkFileChooserClass.FFI.withPtr false ---> I) selectAll_ self
    fun selectFile self file =
      (
        GtkFileChooserClass.FFI.withPtr false
         &&&> GioFileClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        selectFile_
        (
          self
           & file
           & []
        )
    fun selectFilename self filename = (GtkFileChooserClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) selectFilename_ (self & filename)
    fun selectUri self uri = (GtkFileChooserClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) selectUri_ (self & uri)
    fun setAction self action = (GtkFileChooserClass.FFI.withPtr false &&&> GtkFileChooserAction.FFI.withVal ---> I) setAction_ (self & action)
    fun setChoice self (id, option) =
      (
        GtkFileChooserClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         ---> I
      )
        setChoice_
        (
          self
           & id
           & option
        )
    fun setCreateFolders self createFolders = (GtkFileChooserClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setCreateFolders_ (self & createFolders)
    fun setCurrentFolder self filename = (GtkFileChooserClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) setCurrentFolder_ (self & filename)
    fun setCurrentFolderFile self file =
      (
        GtkFileChooserClass.FFI.withPtr false
         &&&> GioFileClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        setCurrentFolderFile_
        (
          self
           & file
           & []
        )
    fun setCurrentFolderUri self uri = (GtkFileChooserClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) setCurrentFolderUri_ (self & uri)
    fun setCurrentName self name = (GtkFileChooserClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setCurrentName_ (self & name)
    fun setDoOverwriteConfirmation self doOverwriteConfirmation = (GtkFileChooserClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setDoOverwriteConfirmation_ (self & doOverwriteConfirmation)
    fun setExtraWidget self extraWidget = (GtkFileChooserClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> I) setExtraWidget_ (self & extraWidget)
    fun setFile self file =
      (
        GtkFileChooserClass.FFI.withPtr false
         &&&> GioFileClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        setFile_
        (
          self
           & file
           & []
        )
    fun setFilename self filename = (GtkFileChooserClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) setFilename_ (self & filename)
    fun setFilter self filter = (GtkFileChooserClass.FFI.withPtr false &&&> GtkFileFilterClass.FFI.withPtr false ---> I) setFilter_ (self & filter)
    fun setLocalOnly self localOnly = (GtkFileChooserClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setLocalOnly_ (self & localOnly)
    fun setPreviewWidget self previewWidget = (GtkFileChooserClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> I) setPreviewWidget_ (self & previewWidget)
    fun setPreviewWidgetActive self active = (GtkFileChooserClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setPreviewWidgetActive_ (self & active)
    fun setSelectMultiple self selectMultiple = (GtkFileChooserClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setSelectMultiple_ (self & selectMultiple)
    fun setShowHidden self showHidden = (GtkFileChooserClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setShowHidden_ (self & showHidden)
    fun setUri self uri = (GtkFileChooserClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) setUri_ (self & uri)
    fun setUsePreviewLabel self useLabel = (GtkFileChooserClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setUsePreviewLabel_ (self & useLabel)
    fun unselectAll self = (GtkFileChooserClass.FFI.withPtr false ---> I) unselectAll_ self
    fun unselectFile self file = (GtkFileChooserClass.FFI.withPtr false &&&> GioFileClass.FFI.withPtr false ---> I) unselectFile_ (self & file)
    fun unselectFilename self filename = (GtkFileChooserClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) unselectFilename_ (self & filename)
    fun unselectUri self uri = (GtkFileChooserClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) unselectUri_ (self & uri)
    local
      open ClosureMarshal Signal
    in
      fun confirmOverwriteSig f = signal "confirm-overwrite" (void ---> ret GtkFileChooserConfirmation.t) f
      fun currentFolderChangedSig f = signal "current-folder-changed" (void ---> ret_void) f
      fun fileActivatedSig f = signal "file-activated" (void ---> ret_void) f
      fun selectionChangedSig f = signal "selection-changed" (void ---> ret_void) f
      fun updatePreviewSig f = signal "update-preview" (void ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val actionProp =
        {
          name = "action",
          gtype = fn () => C.gtype GtkFileChooserAction.t (),
          get = fn x => fn () => C.get GtkFileChooserAction.t x,
          set = fn x => C.set GtkFileChooserAction.t x,
          init = fn x => C.set GtkFileChooserAction.t x
        }
      val createFoldersProp =
        {
          name = "create-folders",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val doOverwriteConfirmationProp =
        {
          name = "do-overwrite-confirmation",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val extraWidgetProp =
        {
          name = "extra-widget",
          gtype = fn () => C.gtype GtkWidgetClass.tOpt (),
          get = fn x => fn () => C.get GtkWidgetClass.tOpt x,
          set = fn x => C.set GtkWidgetClass.tOpt x,
          init = fn x => C.set GtkWidgetClass.tOpt x
        }
      val filterProp =
        {
          name = "filter",
          gtype = fn () => C.gtype GtkFileFilterClass.tOpt (),
          get = fn x => fn () => C.get GtkFileFilterClass.tOpt x,
          set = fn x => C.set GtkFileFilterClass.tOpt x,
          init = fn x => C.set GtkFileFilterClass.tOpt x
        }
      val localOnlyProp =
        {
          name = "local-only",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val previewWidgetProp =
        {
          name = "preview-widget",
          gtype = fn () => C.gtype GtkWidgetClass.tOpt (),
          get = fn x => fn () => C.get GtkWidgetClass.tOpt x,
          set = fn x => C.set GtkWidgetClass.tOpt x,
          init = fn x => C.set GtkWidgetClass.tOpt x
        }
      val previewWidgetActiveProp =
        {
          name = "preview-widget-active",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val selectMultipleProp =
        {
          name = "select-multiple",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val showHiddenProp =
        {
          name = "show-hidden",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val usePreviewLabelProp =
        {
          name = "use-preview-label",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
