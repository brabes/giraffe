structure GObjectTypeFundamentalFlags :>
  sig
    include G_OBJECT_TYPE_FUNDAMENTAL_FLAGS
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    val CLASSED = 0w1
    val INSTANTIATABLE = 0w2
    val DERIVABLE = 0w4
    val DEEP_DERIVABLE = 0w8
    val allFlags =
      [
        CLASSED,
        INSTANTIATABLE,
        DERIVABLE,
        DEEP_DERIVABLE
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
    structure PolyML =
      struct
        val VAL = FFI.Flags.PolyML.VAL
        val REF = FFI.Flags.PolyML.REF
      end
  end
