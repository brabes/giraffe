structure GtkWindowGroup :>
  GTK_WINDOW_GROUP
    where type 'a class_t = 'a GtkWindowGroupClass.t
    where type 'a widget_class_t = 'a GtkWidgetClass.t
    where type 'a window_class_t = 'a GtkWindowClass.t =
  struct
    val getType_ = _import "gtk_window_group_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_window_group_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val addWindow_ = fn x1 & x2 => (_import "gtk_window_group_add_window" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val getCurrentDeviceGrab_ = fn x1 & x2 => (_import "gtk_window_group_get_current_device_grab" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getCurrentGrab_ = _import "gtk_window_group_get_current_grab" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val removeWindow_ = fn x1 & x2 => (_import "gtk_window_group_remove_window" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    type 'a class_t = 'a GtkWindowGroupClass.t
    type 'a widget_class_t = 'a GtkWidgetClass.t
    type 'a window_class_t = 'a GtkWindowClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkWindowGroupClass.C.fromPtr true) new_ ()
    fun addWindow self window = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) addWindow_ (self & window)
    fun getCurrentDeviceGrab self device = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getCurrentDeviceGrab_ (self & device)
    fun getCurrentGrab self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getCurrentGrab_ self
    fun removeWindow self window = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) removeWindow_ (self & window)
  end
