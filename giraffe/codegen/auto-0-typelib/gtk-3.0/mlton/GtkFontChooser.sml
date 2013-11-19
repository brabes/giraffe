structure GtkFontChooser :>
  GTK_FONT_CHOOSER
    where type 'a class_t = 'a GtkFontChooserClass.t =
  struct
    val getType_ = _import "gtk_font_chooser_get_type" : unit -> GObjectType.C.val_;
    val getFont_ = _import "gtk_font_chooser_get_font" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getFontDesc_ = _import "gtk_font_chooser_get_font_desc" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p;
    val getFontFace_ = _import "gtk_font_chooser_get_font_face" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getFontFamily_ = _import "gtk_font_chooser_get_font_family" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getFontSize_ = _import "gtk_font_chooser_get_font_size" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.C.val_;
    val getPreviewText_ = _import "gtk_font_chooser_get_preview_text" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getShowPreviewEntry_ = _import "gtk_font_chooser_get_show_preview_entry" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val setFont_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_font_chooser_set_font" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setFontDesc_ = fn x1 & x2 => (_import "gtk_font_chooser_set_font_desc" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p -> unit;) (x1, x2)
    val setPreviewText_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_font_chooser_set_preview_text" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setShowPreviewEntry_ = fn x1 & x2 => (_import "gtk_font_chooser_set_show_preview_entry" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    type 'a class_t = 'a GtkFontChooserClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getFont self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr true) getFont_ self
    fun getFontDesc self = (GObjectObjectClass.C.withPtr ---> PangoFontDescriptionRecord.C.fromPtr true) getFontDesc_ self
    fun getFontFace self = (GObjectObjectClass.C.withPtr ---> PangoFontFaceClass.C.fromPtr false) getFontFace_ self
    fun getFontFamily self = (GObjectObjectClass.C.withPtr ---> PangoFontFamilyClass.C.fromPtr false) getFontFamily_ self
    fun getFontSize self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getFontSize_ self
    fun getPreviewText self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr true) getPreviewText_ self
    fun getShowPreviewEntry self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowPreviewEntry_ self
    fun setFont self fontname = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setFont_ (self & fontname)
    fun setFontDesc self fontDesc = (GObjectObjectClass.C.withPtr &&&> PangoFontDescriptionRecord.C.withPtr ---> I) setFontDesc_ (self & fontDesc)
    fun setPreviewText self text = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setPreviewText_ (self & text)
    fun setShowPreviewEntry self showPreviewEntry = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowPreviewEntry_ (self & showPreviewEntry)
    local
      open ClosureMarshal Signal
    in
      fun fontActivatedSig f = signal "font-activated" (get 0w1 string ---> ret_void) f
    end
    local
      open Property
    in
      val fontProp =
        {
          get = fn x => get "font" stringOpt x,
          set = fn x => set "font" stringOpt x
        }
      val fontDescProp =
        {
          get = fn x => get "font-desc" PangoFontDescriptionRecord.tOpt x,
          set = fn x => set "font-desc" PangoFontDescriptionRecord.tOpt x
        }
      val previewTextProp =
        {
          get = fn x => get "preview-text" stringOpt x,
          set = fn x => set "preview-text" stringOpt x
        }
      val showPreviewEntryProp =
        {
          get = fn x => get "show-preview-entry" boolean x,
          set = fn x => set "show-preview-entry" boolean x
        }
    end
  end