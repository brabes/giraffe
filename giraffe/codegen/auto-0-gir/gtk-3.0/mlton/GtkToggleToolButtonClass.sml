structure GtkToggleToolButtonClass :>
  GTK_TOGGLE_TOOL_BUTTON_CLASS
    where type 'a tool_button_class = 'a GtkToolButtonClass.class
    where type C.opt = GtkToolButtonClass.C.opt
    where type C.non_opt = GtkToolButtonClass.C.non_opt
    where type 'a C.p = 'a GtkToolButtonClass.C.p =
  struct
    type 'a tool_button_class = 'a GtkToolButtonClass.class
    open GtkToolButtonClass
    type 'a toggle_tool_button = unit
    type 'a class = 'a toggle_tool_button class
    val getType_ = _import "gtk_toggle_tool_button_get_type" : unit -> GObjectType.FFI.val_;
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
