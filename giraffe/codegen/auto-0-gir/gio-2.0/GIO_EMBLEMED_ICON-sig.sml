signature GIO_EMBLEMED_ICON =
  sig
    type 'a class
    type 'a emblem_class
    type 'a icon_class
    type t = base class
    val asIcon : 'a class -> base icon_class
    val getType : unit -> GObject.Type.t
    val new : 'a icon_class * 'b emblem_class option -> base class
    val addEmblem :
      'a class
       -> 'b emblem_class
       -> unit
    val clearEmblems : 'a class -> unit
    val getIcon : 'a class -> base icon_class
    val giconProp :
      {
        get : 'a class -> base icon_class option,
        new : 'b icon_class option -> 'a class Property.t
      }
  end