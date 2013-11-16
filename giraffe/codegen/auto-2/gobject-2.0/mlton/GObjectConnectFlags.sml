structure GObjectConnectFlags :>
  sig
    include G_OBJECT_CONNECT_FLAGS
  end =
  struct
    val AFTER = 0w1
    val SWAPPED = 0w2
    val allFlags = [AFTER, SWAPPED]
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
  end
