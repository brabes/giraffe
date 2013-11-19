structure PangoFontFace :>
  PANGO_FONT_FACE
    where type 'a class_t = 'a PangoFontFaceClass.t
    where type fontdescriptionrecord_t = PangoFontDescriptionRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_font_face_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val describe_ = call (load_sym libpango "pango_font_face_describe") (GObjectObjectClass.PolyML.PTR --> PangoFontDescriptionRecord.PolyML.PTR)
      val getFaceName_ = call (load_sym libpango "pango_font_face_get_face_name") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val isSynthesized_ = call (load_sym libpango "pango_font_face_is_synthesized") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
    end
    type 'a class_t = 'a PangoFontFaceClass.t
    type fontdescriptionrecord_t = PangoFontDescriptionRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun describe self = (GObjectObjectClass.C.withPtr ---> PangoFontDescriptionRecord.C.fromPtr true) describe_ self
    fun getFaceName self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getFaceName_ self
    fun isSynthesized self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isSynthesized_ self
  end