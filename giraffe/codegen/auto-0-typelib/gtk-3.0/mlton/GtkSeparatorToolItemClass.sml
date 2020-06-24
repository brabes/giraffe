structure GtkSeparatorToolItemClass :>
  GTK_SEPARATOR_TOOL_ITEM_CLASS
    where type 'a tool_item_class = 'a GtkToolItemClass.class
    where type C.opt = GtkToolItemClass.C.opt
    where type C.non_opt = GtkToolItemClass.C.non_opt
    where type 'a C.p = 'a GtkToolItemClass.C.p =
  struct
    type 'a tool_item_class = 'a GtkToolItemClass.class
    open GtkToolItemClass
    type 'a separator_tool_item = unit
    type 'a class = 'a separator_tool_item class
    val getType_ = _import "gtk_separator_tool_item_get_type" : unit -> GObjectType.FFI.val_;
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
