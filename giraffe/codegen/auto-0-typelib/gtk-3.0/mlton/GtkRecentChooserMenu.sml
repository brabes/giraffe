structure GtkRecentChooserMenu :>
  GTK_RECENT_CHOOSER_MENU
    where type 'a class_t = 'a GtkRecentChooserMenuClass.t
    where type 'a activatableclass_t = 'a GtkActivatableClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a recentchooserclass_t = 'a GtkRecentChooserClass.t
    where type 'a recentmanagerclass_t = 'a GtkRecentManagerClass.t =
  struct
    val getType_ = _import "gtk_recent_chooser_menu_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_recent_chooser_menu_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newForManager_ = _import "gtk_recent_chooser_menu_new_for_manager" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getShowNumbers_ = _import "gtk_recent_chooser_menu_get_show_numbers" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val setShowNumbers_ = fn x1 & x2 => (_import "gtk_recent_chooser_menu_set_show_numbers" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    type 'a class_t = 'a GtkRecentChooserMenuClass.t
    type 'a activatableclass_t = 'a GtkActivatableClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a recentchooserclass_t = 'a GtkRecentChooserClass.t
    type 'a recentmanagerclass_t = 'a GtkRecentManagerClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asRecentChooser self = (GObjectObjectClass.C.withPtr ---> GtkRecentChooserClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkRecentChooserMenuClass.C.fromPtr false) new_ ()
    fun newForManager manager = (GObjectObjectClass.C.withPtr ---> GtkRecentChooserMenuClass.C.fromPtr false) newForManager_ manager
    fun getShowNumbers self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowNumbers_ self
    fun setShowNumbers self showNumbers = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowNumbers_ (self & showNumbers)
    local
      open Property
    in
      val showNumbersProp =
        {
          get = fn x => get "show-numbers" boolean x,
          set = fn x => set "show-numbers" boolean x
        }
    end
  end
