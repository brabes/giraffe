structure GioSocketMsgFlags :> GIO_SOCKET_MSG_FLAGS =
  struct
    datatype enum =
      NONE
    | OOB
    | PEEK
    | DONTROUTE
    structure Enum =
      Enum(
        type enum = enum
        val null = NONE
        val toInt =
          fn
            NONE => 0
          | OOB => 1
          | PEEK => 2
          | DONTROUTE => 4
        exception Value of GInt.t
        val fromInt =
          fn
            0 => NONE
          | 1 => OOB
          | 2 => PEEK
          | 4 => DONTROUTE
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "g_socket_msg_flags_get_type" : unit -> GObjectType.FFI.val_;
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
