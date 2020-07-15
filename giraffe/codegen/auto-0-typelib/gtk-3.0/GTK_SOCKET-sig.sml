signature GTK_SOCKET =
  sig
    type 'a class
    type 'a buildable_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val addId :
      'a class
       -> LargeInt.int
       -> unit
    val getId : 'a class -> LargeInt.int
    val getPlugWindow : 'a class -> base Gdk.WindowClass.class option
    val plugAddedSig : (unit -> unit) -> 'a class Signal.t
    val plugRemovedSig : (unit -> bool) -> 'a class Signal.t
  end