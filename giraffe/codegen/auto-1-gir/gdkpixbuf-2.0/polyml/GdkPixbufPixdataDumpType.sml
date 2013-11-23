structure GdkPixbufPixdataDumpType :>
  sig
    include GDK_PIXBUF_PIXDATA_DUMP_TYPE
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    val PIXDATASTREAM = 0w0
    val PIXDATASTRUCT = 0w1
    val MACROS = 0w2
    val GTYPES = 0w0
    val CTYPES = 0w256
    val STATIC = 0w512
    val CONST = 0w1024
    val RLEDECODER = 0w65536
    val allFlags =
      [
        PIXDATASTREAM,
        PIXDATASTRUCT,
        MACROS,
        GTYPES,
        CTYPES,
        STATIC,
        CONST,
        RLEDECODER
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
