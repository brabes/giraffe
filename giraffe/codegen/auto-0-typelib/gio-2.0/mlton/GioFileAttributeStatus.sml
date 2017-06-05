structure GioFileAttributeStatus :> GIO_FILE_ATTRIBUTE_STATUS =
  struct
    datatype enum =
      UNSET
    | SET
    | ERROR_SETTING
    structure Enum =
      Enum(
        type enum = enum
        val null = UNSET
        val toInt =
          fn
            UNSET => 0
          | SET => 1
          | ERROR_SETTING => 2
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => UNSET
          | 1 => SET
          | 2 => ERROR_SETTING
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "g_file_attribute_status_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
