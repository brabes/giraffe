signature GTK_H_SCROLLBAR =
  sig
    type 'a class
    type 'a buildable_class
    type 'a orientable_class
    type 'a adjustment_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asOrientable : 'a class -> base orientable_class
    val getType : unit -> GObject.Type.t
    val new : 'a adjustment_class option -> base class
  end
