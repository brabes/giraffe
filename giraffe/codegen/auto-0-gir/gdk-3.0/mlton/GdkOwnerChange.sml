structure GdkOwnerChange :> GDK_OWNER_CHANGE =
  struct
    datatype enum =
      NEW_OWNER
    | DESTROY
    | CLOSE
    structure Enum =
      Enum(
        type enum = enum
        val null = NEW_OWNER
        val toInt =
          fn
            NEW_OWNER => 0
          | DESTROY => 1
          | CLOSE => 2
        exception Value of GInt.t
        val fromInt =
          fn
            0 => NEW_OWNER
          | 1 => DESTROY
          | 2 => CLOSE
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gdk_owner_change_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
