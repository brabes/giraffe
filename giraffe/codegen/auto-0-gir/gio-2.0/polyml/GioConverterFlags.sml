structure GioConverterFlags :> GIO_CONVERTER_FLAGS =
  struct
    local
      fun NONE () = 0w0
    in
      val NONE = NONE ()
    end
    val INPUT_AT_END = 0w1
    val FLUSH = 0w2
    val allFlags =
      [
        NONE,
        INPUT_AT_END,
        FLUSH
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_converter_flags_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_flags") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_flags") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> cVoid)
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
