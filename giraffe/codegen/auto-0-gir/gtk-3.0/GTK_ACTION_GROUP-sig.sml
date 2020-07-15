signature GTK_ACTION_GROUP =
  sig
    type 'a class
    type 'a buildable_class
    type 'a widget_class
    type 'a action_class
    type 'a accel_group_class
    type t = base class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : string -> base class
    val addAction :
      'a class
       -> 'b action_class
       -> unit
    val addActionWithAccel :
      'a class
       -> 'b action_class * string option
       -> unit
    val getAccelGroup : 'a class -> base accel_group_class
    val getAction :
      'a class
       -> string
       -> base action_class
    val getName : 'a class -> string
    val getSensitive : 'a class -> bool
    val getVisible : 'a class -> bool
    val removeAction :
      'a class
       -> 'b action_class
       -> unit
    val setAccelGroup :
      'a class
       -> 'b accel_group_class option
       -> unit
    val setSensitive :
      'a class
       -> bool
       -> unit
    val setTranslationDomain :
      'a class
       -> string option
       -> unit
    val setVisible :
      'a class
       -> bool
       -> unit
    val translateString :
      'a class
       -> string
       -> string
    val connectProxySig : (base action_class * base widget_class -> unit) -> 'a class Signal.t
    val disconnectProxySig : (base action_class * base widget_class -> unit) -> 'a class Signal.t
    val postActivateSig : (base action_class -> unit) -> 'a class Signal.t
    val preActivateSig : (base action_class -> unit) -> 'a class Signal.t
    val accelGroupProp :
      {
        get : 'a class -> base accel_group_class option,
        set :
          'b accel_group_class option
           -> 'a class
           -> unit,
        new : 'b accel_group_class option -> 'a class Property.t
      }
    val nameProp :
      {
        get : 'a class -> string option,
        new : string option -> 'a class Property.t
      }
    val sensitiveProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val visibleProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
  end