structure GtkRecentFilterFlags :> GTK_RECENT_FILTER_FLAGS =
  struct
    val URI = 0w1
    val DISPLAY_NAME = 0w2
    val MIME_TYPE = 0w4
    val APPLICATION = 0w8
    val GROUP = 0w16
    val AGE = 0w32
    val allFlags =
      [
        URI,
        DISPLAY_NAME,
        MIME_TYPE,
        APPLICATION,
        GROUP,
        AGE
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    val getType_ = _import "gtk_recent_filter_flags_get_type" : unit -> GObjectType.FFI.val_;
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
