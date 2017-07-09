structure GioPasswordSave :> GIO_PASSWORD_SAVE =
  struct
    datatype enum =
      NEVER
    | FOR_SESSION
    | PERMANENTLY
    structure Enum =
      Enum(
        type enum = enum
        val null = NEVER
        val toInt =
          fn
            NEVER => 0
          | FOR_SESSION => 1
          | PERMANENTLY => 2
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => NEVER
          | 1 => FOR_SESSION
          | 2 => PERMANENTLY
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_password_save_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
