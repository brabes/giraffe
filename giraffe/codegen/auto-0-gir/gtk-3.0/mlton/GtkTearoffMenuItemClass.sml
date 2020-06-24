structure GtkTearoffMenuItemClass :>
  GTK_TEAROFF_MENU_ITEM_CLASS
    where type 'a menu_item_class = 'a GtkMenuItemClass.class
    where type C.opt = GtkMenuItemClass.C.opt
    where type C.non_opt = GtkMenuItemClass.C.non_opt
    where type 'a C.p = 'a GtkMenuItemClass.C.p =
  struct
    type 'a menu_item_class = 'a GtkMenuItemClass.class
    open GtkMenuItemClass
    type 'a tearoff_menu_item = unit
    type 'a class = 'a tearoff_menu_item class
    val getType_ = _import "gtk_tearoff_menu_item_get_type" : unit -> GObjectType.FFI.val_;
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
