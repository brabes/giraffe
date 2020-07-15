signature GTK_VIEWPORT =
  sig
    type 'a class
    type 'a buildable_class
    type 'a scrollable_class
    type 'a adjustment_class
    type shadow_type_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asScrollable : 'a class -> base scrollable_class
    val getType : unit -> GObject.Type.t
    val new : 'a adjustment_class option * 'b adjustment_class option -> base class
    val getBinWindow : 'a class -> base Gdk.WindowClass.class
    val getHadjustment : 'a class -> base adjustment_class
    val getShadowType : 'a class -> shadow_type_t
    val getVadjustment : 'a class -> base adjustment_class
    val getViewWindow : 'a class -> base Gdk.WindowClass.class
    val setHadjustment :
      'a class
       -> 'b adjustment_class option
       -> unit
    val setShadowType :
      'a class
       -> shadow_type_t
       -> unit
    val setVadjustment :
      'a class
       -> 'b adjustment_class option
       -> unit
    val shadowTypeProp :
      {
        get : 'a class -> shadow_type_t,
        set :
          shadow_type_t
           -> 'a class
           -> unit,
        new : shadow_type_t -> 'a class Property.t
      }
  end