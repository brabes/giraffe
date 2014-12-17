signature GTK_SETTINGS =
  sig
    type 'a class_t
    type 'a styleproviderclass_t
    type settingsvaluerecord_t
    type impreeditstyle_t
    type imstatusstyle_t
    type cornertype_t
    type iconsize_t
    type toolbarstyle_t
    type policytype_t
    type t = base class_t
    val asStyleProvider : 'a class_t -> base styleproviderclass_t
    val getType : unit -> GObject.Type.t
    val getDefault : unit -> base class_t
    val getForScreen : 'a Gdk.ScreenClass.t -> base class_t
    val installProperty : 'a GObject.ParamSpecClass.t -> unit
    val setDoubleProperty :
      'a class_t
       -> string
       -> real
       -> string
       -> unit
    val setLongProperty :
      'a class_t
       -> string
       -> LargeInt.int
       -> string
       -> unit
    val setPropertyValue :
      'a class_t
       -> string
       -> settingsvaluerecord_t
       -> unit
    val setStringProperty :
      'a class_t
       -> string
       -> string
       -> string
       -> unit
    val gtkAlternativeButtonOrderProp : ('a class_t, bool, bool) Property.readwrite
    val gtkAlternativeSortArrowsProp : ('a class_t, bool, bool) Property.readwrite
    val gtkApplicationPreferDarkThemeProp : ('a class_t, bool, bool) Property.readwrite
    val gtkAutoMnemonicsProp : ('a class_t, bool, bool) Property.readwrite
    val gtkButtonImagesProp : ('a class_t, bool, bool) Property.readwrite
    val gtkCanChangeAccelsProp : ('a class_t, bool, bool) Property.readwrite
    val gtkColorPaletteProp : ('a class_t, string option, string option) Property.readwrite
    val gtkColorSchemeProp : ('a class_t, string option, string option) Property.readwrite
    val gtkCursorBlinkProp : ('a class_t, bool, bool) Property.readwrite
    val gtkCursorBlinkTimeProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkCursorBlinkTimeoutProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkCursorThemeNameProp : ('a class_t, string option, string option) Property.readwrite
    val gtkCursorThemeSizeProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkDndDragThresholdProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkDoubleClickDistanceProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkDoubleClickTimeProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkEnableAccelsProp : ('a class_t, bool, bool) Property.readwrite
    val gtkEnableAnimationsProp : ('a class_t, bool, bool) Property.readwrite
    val gtkEnableEventSoundsProp : ('a class_t, bool, bool) Property.readwrite
    val gtkEnableInputFeedbackSoundsProp : ('a class_t, bool, bool) Property.readwrite
    val gtkEnableMnemonicsProp : ('a class_t, bool, bool) Property.readwrite
    val gtkEnableTooltipsProp : ('a class_t, bool, bool) Property.readwrite
    val gtkEntryPasswordHintTimeoutProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkEntrySelectOnFocusProp : ('a class_t, bool, bool) Property.readwrite
    val gtkErrorBellProp : ('a class_t, bool, bool) Property.readwrite
    val gtkFallbackIconThemeProp : ('a class_t, string option, string option) Property.readwrite
    val gtkFileChooserBackendProp : ('a class_t, string option, string option) Property.readwrite
    val gtkFontNameProp : ('a class_t, string option, string option) Property.readwrite
    val gtkFontconfigTimestampProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkIconSizesProp : ('a class_t, string option, string option) Property.readwrite
    val gtkIconThemeNameProp : ('a class_t, string option, string option) Property.readwrite
    val gtkImModuleProp : ('a class_t, string option, string option) Property.readwrite
    val gtkImPreeditStyleProp : ('a class_t, impreeditstyle_t, impreeditstyle_t) Property.readwrite
    val gtkImStatusStyleProp : ('a class_t, imstatusstyle_t, imstatusstyle_t) Property.readwrite
    val gtkKeyThemeNameProp : ('a class_t, string option, string option) Property.readwrite
    val gtkKeynavCursorOnlyProp : ('a class_t, bool, bool) Property.readwrite
    val gtkKeynavWrapAroundProp : ('a class_t, bool, bool) Property.readwrite
    val gtkLabelSelectOnFocusProp : ('a class_t, bool, bool) Property.readwrite
    val gtkMenuBarAccelProp : ('a class_t, string option, string option) Property.readwrite
    val gtkMenuBarPopupDelayProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkMenuImagesProp : ('a class_t, bool, bool) Property.readwrite
    val gtkMenuPopdownDelayProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkMenuPopupDelayProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkModulesProp : ('a class_t, string option, string option) Property.readwrite
    val gtkPrintBackendsProp : ('a class_t, string option, string option) Property.readwrite
    val gtkPrintPreviewCommandProp : ('a class_t, string option, string option) Property.readwrite
    val gtkRecentFilesLimitProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkRecentFilesMaxAgeProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkScrolledWindowPlacementProp : ('a class_t, cornertype_t, cornertype_t) Property.readwrite
    val gtkShowInputMethodMenuProp : ('a class_t, bool, bool) Property.readwrite
    val gtkShowUnicodeMenuProp : ('a class_t, bool, bool) Property.readwrite
    val gtkSoundThemeNameProp : ('a class_t, string option, string option) Property.readwrite
    val gtkSplitCursorProp : ('a class_t, bool, bool) Property.readwrite
    val gtkThemeNameProp : ('a class_t, string option, string option) Property.readwrite
    val gtkTimeoutExpandProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkTimeoutInitialProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkTimeoutRepeatProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkToolbarIconSizeProp : ('a class_t, iconsize_t, iconsize_t) Property.readwrite
    val gtkToolbarStyleProp : ('a class_t, toolbarstyle_t, toolbarstyle_t) Property.readwrite
    val gtkTooltipBrowseModeTimeoutProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkTooltipBrowseTimeoutProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkTooltipTimeoutProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkTouchscreenModeProp : ('a class_t, bool, bool) Property.readwrite
    val gtkVisibleFocusProp : ('a class_t, policytype_t, policytype_t) Property.readwrite
    val gtkXftAntialiasProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkXftDpiProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkXftHintingProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkXftHintstyleProp : ('a class_t, string option, string option) Property.readwrite
    val gtkXftRgbaProp : ('a class_t, string option, string option) Property.readwrite
  end
