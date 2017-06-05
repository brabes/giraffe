structure GtkSwitch :>
  GTK_SWITCH
    where type 'a class = 'a GtkSwitchClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_switch_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_switch_new" : unit -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getActive_ = _import "gtk_switch_get_active" : GtkSwitchClass.FFI.notnull GtkSwitchClass.FFI.p -> GBool.FFI.val_;
    val setActive_ = fn x1 & x2 => (_import "gtk_switch_set_active" : GtkSwitchClass.FFI.notnull GtkSwitchClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkSwitchClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkSwitchClass.FFI.fromPtr false) new_ ()
    fun getActive self = (GtkSwitchClass.FFI.withPtr ---> GBool.FFI.fromVal) getActive_ self
    fun setActive self isActive = (GtkSwitchClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setActive_ (self & isActive)
    local
      open ClosureMarshal Signal
    in
      fun activateSig f = signal "activate" (void ---> ret_void) f
    end
    local
      open Property
    in
      val activeProp =
        {
          get = fn x => get "active" boolean x,
          set = fn x => set "active" boolean x
        }
    end
  end
