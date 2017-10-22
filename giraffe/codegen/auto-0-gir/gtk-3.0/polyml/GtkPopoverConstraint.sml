structure GtkPopoverConstraint :> GTK_POPOVER_CONSTRAINT =
  struct
    datatype enum =
      NONE
    | WINDOW
    structure Enum =
      Enum(
        type enum = enum
        val null = NONE
        val toInt =
          fn
            NONE => 0
          | WINDOW => 1
        exception Value of GInt.t
        val fromInt =
          fn
            0 => NONE
          | 1 => WINDOW
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_popover_constraint_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> cVoid)
    end
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end