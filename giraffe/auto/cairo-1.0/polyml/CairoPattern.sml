structure CairoPattern :>
  CAIRO_PATTERN
    where type record_t = CairoPatternRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libcairogobject "cairo_gobject_pattern_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
    end
    type record_t = CairoPatternRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end