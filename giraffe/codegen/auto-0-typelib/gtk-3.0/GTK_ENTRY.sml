signature GTK_ENTRY =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type 'a cell_editable_class_t
    type 'a editable_class_t
    type 'a adjustment_class_t
    type target_list_record_t
    type delete_type_t
    type entry_icon_position_t
    type movement_step_t
    type 'a menu_class_t
    type 'a entry_buffer_class_t
    type 'a entry_completion_class_t
    type border_record_t
    type image_type_t
    type shadow_type_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val asCellEditable : 'a class_t -> base cell_editable_class_t
    val asEditable : 'a class_t -> base editable_class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val newWithBuffer : 'a entry_buffer_class_t -> base class_t
    val getActivatesDefault : 'a class_t -> bool
    val getAlignment : 'a class_t -> real
    val getBuffer : 'a class_t -> base entry_buffer_class_t
    val getCompletion : 'a class_t -> base entry_completion_class_t
    val getCurrentIconDragSource : 'a class_t -> LargeInt.int
    val getCursorHadjustment : 'a class_t -> base adjustment_class_t
    val getHasFrame : 'a class_t -> bool
    val getIconActivatable :
      'a class_t
       -> entry_icon_position_t
       -> bool
    val getIconArea :
      'a class_t
       -> entry_icon_position_t
       -> Cairo.RectangleIntRecord.t
    val getIconAtPos :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
    val getIconGicon :
      'a class_t
       -> entry_icon_position_t
       -> base Gio.IconClass.t
    val getIconName :
      'a class_t
       -> entry_icon_position_t
       -> string
    val getIconPixbuf :
      'a class_t
       -> entry_icon_position_t
       -> base GdkPixbuf.PixbufClass.t
    val getIconSensitive :
      'a class_t
       -> entry_icon_position_t
       -> bool
    val getIconStock :
      'a class_t
       -> entry_icon_position_t
       -> string
    val getIconStorageType :
      'a class_t
       -> entry_icon_position_t
       -> image_type_t
    val getIconTooltipMarkup :
      'a class_t
       -> entry_icon_position_t
       -> string
    val getIconTooltipText :
      'a class_t
       -> entry_icon_position_t
       -> string
    val getInnerBorder : 'a class_t -> border_record_t
    val getInvisibleChar : 'a class_t -> char
    val getLayout : 'a class_t -> base Pango.LayoutClass.t
    val getLayoutOffsets : 'a class_t -> LargeInt.int * LargeInt.int
    val getMaxLength : 'a class_t -> LargeInt.int
    val getOverwriteMode : 'a class_t -> bool
    val getPlaceholderText : 'a class_t -> string
    val getProgressFraction : 'a class_t -> real
    val getProgressPulseStep : 'a class_t -> real
    val getText : 'a class_t -> string
    val getTextArea : 'a class_t -> Cairo.RectangleIntRecord.t
    val getTextLength : 'a class_t -> LargeInt.int
    val getVisibility : 'a class_t -> bool
    val getWidthChars : 'a class_t -> LargeInt.int
    val imContextFilterKeypress :
      'a class_t
       -> Gdk.EventKeyRecord.t
       -> bool
    val layoutIndexToTextIndex :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
    val progressPulse : 'a class_t -> unit
    val resetImContext : 'a class_t -> unit
    val setActivatesDefault :
      'a class_t
       -> bool
       -> unit
    val setAlignment :
      'a class_t
       -> real
       -> unit
    val setBuffer :
      'a class_t
       -> 'b entry_buffer_class_t
       -> unit
    val setCompletion :
      'a class_t
       -> 'b entry_completion_class_t option
       -> unit
    val setCursorHadjustment :
      'a class_t
       -> 'b adjustment_class_t
       -> unit
    val setHasFrame :
      'a class_t
       -> bool
       -> unit
    val setIconActivatable :
      'a class_t
       -> entry_icon_position_t
       -> bool
       -> unit
    val setIconDragSource :
      'a class_t
       -> entry_icon_position_t
       -> target_list_record_t
       -> Gdk.DragAction.t
       -> unit
    val setIconFromGicon :
      'a class_t
       -> entry_icon_position_t
       -> 'b Gio.IconClass.t option
       -> unit
    val setIconFromIconName :
      'a class_t
       -> entry_icon_position_t
       -> string option
       -> unit
    val setIconFromPixbuf :
      'a class_t
       -> entry_icon_position_t
       -> 'b GdkPixbuf.PixbufClass.t option
       -> unit
    val setIconFromStock :
      'a class_t
       -> entry_icon_position_t
       -> string option
       -> unit
    val setIconSensitive :
      'a class_t
       -> entry_icon_position_t
       -> bool
       -> unit
    val setIconTooltipMarkup :
      'a class_t
       -> entry_icon_position_t
       -> string option
       -> unit
    val setIconTooltipText :
      'a class_t
       -> entry_icon_position_t
       -> string option
       -> unit
    val setInnerBorder :
      'a class_t
       -> border_record_t option
       -> unit
    val setInvisibleChar :
      'a class_t
       -> char
       -> unit
    val setMaxLength :
      'a class_t
       -> LargeInt.int
       -> unit
    val setOverwriteMode :
      'a class_t
       -> bool
       -> unit
    val setPlaceholderText :
      'a class_t
       -> string
       -> unit
    val setProgressFraction :
      'a class_t
       -> real
       -> unit
    val setProgressPulseStep :
      'a class_t
       -> real
       -> unit
    val setText :
      'a class_t
       -> string
       -> unit
    val setVisibility :
      'a class_t
       -> bool
       -> unit
    val setWidthChars :
      'a class_t
       -> LargeInt.int
       -> unit
    val textIndexToLayoutIndex :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
    val unsetInvisibleChar : 'a class_t -> unit
    val activateSig : (unit -> unit) -> 'a class_t Signal.signal
    val backspaceSig : (unit -> unit) -> 'a class_t Signal.signal
    val copyClipboardSig : (unit -> unit) -> 'a class_t Signal.signal
    val cutClipboardSig : (unit -> unit) -> 'a class_t Signal.signal
    val deleteFromCursorSig :
      (delete_type_t
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val iconPressSig :
      (entry_icon_position_t
        -> Gdk.EventButtonRecord.t
        -> unit)
       -> 'a class_t Signal.signal
    val iconReleaseSig :
      (entry_icon_position_t
        -> Gdk.EventButtonRecord.t
        -> unit)
       -> 'a class_t Signal.signal
    val insertAtCursorSig : (string -> unit) -> 'a class_t Signal.signal
    val moveCursorSig :
      (movement_step_t
        -> LargeInt.int
        -> bool
        -> unit)
       -> 'a class_t Signal.signal
    val pasteClipboardSig : (unit -> unit) -> 'a class_t Signal.signal
    val populatePopupSig : (base menu_class_t -> unit) -> 'a class_t Signal.signal
    val preeditChangedSig : (string -> unit) -> 'a class_t Signal.signal
    val toggleOverwriteSig : (unit -> unit) -> 'a class_t Signal.signal
    val activatesDefaultProp : ('a class_t, bool, bool) Property.readwrite
    val bufferProp : ('a class_t, base entry_buffer_class_t option, 'b entry_buffer_class_t option) Property.readwrite
    val capsLockWarningProp : ('a class_t, bool, bool) Property.readwrite
    val completionProp : ('a class_t, base entry_completion_class_t option, 'b entry_completion_class_t option) Property.readwrite
    val cursorPositionProp : ('a class_t, LargeInt.int) Property.readonly
    val editableProp : ('a class_t, bool, bool) Property.readwrite
    val hasFrameProp : ('a class_t, bool, bool) Property.readwrite
    val imModuleProp : ('a class_t, string option, string option) Property.readwrite
    val innerBorderProp : ('a class_t, border_record_t option, border_record_t option) Property.readwrite
    val invisibleCharProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val invisibleCharSetProp : ('a class_t, bool, bool) Property.readwrite
    val maxLengthProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val overwriteModeProp : ('a class_t, bool, bool) Property.readwrite
    val placeholderTextProp : ('a class_t, string option, string option) Property.readwrite
    val primaryIconActivatableProp : ('a class_t, bool, bool) Property.readwrite
    val primaryIconGiconProp : ('a class_t, base Gio.IconClass.t option, 'b Gio.IconClass.t option) Property.readwrite
    val primaryIconNameProp : ('a class_t, string option, string option) Property.readwrite
    val primaryIconPixbufProp : ('a class_t, base GdkPixbuf.PixbufClass.t option, 'b GdkPixbuf.PixbufClass.t option) Property.readwrite
    val primaryIconSensitiveProp : ('a class_t, bool, bool) Property.readwrite
    val primaryIconStockProp : ('a class_t, string option, string option) Property.readwrite
    val primaryIconStorageTypeProp : ('a class_t, image_type_t) Property.readonly
    val primaryIconTooltipMarkupProp : ('a class_t, string option, string option) Property.readwrite
    val primaryIconTooltipTextProp : ('a class_t, string option, string option) Property.readwrite
    val progressFractionProp : ('a class_t, real, real) Property.readwrite
    val progressPulseStepProp : ('a class_t, real, real) Property.readwrite
    val scrollOffsetProp : ('a class_t, LargeInt.int) Property.readonly
    val secondaryIconActivatableProp : ('a class_t, bool, bool) Property.readwrite
    val secondaryIconGiconProp : ('a class_t, base Gio.IconClass.t option, 'b Gio.IconClass.t option) Property.readwrite
    val secondaryIconNameProp : ('a class_t, string option, string option) Property.readwrite
    val secondaryIconPixbufProp : ('a class_t, base GdkPixbuf.PixbufClass.t option, 'b GdkPixbuf.PixbufClass.t option) Property.readwrite
    val secondaryIconSensitiveProp : ('a class_t, bool, bool) Property.readwrite
    val secondaryIconStockProp : ('a class_t, string option, string option) Property.readwrite
    val secondaryIconStorageTypeProp : ('a class_t, image_type_t) Property.readonly
    val secondaryIconTooltipMarkupProp : ('a class_t, string option, string option) Property.readwrite
    val secondaryIconTooltipTextProp : ('a class_t, string option, string option) Property.readwrite
    val selectionBoundProp : ('a class_t, LargeInt.int) Property.readonly
    val shadowTypeProp : ('a class_t, shadow_type_t, shadow_type_t) Property.readwrite
    val textProp : ('a class_t, string option, string option) Property.readwrite
    val textLengthProp : ('a class_t, LargeInt.int) Property.readonly
    val truncateMultilineProp : ('a class_t, bool, bool) Property.readwrite
    val visibilityProp : ('a class_t, bool, bool) Property.readwrite
    val widthCharsProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val xalignProp : ('a class_t, real, real) Property.readwrite
  end
