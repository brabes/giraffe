structure GioIOStreamSpliceFlags :>
  sig
    include GIO_I_O_STREAM_SPLICE_FLAGS
  end =
  struct
    local
      fun NONE () = 0w0
    in
      val NONE = NONE ()
    end
    val CLOSESTREAM1 = 0w1
    val CLOSESTREAM2 = 0w2
    val WAITFORBOTH = 0w4
    val allFlags =
      [
        NONE,
        CLOSESTREAM1,
        CLOSESTREAM2,
        WAITFORBOTH
      ]
    structure BitFlags =
      Word32BitFlags (
        val allFlags = allFlags
      )
    open BitFlags
    type t = flags
    structure C =
      struct
        type val_ = FFI.Flags.C.val_
        type ref_ = FFI.Flags.C.ref_
        fun withVal f = f
        fun withRefVal f = withVal (FFI.Flags.C.withRef f)
        fun fromVal w = w
      end
    val getType_ = _import "g_io_stream_splice_flags_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_flags" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_flags" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
