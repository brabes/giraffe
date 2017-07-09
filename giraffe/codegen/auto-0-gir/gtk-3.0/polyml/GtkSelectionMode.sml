structure GtkSelectionMode :> GTK_SELECTION_MODE =
  struct
    datatype enum =
      NONE
    | SINGLE
    | BROWSE
    | MULTIPLE
    structure Enum =
      Enum(
        type enum = enum
        val null = NONE
        val toInt =
          fn
            NONE => 0
          | SINGLE => 1
          | BROWSE => 2
          | MULTIPLE => 3
        exception Value of GInt.t
        val fromInt =
          fn
            0 => NONE
          | 1 => SINGLE
          | 2 => BROWSE
          | 3 => MULTIPLE
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_selection_mode_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> cVoid)
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
