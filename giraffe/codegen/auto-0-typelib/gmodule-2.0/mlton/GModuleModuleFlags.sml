structure GModuleModuleFlags :>
  sig
    include G_MODULE_MODULE_FLAGS
  end =
  struct
    val LAZY = 0w1
    val LOCAL = 0w2
    val MASK = 0w3
    val allFlags =
      [
        LAZY,
        LOCAL,
        MASK
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
  end