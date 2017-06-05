structure GtkPathPriorityType :> GTK_PATH_PRIORITY_TYPE =
  struct
    datatype enum =
      LOWEST
    | GTK
    | APPLICATION
    | THEME
    | RC
    | HIGHEST
    structure Enum =
      Enum(
        type enum = enum
        val null = LOWEST
        val toInt =
          fn
            LOWEST => 0
          | GTK => 4
          | APPLICATION => 8
          | THEME => 10
          | RC => 12
          | HIGHEST => 15
        exception Value of GInt.t
        val fromInt =
          fn
            0 => LOWEST
          | 4 => GTK
          | 8 => APPLICATION
          | 10 => THEME
          | 12 => RC
          | 15 => HIGHEST
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_path_priority_type_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
