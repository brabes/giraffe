structure GtkPositionType :> GTK_POSITION_TYPE =
  struct
    datatype enum =
      LEFT
    | RIGHT
    | TOP
    | BOTTOM
    structure Enum =
      Enum(
        type enum = enum
        val null = LEFT
        val toInt =
          fn
            LEFT => 0
          | RIGHT => 1
          | TOP => 2
          | BOTTOM => 3
        exception Value of GInt.t
        val fromInt =
          fn
            0 => LEFT
          | 1 => RIGHT
          | 2 => TOP
          | 3 => BOTTOM
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_position_type_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
