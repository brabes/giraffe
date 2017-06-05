structure GioEmblemOrigin :> GIO_EMBLEM_ORIGIN =
  struct
    datatype enum =
      UNKNOWN
    | DEVICE
    | LIVEMETADATA
    | TAG
    structure Enum =
      Enum(
        type enum = enum
        val null = UNKNOWN
        val toInt =
          fn
            UNKNOWN => 0
          | DEVICE => 1
          | LIVEMETADATA => 2
          | TAG => 3
        exception Value of GInt.t
        val fromInt =
          fn
            0 => UNKNOWN
          | 1 => DEVICE
          | 2 => LIVEMETADATA
          | 3 => TAG
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_emblem_origin_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
