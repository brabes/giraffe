structure Pango : PANGO =
  struct
    structure Utf8CVectorType =
      CPointerCVectorType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVector = CVector(Utf8CVectorType)
    val attrTypeGetName_ = _import "pango_attr_type_get_name" : PangoAttrType.FFI.val_ -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val attrTypeRegister_ = _import "mlton_pango_attr_type_register" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> PangoAttrType.FFI.val_;
    val bidiTypeForUnichar_ = _import "pango_bidi_type_for_unichar" : GChar.FFI.val_ -> PangoBidiType.FFI.val_;
    val extentsToPixels_ = fn x1 & x2 => (_import "pango_extents_to_pixels" : unit PangoRectangleRecord.FFI.p * unit PangoRectangleRecord.FFI.p -> unit;) (x1, x2)
    val findBaseDir_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_pango_find_base_dir" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt32.FFI.val_
               -> PangoDirection.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val fontDescriptionFromString_ = _import "mlton_pango_font_description_from_string" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p;
    val gravityGetForMatrix_ = _import "pango_gravity_get_for_matrix" : PangoMatrixRecord.FFI.notnull PangoMatrixRecord.FFI.p -> PangoGravity.FFI.val_;
    val gravityGetForScript_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_gravity_get_for_script" :
              PangoScript.FFI.val_
               * PangoGravity.FFI.val_
               * PangoGravityHint.FFI.val_
               -> PangoGravity.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val gravityGetForScriptAndWidth_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "pango_gravity_get_for_script_and_width" :
              PangoScript.FFI.val_
               * GBool.FFI.val_
               * PangoGravity.FFI.val_
               * PangoGravityHint.FFI.val_
               -> PangoGravity.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val gravityToRotation_ = _import "pango_gravity_to_rotation" : PangoGravity.FFI.val_ -> GDouble.FFI.val_;
    val isZeroWidth_ = _import "pango_is_zero_width" : GChar.FFI.val_ -> GBool.FFI.val_;
    val languageFromString_ = _import "mlton_pango_language_from_string" : Utf8.MLton.p1 * unit Utf8.MLton.p2 -> PangoLanguageRecord.FFI.notnull PangoLanguageRecord.FFI.p;
    val languageGetDefault_ = _import "pango_language_get_default" : unit -> PangoLanguageRecord.FFI.notnull PangoLanguageRecord.FFI.p;
    val parseMarkup_ =
      fn
        (x1, x2)
         & x3
         & x4
         & x5
         & (x6, x7)
         & x8
         & x9 =>
          (
            _import "mlton_pango_parse_markup" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt32.FFI.val_
               * GChar.FFI.val_
               * (unit, PangoAttrListRecord.FFI.notnull) PangoAttrListRecord.FFI.r
               * Utf8.MLton.r1
               * (unit, Utf8.FFI.notnull) Utf8.MLton.r2
               * GChar.FFI.ref_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9
            )
    val quantizeLineGeometry_ = fn x1 & x2 => (_import "pango_quantize_line_geometry" : GInt32.FFI.ref_ * GInt32.FFI.ref_ -> unit;) (x1, x2)
    val scriptForUnichar_ = _import "pango_script_for_unichar" : GChar.FFI.val_ -> PangoScript.FFI.val_;
    val scriptGetSampleLanguage_ = _import "pango_script_get_sample_language" : PangoScript.FFI.val_ -> PangoLanguageRecord.FFI.notnull PangoLanguageRecord.FFI.p;
    val splitFileList_ = _import "mlton_pango_split_file_list" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> Utf8CVector.FFI.notnull Utf8CVector.FFI.out_p;
    val trimString_ = _import "mlton_pango_trim_string" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val unicharDirection_ = _import "pango_unichar_direction" : GChar.FFI.val_ -> PangoDirection.FFI.val_;
    val unitsFromDouble_ = _import "pango_units_from_double" : GDouble.FFI.val_ -> GInt32.FFI.val_;
    val unitsToDouble_ = _import "pango_units_to_double" : GInt32.FFI.val_ -> GDouble.FFI.val_;
    val version_ = _import "pango_version" : unit -> GInt32.FFI.val_;
    val versionCheck_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_version_check" :
              GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val versionString_ = _import "pango_version_string" : unit -> Utf8.FFI.notnull Utf8.FFI.out_p;
    structure Alignment = PangoAlignment
    structure AttrListRecord = PangoAttrListRecord
    structure AttrType = PangoAttrType
    structure AttributeRecord = PangoAttributeRecord
    structure BidiType = PangoBidiType
    structure ColorRecord = PangoColorRecord
    structure ContextClass = PangoContextClass
    structure CoverageLevel = PangoCoverageLevel
    structure Direction = PangoDirection
    structure EllipsizeMode = PangoEllipsizeMode
    structure FontClass = PangoFontClass
    structure FontDescriptionRecord = PangoFontDescriptionRecord
    structure FontFaceClass = PangoFontFaceClass
    structure FontFamilyClass = PangoFontFamilyClass
    structure FontMapClass = PangoFontMapClass
    structure FontMask = PangoFontMask
    structure FontMetricsRecord = PangoFontMetricsRecord
    structure FontsetClass = PangoFontsetClass
    structure GlyphItemRecord = PangoGlyphItemRecord
    structure GlyphStringRecord = PangoGlyphStringRecord
    structure GravityHint = PangoGravityHint
    structure LanguageRecord = PangoLanguageRecord
    structure LayoutClass = PangoLayoutClass
    structure LayoutIterRecord = PangoLayoutIterRecord
    structure LayoutLineRecord = PangoLayoutLineRecord
    structure LogAttrRecord = PangoLogAttrRecord
    structure MatrixRecord = PangoMatrixRecord
    structure RectangleRecord = PangoRectangleRecord
    structure RenderPart = PangoRenderPart
    structure RendererClass = PangoRendererClass
    structure Stretch = PangoStretch
    structure Style = PangoStyle
    structure TabAlign = PangoTabAlign
    structure TabArrayRecord = PangoTabArrayRecord
    structure Underline = PangoUnderline
    structure Variant = PangoVariant
    structure Weight = PangoWeight
    structure WrapMode = PangoWrapMode
    structure AttrList = PangoAttrList
    structure Attribute = PangoAttribute
    structure Color = PangoColor
    structure Font = PangoFont
    structure FontFace = PangoFontFace
    structure FontFamily = PangoFontFamily
    structure FontMap = PangoFontMap
    structure FontMetrics = PangoFontMetrics
    structure Fontset = PangoFontset
    structure GlyphItem = PangoGlyphItem
    structure GlyphString = PangoGlyphString
    structure Layout = PangoLayout
    structure LayoutIter = PangoLayoutIter
    structure LayoutLine = PangoLayoutLine
    structure LogAttr = PangoLogAttr
    structure Matrix = PangoMatrix
    structure Rectangle = PangoRectangle
    structure Renderer = PangoRenderer
    structure Script = PangoScript
    structure TabArray = PangoTabArray
    structure Gravity = PangoGravity
    structure Language = PangoLanguage
    structure Context = PangoContext
    structure FontDescription = PangoFontDescription
    val ANALYSIS_FLAG_CENTERED_BASELINE = 1
    val ATTR_INDEX_FROM_TEXT_BEGINNING = 0
    val ENGINE_TYPE_LANG = "PangoEngineLang"
    val ENGINE_TYPE_SHAPE = "PangoEngineShape"
    val RENDER_TYPE_NONE = "PangoRenderNone"
    val SCALE = 1024
    val UNKNOWN_GLYPH_HEIGHT = 14
    val UNKNOWN_GLYPH_WIDTH = 10
    fun attrTypeGetName type' = (PangoAttrType.FFI.withVal ---> Utf8.FFI.fromPtr 0) attrTypeGetName_ type'
    fun attrTypeRegister name = (Utf8.FFI.withPtr ---> PangoAttrType.FFI.fromVal) attrTypeRegister_ name
    fun bidiTypeForUnichar ch = (GChar.FFI.withVal ---> PangoBidiType.FFI.fromVal) bidiTypeForUnichar_ ch
    fun extentsToPixels inclusive nearest = (PangoRectangleRecord.FFI.withOptPtr &&&> PangoRectangleRecord.FFI.withOptPtr ---> I) extentsToPixels_ (inclusive & nearest)
    fun findBaseDir text length = (Utf8.FFI.withPtr &&&> GInt32.FFI.withVal ---> PangoDirection.FFI.fromVal) findBaseDir_ (text & length)
    fun fontDescriptionFromString str = (Utf8.FFI.withPtr ---> PangoFontDescriptionRecord.FFI.fromPtr true) fontDescriptionFromString_ str
    fun gravityGetForMatrix matrix = (PangoMatrixRecord.FFI.withPtr ---> PangoGravity.FFI.fromVal) gravityGetForMatrix_ matrix
    fun gravityGetForScript script baseGravity hint =
      (
        PangoScript.FFI.withVal
         &&&> PangoGravity.FFI.withVal
         &&&> PangoGravityHint.FFI.withVal
         ---> PangoGravity.FFI.fromVal
      )
        gravityGetForScript_
        (
          script
           & baseGravity
           & hint
        )
    fun gravityGetForScriptAndWidth script wide baseGravity hint =
      (
        PangoScript.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> PangoGravity.FFI.withVal
         &&&> PangoGravityHint.FFI.withVal
         ---> PangoGravity.FFI.fromVal
      )
        gravityGetForScriptAndWidth_
        (
          script
           & wide
           & baseGravity
           & hint
        )
    fun gravityToRotation gravity = (PangoGravity.FFI.withVal ---> GDouble.FFI.fromVal) gravityToRotation_ gravity
    fun isZeroWidth ch = (GChar.FFI.withVal ---> GBool.FFI.fromVal) isZeroWidth_ ch
    fun languageFromString language = (Utf8.FFI.withOptPtr ---> PangoLanguageRecord.FFI.fromPtr true) languageFromString_ language
    fun languageGetDefault () = (I ---> PangoLanguageRecord.FFI.fromPtr true) languageGetDefault_ ()
    fun parseMarkup markupText length accelMarker =
      let
        val attrList
         & text
         & accelChar
         & retVal =
          (
            Utf8.FFI.withPtr
             &&&> GInt32.FFI.withVal
             &&&> GChar.FFI.withVal
             &&&> PangoAttrListRecord.FFI.withRefOptPtr
             &&&> Utf8.FFI.withRefOptPtr
             &&&> GChar.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> PangoAttrListRecord.FFI.fromPtr true
                   && Utf8.FFI.fromPtr 1
                   && GChar.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            parseMarkup_
            (
              markupText
               & length
               & accelMarker
               & NONE
               & NONE
               & GChar.null
               & []
            )
      in
        if retVal
        then
          SOME
            (
              attrList,
              text,
              accelChar
            )
        else NONE
      end
    fun quantizeLineGeometry thickness position =
      let
        val thickness
         & position
         & () =
          (
            GInt32.FFI.withRefVal &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            quantizeLineGeometry_
            (thickness & position)
      in
        (thickness, position)
      end
    fun scriptForUnichar ch = (GChar.FFI.withVal ---> PangoScript.FFI.fromVal) scriptForUnichar_ ch
    fun scriptGetSampleLanguage script = (PangoScript.FFI.withVal ---> PangoLanguageRecord.FFI.fromPtr true) scriptGetSampleLanguage_ script
    fun splitFileList str = (Utf8.FFI.withPtr ---> Utf8CVector.FFI.fromPtr 2) splitFileList_ str
    fun trimString str = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) trimString_ str
    fun unicharDirection ch = (GChar.FFI.withVal ---> PangoDirection.FFI.fromVal) unicharDirection_ ch
    fun unitsFromDouble d = (GDouble.FFI.withVal ---> GInt32.FFI.fromVal) unitsFromDouble_ d
    fun unitsToDouble i = (GInt32.FFI.withVal ---> GDouble.FFI.fromVal) unitsToDouble_ i
    fun version () = (I ---> GInt32.FFI.fromVal) version_ ()
    fun versionCheck requiredMajor requiredMinor requiredMicro =
      (
        GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> Utf8.FFI.fromPtr 0
      )
        versionCheck_
        (
          requiredMajor
           & requiredMinor
           & requiredMicro
        )
    fun versionString () = (I ---> Utf8.FFI.fromPtr 0) versionString_ ()
  end
