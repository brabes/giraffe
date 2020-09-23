signature G_OBJECT_TYPE_MODULE =
  sig
    type 'a class
    type 'a type_plugin_class
    type type_t
    type t = base class
    val asTypePlugin : 'a class -> base type_plugin_class
    val getType : unit -> type_t
    val setName :
      'a class
       -> string
       -> unit
    val unuse : 'a class -> unit
    val use : 'a class -> bool
  end
