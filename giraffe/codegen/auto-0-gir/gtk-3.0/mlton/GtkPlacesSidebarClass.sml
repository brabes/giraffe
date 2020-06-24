structure GtkPlacesSidebarClass :>
  GTK_PLACES_SIDEBAR_CLASS
    where type 'a scrolled_window_class = 'a GtkScrolledWindowClass.class
    where type C.opt = GtkScrolledWindowClass.C.opt
    where type C.non_opt = GtkScrolledWindowClass.C.non_opt
    where type 'a C.p = 'a GtkScrolledWindowClass.C.p =
  struct
    type 'a scrolled_window_class = 'a GtkScrolledWindowClass.class
    open GtkScrolledWindowClass
    type 'a places_sidebar = unit
    type 'a class = 'a places_sidebar class
    val getType_ = _import "gtk_places_sidebar_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_object" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.non_opt FFI.p;
    val getOptValue_ = _import "g_value_get_object" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.opt FFI.p;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_object" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.non_opt FFI.p -> unit;) (x1, x2)
    val setOptValue_ = fn x1 & x2 => (_import "g_value_set_object" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.opt FFI.p -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromPtr false) getValue_,
          setValue = (I &&&> FFI.withPtr ---> I) setValue_
        }
    val tOpt =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
          setValue = (I &&&> FFI.withOptPtr ---> I) setOptValue_
        }
  end
