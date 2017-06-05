structure AtkCoordType :> ATK_COORD_TYPE =
  struct
    datatype enum =
      SCREEN
    | WINDOW
    structure Enum =
      Enum(
        type enum = enum
        val null = SCREEN
        val toInt =
          fn
            SCREEN => 0
          | WINDOW => 1
        exception Value of GInt.t
        val fromInt =
          fn
            0 => SCREEN
          | 1 => WINDOW
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_coord_type_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
