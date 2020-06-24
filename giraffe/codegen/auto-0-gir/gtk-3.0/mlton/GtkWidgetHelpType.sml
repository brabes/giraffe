structure GtkWidgetHelpType :> GTK_WIDGET_HELP_TYPE =
  struct
    datatype enum =
      TOOLTIP
    | WHATS_THIS
    structure Enum =
      Enum(
        type enum = enum
        val null = TOOLTIP
        val toInt =
          fn
            TOOLTIP => 0
          | WHATS_THIS => 1
        exception Value of GInt.t
        val fromInt =
          fn
            0 => TOOLTIP
          | 1 => WHATS_THIS
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_widget_help_type_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
