structure GtkPrintOperationResult :>
  sig
    include GTK_PRINT_OPERATION_RESULT
  end =
  struct
    datatype t =
      ERROR
    | APPLY
    | CANCEL
    | IN_PROGRESS
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            ERROR => f 0
          | APPLY => f 1
          | CANCEL => f 2
          | IN_PROGRESS => f 3
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => ERROR
          | 1 => APPLY
          | 2 => CANCEL
          | 3 => IN_PROGRESS
          | n => raise Value n
      end
    val getType_ = _import "gtk_print_operation_result_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = ERROR
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
