signature GTK_COLOR_SELECTION_DIALOG =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type 'a widget_class_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val getType : unit -> GObject.Type.t
    val new : string -> base class_t
    val getColorSelection : 'a class_t -> base widget_class_t
    val cancelButtonProp : ('a class_t, base widget_class_t option) Property.readonly
    val colorSelectionProp : ('a class_t, base widget_class_t option) Property.readonly
    val helpButtonProp : ('a class_t, base widget_class_t option) Property.readonly
    val okButtonProp : ('a class_t, base widget_class_t option) Property.readonly
  end
