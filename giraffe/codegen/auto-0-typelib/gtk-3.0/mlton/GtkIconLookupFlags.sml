structure GtkIconLookupFlags :>
  sig
    include GTK_ICON_LOOKUP_FLAGS
  end =
  struct
    val NO_SVG = 0w1
    val FORCE_SVG = 0w2
    val USE_BUILTIN = 0w4
    val GENERIC_FALLBACK = 0w8
    val FORCE_SIZE = 0w16
    val allFlags =
      [
        NO_SVG,
        FORCE_SVG,
        USE_BUILTIN,
        GENERIC_FALLBACK,
        FORCE_SIZE
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
    val getType_ = _import "gtk_icon_lookup_flags_get_type" : unit -> GObjectType.C.val_;
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
