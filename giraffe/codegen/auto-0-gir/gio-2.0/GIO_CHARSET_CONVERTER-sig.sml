signature GIO_CHARSET_CONVERTER =
  sig
    type 'a class
    type 'a converter_class
    type 'a initable_class
    type t = base class
    val asConverter : 'a class -> base converter_class
    val asInitable : 'a class -> base initable_class
    val getType : unit -> GObject.Type.t
    val new : string * string -> base class
    val getNumFallbacks : 'a class -> LargeInt.int
    val getUseFallback : 'a class -> bool
    val setUseFallback :
      'a class
       -> bool
       -> unit
    val fromCharsetProp :
      {
        get : 'a class -> string option,
        new : string option -> 'a class Property.t
      }
    val toCharsetProp :
      {
        get : 'a class -> string option,
        new : string option -> 'a class Property.t
      }
    val useFallbackProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
  end