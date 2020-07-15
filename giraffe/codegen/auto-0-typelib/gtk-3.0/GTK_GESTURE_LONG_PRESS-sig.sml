signature GTK_GESTURE_LONG_PRESS =
  sig
    type 'a class
    type 'a widget_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : 'a widget_class -> base class
    val cancelledSig : (unit -> unit) -> 'a class Signal.t
    val pressedSig : (real * real -> unit) -> 'a class Signal.t
    val delayFactorProp :
      {
        get : 'a class -> real,
        set :
          real
           -> 'a class
           -> unit,
        new : real -> 'a class Property.t
      }
  end