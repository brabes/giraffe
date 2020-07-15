signature GIO_NETWORK_SERVICE =
  sig
    type 'a class
    type 'a socket_connectable_class
    type t = base class
    val asSocketConnectable : 'a class -> base socket_connectable_class
    val getType : unit -> GObject.Type.t
    val new :
      string
       * string
       * string
       -> base class
    val getDomain : 'a class -> string
    val getProtocol : 'a class -> string
    val getScheme : 'a class -> string
    val getService : 'a class -> string
    val setScheme :
      'a class
       -> string
       -> unit
    val domainProp :
      {
        get : 'a class -> string option,
        new : string option -> 'a class Property.t
      }
    val protocolProp :
      {
        get : 'a class -> string option,
        new : string option -> 'a class Property.t
      }
    val schemeProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val serviceProp :
      {
        get : 'a class -> string option,
        new : string option -> 'a class Property.t
      }
  end