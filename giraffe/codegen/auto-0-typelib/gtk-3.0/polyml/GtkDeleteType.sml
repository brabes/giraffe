structure GtkDeleteType :> GTK_DELETE_TYPE =
  struct
    datatype enum =
      CHARS
    | WORD_ENDS
    | WORDS
    | DISPLAY_LINES
    | DISPLAY_LINE_ENDS
    | PARAGRAPH_ENDS
    | PARAGRAPHS
    | WHITESPACE
    structure Enum =
      Enum(
        type enum = enum
        val null = CHARS
        val toInt =
          fn
            CHARS => 0
          | WORD_ENDS => 1
          | WORDS => 2
          | DISPLAY_LINES => 3
          | DISPLAY_LINE_ENDS => 4
          | PARAGRAPH_ENDS => 5
          | PARAGRAPHS => 6
          | WHITESPACE => 7
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => CHARS
          | 1 => WORD_ENDS
          | 2 => WORDS
          | 3 => DISPLAY_LINES
          | 4 => DISPLAY_LINE_ENDS
          | 5 => PARAGRAPH_ENDS
          | 6 => PARAGRAPHS
          | 7 => WHITESPACE
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_delete_type_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
