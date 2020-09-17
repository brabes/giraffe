structure PangoContext :>
  PANGO_CONTEXT
    where type 'a class = 'a PangoContextClass.class
    where type font_metrics_t = PangoFontMetricsRecord.t
    where type font_family_class_c_ptr_array_n_t = PangoFontFamilyClassCPtrArrayN.t
    where type 'a font_class = 'a PangoFontClass.class
    where type 'a fontset_class = 'a PangoFontsetClass.class
    where type direction_t = PangoDirection.t
    where type gravity_t = PangoGravity.t
    where type font_description_t = PangoFontDescriptionRecord.t
    where type 'a font_map_class = 'a PangoFontMapClass.class
    where type gravity_hint_t = PangoGravityHint.t
    where type language_t = PangoLanguageRecord.t
    where type matrix_t = PangoMatrixRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_context_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "pango_context_new") (cVoid --> PangoContextClass.PolyML.cPtr)
      val changed_ = call (getSymbol "pango_context_changed") (PangoContextClass.PolyML.cPtr --> cVoid)
      val getBaseDir_ = call (getSymbol "pango_context_get_base_dir") (PangoContextClass.PolyML.cPtr --> PangoDirection.PolyML.cVal)
      val getBaseGravity_ = call (getSymbol "pango_context_get_base_gravity") (PangoContextClass.PolyML.cPtr --> PangoGravity.PolyML.cVal)
      val getFontDescription_ = call (getSymbol "pango_context_get_font_description") (PangoContextClass.PolyML.cPtr --> PangoFontDescriptionRecord.PolyML.cPtr)
      val getFontMap_ = call (getSymbol "pango_context_get_font_map") (PangoContextClass.PolyML.cPtr --> PangoFontMapClass.PolyML.cPtr)
      val getGravity_ = call (getSymbol "pango_context_get_gravity") (PangoContextClass.PolyML.cPtr --> PangoGravity.PolyML.cVal)
      val getGravityHint_ = call (getSymbol "pango_context_get_gravity_hint") (PangoContextClass.PolyML.cPtr --> PangoGravityHint.PolyML.cVal)
      val getLanguage_ = call (getSymbol "pango_context_get_language") (PangoContextClass.PolyML.cPtr --> PangoLanguageRecord.PolyML.cPtr)
      val getMatrix_ = call (getSymbol "pango_context_get_matrix") (PangoContextClass.PolyML.cPtr --> PangoMatrixRecord.PolyML.cOptPtr)
      val getMetrics_ =
        call (getSymbol "pango_context_get_metrics")
          (
            PangoContextClass.PolyML.cPtr
             &&> PangoFontDescriptionRecord.PolyML.cOptPtr
             &&> PangoLanguageRecord.PolyML.cOptPtr
             --> PangoFontMetricsRecord.PolyML.cPtr
          )
      val getSerial_ = call (getSymbol "pango_context_get_serial") (PangoContextClass.PolyML.cPtr --> GUInt.PolyML.cVal)
      val listFamilies_ =
        call (getSymbol "pango_context_list_families")
          (
            PangoContextClass.PolyML.cPtr
             &&> PangoFontFamilyClassCPtrArrayN.PolyML.cOutRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val loadFont_ = call (getSymbol "pango_context_load_font") (PangoContextClass.PolyML.cPtr &&> PangoFontDescriptionRecord.PolyML.cPtr --> PangoFontClass.PolyML.cOptPtr)
      val loadFontset_ =
        call (getSymbol "pango_context_load_fontset")
          (
            PangoContextClass.PolyML.cPtr
             &&> PangoFontDescriptionRecord.PolyML.cPtr
             &&> PangoLanguageRecord.PolyML.cPtr
             --> PangoFontsetClass.PolyML.cOptPtr
          )
      val setBaseDir_ = call (getSymbol "pango_context_set_base_dir") (PangoContextClass.PolyML.cPtr &&> PangoDirection.PolyML.cVal --> cVoid)
      val setBaseGravity_ = call (getSymbol "pango_context_set_base_gravity") (PangoContextClass.PolyML.cPtr &&> PangoGravity.PolyML.cVal --> cVoid)
      val setFontDescription_ = call (getSymbol "pango_context_set_font_description") (PangoContextClass.PolyML.cPtr &&> PangoFontDescriptionRecord.PolyML.cPtr --> cVoid)
      val setFontMap_ = call (getSymbol "pango_context_set_font_map") (PangoContextClass.PolyML.cPtr &&> PangoFontMapClass.PolyML.cPtr --> cVoid)
      val setGravityHint_ = call (getSymbol "pango_context_set_gravity_hint") (PangoContextClass.PolyML.cPtr &&> PangoGravityHint.PolyML.cVal --> cVoid)
      val setLanguage_ = call (getSymbol "pango_context_set_language") (PangoContextClass.PolyML.cPtr &&> PangoLanguageRecord.PolyML.cPtr --> cVoid)
      val setMatrix_ = call (getSymbol "pango_context_set_matrix") (PangoContextClass.PolyML.cPtr &&> PangoMatrixRecord.PolyML.cOptPtr --> cVoid)
    end
    type 'a class = 'a PangoContextClass.class
    type font_metrics_t = PangoFontMetricsRecord.t
    type font_family_class_c_ptr_array_n_t = PangoFontFamilyClassCPtrArrayN.t
    type 'a font_class = 'a PangoFontClass.class
    type 'a fontset_class = 'a PangoFontsetClass.class
    type direction_t = PangoDirection.t
    type gravity_t = PangoGravity.t
    type font_description_t = PangoFontDescriptionRecord.t
    type 'a font_map_class = 'a PangoFontMapClass.class
    type gravity_hint_t = PangoGravityHint.t
    type language_t = PangoLanguageRecord.t
    type matrix_t = PangoMatrixRecord.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> PangoContextClass.FFI.fromPtr true) new_ ()
    fun changed self = (PangoContextClass.FFI.withPtr false ---> I) changed_ self
    fun getBaseDir self = (PangoContextClass.FFI.withPtr false ---> PangoDirection.FFI.fromVal) getBaseDir_ self
    fun getBaseGravity self = (PangoContextClass.FFI.withPtr false ---> PangoGravity.FFI.fromVal) getBaseGravity_ self
    fun getFontDescription self = (PangoContextClass.FFI.withPtr false ---> PangoFontDescriptionRecord.FFI.fromPtr false) getFontDescription_ self before PangoContextClass.FFI.touchPtr self
    fun getFontMap self = (PangoContextClass.FFI.withPtr false ---> PangoFontMapClass.FFI.fromPtr false) getFontMap_ self before PangoContextClass.FFI.touchPtr self
    fun getGravity self = (PangoContextClass.FFI.withPtr false ---> PangoGravity.FFI.fromVal) getGravity_ self
    fun getGravityHint self = (PangoContextClass.FFI.withPtr false ---> PangoGravityHint.FFI.fromVal) getGravityHint_ self
    fun getLanguage self = (PangoContextClass.FFI.withPtr false ---> PangoLanguageRecord.FFI.fromPtr true) getLanguage_ self
    fun getMatrix self = (PangoContextClass.FFI.withPtr false ---> PangoMatrixRecord.FFI.fromOptPtr false) getMatrix_ self before PangoContextClass.FFI.touchPtr self
    fun getMetrics self (desc, language) =
      (
        PangoContextClass.FFI.withPtr false
         &&&> PangoFontDescriptionRecord.FFI.withOptPtr false
         &&&> PangoLanguageRecord.FFI.withOptPtr false
         ---> PangoFontMetricsRecord.FFI.fromPtr true
      )
        getMetrics_
        (
          self
           & desc
           & language
        )
    fun getSerial self = (PangoContextClass.FFI.withPtr false ---> GUInt.FFI.fromVal) getSerial_ self
    fun listFamilies self =
      let
        val families
         & nFamilies
         & () =
          (
            PangoContextClass.FFI.withPtr false
             &&&> PangoFontFamilyClassCPtrArrayN.FFI.withRefOptPtr 0
             &&&> GInt.FFI.withRefVal
             ---> PangoFontFamilyClassCPtrArrayN.FFI.fromPtr 1
                   && GInt.FFI.fromVal
                   && I
          )
            listFamilies_
            (
              self
               & NONE
               & GInt.null
            )
      in
        families (LargeInt.toInt nFamilies) before PangoContextClass.FFI.touchPtr self
      end
    fun loadFont self desc = (PangoContextClass.FFI.withPtr false &&&> PangoFontDescriptionRecord.FFI.withPtr false ---> PangoFontClass.FFI.fromOptPtr true) loadFont_ (self & desc)
    fun loadFontset self (desc, language) =
      (
        PangoContextClass.FFI.withPtr false
         &&&> PangoFontDescriptionRecord.FFI.withPtr false
         &&&> PangoLanguageRecord.FFI.withPtr false
         ---> PangoFontsetClass.FFI.fromOptPtr true
      )
        loadFontset_
        (
          self
           & desc
           & language
        )
    fun setBaseDir self direction = (PangoContextClass.FFI.withPtr false &&&> PangoDirection.FFI.withVal ---> I) setBaseDir_ (self & direction)
    fun setBaseGravity self gravity = (PangoContextClass.FFI.withPtr false &&&> PangoGravity.FFI.withVal ---> I) setBaseGravity_ (self & gravity)
    fun setFontDescription self desc = (PangoContextClass.FFI.withPtr false &&&> PangoFontDescriptionRecord.FFI.withPtr false ---> I) setFontDescription_ (self & desc)
    fun setFontMap self fontMap = (PangoContextClass.FFI.withPtr false &&&> PangoFontMapClass.FFI.withPtr false ---> I) setFontMap_ (self & fontMap)
    fun setGravityHint self hint = (PangoContextClass.FFI.withPtr false &&&> PangoGravityHint.FFI.withVal ---> I) setGravityHint_ (self & hint)
    fun setLanguage self language = (PangoContextClass.FFI.withPtr false &&&> PangoLanguageRecord.FFI.withPtr false ---> I) setLanguage_ (self & language)
    fun setMatrix self matrix = (PangoContextClass.FFI.withPtr false &&&> PangoMatrixRecord.FFI.withOptPtr false ---> I) setMatrix_ (self & matrix)
  end
