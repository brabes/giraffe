signature GTK_RADIO_TOOL_BUTTON =
  sig
    type 'a class_t
    type 'a activatable_class_t
    type 'a buildable_class_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asActivatable : 'a class_t -> base activatable_class_t
    val asBuildable : 'a class_t -> base buildable_class_t
    val getType : unit -> GObject.Type.t
    val newFromWidget : 'a class_t option -> base class_t
    val newWithStockFromWidget :
      'a class_t option
       -> string
       -> base class_t
    val groupProp : ('a class_t, 'b class_t option) Property.writeonly
  end
