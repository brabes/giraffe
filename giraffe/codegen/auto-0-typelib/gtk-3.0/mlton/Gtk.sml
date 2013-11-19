structure Gtk : GTK =
  struct
    val accelGroupsActivate_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_accel_groups_activate" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.UInt32.C.val_
               * GdkModifierType.C.val_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val acceleratorGetDefaultModMask_ = _import "gtk_accelerator_get_default_mod_mask" : unit -> GdkModifierType.C.val_;
    val acceleratorGetLabel_ = fn x1 & x2 => (_import "gtk_accelerator_get_label" : FFI.UInt32.C.val_ * GdkModifierType.C.val_ -> FFI.String.C.notnull FFI.String.C.out_p;) (x1, x2)
    val acceleratorName_ = fn x1 & x2 => (_import "gtk_accelerator_name" : FFI.UInt32.C.val_ * GdkModifierType.C.val_ -> FFI.String.C.notnull FFI.String.C.out_p;) (x1, x2)
    val acceleratorParse_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_gtk_accelerator_parse" :
              cstring
               * unit CPointer.t
               * FFI.UInt32.C.ref_
               * GdkModifierType.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val acceleratorSetDefaultModMask_ = _import "gtk_accelerator_set_default_mod_mask" : GdkModifierType.C.val_ -> unit;
    val acceleratorValid_ = fn x1 & x2 => (_import "gtk_accelerator_valid" : FFI.UInt32.C.val_ * GdkModifierType.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val alternativeDialogButtonOrder_ = _import "gtk_alternative_dialog_button_order" : unit GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val builderErrorQuark_ = _import "gtk_builder_error_quark" : unit -> FFI.UInt32.C.val_;
    val cairoShouldDrawWindow_ = fn x1 & x2 => (_import "gtk_cairo_should_draw_window" : CairoContextRecord.C.notnull CairoContextRecord.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val cairoTransformToWindow_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_cairo_transform_to_window" :
              CairoContextRecord.C.notnull CairoContextRecord.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val checkVersion_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_check_version" :
              FFI.UInt32.C.val_
               * FFI.UInt32.C.val_
               * FFI.UInt32.C.val_
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val cssProviderErrorQuark_ = _import "gtk_css_provider_error_quark" : unit -> FFI.UInt32.C.val_;
    val deviceGrabAdd_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_device_grab_add" :
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
    val deviceGrabRemove_ = fn x1 & x2 => (_import "gtk_device_grab_remove" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val disableSetlocale_ = _import "gtk_disable_setlocale" : unit -> unit;
    val dragFinish_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_drag_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Bool.C.val_
               * FFI.Bool.C.val_
               * FFI.UInt32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val dragGetSourceWidget_ = _import "gtk_drag_get_source_widget" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val dragSetIconDefault_ = _import "gtk_drag_set_icon_default" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val dragSetIconGicon_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_drag_set_icon_gicon" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val dragSetIconName_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_gtk_drag_set_icon_name" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val dragSetIconPixbuf_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_drag_set_icon_pixbuf" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val dragSetIconStock_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_gtk_drag_set_icon_stock" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val dragSetIconSurface_ = fn x1 & x2 => (_import "gtk_drag_set_icon_surface" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * CairoSurfaceRecord.C.notnull CairoSurfaceRecord.C.p -> unit;) (x1, x2)
    val dragSetIconWidget_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_drag_set_icon_widget" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val drawInsertionCursor_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_draw_insertion_cursor" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * CairoRectangleIntRecord.C.notnull CairoRectangleIntRecord.C.p
               * FFI.Bool.C.val_
               * GtkTextDirection.C.val_
               * FFI.Bool.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val eventsPending_ = _import "gtk_events_pending" : unit -> FFI.Bool.C.val_;
    val fileChooserErrorQuark_ = _import "gtk_file_chooser_error_quark" : unit -> FFI.UInt32.C.val_;
    val getBinaryAge_ = _import "gtk_get_binary_age" : unit -> FFI.UInt32.C.val_;
    val getCurrentEvent_ = _import "gtk_get_current_event" : unit -> GdkEvent.C.notnull GdkEvent.C.p;
    val getCurrentEventDevice_ = _import "gtk_get_current_event_device" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getCurrentEventState_ = _import "gtk_get_current_event_state" : GdkModifierType.C.ref_ -> FFI.Bool.C.val_;
    val getCurrentEventTime_ = _import "gtk_get_current_event_time" : unit -> FFI.UInt32.C.val_;
    val getDebugFlags_ = _import "gtk_get_debug_flags" : unit -> FFI.UInt32.C.val_;
    val getDefaultLanguage_ = _import "gtk_get_default_language" : unit -> PangoLanguageRecord.C.notnull PangoLanguageRecord.C.p;
    val getEventWidget_ = _import "gtk_get_event_widget" : GdkEvent.C.notnull GdkEvent.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getInterfaceAge_ = _import "gtk_get_interface_age" : unit -> FFI.UInt32.C.val_;
    val getMajorVersion_ = _import "gtk_get_major_version" : unit -> FFI.UInt32.C.val_;
    val getMicroVersion_ = _import "gtk_get_micro_version" : unit -> FFI.UInt32.C.val_;
    val getMinorVersion_ = _import "gtk_get_minor_version" : unit -> FFI.UInt32.C.val_;
    val grabGetCurrent_ = _import "gtk_grab_get_current" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val iconSizeFromName_ = _import "mlton_gtk_icon_size_from_name" : cstring * unit CPointer.t -> FFI.Int32.C.val_;
    val iconSizeGetName_ = _import "gtk_icon_size_get_name" : FFI.Int32.C.val_ -> FFI.String.C.notnull FFI.String.C.out_p;
    val iconSizeLookup_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_icon_size_lookup" :
              FFI.Int32.C.val_
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val iconSizeLookupForSettings_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_icon_size_lookup_for_settings" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val iconSizeRegister_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_gtk_icon_size_register" :
              cstring
               * unit CPointer.t
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               -> FFI.Int32.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val iconSizeRegisterAlias_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_icon_size_register_alias" :
              cstring
               * unit CPointer.t
               * FFI.Int32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val iconThemeErrorQuark_ = _import "gtk_icon_theme_error_quark" : unit -> FFI.UInt32.C.val_;
    val keySnooperRemove_ = _import "gtk_key_snooper_remove" : FFI.UInt32.C.val_ -> unit;
    val main_ = _import "gtk_main" : unit -> unit;
    val mainDoEvent_ = _import "gtk_main_do_event" : GdkEvent.C.notnull GdkEvent.C.p -> unit;
    val mainIteration_ = _import "gtk_main_iteration" : unit -> FFI.Bool.C.val_;
    val mainIterationDo_ = _import "gtk_main_iteration_do" : FFI.Bool.C.val_ -> FFI.Bool.C.val_;
    val mainLevel_ = _import "gtk_main_level" : unit -> FFI.UInt32.C.val_;
    val mainQuit_ = _import "gtk_main_quit" : unit -> unit;
    val paintArrow_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & (x6, x7)
         & x8
         & x9
         & x10
         & x11
         & x12
         & x13 =>
          (
            _import "mlton_gtk_paint_arrow" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * GtkStateType.C.val_
               * GtkShadowType.C.val_
               * unit GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * GtkArrowType.C.val_
               * FFI.Bool.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
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
              x9,
              x10,
              x11,
              x12,
              x13
            )
    val paintBox_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & (x6, x7)
         & x8
         & x9
         & x10
         & x11 =>
          (
            _import "mlton_gtk_paint_box" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * GtkStateType.C.val_
               * GtkShadowType.C.val_
               * unit GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
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
              x9,
              x10,
              x11
            )
    val paintBoxGap_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & (x6, x7)
         & x8
         & x9
         & x10
         & x11
         & x12
         & x13
         & x14 =>
          (
            _import "mlton_gtk_paint_box_gap" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * GtkStateType.C.val_
               * GtkShadowType.C.val_
               * unit GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * GtkPositionType.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
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
              x9,
              x10,
              x11,
              x12,
              x13,
              x14
            )
    val paintCheck_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & (x6, x7)
         & x8
         & x9
         & x10
         & x11 =>
          (
            _import "mlton_gtk_paint_check" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * GtkStateType.C.val_
               * GtkShadowType.C.val_
               * unit GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
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
              x9,
              x10,
              x11
            )
    val paintDiamond_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & (x6, x7)
         & x8
         & x9
         & x10
         & x11 =>
          (
            _import "mlton_gtk_paint_diamond" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * GtkStateType.C.val_
               * GtkShadowType.C.val_
               * unit GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
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
              x9,
              x10,
              x11
            )
    val paintExpander_ =
      fn
        x1
         & x2
         & x3
         & x4
         & (x5, x6)
         & x7
         & x8
         & x9 =>
          (
            _import "mlton_gtk_paint_expander" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * GtkStateType.C.val_
               * unit GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * GtkExpanderStyle.C.val_
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
    val paintExtension_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & (x6, x7)
         & x8
         & x9
         & x10
         & x11
         & x12 =>
          (
            _import "mlton_gtk_paint_extension" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * GtkStateType.C.val_
               * GtkShadowType.C.val_
               * unit GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * GtkPositionType.C.val_
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
              x9,
              x10,
              x11,
              x12
            )
    val paintFlatBox_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & (x6, x7)
         & x8
         & x9
         & x10
         & x11 =>
          (
            _import "mlton_gtk_paint_flat_box" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * GtkStateType.C.val_
               * GtkShadowType.C.val_
               * unit GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
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
              x9,
              x10,
              x11
            )
    val paintFocus_ =
      fn
        x1
         & x2
         & x3
         & x4
         & (x5, x6)
         & x7
         & x8
         & x9
         & x10 =>
          (
            _import "mlton_gtk_paint_focus" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * GtkStateType.C.val_
               * unit GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
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
              x9,
              x10
            )
    val paintHandle_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & (x6, x7)
         & x8
         & x9
         & x10
         & x11
         & x12 =>
          (
            _import "mlton_gtk_paint_handle" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * GtkStateType.C.val_
               * GtkShadowType.C.val_
               * unit GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * GtkOrientation.C.val_
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
              x9,
              x10,
              x11,
              x12
            )
    val paintHline_ =
      fn
        x1
         & x2
         & x3
         & x4
         & (x5, x6)
         & x7
         & x8
         & x9 =>
          (
            _import "mlton_gtk_paint_hline" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * GtkStateType.C.val_
               * unit GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
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
    val paintLayout_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & (x6, x7)
         & x8
         & x9
         & x10 =>
          (
            _import "mlton_gtk_paint_layout" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * GtkStateType.C.val_
               * FFI.Bool.C.val_
               * unit GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
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
              x9,
              x10
            )
    val paintOption_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & (x6, x7)
         & x8
         & x9
         & x10
         & x11 =>
          (
            _import "mlton_gtk_paint_option" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * GtkStateType.C.val_
               * GtkShadowType.C.val_
               * unit GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
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
              x9,
              x10,
              x11
            )
    val paintResizeGrip_ =
      fn
        x1
         & x2
         & x3
         & x4
         & (x5, x6)
         & x7
         & x8
         & x9
         & x10
         & x11 =>
          (
            _import "mlton_gtk_paint_resize_grip" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * GtkStateType.C.val_
               * unit GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * GdkWindowEdge.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
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
              x9,
              x10,
              x11
            )
    val paintShadow_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & (x6, x7)
         & x8
         & x9
         & x10
         & x11 =>
          (
            _import "mlton_gtk_paint_shadow" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * GtkStateType.C.val_
               * GtkShadowType.C.val_
               * unit GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
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
              x9,
              x10,
              x11
            )
    val paintShadowGap_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & (x6, x7)
         & x8
         & x9
         & x10
         & x11
         & x12
         & x13
         & x14 =>
          (
            _import "mlton_gtk_paint_shadow_gap" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * GtkStateType.C.val_
               * GtkShadowType.C.val_
               * unit GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * GtkPositionType.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
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
              x9,
              x10,
              x11,
              x12,
              x13,
              x14
            )
    val paintSlider_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & (x6, x7)
         & x8
         & x9
         & x10
         & x11
         & x12 =>
          (
            _import "mlton_gtk_paint_slider" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * GtkStateType.C.val_
               * GtkShadowType.C.val_
               * unit GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * GtkOrientation.C.val_
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
              x9,
              x10,
              x11,
              x12
            )
    val paintSpinner_ =
      fn
        x1
         & x2
         & x3
         & x4
         & (x5, x6)
         & x7
         & x8
         & x9
         & x10
         & x11 =>
          (
            _import "mlton_gtk_paint_spinner" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * GtkStateType.C.val_
               * unit GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.UInt32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
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
              x9,
              x10,
              x11
            )
    val paintTab_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & (x6, x7)
         & x8
         & x9
         & x10
         & x11 =>
          (
            _import "mlton_gtk_paint_tab" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * GtkStateType.C.val_
               * GtkShadowType.C.val_
               * unit GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
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
              x9,
              x10,
              x11
            )
    val paintVline_ =
      fn
        x1
         & x2
         & x3
         & x4
         & (x5, x6)
         & x7
         & x8
         & x9 =>
          (
            _import "mlton_gtk_paint_vline" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * GtkStateType.C.val_
               * unit GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
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
    val paperSizeGetDefault_ = _import "gtk_paper_size_get_default" : unit -> FFI.String.C.notnull FFI.String.C.out_p;
    val printErrorQuark_ = _import "gtk_print_error_quark" : unit -> FFI.UInt32.C.val_;
    val printRunPageSetupDialog_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_print_run_page_setup_dialog" :
              unit GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val propagateEvent_ = fn x1 & x2 => (_import "gtk_propagate_event" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkEvent.C.notnull GdkEvent.C.p -> unit;) (x1, x2)
    val rcAddDefaultFile_ = _import "mlton_gtk_rc_add_default_file" : cstring * unit CPointer.t -> unit;
    val rcGetStyle_ = _import "gtk_rc_get_style" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val recentChooserErrorQuark_ = _import "gtk_recent_chooser_error_quark" : unit -> FFI.UInt32.C.val_;
    val recentManagerErrorQuark_ = _import "gtk_recent_manager_error_quark" : unit -> FFI.UInt32.C.val_;
    val renderActivity_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_render_activity" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val renderArrow_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_render_arrow" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val renderBackground_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_render_background" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val renderCheck_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_render_check" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val renderExpander_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_render_expander" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val renderExtension_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "gtk_render_extension" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * GtkPositionType.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val renderFocus_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_render_focus" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val renderFrame_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_render_frame" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val renderFrameGap_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7
         & x8
         & x9 =>
          (
            _import "gtk_render_frame_gap" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * GtkPositionType.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
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
    val renderHandle_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_render_handle" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val renderIcon_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_render_icon" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val renderIconPixbuf_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_render_icon_pixbuf" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkIconSourceRecord.C.notnull GtkIconSourceRecord.C.p
               * FFI.Int32.C.val_
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val renderLayout_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_render_layout" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val renderLine_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_render_line" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val renderOption_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_render_option" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val renderSlider_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "gtk_render_slider" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * GtkOrientation.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val rgbToHsv_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_rgb_to_hsv" :
              FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.ref_
               * FFI.Double.C.ref_
               * FFI.Double.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val selectionAddTarget_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_selection_add_target" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GdkAtomRecord.C.notnull GdkAtomRecord.C.p
               * GdkAtomRecord.C.notnull GdkAtomRecord.C.p
               * FFI.UInt32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val selectionClearTargets_ = fn x1 & x2 => (_import "gtk_selection_clear_targets" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkAtomRecord.C.notnull GdkAtomRecord.C.p -> unit;) (x1, x2)
    val selectionConvert_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_selection_convert" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GdkAtomRecord.C.notnull GdkAtomRecord.C.p
               * GdkAtomRecord.C.notnull GdkAtomRecord.C.p
               * FFI.UInt32.C.val_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val selectionOwnerSet_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_selection_owner_set" :
              unit GObjectObjectClass.C.p
               * GdkAtomRecord.C.notnull GdkAtomRecord.C.p
               * FFI.UInt32.C.val_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val selectionOwnerSetForDisplay_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_selection_owner_set_for_display" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * GdkAtomRecord.C.notnull GdkAtomRecord.C.p
               * FFI.UInt32.C.val_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val selectionRemoveAll_ = _import "gtk_selection_remove_all" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val setDebugFlags_ = _import "gtk_set_debug_flags" : FFI.UInt32.C.val_ -> unit;
    val showUri_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_gtk_show_uri" :
              unit GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.UInt32.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val stockLookup_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_stock_lookup" :
              cstring
               * unit CPointer.t
               * GtkStockItemRecord.C.notnull GtkStockItemRecord.C.p
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val testCreateSimpleWindow_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_gtk_test_create_simple_window" :
              cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val testFindLabel_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_test_find_label" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val testRegisterAllTypes_ = _import "gtk_test_register_all_types" : unit -> unit;
    val testSliderGetValue_ = _import "gtk_test_slider_get_value" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Double.C.val_;
    val testSliderSetPerc_ = fn x1 & x2 => (_import "gtk_test_slider_set_perc" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Double.C.val_ -> unit;) (x1, x2)
    val testSpinButtonClick_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_test_spin_button_click" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.UInt32.C.val_
               * FFI.Bool.C.val_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val testTextGet_ = _import "gtk_test_text_get" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val testTextSet_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_test_text_set" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val testWidgetClick_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_test_widget_click" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.UInt32.C.val_
               * GdkModifierType.C.val_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val testWidgetSendKey_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_test_widget_send_key" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.UInt32.C.val_
               * GdkModifierType.C.val_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val treeGetRowDragData_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_get_row_drag_data" :
              GtkSelectionDataRecord.C.notnull GtkSelectionDataRecord.C.p
               * (unit, GObjectObjectClass.C.notnull) GObjectObjectClass.C.r
               * (unit, GtkTreePathRecord.C.notnull) GtkTreePathRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val treeRowReferenceDeleted_ = fn x1 & x2 => (_import "gtk_tree_row_reference_deleted" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p -> unit;) (x1, x2)
    val treeRowReferenceInserted_ = fn x1 & x2 => (_import "gtk_tree_row_reference_inserted" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p -> unit;) (x1, x2)
    val treeSetRowDragData_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_set_row_drag_data" :
              GtkSelectionDataRecord.C.notnull GtkSelectionDataRecord.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    structure ActionEntry = GtkActionEntry
    structure AccelFlags = GtkAccelFlags
    structure AccelGroupClass = GtkAccelGroupClass
    structure AccelKeyRecord = GtkAccelKeyRecord
    structure AccelMapClass = GtkAccelMapClass
    structure AccessibleClass = GtkAccessibleClass
    structure ActionClass = GtkActionClass
    structure ActionGroupClass = GtkActionGroupClass
    structure ActivatableClass = GtkActivatableClass
    structure AdjustmentClass = GtkAdjustmentClass
    structure Align = GtkAlign
    structure AppChooserClass = GtkAppChooserClass
    structure ApplicationClass = GtkApplicationClass
    structure ArrowPlacement = GtkArrowPlacement
    structure ArrowType = GtkArrowType
    structure AssistantPageType = GtkAssistantPageType
    structure AttachOptions = GtkAttachOptions
    structure BorderRecord = GtkBorderRecord
    structure BorderStyle = GtkBorderStyle
    structure BuildableClass = GtkBuildableClass
    structure BuilderClass = GtkBuilderClass
    structure BuilderError = GtkBuilderError
    exception BuilderError = GtkBuilderError
    structure ButtonBoxStyle = GtkButtonBoxStyle
    structure ButtonsType = GtkButtonsType
    structure CalendarDisplayOptions = GtkCalendarDisplayOptions
    structure CellAreaClass = GtkCellAreaClass
    structure CellAreaContextClass = GtkCellAreaContextClass
    structure CellEditableClass = GtkCellEditableClass
    structure CellLayoutClass = GtkCellLayoutClass
    structure CellRendererClass = GtkCellRendererClass
    structure CellRendererAccelMode = GtkCellRendererAccelMode
    structure CellRendererMode = GtkCellRendererMode
    structure CellRendererState = GtkCellRendererState
    structure ClipboardClass = GtkClipboardClass
    structure CornerType = GtkCornerType
    structure CssProviderClass = GtkCssProviderClass
    structure CssProviderError = GtkCssProviderError
    exception CssProviderError = GtkCssProviderError
    structure CssSectionType = GtkCssSectionType
    structure DebugFlag = GtkDebugFlag
    structure DeleteType = GtkDeleteType
    structure DestDefaults = GtkDestDefaults
    structure DialogFlags = GtkDialogFlags
    structure DirectionType = GtkDirectionType
    structure DragResult = GtkDragResult
    structure EditableClass = GtkEditableClass
    structure EntryBufferClass = GtkEntryBufferClass
    structure EntryCompletionClass = GtkEntryCompletionClass
    structure EntryIconPosition = GtkEntryIconPosition
    structure ExpanderStyle = GtkExpanderStyle
    structure FileChooserClass = GtkFileChooserClass
    structure FileChooserAction = GtkFileChooserAction
    structure FileChooserConfirmation = GtkFileChooserConfirmation
    structure FileChooserError = GtkFileChooserError
    exception FileChooserError = GtkFileChooserError
    structure FileFilterClass = GtkFileFilterClass
    structure FileFilterFlags = GtkFileFilterFlags
    structure FileFilterInfoRecord = GtkFileFilterInfoRecord
    structure FontChooserClass = GtkFontChooserClass
    structure IMContextClass = GtkIMContextClass
    structure IMPreeditStyle = GtkIMPreeditStyle
    structure IMStatusStyle = GtkIMStatusStyle
    structure IconFactoryClass = GtkIconFactoryClass
    structure IconInfoRecord = GtkIconInfoRecord
    structure IconLookupFlags = GtkIconLookupFlags
    structure IconSetRecord = GtkIconSetRecord
    structure IconSourceRecord = GtkIconSourceRecord
    structure IconThemeClass = GtkIconThemeClass
    structure IconThemeError = GtkIconThemeError
    exception IconThemeError = GtkIconThemeError
    structure IconViewDropPosition = GtkIconViewDropPosition
    structure ImageType = GtkImageType
    structure JunctionSides = GtkJunctionSides
    structure Justification = GtkJustification
    structure License = GtkLicense
    structure ListStoreClass = GtkListStoreClass
    structure MenuDirectionType = GtkMenuDirectionType
    structure MessageType = GtkMessageType
    structure MountOperationClass = GtkMountOperationClass
    structure MovementStep = GtkMovementStep
    structure NotebookTab = GtkNotebookTab
    structure NumberUpLayout = GtkNumberUpLayout
    structure NumerableIconClass = GtkNumerableIconClass
    structure OrientableClass = GtkOrientableClass
    structure Orientation = GtkOrientation
    structure PackDirection = GtkPackDirection
    structure PackType = GtkPackType
    structure PageOrientation = GtkPageOrientation
    structure PageSet = GtkPageSet
    structure PageSetupClass = GtkPageSetupClass
    structure PaperSizeRecord = GtkPaperSizeRecord
    structure PathPriorityType = GtkPathPriorityType
    structure PathType = GtkPathType
    structure PolicyType = GtkPolicyType
    structure PositionType = GtkPositionType
    structure PrintContextClass = GtkPrintContextClass
    structure PrintDuplex = GtkPrintDuplex
    structure PrintError = GtkPrintError
    exception PrintError = GtkPrintError
    structure PrintOperationClass = GtkPrintOperationClass
    structure PrintOperationAction = GtkPrintOperationAction
    structure PrintOperationPreviewClass = GtkPrintOperationPreviewClass
    structure PrintOperationResult = GtkPrintOperationResult
    structure PrintPages = GtkPrintPages
    structure PrintQuality = GtkPrintQuality
    structure PrintSettingsClass = GtkPrintSettingsClass
    structure PrintStatus = GtkPrintStatus
    structure RcFlags = GtkRcFlags
    structure RcStyleClass = GtkRcStyleClass
    structure RecentChooserClass = GtkRecentChooserClass
    structure RecentChooserError = GtkRecentChooserError
    exception RecentChooserError = GtkRecentChooserError
    structure RecentDataRecord = GtkRecentDataRecord
    structure RecentFilterClass = GtkRecentFilterClass
    structure RecentFilterFlags = GtkRecentFilterFlags
    structure RecentFilterInfoRecord = GtkRecentFilterInfoRecord
    structure RecentInfoRecord = GtkRecentInfoRecord
    structure RecentManagerClass = GtkRecentManagerClass
    structure RecentManagerError = GtkRecentManagerError
    exception RecentManagerError = GtkRecentManagerError
    structure RecentSortType = GtkRecentSortType
    structure RegionFlags = GtkRegionFlags
    structure ReliefStyle = GtkReliefStyle
    structure RequisitionRecord = GtkRequisitionRecord
    structure ResizeMode = GtkResizeMode
    structure ResponseType = GtkResponseType
    structure ScrollStep = GtkScrollStep
    structure ScrollType = GtkScrollType
    structure ScrollableClass = GtkScrollableClass
    structure ScrollablePolicy = GtkScrollablePolicy
    structure SelectionDataRecord = GtkSelectionDataRecord
    structure SelectionMode = GtkSelectionMode
    structure SensitivityType = GtkSensitivityType
    structure SettingsClass = GtkSettingsClass
    structure SettingsValueRecord = GtkSettingsValueRecord
    structure ShadowType = GtkShadowType
    structure SizeGroupClass = GtkSizeGroupClass
    structure SizeGroupMode = GtkSizeGroupMode
    structure SizeRequestMode = GtkSizeRequestMode
    structure SortType = GtkSortType
    structure SpinButtonUpdatePolicy = GtkSpinButtonUpdatePolicy
    structure SpinType = GtkSpinType
    structure StateFlags = GtkStateFlags
    structure StateType = GtkStateType
    structure StatusIconClass = GtkStatusIconClass
    structure StockItemRecord = GtkStockItemRecord
    structure StyleClass = GtkStyleClass
    structure StyleContextClass = GtkStyleContextClass
    structure StylePropertiesClass = GtkStylePropertiesClass
    structure StyleProviderClass = GtkStyleProviderClass
    structure SymbolicColorRecord = GtkSymbolicColorRecord
    structure TargetEntryRecord = GtkTargetEntryRecord
    structure TargetFlags = GtkTargetFlags
    structure TargetListRecord = GtkTargetListRecord
    structure TextAttributesRecord = GtkTextAttributesRecord
    structure TextBufferClass = GtkTextBufferClass
    structure TextBufferTargetInfo = GtkTextBufferTargetInfo
    structure TextChildAnchorClass = GtkTextChildAnchorClass
    structure TextDirection = GtkTextDirection
    structure TextIterRecord = GtkTextIterRecord
    structure TextMarkClass = GtkTextMarkClass
    structure TextSearchFlags = GtkTextSearchFlags
    structure TextTagClass = GtkTextTagClass
    structure TextTagTableClass = GtkTextTagTableClass
    structure TextWindowType = GtkTextWindowType
    structure ThemingEngineClass = GtkThemingEngineClass
    structure ToolPaletteDragTargets = GtkToolPaletteDragTargets
    structure ToolShellClass = GtkToolShellClass
    structure ToolbarSpaceStyle = GtkToolbarSpaceStyle
    structure ToolbarStyle = GtkToolbarStyle
    structure TooltipClass = GtkTooltipClass
    structure TreeDragDestClass = GtkTreeDragDestClass
    structure TreeDragSourceClass = GtkTreeDragSourceClass
    structure TreeIterRecord = GtkTreeIterRecord
    structure TreeModelClass = GtkTreeModelClass
    structure TreeModelFilterClass = GtkTreeModelFilterClass
    structure TreeModelFlags = GtkTreeModelFlags
    structure TreeModelSortClass = GtkTreeModelSortClass
    structure TreePathRecord = GtkTreePathRecord
    structure TreeSelectionClass = GtkTreeSelectionClass
    structure TreeSortableClass = GtkTreeSortableClass
    structure TreeStoreClass = GtkTreeStoreClass
    structure TreeViewColumnClass = GtkTreeViewColumnClass
    structure TreeViewColumnSizing = GtkTreeViewColumnSizing
    structure TreeViewDropPosition = GtkTreeViewDropPosition
    structure TreeViewGridLines = GtkTreeViewGridLines
    structure UIManagerClass = GtkUIManagerClass
    structure UIManagerItemType = GtkUIManagerItemType
    structure Unit = GtkUnit
    structure WidgetClass = GtkWidgetClass
    structure WidgetHelpType = GtkWidgetHelpType
    structure WidgetPathRecord = GtkWidgetPathRecord
    structure WindowGroupClass = GtkWindowGroupClass
    structure WindowPosition = GtkWindowPosition
    structure WindowType = GtkWindowType
    structure WrapMode = GtkWrapMode
    structure AccelGroup = GtkAccelGroup
    structure AccelKey = GtkAccelKey
    structure AccelMap = GtkAccelMap
    structure Accessible = GtkAccessible
    structure Action = GtkAction
    structure Activatable = GtkActivatable
    structure Adjustment = GtkAdjustment
    structure AppChooser = GtkAppChooser
    structure Border = GtkBorder
    structure Buildable = GtkBuildable
    structure Builder = GtkBuilder
    structure CalendarClass = GtkCalendarClass
    structure CellArea = GtkCellArea
    structure CellAreaBoxClass = GtkCellAreaBoxClass
    structure CellAreaContext = GtkCellAreaContext
    structure CellEditable = GtkCellEditable
    structure CellLayout = GtkCellLayout
    structure CellRenderer = GtkCellRenderer
    structure CellRendererPixbufClass = GtkCellRendererPixbufClass
    structure CellRendererProgressClass = GtkCellRendererProgressClass
    structure CellRendererSpinnerClass = GtkCellRendererSpinnerClass
    structure CellRendererTextClass = GtkCellRendererTextClass
    structure CellRendererToggleClass = GtkCellRendererToggleClass
    structure CellViewClass = GtkCellViewClass
    structure Clipboard = GtkClipboard
    structure ContainerClass = GtkContainerClass
    structure CssProvider = GtkCssProvider
    structure DrawingAreaClass = GtkDrawingAreaClass
    structure Editable = GtkEditable
    structure EntryClass = GtkEntryClass
    structure EntryBuffer = GtkEntryBuffer
    structure EntryCompletion = GtkEntryCompletion
    structure FileChooser = GtkFileChooser
    structure FileFilter = GtkFileFilter
    structure FileFilterInfo = GtkFileFilterInfo
    structure FontChooser = GtkFontChooser
    structure HsvClass = GtkHsvClass
    structure IMContext = GtkIMContext
    structure IMContextSimpleClass = GtkIMContextSimpleClass
    structure IMMulticontextClass = GtkIMMulticontextClass
    structure IconFactory = GtkIconFactory
    structure IconInfo = GtkIconInfo
    structure IconSet = GtkIconSet
    structure IconSize = GtkIconSize
    structure IconSource = GtkIconSource
    structure IconTheme = GtkIconTheme
    structure InvisibleClass = GtkInvisibleClass
    structure ListStore = GtkListStore
    structure MiscClass = GtkMiscClass
    structure NumerableIcon = GtkNumerableIcon
    structure Orientable = GtkOrientable
    structure PageSetup = GtkPageSetup
    structure PaperSize = GtkPaperSize
    structure PrintContext = GtkPrintContext
    structure PrintOperationPreview = GtkPrintOperationPreview
    structure PrintSettings = GtkPrintSettings
    structure ProgressBarClass = GtkProgressBarClass
    structure RangeClass = GtkRangeClass
    structure RcStyle = GtkRcStyle
    structure RecentActionClass = GtkRecentActionClass
    structure RecentChooser = GtkRecentChooser
    structure RecentData = GtkRecentData
    structure RecentFilter = GtkRecentFilter
    structure RecentFilterInfo = GtkRecentFilterInfo
    structure RecentInfo = GtkRecentInfo
    structure RecentManager = GtkRecentManager
    structure Requisition = GtkRequisition
    structure Scrollable = GtkScrollable
    structure SelectionData = GtkSelectionData
    structure SeparatorClass = GtkSeparatorClass
    structure SettingsValue = GtkSettingsValue
    structure SizeGroup = GtkSizeGroup
    structure SpinnerClass = GtkSpinnerClass
    structure StockItem = GtkStockItem
    structure Style = GtkStyle
    structure StyleContext = GtkStyleContext
    structure StyleProperties = GtkStyleProperties
    structure StyleProvider = GtkStyleProvider
    structure SwitchClass = GtkSwitchClass
    structure SymbolicColor = GtkSymbolicColor
    structure TargetEntry = GtkTargetEntry
    structure TargetList = GtkTargetList
    structure TextAttributes = GtkTextAttributes
    structure TextBuffer = GtkTextBuffer
    structure TextChildAnchor = GtkTextChildAnchor
    structure TextIter = GtkTextIter
    structure TextMark = GtkTextMark
    structure TextTag = GtkTextTag
    structure TextTagTable = GtkTextTagTable
    structure ThemingEngine = GtkThemingEngine
    structure ToggleActionClass = GtkToggleActionClass
    structure ToolShell = GtkToolShell
    structure Tooltip = GtkTooltip
    structure TreeDragDest = GtkTreeDragDest
    structure TreeDragSource = GtkTreeDragSource
    structure TreeIter = GtkTreeIter
    structure TreeModel = GtkTreeModel
    structure TreeModelFilter = GtkTreeModelFilter
    structure TreeModelSort = GtkTreeModelSort
    structure TreePath = GtkTreePath
    structure TreeSortable = GtkTreeSortable
    structure TreeStore = GtkTreeStore
    structure TreeViewColumn = GtkTreeViewColumn
    structure UIManager = GtkUIManager
    structure WidgetPath = GtkWidgetPath
    structure ActionGroup = GtkActionGroup
    structure ArrowClass = GtkArrowClass
    structure BinClass = GtkBinClass
    structure BoxClass = GtkBoxClass
    structure Calendar = GtkCalendar
    structure CellAreaBox = GtkCellAreaBox
    structure CellRendererAccelClass = GtkCellRendererAccelClass
    structure CellRendererComboClass = GtkCellRendererComboClass
    structure CellRendererPixbuf = GtkCellRendererPixbuf
    structure CellRendererProgress = GtkCellRendererProgress
    structure CellRendererSpinClass = GtkCellRendererSpinClass
    structure CellRendererSpinner = GtkCellRendererSpinner
    structure CellRendererText = GtkCellRendererText
    structure CellRendererToggle = GtkCellRendererToggle
    structure CellView = GtkCellView
    structure Container = GtkContainer
    structure DrawingArea = GtkDrawingArea
    structure FixedClass = GtkFixedClass
    structure GridClass = GtkGridClass
    structure Hsv = GtkHsv
    structure HSeparatorClass = GtkHSeparatorClass
    structure IMContextSimple = GtkIMContextSimple
    structure IconViewClass = GtkIconViewClass
    structure ImageClass = GtkImageClass
    structure Invisible = GtkInvisible
    structure LabelClass = GtkLabelClass
    structure LayoutClass = GtkLayoutClass
    structure MenuShellClass = GtkMenuShellClass
    structure Misc = GtkMisc
    structure NotebookClass = GtkNotebookClass
    structure PanedClass = GtkPanedClass
    structure ProgressBar = GtkProgressBar
    structure RadioActionClass = GtkRadioActionClass
    structure Range = GtkRange
    structure RecentAction = GtkRecentAction
    structure ScaleClass = GtkScaleClass
    structure ScrollbarClass = GtkScrollbarClass
    structure Separator = GtkSeparator
    structure Settings = GtkSettings
    structure SocketClass = GtkSocketClass
    structure SpinButtonClass = GtkSpinButtonClass
    structure Spinner = GtkSpinner
    structure Switch = GtkSwitch
    structure TableClass = GtkTableClass
    structure TextViewClass = GtkTextViewClass
    structure ToggleAction = GtkToggleAction
    structure ToolItemGroupClass = GtkToolItemGroupClass
    structure ToolPaletteClass = GtkToolPaletteClass
    structure ToolbarClass = GtkToolbarClass
    structure TreeViewClass = GtkTreeViewClass
    structure VSeparatorClass = GtkVSeparatorClass
    structure AccelLabelClass = GtkAccelLabelClass
    structure AlignmentClass = GtkAlignmentClass
    structure AppChooserWidgetClass = GtkAppChooserWidgetClass
    structure Arrow = GtkArrow
    structure Bin = GtkBin
    structure Box = GtkBox
    structure ButtonClass = GtkButtonClass
    structure ButtonBoxClass = GtkButtonBoxClass
    structure CellRendererAccel = GtkCellRendererAccel
    structure CellRendererCombo = GtkCellRendererCombo
    structure CellRendererSpin = GtkCellRendererSpin
    structure ColorSelectionClass = GtkColorSelectionClass
    structure ComboBoxClass = GtkComboBoxClass
    structure EventBoxClass = GtkEventBoxClass
    structure ExpanderClass = GtkExpanderClass
    structure FileChooserButtonClass = GtkFileChooserButtonClass
    structure FileChooserWidgetClass = GtkFileChooserWidgetClass
    structure Fixed = GtkFixed
    structure FontChooserWidgetClass = GtkFontChooserWidgetClass
    structure FontSelectionClass = GtkFontSelectionClass
    structure FrameClass = GtkFrameClass
    structure Grid = GtkGrid
    structure HBoxClass = GtkHBoxClass
    structure HPanedClass = GtkHPanedClass
    structure HScaleClass = GtkHScaleClass
    structure HScrollbarClass = GtkHScrollbarClass
    structure HSeparator = GtkHSeparator
    structure HandleBoxClass = GtkHandleBoxClass
    structure IMMulticontext = GtkIMMulticontext
    structure IconView = GtkIconView
    structure Image = GtkImage
    structure InfoBarClass = GtkInfoBarClass
    structure Layout = GtkLayout
    structure MenuClass = GtkMenuClass
    structure MenuBarClass = GtkMenuBarClass
    structure MenuItemClass = GtkMenuItemClass
    structure MenuShell = GtkMenuShell
    structure Notebook = GtkNotebook
    structure OverlayClass = GtkOverlayClass
    structure Paned = GtkPaned
    structure RadioAction = GtkRadioAction
    structure RecentChooserWidgetClass = GtkRecentChooserWidgetClass
    structure Scale = GtkScale
    structure Scrollbar = GtkScrollbar
    structure ScrolledWindowClass = GtkScrolledWindowClass
    structure Socket = GtkSocket
    structure SpinButton = GtkSpinButton
    structure StatusbarClass = GtkStatusbarClass
    structure Table = GtkTable
    structure ToolItemClass = GtkToolItemClass
    structure TreeSelection = GtkTreeSelection
    structure TreeView = GtkTreeView
    structure VBoxClass = GtkVBoxClass
    structure VPanedClass = GtkVPanedClass
    structure VScaleClass = GtkVScaleClass
    structure VScrollbarClass = GtkVScrollbarClass
    structure VSeparator = GtkVSeparator
    structure ViewportClass = GtkViewportClass
    structure WindowClass = GtkWindowClass
    structure ScrolledWindow = GtkScrolledWindow
    structure AccelLabel = GtkAccelLabel
    structure Alignment = GtkAlignment
    structure AppChooserButtonClass = GtkAppChooserButtonClass
    structure AppChooserWidget = GtkAppChooserWidget
    structure Application = GtkApplication
    structure AspectFrameClass = GtkAspectFrameClass
    structure AssistantClass = GtkAssistantClass
    structure Button = GtkButton
    structure ButtonBox = GtkButtonBox
    structure CheckMenuItemClass = GtkCheckMenuItemClass
    structure ColorButtonClass = GtkColorButtonClass
    structure ColorSelection = GtkColorSelection
    structure ComboBox = GtkComboBox
    structure ComboBoxTextClass = GtkComboBoxTextClass
    structure DialogClass = GtkDialogClass
    structure Entry = GtkEntry
    structure EventBox = GtkEventBox
    structure Expander = GtkExpander
    structure FileChooserButton = GtkFileChooserButton
    structure FileChooserWidget = GtkFileChooserWidget
    structure FontButtonClass = GtkFontButtonClass
    structure FontChooserWidget = GtkFontChooserWidget
    structure FontSelection = GtkFontSelection
    structure Frame = GtkFrame
    structure HBox = GtkHBox
    structure HButtonBoxClass = GtkHButtonBoxClass
    structure HPaned = GtkHPaned
    structure HScale = GtkHScale
    structure HScrollbar = GtkHScrollbar
    structure HandleBox = GtkHandleBox
    structure ImageMenuItemClass = GtkImageMenuItemClass
    structure InfoBar = GtkInfoBar
    structure Label = GtkLabel
    structure LinkButtonClass = GtkLinkButtonClass
    structure LockButtonClass = GtkLockButtonClass
    structure Menu = GtkMenu
    structure MenuBar = GtkMenuBar
    structure MenuItem = GtkMenuItem
    structure MountOperation = GtkMountOperation
    structure OffscreenWindowClass = GtkOffscreenWindowClass
    structure Overlay = GtkOverlay
    structure PlugClass = GtkPlugClass
    structure PrintOperation = GtkPrintOperation
    structure RecentChooserMenuClass = GtkRecentChooserMenuClass
    structure RecentChooserWidget = GtkRecentChooserWidget
    structure ScaleButtonClass = GtkScaleButtonClass
    structure SeparatorMenuItemClass = GtkSeparatorMenuItemClass
    structure SeparatorToolItemClass = GtkSeparatorToolItemClass
    structure StatusIcon = GtkStatusIcon
    structure Statusbar = GtkStatusbar
    structure TearoffMenuItemClass = GtkTearoffMenuItemClass
    structure TextView = GtkTextView
    structure ToggleButtonClass = GtkToggleButtonClass
    structure ToolButtonClass = GtkToolButtonClass
    structure ToolItem = GtkToolItem
    structure ToolItemGroup = GtkToolItemGroup
    structure ToolPalette = GtkToolPalette
    structure Toolbar = GtkToolbar
    structure VBox = GtkVBox
    structure VButtonBoxClass = GtkVButtonBoxClass
    structure VPaned = GtkVPaned
    structure VScale = GtkVScale
    structure VScrollbar = GtkVScrollbar
    structure Viewport = GtkViewport
    structure Widget = GtkWidget
    structure Window = GtkWindow
    structure WindowGroup = GtkWindowGroup
    structure AboutDialogClass = GtkAboutDialogClass
    structure AppChooserButton = GtkAppChooserButton
    structure AppChooserDialogClass = GtkAppChooserDialogClass
    structure AspectFrame = GtkAspectFrame
    structure Assistant = GtkAssistant
    structure CheckButtonClass = GtkCheckButtonClass
    structure CheckMenuItem = GtkCheckMenuItem
    structure ColorButton = GtkColorButton
    structure ColorSelectionDialogClass = GtkColorSelectionDialogClass
    structure ComboBoxText = GtkComboBoxText
    structure Dialog = GtkDialog
    structure FileChooserDialogClass = GtkFileChooserDialogClass
    structure FontButton = GtkFontButton
    structure FontChooserDialogClass = GtkFontChooserDialogClass
    structure FontSelectionDialogClass = GtkFontSelectionDialogClass
    structure HButtonBox = GtkHButtonBox
    structure ImageMenuItem = GtkImageMenuItem
    structure LinkButton = GtkLinkButton
    structure LockButton = GtkLockButton
    structure MenuToolButtonClass = GtkMenuToolButtonClass
    structure MessageDialogClass = GtkMessageDialogClass
    structure OffscreenWindow = GtkOffscreenWindow
    structure Plug = GtkPlug
    structure RadioMenuItemClass = GtkRadioMenuItemClass
    structure RecentChooserDialogClass = GtkRecentChooserDialogClass
    structure RecentChooserMenu = GtkRecentChooserMenu
    structure ScaleButton = GtkScaleButton
    structure SeparatorMenuItem = GtkSeparatorMenuItem
    structure SeparatorToolItem = GtkSeparatorToolItem
    structure TearoffMenuItem = GtkTearoffMenuItem
    structure ToggleButton = GtkToggleButton
    structure ToggleToolButtonClass = GtkToggleToolButtonClass
    structure ToolButton = GtkToolButton
    structure VButtonBox = GtkVButtonBox
    structure VolumeButtonClass = GtkVolumeButtonClass
    structure AboutDialog = GtkAboutDialog
    structure AppChooserDialog = GtkAppChooserDialog
    structure CheckButton = GtkCheckButton
    structure ColorSelectionDialog = GtkColorSelectionDialog
    structure FileChooserDialog = GtkFileChooserDialog
    structure FontChooserDialog = GtkFontChooserDialog
    structure FontSelectionDialog = GtkFontSelectionDialog
    structure MenuToolButton = GtkMenuToolButton
    structure MessageDialog = GtkMessageDialog
    structure RadioButtonClass = GtkRadioButtonClass
    structure RadioMenuItem = GtkRadioMenuItem
    structure RadioToolButtonClass = GtkRadioToolButtonClass
    structure RecentChooserDialog = GtkRecentChooserDialog
    structure ToggleToolButton = GtkToggleToolButton
    structure VolumeButton = GtkVolumeButton
    structure RadioButton = GtkRadioButton
    structure RadioToolButton = GtkRadioToolButton
    val BINARY_AGE = 204
    val INPUT_ERROR = ~1
    val INTERFACE_AGE = 4
    val MAJOR_VERSION = 3
    val MAX_COMPOSE_LEN = 7
    val MICRO_VERSION = 4
    val MINOR_VERSION = 2
    val PAPER_NAME_A3 = "iso_a3"
    val PAPER_NAME_A4 = "iso_a4"
    val PAPER_NAME_A5 = "iso_a5"
    val PAPER_NAME_B5 = "iso_b5"
    val PAPER_NAME_EXECUTIVE = "na_executive"
    val PAPER_NAME_LEGAL = "na_legal"
    val PAPER_NAME_LETTER = "na_letter"
    val PATH_PRIO_MASK = 15
    val PRINT_SETTINGS_COLLATE = "collate"
    val PRINT_SETTINGS_DEFAULT_SOURCE = "default-source"
    val PRINT_SETTINGS_DITHER = "dither"
    val PRINT_SETTINGS_DUPLEX = "duplex"
    val PRINT_SETTINGS_FINISHINGS = "finishings"
    val PRINT_SETTINGS_MEDIA_TYPE = "media-type"
    val PRINT_SETTINGS_NUMBER_UP = "number-up"
    val PRINT_SETTINGS_NUMBER_UP_LAYOUT = "number-up-layout"
    val PRINT_SETTINGS_N_COPIES = "n-copies"
    val PRINT_SETTINGS_ORIENTATION = "orientation"
    val PRINT_SETTINGS_OUTPUT_BIN = "output-bin"
    val PRINT_SETTINGS_OUTPUT_FILE_FORMAT = "output-file-format"
    val PRINT_SETTINGS_OUTPUT_URI = "output-uri"
    val PRINT_SETTINGS_PAGE_RANGES = "page-ranges"
    val PRINT_SETTINGS_PAGE_SET = "page-set"
    val PRINT_SETTINGS_PAPER_FORMAT = "paper-format"
    val PRINT_SETTINGS_PAPER_HEIGHT = "paper-height"
    val PRINT_SETTINGS_PAPER_WIDTH = "paper-width"
    val PRINT_SETTINGS_PRINTER = "printer"
    val PRINT_SETTINGS_PRINTER_LPI = "printer-lpi"
    val PRINT_SETTINGS_PRINT_PAGES = "print-pages"
    val PRINT_SETTINGS_QUALITY = "quality"
    val PRINT_SETTINGS_RESOLUTION = "resolution"
    val PRINT_SETTINGS_RESOLUTION_X = "resolution-x"
    val PRINT_SETTINGS_RESOLUTION_Y = "resolution-y"
    val PRINT_SETTINGS_REVERSE = "reverse"
    val PRINT_SETTINGS_SCALE = "scale"
    val PRINT_SETTINGS_USE_COLOR = "use-color"
    val PRINT_SETTINGS_WIN32_DRIVER_EXTRA = "win32-driver-extra"
    val PRINT_SETTINGS_WIN32_DRIVER_VERSION = "win32-driver-version"
    val PRIORITY_RESIZE = 10
    val STOCK_ABOUT = "gtk-about"
    val STOCK_ADD = "gtk-add"
    val STOCK_APPLY = "gtk-apply"
    val STOCK_BOLD = "gtk-bold"
    val STOCK_CANCEL = "gtk-cancel"
    val STOCK_CAPS_LOCK_WARNING = "gtk-caps-lock-warning"
    val STOCK_CDROM = "gtk-cdrom"
    val STOCK_CLEAR = "gtk-clear"
    val STOCK_CLOSE = "gtk-close"
    val STOCK_COLOR_PICKER = "gtk-color-picker"
    val STOCK_CONNECT = "gtk-connect"
    val STOCK_CONVERT = "gtk-convert"
    val STOCK_COPY = "gtk-copy"
    val STOCK_CUT = "gtk-cut"
    val STOCK_DELETE = "gtk-delete"
    val STOCK_DIALOG_AUTHENTICATION = "gtk-dialog-authentication"
    val STOCK_DIALOG_ERROR = "gtk-dialog-error"
    val STOCK_DIALOG_INFO = "gtk-dialog-info"
    val STOCK_DIALOG_QUESTION = "gtk-dialog-question"
    val STOCK_DIALOG_WARNING = "gtk-dialog-warning"
    val STOCK_DIRECTORY = "gtk-directory"
    val STOCK_DISCARD = "gtk-discard"
    val STOCK_DISCONNECT = "gtk-disconnect"
    val STOCK_DND = "gtk-dnd"
    val STOCK_DND_MULTIPLE = "gtk-dnd-multiple"
    val STOCK_EDIT = "gtk-edit"
    val STOCK_EXECUTE = "gtk-execute"
    val STOCK_FILE = "gtk-file"
    val STOCK_FIND = "gtk-find"
    val STOCK_FIND_AND_REPLACE = "gtk-find-and-replace"
    val STOCK_FLOPPY = "gtk-floppy"
    val STOCK_FULLSCREEN = "gtk-fullscreen"
    val STOCK_GOTO_BOTTOM = "gtk-goto-bottom"
    val STOCK_GOTO_FIRST = "gtk-goto-first"
    val STOCK_GOTO_LAST = "gtk-goto-last"
    val STOCK_GOTO_TOP = "gtk-goto-top"
    val STOCK_GO_BACK = "gtk-go-back"
    val STOCK_GO_DOWN = "gtk-go-down"
    val STOCK_GO_FORWARD = "gtk-go-forward"
    val STOCK_GO_UP = "gtk-go-up"
    val STOCK_HARDDISK = "gtk-harddisk"
    val STOCK_HELP = "gtk-help"
    val STOCK_HOME = "gtk-home"
    val STOCK_INDENT = "gtk-indent"
    val STOCK_INDEX = "gtk-index"
    val STOCK_INFO = "gtk-info"
    val STOCK_ITALIC = "gtk-italic"
    val STOCK_JUMP_TO = "gtk-jump-to"
    val STOCK_JUSTIFY_CENTER = "gtk-justify-center"
    val STOCK_JUSTIFY_FILL = "gtk-justify-fill"
    val STOCK_JUSTIFY_LEFT = "gtk-justify-left"
    val STOCK_JUSTIFY_RIGHT = "gtk-justify-right"
    val STOCK_LEAVE_FULLSCREEN = "gtk-leave-fullscreen"
    val STOCK_MEDIA_FORWARD = "gtk-media-forward"
    val STOCK_MEDIA_NEXT = "gtk-media-next"
    val STOCK_MEDIA_PAUSE = "gtk-media-pause"
    val STOCK_MEDIA_PLAY = "gtk-media-play"
    val STOCK_MEDIA_PREVIOUS = "gtk-media-previous"
    val STOCK_MEDIA_RECORD = "gtk-media-record"
    val STOCK_MEDIA_REWIND = "gtk-media-rewind"
    val STOCK_MEDIA_STOP = "gtk-media-stop"
    val STOCK_MISSING_IMAGE = "gtk-missing-image"
    val STOCK_NETWORK = "gtk-network"
    val STOCK_NEW = "gtk-new"
    val STOCK_NO = "gtk-no"
    val STOCK_OK = "gtk-ok"
    val STOCK_OPEN = "gtk-open"
    val STOCK_ORIENTATION_LANDSCAPE = "gtk-orientation-landscape"
    val STOCK_ORIENTATION_PORTRAIT = "gtk-orientation-portrait"
    val STOCK_ORIENTATION_REVERSE_LANDSCAPE = "gtk-orientation-reverse-landscape"
    val STOCK_ORIENTATION_REVERSE_PORTRAIT = "gtk-orientation-reverse-portrait"
    val STOCK_PAGE_SETUP = "gtk-page-setup"
    val STOCK_PASTE = "gtk-paste"
    val STOCK_PREFERENCES = "gtk-preferences"
    val STOCK_PRINT = "gtk-print"
    val STOCK_PRINT_ERROR = "gtk-print-error"
    val STOCK_PRINT_PAUSED = "gtk-print-paused"
    val STOCK_PRINT_PREVIEW = "gtk-print-preview"
    val STOCK_PRINT_REPORT = "gtk-print-report"
    val STOCK_PRINT_WARNING = "gtk-print-warning"
    val STOCK_PROPERTIES = "gtk-properties"
    val STOCK_QUIT = "gtk-quit"
    val STOCK_REDO = "gtk-redo"
    val STOCK_REFRESH = "gtk-refresh"
    val STOCK_REMOVE = "gtk-remove"
    val STOCK_REVERT_TO_SAVED = "gtk-revert-to-saved"
    val STOCK_SAVE = "gtk-save"
    val STOCK_SAVE_AS = "gtk-save-as"
    val STOCK_SELECT_ALL = "gtk-select-all"
    val STOCK_SELECT_COLOR = "gtk-select-color"
    val STOCK_SELECT_FONT = "gtk-select-font"
    val STOCK_SORT_ASCENDING = "gtk-sort-ascending"
    val STOCK_SORT_DESCENDING = "gtk-sort-descending"
    val STOCK_SPELL_CHECK = "gtk-spell-check"
    val STOCK_STOP = "gtk-stop"
    val STOCK_STRIKETHROUGH = "gtk-strikethrough"
    val STOCK_UNDELETE = "gtk-undelete"
    val STOCK_UNDERLINE = "gtk-underline"
    val STOCK_UNDO = "gtk-undo"
    val STOCK_UNINDENT = "gtk-unindent"
    val STOCK_YES = "gtk-yes"
    val STOCK_ZOOM_100 = "gtk-zoom-100"
    val STOCK_ZOOM_FIT = "gtk-zoom-fit"
    val STOCK_ZOOM_IN = "gtk-zoom-in"
    val STOCK_ZOOM_OUT = "gtk-zoom-out"
    val STYLE_CLASS_ACCELERATOR = "accelerator"
    val STYLE_CLASS_BACKGROUND = "background"
    val STYLE_CLASS_BUTTON = "button"
    val STYLE_CLASS_CALENDAR = "calendar"
    val STYLE_CLASS_CELL = "cell"
    val STYLE_CLASS_CHECK = "check"
    val STYLE_CLASS_COMBOBOX_ENTRY = "combobox-entry"
    val STYLE_CLASS_DEFAULT = "default"
    val STYLE_CLASS_DND = "dnd"
    val STYLE_CLASS_DOCK = "dock"
    val STYLE_CLASS_ENTRY = "entry"
    val STYLE_CLASS_ERROR = "error"
    val STYLE_CLASS_EXPANDER = "expander"
    val STYLE_CLASS_FRAME = "frame"
    val STYLE_CLASS_GRIP = "grip"
    val STYLE_CLASS_HEADER = "header"
    val STYLE_CLASS_HIGHLIGHT = "highlight"
    val STYLE_CLASS_HORIZONTAL = "horizontal"
    val STYLE_CLASS_IMAGE = "image"
    val STYLE_CLASS_INFO = "info"
    val STYLE_CLASS_INLINE_TOOLBAR = "inline-toolbar"
    val STYLE_CLASS_MARK = "mark"
    val STYLE_CLASS_MENU = "menu"
    val STYLE_CLASS_MENUBAR = "menubar"
    val STYLE_CLASS_MENUITEM = "menuitem"
    val STYLE_CLASS_NOTEBOOK = "notebook"
    val STYLE_CLASS_PANE_SEPARATOR = "pane-separator"
    val STYLE_CLASS_PRIMARY_TOOLBAR = "primary-toolbar"
    val STYLE_CLASS_PROGRESSBAR = "progressbar"
    val STYLE_CLASS_QUESTION = "question"
    val STYLE_CLASS_RADIO = "radio"
    val STYLE_CLASS_RAISED = "raised"
    val STYLE_CLASS_RUBBERBAND = "rubberband"
    val STYLE_CLASS_SCALE = "scale"
    val STYLE_CLASS_SCALE_HAS_MARKS_ABOVE = "scale-has-marks-above"
    val STYLE_CLASS_SCALE_HAS_MARKS_BELOW = "scale-has-marks-below"
    val STYLE_CLASS_SCROLLBAR = "scrollbar"
    val STYLE_CLASS_SEPARATOR = "separator"
    val STYLE_CLASS_SIDEBAR = "sidebar"
    val STYLE_CLASS_SLIDER = "slider"
    val STYLE_CLASS_SPINBUTTON = "spinbutton"
    val STYLE_CLASS_SPINNER = "spinner"
    val STYLE_CLASS_TOOLBAR = "toolbar"
    val STYLE_CLASS_TOOLTIP = "tooltip"
    val STYLE_CLASS_TROUGH = "trough"
    val STYLE_CLASS_VERTICAL = "vertical"
    val STYLE_CLASS_VIEW = "view"
    val STYLE_CLASS_WARNING = "warning"
    val STYLE_PROPERTY_BACKGROUND_COLOR = "background-color"
    val STYLE_PROPERTY_BACKGROUND_IMAGE = "background-image"
    val STYLE_PROPERTY_BORDER_COLOR = "border-color"
    val STYLE_PROPERTY_BORDER_RADIUS = "border-radius"
    val STYLE_PROPERTY_BORDER_STYLE = "border-style"
    val STYLE_PROPERTY_BORDER_WIDTH = "border-width"
    val STYLE_PROPERTY_COLOR = "color"
    val STYLE_PROPERTY_FONT = "font"
    val STYLE_PROPERTY_MARGIN = "margin"
    val STYLE_PROPERTY_PADDING = "padding"
    val STYLE_PROVIDER_PRIORITY_APPLICATION = 600
    val STYLE_PROVIDER_PRIORITY_FALLBACK = 1
    val STYLE_PROVIDER_PRIORITY_SETTINGS = 400
    val STYLE_PROVIDER_PRIORITY_THEME = 200
    val STYLE_PROVIDER_PRIORITY_USER = 800
    val STYLE_REGION_COLUMN = "column"
    val STYLE_REGION_COLUMN_HEADER = "column-header"
    val STYLE_REGION_ROW = "row"
    val STYLE_REGION_TAB = "tab"
    val TEXT_VIEW_PRIORITY_VALIDATE = 5
    fun accelGroupsActivate object accelKey accelMods =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt32.C.withVal
         &&&> GdkModifierType.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        accelGroupsActivate_
        (
          object
           & accelKey
           & accelMods
        )
    fun acceleratorGetDefaultModMask () = (I ---> GdkModifierType.C.fromVal) acceleratorGetDefaultModMask_ ()
    fun acceleratorGetLabel acceleratorKey acceleratorMods = (FFI.UInt32.C.withVal &&&> GdkModifierType.C.withVal ---> FFI.String.C.fromPtr true) acceleratorGetLabel_ (acceleratorKey & acceleratorMods)
    fun acceleratorName acceleratorKey acceleratorMods = (FFI.UInt32.C.withVal &&&> GdkModifierType.C.withVal ---> FFI.String.C.fromPtr true) acceleratorName_ (acceleratorKey & acceleratorMods)
    fun acceleratorParse accelerator =
      let
        val acceleratorKey
         & acceleratorMods
         & () =
          (
            FFI.String.C.withConstPtr
             &&&> FFI.UInt32.C.withRefVal
             &&&> GdkModifierType.C.withRefVal
             ---> FFI.UInt32.C.fromVal
                   && GdkModifierType.C.fromVal
                   && I
          )
            acceleratorParse_
            (
              accelerator
               & FFI.UInt32.null
               & GdkModifierType.flags []
            )
      in
        (acceleratorKey, acceleratorMods)
      end
    fun acceleratorSetDefaultModMask defaultModMask = (GdkModifierType.C.withVal ---> I) acceleratorSetDefaultModMask_ defaultModMask
    fun acceleratorValid keyval modifiers = (FFI.UInt32.C.withVal &&&> GdkModifierType.C.withVal ---> FFI.Bool.C.fromVal) acceleratorValid_ (keyval & modifiers)
    fun alternativeDialogButtonOrder screen = (GObjectObjectClass.C.withOptPtr ---> FFI.Bool.C.fromVal) alternativeDialogButtonOrder_ screen
    fun builderErrorQuark () = (I ---> FFI.UInt32.C.fromVal) builderErrorQuark_ ()
    fun cairoShouldDrawWindow cr window = (CairoContextRecord.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) cairoShouldDrawWindow_ (cr & window)
    fun cairoTransformToWindow cr widget window =
      (
        CairoContextRecord.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         ---> I
      )
        cairoTransformToWindow_
        (
          cr
           & widget
           & window
        )
    fun checkVersion requiredMajor requiredMinor requiredMicro =
      (
        FFI.UInt32.C.withVal
         &&&> FFI.UInt32.C.withVal
         &&&> FFI.UInt32.C.withVal
         ---> FFI.String.C.fromPtr false
      )
        checkVersion_
        (
          requiredMajor
           & requiredMinor
           & requiredMicro
        )
    fun cssProviderErrorQuark () = (I ---> FFI.UInt32.C.fromVal) cssProviderErrorQuark_ ()
    fun deviceGrabAdd widget device blockOthers =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        deviceGrabAdd_
        (
          widget
           & device
           & blockOthers
        )
    fun deviceGrabRemove widget device = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) deviceGrabRemove_ (widget & device)
    fun disableSetlocale () = (I ---> I) disableSetlocale_ ()
    fun dragFinish context success del time =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         &&&> FFI.Bool.C.withVal
         &&&> FFI.UInt32.C.withVal
         ---> I
      )
        dragFinish_
        (
          context
           & success
           & del
           & time
        )
    fun dragGetSourceWidget context = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) dragGetSourceWidget_ context
    fun dragSetIconDefault context = (GObjectObjectClass.C.withPtr ---> I) dragSetIconDefault_ context
    fun dragSetIconGicon context icon hotX hotY =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        dragSetIconGicon_
        (
          context
           & icon
           & hotX
           & hotY
        )
    fun dragSetIconName context iconName hotX hotY =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        dragSetIconName_
        (
          context
           & iconName
           & hotX
           & hotY
        )
    fun dragSetIconPixbuf context pixbuf hotX hotY =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        dragSetIconPixbuf_
        (
          context
           & pixbuf
           & hotX
           & hotY
        )
    fun dragSetIconStock context stockId hotX hotY =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        dragSetIconStock_
        (
          context
           & stockId
           & hotX
           & hotY
        )
    fun dragSetIconSurface context surface = (GObjectObjectClass.C.withPtr &&&> CairoSurfaceRecord.C.withPtr ---> I) dragSetIconSurface_ (context & surface)
    fun dragSetIconWidget context widget hotX hotY =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        dragSetIconWidget_
        (
          context
           & widget
           & hotX
           & hotY
        )
    fun drawInsertionCursor widget cr location isPrimary direction drawArrow =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> CairoRectangleIntRecord.C.withPtr
         &&&> FFI.Bool.C.withVal
         &&&> GtkTextDirection.C.withVal
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        drawInsertionCursor_
        (
          widget
           & cr
           & location
           & isPrimary
           & direction
           & drawArrow
        )
    fun eventsPending () = (I ---> FFI.Bool.C.fromVal) eventsPending_ ()
    fun fileChooserErrorQuark () = (I ---> FFI.UInt32.C.fromVal) fileChooserErrorQuark_ ()
    fun getBinaryAge () = (I ---> FFI.UInt32.C.fromVal) getBinaryAge_ ()
    fun getCurrentEvent () = (I ---> GdkEvent.C.fromPtr true) getCurrentEvent_ ()
    fun getCurrentEventDevice () = (I ---> GdkDeviceClass.C.fromPtr false) getCurrentEventDevice_ ()
    fun getCurrentEventState () =
      let
        val state & retVal = (GdkModifierType.C.withRefVal ---> GdkModifierType.C.fromVal && FFI.Bool.C.fromVal) getCurrentEventState_ (GdkModifierType.flags [])
      in
        if retVal then SOME state else NONE
      end
    fun getCurrentEventTime () = (I ---> FFI.UInt32.C.fromVal) getCurrentEventTime_ ()
    fun getDebugFlags () = (I ---> FFI.UInt32.C.fromVal) getDebugFlags_ ()
    fun getDefaultLanguage () = (I ---> PangoLanguageRecord.C.fromPtr true) getDefaultLanguage_ ()
    fun getEventWidget event = (GdkEvent.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getEventWidget_ event
    fun getInterfaceAge () = (I ---> FFI.UInt32.C.fromVal) getInterfaceAge_ ()
    fun getMajorVersion () = (I ---> FFI.UInt32.C.fromVal) getMajorVersion_ ()
    fun getMicroVersion () = (I ---> FFI.UInt32.C.fromVal) getMicroVersion_ ()
    fun getMinorVersion () = (I ---> FFI.UInt32.C.fromVal) getMinorVersion_ ()
    fun grabGetCurrent () = (I ---> GtkWidgetClass.C.fromPtr false) grabGetCurrent_ ()
    fun iconSizeFromName name = (FFI.String.C.withConstPtr ---> FFI.Int32.C.fromVal) iconSizeFromName_ name
    fun iconSizeGetName size = (FFI.Int32.C.withVal ---> FFI.String.C.fromPtr false) iconSizeGetName_ size
    fun iconSizeLookup size =
      let
        val width
         & height
         & retVal =
          (
            FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            iconSizeLookup_
            (
              size
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        if retVal then SOME (width, height) else NONE
      end
    fun iconSizeLookupForSettings settings size =
      let
        val width
         & height
         & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            iconSizeLookupForSettings_
            (
              settings
               & size
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        if retVal then SOME (width, height) else NONE
      end
    fun iconSizeRegister name width height =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> FFI.Int32.C.fromVal
      )
        iconSizeRegister_
        (
          name
           & width
           & height
        )
    fun iconSizeRegisterAlias alias target = (FFI.String.C.withConstPtr &&&> FFI.Int32.C.withVal ---> I) iconSizeRegisterAlias_ (alias & target)
    fun iconThemeErrorQuark () = (I ---> FFI.UInt32.C.fromVal) iconThemeErrorQuark_ ()
    fun keySnooperRemove snooperHandlerId = (FFI.UInt32.C.withVal ---> I) keySnooperRemove_ snooperHandlerId
    fun main () = (I ---> I) main_ ()
    fun mainDoEvent event = (GdkEvent.C.withPtr ---> I) mainDoEvent_ event
    fun mainIteration () = (I ---> FFI.Bool.C.fromVal) mainIteration_ ()
    fun mainIterationDo blocking = (FFI.Bool.C.withVal ---> FFI.Bool.C.fromVal) mainIterationDo_ blocking
    fun mainLevel () = (I ---> FFI.UInt32.C.fromVal) mainLevel_ ()
    fun mainQuit () = (I ---> I) mainQuit_ ()
    fun paintArrow style cr stateType shadowType widget detail arrowType fill x y width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> GtkStateType.C.withVal
         &&&> GtkShadowType.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> GtkArrowType.C.withVal
         &&&> FFI.Bool.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        paintArrow_
        (
          style
           & cr
           & stateType
           & shadowType
           & widget
           & detail
           & arrowType
           & fill
           & x
           & y
           & width
           & height
        )
    fun paintBox style cr stateType shadowType widget detail x y width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> GtkStateType.C.withVal
         &&&> GtkShadowType.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        paintBox_
        (
          style
           & cr
           & stateType
           & shadowType
           & widget
           & detail
           & x
           & y
           & width
           & height
        )
    fun paintBoxGap style cr stateType shadowType widget detail x y width height gapSide gapX gapWidth =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> GtkStateType.C.withVal
         &&&> GtkShadowType.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> GtkPositionType.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        paintBoxGap_
        (
          style
           & cr
           & stateType
           & shadowType
           & widget
           & detail
           & x
           & y
           & width
           & height
           & gapSide
           & gapX
           & gapWidth
        )
    fun paintCheck style cr stateType shadowType widget detail x y width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> GtkStateType.C.withVal
         &&&> GtkShadowType.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        paintCheck_
        (
          style
           & cr
           & stateType
           & shadowType
           & widget
           & detail
           & x
           & y
           & width
           & height
        )
    fun paintDiamond style cr stateType shadowType widget detail x y width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> GtkStateType.C.withVal
         &&&> GtkShadowType.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        paintDiamond_
        (
          style
           & cr
           & stateType
           & shadowType
           & widget
           & detail
           & x
           & y
           & width
           & height
        )
    fun paintExpander style cr stateType widget detail x y expanderStyle =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> GtkStateType.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> GtkExpanderStyle.C.withVal
         ---> I
      )
        paintExpander_
        (
          style
           & cr
           & stateType
           & widget
           & detail
           & x
           & y
           & expanderStyle
        )
    fun paintExtension style cr stateType shadowType widget detail x y width height gapSide =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> GtkStateType.C.withVal
         &&&> GtkShadowType.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> GtkPositionType.C.withVal
         ---> I
      )
        paintExtension_
        (
          style
           & cr
           & stateType
           & shadowType
           & widget
           & detail
           & x
           & y
           & width
           & height
           & gapSide
        )
    fun paintFlatBox style cr stateType shadowType widget detail x y width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> GtkStateType.C.withVal
         &&&> GtkShadowType.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        paintFlatBox_
        (
          style
           & cr
           & stateType
           & shadowType
           & widget
           & detail
           & x
           & y
           & width
           & height
        )
    fun paintFocus style cr stateType widget detail x y width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> GtkStateType.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        paintFocus_
        (
          style
           & cr
           & stateType
           & widget
           & detail
           & x
           & y
           & width
           & height
        )
    fun paintHandle style cr stateType shadowType widget detail x y width height orientation =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> GtkStateType.C.withVal
         &&&> GtkShadowType.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> GtkOrientation.C.withVal
         ---> I
      )
        paintHandle_
        (
          style
           & cr
           & stateType
           & shadowType
           & widget
           & detail
           & x
           & y
           & width
           & height
           & orientation
        )
    fun paintHline style cr stateType widget detail x1 x2 y =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> GtkStateType.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        paintHline_
        (
          style
           & cr
           & stateType
           & widget
           & detail
           & x1
           & x2
           & y
        )
    fun paintLayout style cr stateType useText widget detail x y layout =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> GtkStateType.C.withVal
         &&&> FFI.Bool.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> GObjectObjectClass.C.withPtr
         ---> I
      )
        paintLayout_
        (
          style
           & cr
           & stateType
           & useText
           & widget
           & detail
           & x
           & y
           & layout
        )
    fun paintOption style cr stateType shadowType widget detail x y width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> GtkStateType.C.withVal
         &&&> GtkShadowType.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        paintOption_
        (
          style
           & cr
           & stateType
           & shadowType
           & widget
           & detail
           & x
           & y
           & width
           & height
        )
    fun paintResizeGrip style cr stateType widget detail edge x y width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> GtkStateType.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> GdkWindowEdge.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        paintResizeGrip_
        (
          style
           & cr
           & stateType
           & widget
           & detail
           & edge
           & x
           & y
           & width
           & height
        )
    fun paintShadow style cr stateType shadowType widget detail x y width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> GtkStateType.C.withVal
         &&&> GtkShadowType.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        paintShadow_
        (
          style
           & cr
           & stateType
           & shadowType
           & widget
           & detail
           & x
           & y
           & width
           & height
        )
    fun paintShadowGap style cr stateType shadowType widget detail x y width height gapSide gapX gapWidth =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> GtkStateType.C.withVal
         &&&> GtkShadowType.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> GtkPositionType.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        paintShadowGap_
        (
          style
           & cr
           & stateType
           & shadowType
           & widget
           & detail
           & x
           & y
           & width
           & height
           & gapSide
           & gapX
           & gapWidth
        )
    fun paintSlider style cr stateType shadowType widget detail x y width height orientation =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> GtkStateType.C.withVal
         &&&> GtkShadowType.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> GtkOrientation.C.withVal
         ---> I
      )
        paintSlider_
        (
          style
           & cr
           & stateType
           & shadowType
           & widget
           & detail
           & x
           & y
           & width
           & height
           & orientation
        )
    fun paintSpinner style cr stateType widget detail step x y width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> GtkStateType.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> FFI.UInt32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        paintSpinner_
        (
          style
           & cr
           & stateType
           & widget
           & detail
           & step
           & x
           & y
           & width
           & height
        )
    fun paintTab style cr stateType shadowType widget detail x y width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> GtkStateType.C.withVal
         &&&> GtkShadowType.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        paintTab_
        (
          style
           & cr
           & stateType
           & shadowType
           & widget
           & detail
           & x
           & y
           & width
           & height
        )
    fun paintVline style cr stateType widget detail y1 y2 x =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> GtkStateType.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        paintVline_
        (
          style
           & cr
           & stateType
           & widget
           & detail
           & y1
           & y2
           & x
        )
    fun paperSizeGetDefault () = (I ---> FFI.String.C.fromPtr false) paperSizeGetDefault_ ()
    fun printErrorQuark () = (I ---> FFI.UInt32.C.fromVal) printErrorQuark_ ()
    fun printRunPageSetupDialog parent pageSetup settings =
      (
        GObjectObjectClass.C.withOptPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GObjectObjectClass.C.withPtr
         ---> GtkPageSetupClass.C.fromPtr true
      )
        printRunPageSetupDialog_
        (
          parent
           & pageSetup
           & settings
        )
    fun propagateEvent widget event = (GObjectObjectClass.C.withPtr &&&> GdkEvent.C.withPtr ---> I) propagateEvent_ (widget & event)
    fun rcAddDefaultFile filename = (FFI.String.C.withConstPtr ---> I) rcAddDefaultFile_ filename
    fun rcGetStyle widget = (GObjectObjectClass.C.withPtr ---> GtkStyleClass.C.fromPtr false) rcGetStyle_ widget
    fun recentChooserErrorQuark () = (I ---> FFI.UInt32.C.fromVal) recentChooserErrorQuark_ ()
    fun recentManagerErrorQuark () = (I ---> FFI.UInt32.C.fromVal) recentManagerErrorQuark_ ()
    fun renderActivity context cr x y width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         ---> I
      )
        renderActivity_
        (
          context
           & cr
           & x
           & y
           & width
           & height
        )
    fun renderArrow context cr angle x y size =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         ---> I
      )
        renderArrow_
        (
          context
           & cr
           & angle
           & x
           & y
           & size
        )
    fun renderBackground context cr x y width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         ---> I
      )
        renderBackground_
        (
          context
           & cr
           & x
           & y
           & width
           & height
        )
    fun renderCheck context cr x y width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         ---> I
      )
        renderCheck_
        (
          context
           & cr
           & x
           & y
           & width
           & height
        )
    fun renderExpander context cr x y width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         ---> I
      )
        renderExpander_
        (
          context
           & cr
           & x
           & y
           & width
           & height
        )
    fun renderExtension context cr x y width height gapSide =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> GtkPositionType.C.withVal
         ---> I
      )
        renderExtension_
        (
          context
           & cr
           & x
           & y
           & width
           & height
           & gapSide
        )
    fun renderFocus context cr x y width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         ---> I
      )
        renderFocus_
        (
          context
           & cr
           & x
           & y
           & width
           & height
        )
    fun renderFrame context cr x y width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         ---> I
      )
        renderFrame_
        (
          context
           & cr
           & x
           & y
           & width
           & height
        )
    fun renderFrameGap context cr x y width height gapSide xy0Gap xy1Gap =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> GtkPositionType.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         ---> I
      )
        renderFrameGap_
        (
          context
           & cr
           & x
           & y
           & width
           & height
           & gapSide
           & xy0Gap
           & xy1Gap
        )
    fun renderHandle context cr x y width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         ---> I
      )
        renderHandle_
        (
          context
           & cr
           & x
           & y
           & width
           & height
        )
    fun renderIcon context cr pixbuf x y =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         ---> I
      )
        renderIcon_
        (
          context
           & cr
           & pixbuf
           & x
           & y
        )
    fun renderIconPixbuf context source size =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkIconSourceRecord.C.withPtr
         &&&> FFI.Int32.C.withVal
         ---> GdkPixbufPixbufClass.C.fromPtr true
      )
        renderIconPixbuf_
        (
          context
           & source
           & size
        )
    fun renderLayout context cr x y layout =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> GObjectObjectClass.C.withPtr
         ---> I
      )
        renderLayout_
        (
          context
           & cr
           & x
           & y
           & layout
        )
    fun renderLine context cr x0 y0 x1 y1 =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         ---> I
      )
        renderLine_
        (
          context
           & cr
           & x0
           & y0
           & x1
           & y1
        )
    fun renderOption context cr x y width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         ---> I
      )
        renderOption_
        (
          context
           & cr
           & x
           & y
           & width
           & height
        )
    fun renderSlider context cr x y width height orientation =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> GtkOrientation.C.withVal
         ---> I
      )
        renderSlider_
        (
          context
           & cr
           & x
           & y
           & width
           & height
           & orientation
        )
    fun rgbToHsv r g b =
      let
        val h
         & s
         & v
         & () =
          (
            FFI.Double.C.withVal
             &&&> FFI.Double.C.withVal
             &&&> FFI.Double.C.withVal
             &&&> FFI.Double.C.withRefVal
             &&&> FFI.Double.C.withRefVal
             &&&> FFI.Double.C.withRefVal
             ---> FFI.Double.C.fromVal
                   && FFI.Double.C.fromVal
                   && FFI.Double.C.fromVal
                   && I
          )
            rgbToHsv_
            (
              r
               & g
               & b
               & FFI.Double.null
               & FFI.Double.null
               & FFI.Double.null
            )
      in
        (
          h,
          s,
          v
        )
      end
    fun selectionAddTarget widget selection target info =
      (
        GObjectObjectClass.C.withPtr
         &&&> GdkAtomRecord.C.withPtr
         &&&> GdkAtomRecord.C.withPtr
         &&&> FFI.UInt32.C.withVal
         ---> I
      )
        selectionAddTarget_
        (
          widget
           & selection
           & target
           & info
        )
    fun selectionClearTargets widget selection = (GObjectObjectClass.C.withPtr &&&> GdkAtomRecord.C.withPtr ---> I) selectionClearTargets_ (widget & selection)
    fun selectionConvert widget selection target time =
      (
        GObjectObjectClass.C.withPtr
         &&&> GdkAtomRecord.C.withPtr
         &&&> GdkAtomRecord.C.withPtr
         &&&> FFI.UInt32.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        selectionConvert_
        (
          widget
           & selection
           & target
           & time
        )
    fun selectionOwnerSet widget selection time =
      (
        GObjectObjectClass.C.withOptPtr
         &&&> GdkAtomRecord.C.withPtr
         &&&> FFI.UInt32.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        selectionOwnerSet_
        (
          widget
           & selection
           & time
        )
    fun selectionOwnerSetForDisplay display widget selection time =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GdkAtomRecord.C.withPtr
         &&&> FFI.UInt32.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        selectionOwnerSetForDisplay_
        (
          display
           & widget
           & selection
           & time
        )
    fun selectionRemoveAll widget = (GObjectObjectClass.C.withPtr ---> I) selectionRemoveAll_ widget
    fun setDebugFlags flags = (FFI.UInt32.C.withVal ---> I) setDebugFlags_ flags
    fun showUri screen uri timestamp =
      (
        GObjectObjectClass.C.withOptPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.UInt32.C.withVal
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        showUri_
        (
          screen
           & uri
           & timestamp
           & []
        )
    fun stockLookup stockId =
      let
        val item & retVal = (FFI.String.C.withConstPtr &&&> GtkStockItemRecord.C.withNewPtr ---> GtkStockItemRecord.C.fromPtr true && FFI.Bool.C.fromVal) stockLookup_ (stockId & ())
      in
        if retVal then SOME item else NONE
      end
    fun testCreateSimpleWindow windowTitle dialogText = (FFI.String.C.withConstPtr &&&> FFI.String.C.withConstPtr ---> GtkWidgetClass.C.fromPtr false) testCreateSimpleWindow_ (windowTitle & dialogText)
    fun testFindLabel widget labelPattern = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GtkWidgetClass.C.fromPtr false) testFindLabel_ (widget & labelPattern)
    fun testRegisterAllTypes () = (I ---> I) testRegisterAllTypes_ ()
    fun testSliderGetValue widget = (GObjectObjectClass.C.withPtr ---> FFI.Double.C.fromVal) testSliderGetValue_ widget
    fun testSliderSetPerc widget percentage = (GObjectObjectClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) testSliderSetPerc_ (widget & percentage)
    fun testSpinButtonClick spinner button upwards =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt32.C.withVal
         &&&> FFI.Bool.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        testSpinButtonClick_
        (
          spinner
           & button
           & upwards
        )
    fun testTextGet widget = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr true) testTextGet_ widget
    fun testTextSet widget string = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) testTextSet_ (widget & string)
    fun testWidgetClick widget button modifiers =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt32.C.withVal
         &&&> GdkModifierType.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        testWidgetClick_
        (
          widget
           & button
           & modifiers
        )
    fun testWidgetSendKey widget keyval modifiers =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt32.C.withVal
         &&&> GdkModifierType.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        testWidgetSendKey_
        (
          widget
           & keyval
           & modifiers
        )
    fun treeGetRowDragData selectionData =
      let
        val treeModel
         & path
         & retVal =
          (
            GtkSelectionDataRecord.C.withPtr
             &&&> GObjectObjectClass.C.withRefOptPtr
             &&&> GtkTreePathRecord.C.withRefOptPtr
             ---> GtkTreeModelClass.C.fromPtr true
                   && GtkTreePathRecord.C.fromPtr true
                   && FFI.Bool.C.fromVal
          )
            treeGetRowDragData_
            (
              selectionData
               & NONE
               & NONE
            )
      in
        if retVal then SOME (treeModel, path) else NONE
      end
    fun treeRowReferenceDeleted proxy path = (GObjectObjectClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> I) treeRowReferenceDeleted_ (proxy & path)
    fun treeRowReferenceInserted proxy path = (GObjectObjectClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> I) treeRowReferenceInserted_ (proxy & path)
    fun treeSetRowDragData selectionData treeModel path =
      (
        GtkSelectionDataRecord.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GtkTreePathRecord.C.withPtr
         ---> FFI.Bool.C.fromVal
      )
        treeSetRowDragData_
        (
          selectionData
           & treeModel
           & path
        )
  end