use "PANGO_GLYPH.sml";
use "PANGO_GLYPH_UNIT.sml";
use "PANGO_ALIGNMENT.sml";
use "PANGO_ATTR_LIST_RECORD.sml";
use "PANGO_ATTR_LIST.sml";
use "PANGO_ATTR_TYPE.sml";
use "PANGO_ATTRIBUTE_RECORD.sml";
use "PANGO_ATTRIBUTE.sml";
use "PANGO_BIDI_TYPE.sml";
use "PANGO_COLOR_RECORD.sml";
use "PANGO_COLOR.sml";
use "PANGO_CONTEXT_CLASS.sml";
use "PANGO_CONTEXT.sml";
use "PANGO_COVERAGE_LEVEL.sml";
use "PANGO_DIRECTION.sml";
use "PANGO_ELLIPSIZE_MODE.sml";
use "PANGO_FONT_CLASS.sml";
use "PANGO_FONT.sml";
use "PANGO_FONT_DESCRIPTION_RECORD.sml";
use "PANGO_FONT_DESCRIPTION.sml";
use "PANGO_FONT_FACE_CLASS.sml";
use "PANGO_FONT_FACE.sml";
use "PANGO_FONT_FAMILY_CLASS.sml";
use "PANGO_FONT_FAMILY.sml";
use "PANGO_FONT_MAP_CLASS.sml";
use "PANGO_FONT_MAP.sml";
use "PANGO_FONT_MASK.sml";
use "PANGO_FONT_METRICS_RECORD.sml";
use "PANGO_FONT_METRICS.sml";
use "PANGO_FONTSET_CLASS.sml";
use "PANGO_FONTSET.sml";
use "PANGO_GLYPH_ITEM_RECORD.sml";
use "PANGO_GLYPH_ITEM.sml";
use "PANGO_GLYPH_STRING_RECORD.sml";
use "PANGO_GLYPH_STRING.sml";
use "PANGO_GRAVITY.sml";
use "PANGO_GRAVITY_HINT.sml";
use "PANGO_LANGUAGE_RECORD.sml";
use "PANGO_LANGUAGE.sml";
use "PANGO_LAYOUT_CLASS.sml";
use "PANGO_LAYOUT.sml";
use "PANGO_LAYOUT_ITER_RECORD.sml";
use "PANGO_LAYOUT_ITER.sml";
use "PANGO_LAYOUT_LINE_RECORD.sml";
use "PANGO_LAYOUT_LINE.sml";
use "PANGO_LOG_ATTR_RECORD.sml";
use "PANGO_LOG_ATTR.sml";
use "PANGO_MATRIX_RECORD.sml";
use "PANGO_MATRIX.sml";
use "PANGO_RECTANGLE_RECORD.sml";
use "PANGO_RECTANGLE.sml";
use "PANGO_RENDER_PART.sml";
use "PANGO_RENDERER_CLASS.sml";
use "PANGO_RENDERER.sml";
use "PANGO_SCRIPT.sml";
use "PANGO_STRETCH.sml";
use "PANGO_STYLE.sml";
use "PANGO_TAB_ALIGN.sml";
use "PANGO_TAB_ARRAY_RECORD.sml";
use "PANGO_TAB_ARRAY.sml";
use "PANGO_UNDERLINE.sml";
use "PANGO_VARIANT.sml";
use "PANGO_WEIGHT.sml";
use "PANGO_WRAP_MODE.sml";
use "PANGO_LAYOUT_RUN_RECORD.sml";
use "PANGO.sml";
use "polyml/PangoGlyph.sml";
use "polyml/PangoGlyphUnit.sml";
use "polyml/PangoAlignment.sml";
use "polyml/PangoAttrListRecord.sml";
use "polyml/PangoAttrType.sml";
use "polyml/PangoAttributeRecord.sml";
use "polyml/PangoBidiType.sml";
use "polyml/PangoColorRecord.sml";
use "polyml/PangoContextClass.sml";
use "polyml/PangoCoverageLevel.sml";
use "polyml/PangoDirection.sml";
use "polyml/PangoEllipsizeMode.sml";
use "polyml/PangoFontClass.sml";
use "polyml/PangoFontDescriptionRecord.sml";
use "polyml/PangoFontFaceClass.sml";
use "polyml/PangoFontFamilyClass.sml";
use "polyml/PangoFontMapClass.sml";
use "polyml/PangoFontMask.sml";
use "polyml/PangoFontMetricsRecord.sml";
use "polyml/PangoFontsetClass.sml";
use "polyml/PangoGlyphItemRecord.sml";
use "polyml/PangoGlyphStringRecord.sml";
use "polyml/PangoGravityHint.sml";
use "polyml/PangoLanguageRecord.sml";
use "polyml/PangoLayoutClass.sml";
use "polyml/PangoLayoutIterRecord.sml";
use "polyml/PangoLayoutLineRecord.sml";
use "polyml/PangoLogAttrRecord.sml";
use "polyml/PangoMatrixRecord.sml";
use "polyml/PangoRectangleRecord.sml";
use "polyml/PangoRenderPart.sml";
use "polyml/PangoRendererClass.sml";
use "polyml/PangoStretch.sml";
use "polyml/PangoStyle.sml";
use "polyml/PangoTabAlign.sml";
use "polyml/PangoTabArrayRecord.sml";
use "polyml/PangoUnderline.sml";
use "polyml/PangoVariant.sml";
use "polyml/PangoWeight.sml";
use "polyml/PangoWrapMode.sml";
use "polyml/PangoLayoutRunRecord.sml";
use "polyml/PangoAttrList.sml";
use "polyml/PangoAttribute.sml";
use "polyml/PangoColor.sml";
use "polyml/PangoFont.sml";
use "polyml/PangoFontFace.sml";
use "polyml/PangoFontFamily.sml";
use "polyml/PangoFontMap.sml";
use "polyml/PangoFontMetrics.sml";
use "polyml/PangoFontset.sml";
use "polyml/PangoGlyphItem.sml";
use "polyml/PangoGlyphString.sml";
use "polyml/PangoLayout.sml";
use "polyml/PangoLayoutLine.sml";
use "polyml/PangoLogAttr.sml";
use "polyml/PangoMatrix.sml";
use "polyml/PangoRectangle.sml";
use "polyml/PangoRenderer.sml";
use "polyml/PangoScript.sml";
use "polyml/PangoTabArray.sml";
use "polyml/PangoGravity.sml";
use "polyml/PangoLanguage.sml";
use "polyml/PangoLayoutIter.sml";
use "polyml/PangoContext.sml";
use "polyml/PangoFontDescription.sml";
use "polyml/Pango.sml";
