structure GtkFileChooserError :>
  sig
    include GTK_FILE_CHOOSER_ERROR
  end =
  struct
    datatype t =
      NONEXISTENT
    | BAD_FILENAME
    | ALREADY_EXISTS
    | INCOMPLETE_HOSTNAME
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            NONEXISTENT => f 0
          | BAD_FILENAME => f 1
          | ALREADY_EXISTS => f 2
          | INCOMPLETE_HOSTNAME => f 3
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => NONEXISTENT
          | 1 => BAD_FILENAME
          | 2 => ALREADY_EXISTS
          | 3 => INCOMPLETE_HOSTNAME
          | n => raise Value n
      end
    val getType_ = _import "gtk_file_chooser_error_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    exception Error of t
    val handler =
      GLibErrorRecord.makeHandler
        (
          "gtk-file-chooser-error-quark",
          C.fromVal,
          Error
        )
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
exception GtkFileChooserError = GtkFileChooserError.Error
