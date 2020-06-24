structure GioFileQueryInfoFlags :> GIO_FILE_QUERY_INFO_FLAGS =
  struct
    local
      fun NONE () = 0w0
    in
      val NONE = NONE ()
    end
    val NOFOLLOW_SYMLINKS = 0w1
    val allFlags = [NONE, NOFOLLOW_SYMLINKS]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    val getType_ = _import "g_file_query_info_flags_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_flags" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_flags" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
