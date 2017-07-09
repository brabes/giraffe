structure VteWriteFlags :> VTE_WRITE_FLAGS =
  struct
    datatype enum =
      DEFAULT
    structure Enum =
      Enum(
        type enum = enum
        val null = DEFAULT
        val toInt = fn DEFAULT => 0
        exception Value of GInt.t
        val fromInt =
          fn
            0 => DEFAULT
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "vte_write_flags_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
