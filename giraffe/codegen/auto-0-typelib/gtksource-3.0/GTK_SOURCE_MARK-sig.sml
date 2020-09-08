signature GTK_SOURCE_MARK =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : string * string -> base class
    val getCategory : 'a class -> string
    val next :
      'a class
       -> string option
       -> base class option
    val prev :
      'a class
       -> string
       -> base class option
    val categoryProp : ('a class, unit -> string option, unit, string option -> unit) Property.t
  end
