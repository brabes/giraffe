signature GTK_STATUS_ICON =
  sig
    type 'a class
    type 'a menu_class
    type 'a tooltip_class
    type orientation_t
    type image_type_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val newFromFile : string -> base class
    val newFromGicon : 'a Gio.IconClass.class -> base class
    val newFromIconName : string -> base class
    val newFromPixbuf : 'a GdkPixbuf.PixbufClass.class -> base class
    val newFromStock : string -> base class
    val positionMenu :
      'a menu_class
       * LargeInt.int
       * LargeInt.int
       * 'b class
       -> bool
           * LargeInt.int
           * LargeInt.int
    val getGeometry :
      'a class
       -> (base Gdk.ScreenClass.class
            * Gdk.RectangleRecord.t
            * orientation_t)
            option
    val getGicon : 'a class -> base Gio.IconClass.class option
    val getHasTooltip : 'a class -> bool
    val getIconName : 'a class -> string option
    val getPixbuf : 'a class -> base GdkPixbuf.PixbufClass.class option
    val getScreen : 'a class -> base Gdk.ScreenClass.class
    val getSize : 'a class -> LargeInt.int
    val getStock : 'a class -> string option
    val getStorageType : 'a class -> image_type_t
    val getTitle : 'a class -> string
    val getTooltipMarkup : 'a class -> string option
    val getTooltipText : 'a class -> string option
    val getVisible : 'a class -> bool
    val getX11WindowId : 'a class -> LargeInt.int
    val isEmbedded : 'a class -> bool
    val setFromFile :
      'a class
       -> string
       -> unit
    val setFromGicon :
      'a class
       -> 'b Gio.IconClass.class
       -> unit
    val setFromIconName :
      'a class
       -> string
       -> unit
    val setFromPixbuf :
      'a class
       -> 'b GdkPixbuf.PixbufClass.class option
       -> unit
    val setFromStock :
      'a class
       -> string
       -> unit
    val setHasTooltip :
      'a class
       -> bool
       -> unit
    val setName :
      'a class
       -> string
       -> unit
    val setScreen :
      'a class
       -> 'b Gdk.ScreenClass.class
       -> unit
    val setTitle :
      'a class
       -> string
       -> unit
    val setTooltipMarkup :
      'a class
       -> string option
       -> unit
    val setTooltipText :
      'a class
       -> string
       -> unit
    val setVisible :
      'a class
       -> bool
       -> unit
    val activateSig : (unit -> unit) -> 'a class Signal.t
    val buttonPressEventSig : (Gdk.EventButtonRecord.t -> bool) -> 'a class Signal.t
    val buttonReleaseEventSig : (Gdk.EventButtonRecord.t -> bool) -> 'a class Signal.t
    val popupMenuSig : (LargeInt.int * LargeInt.int -> unit) -> 'a class Signal.t
    val queryTooltipSig :
      (LargeInt.int
        * LargeInt.int
        * bool
        * base tooltip_class
        -> bool)
       -> 'a class Signal.t
    val scrollEventSig : (Gdk.EventScrollRecord.t -> bool) -> 'a class Signal.t
    val sizeChangedSig : (LargeInt.int -> bool) -> 'a class Signal.t
    val embeddedProp : ('a class, unit -> bool, unit, unit) Property.t
    val fileProp : ('a class, unit, string option -> unit, string option -> unit) Property.t
    val giconProp : ('a class, unit -> base Gio.IconClass.class option, 'b Gio.IconClass.class option -> unit, 'b Gio.IconClass.class option -> unit) Property.t
    val hasTooltipProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val iconNameProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val orientationProp : ('a class, unit -> orientation_t, unit, unit) Property.t
    val pixbufProp : ('a class, unit -> base GdkPixbuf.PixbufClass.class option, 'b GdkPixbuf.PixbufClass.class option -> unit, 'b GdkPixbuf.PixbufClass.class option -> unit) Property.t
    val screenProp : ('a class, unit -> base Gdk.ScreenClass.class option, 'b Gdk.ScreenClass.class option -> unit, 'b Gdk.ScreenClass.class option -> unit) Property.t
    val sizeProp : ('a class, unit -> LargeInt.int, unit, unit) Property.t
    val stockProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val storageTypeProp : ('a class, unit -> image_type_t, unit, unit) Property.t
    val titleProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val tooltipMarkupProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val tooltipTextProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val visibleProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
  end
