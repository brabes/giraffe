signature GTK_MENU_BAR =
  sig
    type 'a class
    type 'a buildable_class
    type pack_direction_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val newFromModel : 'a Gio.MenuModelClass.class -> base class
    val getChildPackDirection : 'a class -> pack_direction_t
    val getPackDirection : 'a class -> pack_direction_t
    val setChildPackDirection :
      'a class
       -> pack_direction_t
       -> unit
    val setPackDirection :
      'a class
       -> pack_direction_t
       -> unit
    val childPackDirectionProp : ('a class, unit -> pack_direction_t, pack_direction_t -> unit, pack_direction_t -> unit) Property.t
    val packDirectionProp : ('a class, unit -> pack_direction_t, pack_direction_t -> unit, pack_direction_t -> unit) Property.t
  end
