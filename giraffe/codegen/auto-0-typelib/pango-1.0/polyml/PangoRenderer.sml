structure PangoRenderer :>
  PANGO_RENDERER
    where type 'a class = 'a PangoRendererClass.class
    where type glyph_item_t = PangoGlyphItemRecord.t
    where type glyph_string_t = PangoGlyphStringRecord.t
    where type 'a font_class = 'a PangoFontClass.class
    where type 'a layout_class = 'a PangoLayoutClass.class
    where type layout_line_t = PangoLayoutLineRecord.t
    where type color_t = PangoColorRecord.t
    where type render_part_t = PangoRenderPart.t
    where type matrix_t = PangoMatrixRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_renderer_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val activate_ = call (load_sym libpango "pango_renderer_activate") (PangoRendererClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val deactivate_ = call (load_sym libpango "pango_renderer_deactivate") (PangoRendererClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val drawErrorUnderline_ =
        call (load_sym libpango "pango_renderer_draw_error_underline")
          (
            PangoRendererClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val drawGlyph_ =
        call (load_sym libpango "pango_renderer_draw_glyph")
          (
            PangoRendererClass.PolyML.cPtr
             &&> PangoFontClass.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val drawGlyphItem_ =
        call (load_sym libpango "pango_renderer_draw_glyph_item")
          (
            PangoRendererClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> PangoGlyphItemRecord.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val drawGlyphs_ =
        call (load_sym libpango "pango_renderer_draw_glyphs")
          (
            PangoRendererClass.PolyML.cPtr
             &&> PangoFontClass.PolyML.cPtr
             &&> PangoGlyphStringRecord.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val drawLayout_ =
        call (load_sym libpango "pango_renderer_draw_layout")
          (
            PangoRendererClass.PolyML.cPtr
             &&> PangoLayoutClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val drawLayoutLine_ =
        call (load_sym libpango "pango_renderer_draw_layout_line")
          (
            PangoRendererClass.PolyML.cPtr
             &&> PangoLayoutLineRecord.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val drawRectangle_ =
        call (load_sym libpango "pango_renderer_draw_rectangle")
          (
            PangoRendererClass.PolyML.cPtr
             &&> PangoRenderPart.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val drawTrapezoid_ =
        call (load_sym libpango "pango_renderer_draw_trapezoid")
          (
            PangoRendererClass.PolyML.cPtr
             &&> PangoRenderPart.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val getColor_ = call (load_sym libpango "pango_renderer_get_color") (PangoRendererClass.PolyML.cPtr &&> PangoRenderPart.PolyML.cVal --> PangoColorRecord.PolyML.cPtr)
      val getLayout_ = call (load_sym libpango "pango_renderer_get_layout") (PangoRendererClass.PolyML.cPtr --> PangoLayoutClass.PolyML.cPtr)
      val getLayoutLine_ = call (load_sym libpango "pango_renderer_get_layout_line") (PangoRendererClass.PolyML.cPtr --> PangoLayoutLineRecord.PolyML.cPtr)
      val getMatrix_ = call (load_sym libpango "pango_renderer_get_matrix") (PangoRendererClass.PolyML.cPtr --> PangoMatrixRecord.PolyML.cPtr)
      val partChanged_ = call (load_sym libpango "pango_renderer_part_changed") (PangoRendererClass.PolyML.cPtr &&> PangoRenderPart.PolyML.cVal --> PolyMLFFI.cVoid)
      val setColor_ =
        call (load_sym libpango "pango_renderer_set_color")
          (
            PangoRendererClass.PolyML.cPtr
             &&> PangoRenderPart.PolyML.cVal
             &&> PangoColorRecord.PolyML.cOptPtr
             --> PolyMLFFI.cVoid
          )
      val setMatrix_ = call (load_sym libpango "pango_renderer_set_matrix") (PangoRendererClass.PolyML.cPtr &&> PangoMatrixRecord.PolyML.cOptPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a PangoRendererClass.class
    type glyph_item_t = PangoGlyphItemRecord.t
    type glyph_string_t = PangoGlyphStringRecord.t
    type 'a font_class = 'a PangoFontClass.class
    type 'a layout_class = 'a PangoLayoutClass.class
    type layout_line_t = PangoLayoutLineRecord.t
    type color_t = PangoColorRecord.t
    type render_part_t = PangoRenderPart.t
    type matrix_t = PangoMatrixRecord.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun activate self = (PangoRendererClass.FFI.withPtr ---> I) activate_ self
    fun deactivate self = (PangoRendererClass.FFI.withPtr ---> I) deactivate_ self
    fun drawErrorUnderline self x y width height =
      (
        PangoRendererClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        drawErrorUnderline_
        (
          self
           & x
           & y
           & width
           & height
        )
    fun drawGlyph self font glyph x y =
      (
        PangoRendererClass.FFI.withPtr
         &&&> PangoFontClass.FFI.withPtr
         &&&> GUInt32.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        drawGlyph_
        (
          self
           & font
           & glyph
           & x
           & y
        )
    fun drawGlyphItem self text glyphItem x y =
      (
        PangoRendererClass.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> PangoGlyphItemRecord.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        drawGlyphItem_
        (
          self
           & text
           & glyphItem
           & x
           & y
        )
    fun drawGlyphs self font glyphs x y =
      (
        PangoRendererClass.FFI.withPtr
         &&&> PangoFontClass.FFI.withPtr
         &&&> PangoGlyphStringRecord.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        drawGlyphs_
        (
          self
           & font
           & glyphs
           & x
           & y
        )
    fun drawLayout self layout x y =
      (
        PangoRendererClass.FFI.withPtr
         &&&> PangoLayoutClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        drawLayout_
        (
          self
           & layout
           & x
           & y
        )
    fun drawLayoutLine self line x y =
      (
        PangoRendererClass.FFI.withPtr
         &&&> PangoLayoutLineRecord.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        drawLayoutLine_
        (
          self
           & line
           & x
           & y
        )
    fun drawRectangle self part x y width height =
      (
        PangoRendererClass.FFI.withPtr
         &&&> PangoRenderPart.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        drawRectangle_
        (
          self
           & part
           & x
           & y
           & width
           & height
        )
    fun drawTrapezoid self part y1 x11 x21 y2 x12 x22 =
      (
        PangoRendererClass.FFI.withPtr
         &&&> PangoRenderPart.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        drawTrapezoid_
        (
          self
           & part
           & y1
           & x11
           & x21
           & y2
           & x12
           & x22
        )
    fun getColor self part = (PangoRendererClass.FFI.withPtr &&&> PangoRenderPart.FFI.withVal ---> PangoColorRecord.FFI.fromPtr true) getColor_ (self & part)
    fun getLayout self = (PangoRendererClass.FFI.withPtr ---> PangoLayoutClass.FFI.fromPtr false) getLayout_ self
    fun getLayoutLine self = (PangoRendererClass.FFI.withPtr ---> PangoLayoutLineRecord.FFI.fromPtr true) getLayoutLine_ self
    fun getMatrix self = (PangoRendererClass.FFI.withPtr ---> PangoMatrixRecord.FFI.fromPtr false) getMatrix_ self
    fun partChanged self part = (PangoRendererClass.FFI.withPtr &&&> PangoRenderPart.FFI.withVal ---> I) partChanged_ (self & part)
    fun setColor self part color =
      (
        PangoRendererClass.FFI.withPtr
         &&&> PangoRenderPart.FFI.withVal
         &&&> PangoColorRecord.FFI.withOptPtr
         ---> I
      )
        setColor_
        (
          self
           & part
           & color
        )
    fun setMatrix self matrix = (PangoRendererClass.FFI.withPtr &&&> PangoMatrixRecord.FFI.withOptPtr ---> I) setMatrix_ (self & matrix)
  end
