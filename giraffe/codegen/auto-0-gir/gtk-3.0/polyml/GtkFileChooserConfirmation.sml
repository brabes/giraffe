structure GtkFileChooserConfirmation :> GTK_FILE_CHOOSER_CONFIRMATION =
  struct
    datatype enum =
      CONFIRM
    | ACCEPT_FILENAME
    | SELECT_AGAIN
    structure Enum =
      Enum(
        type enum = enum
        val null = CONFIRM
        val toInt =
          fn
            CONFIRM => 0
          | ACCEPT_FILENAME => 1
          | SELECT_AGAIN => 2
        exception Value of GInt.t
        val fromInt =
          fn
            0 => CONFIRM
          | 1 => ACCEPT_FILENAME
          | 2 => SELECT_AGAIN
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_file_chooser_confirmation_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
