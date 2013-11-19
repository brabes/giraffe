structure PangoFontMetrics :>
  PANGO_FONT_METRICS
    where type record_t = PangoFontMetricsRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_font_metrics_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getApproximateCharWidth_ = call (load_sym libpango "pango_font_metrics_get_approximate_char_width") (PangoFontMetricsRecord.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getApproximateDigitWidth_ = call (load_sym libpango "pango_font_metrics_get_approximate_digit_width") (PangoFontMetricsRecord.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getAscent_ = call (load_sym libpango "pango_font_metrics_get_ascent") (PangoFontMetricsRecord.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getDescent_ = call (load_sym libpango "pango_font_metrics_get_descent") (PangoFontMetricsRecord.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getStrikethroughPosition_ = call (load_sym libpango "pango_font_metrics_get_strikethrough_position") (PangoFontMetricsRecord.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getStrikethroughThickness_ = call (load_sym libpango "pango_font_metrics_get_strikethrough_thickness") (PangoFontMetricsRecord.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getUnderlinePosition_ = call (load_sym libpango "pango_font_metrics_get_underline_position") (PangoFontMetricsRecord.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getUnderlineThickness_ = call (load_sym libpango "pango_font_metrics_get_underline_thickness") (PangoFontMetricsRecord.PolyML.PTR --> FFI.Int32.PolyML.VAL)
    end
    type record_t = PangoFontMetricsRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getApproximateCharWidth self = (PangoFontMetricsRecord.C.withPtr ---> FFI.Int32.C.fromVal) getApproximateCharWidth_ self
    fun getApproximateDigitWidth self = (PangoFontMetricsRecord.C.withPtr ---> FFI.Int32.C.fromVal) getApproximateDigitWidth_ self
    fun getAscent self = (PangoFontMetricsRecord.C.withPtr ---> FFI.Int32.C.fromVal) getAscent_ self
    fun getDescent self = (PangoFontMetricsRecord.C.withPtr ---> FFI.Int32.C.fromVal) getDescent_ self
    fun getStrikethroughPosition self = (PangoFontMetricsRecord.C.withPtr ---> FFI.Int32.C.fromVal) getStrikethroughPosition_ self
    fun getStrikethroughThickness self = (PangoFontMetricsRecord.C.withPtr ---> FFI.Int32.C.fromVal) getStrikethroughThickness_ self
    fun getUnderlinePosition self = (PangoFontMetricsRecord.C.withPtr ---> FFI.Int32.C.fromVal) getUnderlinePosition_ self
    fun getUnderlineThickness self = (PangoFontMetricsRecord.C.withPtr ---> FFI.Int32.C.fromVal) getUnderlineThickness_ self
  end