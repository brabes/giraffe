signature GIO_NETWORK_SERVICE =
  sig
    type 'a class_t
    type 'a socketconnectableclass_t
    val asSocketConnectable : 'a class_t -> base socketconnectableclass_t
    val getType : unit -> GObject.Type.t
    val new :
      string
       -> string
       -> string
       -> base socketconnectableclass_t
    val getDomain : 'a class_t -> string
    val getProtocol : 'a class_t -> string
    val getScheme : 'a class_t -> string
    val getService : 'a class_t -> string
    val setScheme :
      'a class_t
       -> string
       -> unit
    val domainProp : ('a class_t, string option, string option) Property.readwrite
    val protocolProp : ('a class_t, string option, string option) Property.readwrite
    val schemeProp : ('a class_t, string option, string option) Property.readwrite
    val serviceProp : ('a class_t, string option, string option) Property.readwrite
  end