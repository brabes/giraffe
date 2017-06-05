structure VteTerminalCursorBlinkMode :> VTE_TERMINAL_CURSOR_BLINK_MODE =
  struct
    datatype enum =
      SYSTEM
    | ON
    | OFF
    structure Enum =
      Enum(
        type enum = enum
        val null = SYSTEM
        val toInt =
          fn
            SYSTEM => 0
          | ON => 1
          | OFF => 2
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => SYSTEM
          | 1 => ON
          | 2 => OFF
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libvte "vte_terminal_cursor_blink_mode_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
