structure GtkPrintQuality :> GTK_PRINT_QUALITY =
  struct
    datatype enum =
      LOW
    | NORMAL
    | HIGH
    | DRAFT
    structure Enum =
      Enum(
        type enum = enum
        val null = LOW
        val toInt =
          fn
            LOW => 0
          | NORMAL => 1
          | HIGH => 2
          | DRAFT => 3
        exception Value of GInt.t
        val fromInt =
          fn
            0 => LOW
          | 1 => NORMAL
          | 2 => HIGH
          | 3 => DRAFT
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_print_quality_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
