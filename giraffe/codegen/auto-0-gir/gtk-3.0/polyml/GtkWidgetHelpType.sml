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
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_widget_help_type_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
