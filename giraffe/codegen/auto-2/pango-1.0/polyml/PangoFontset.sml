structure PangoFontset :>
  PANGO_FONTSET
    where type 'a class_t = 'a PangoFontsetClass.t
    where type 'a fontclass_t = 'a PangoFontClass.t
    where type fontmetricsrecord_t = PangoFontMetricsRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_fontset_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getFont_ = call (load_sym libpango "pango_fontset_get_font") (GObjectObjectClass.PolyML.PTR &&> FFI.UInt32.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val getMetrics_ = call (load_sym libpango "pango_fontset_get_metrics") (GObjectObjectClass.PolyML.PTR --> PangoFontMetricsRecord.PolyML.PTR)
    end
    type 'a class_t = 'a PangoFontsetClass.t
    type 'a fontclass_t = 'a PangoFontClass.t
    type fontmetricsrecord_t = PangoFontMetricsRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getFont self wc = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> PangoFontClass.C.fromPtr true) getFont_ (self & wc)
    fun getMetrics self = (GObjectObjectClass.C.withPtr ---> PangoFontMetricsRecord.C.fromPtr true) getMetrics_ self
  end
