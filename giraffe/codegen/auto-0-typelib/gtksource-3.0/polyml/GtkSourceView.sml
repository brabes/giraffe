structure GtkSourceView :>
  GTK_SOURCE_VIEW
    where type 'a class = 'a GtkSourceViewClass.class
    where type 'a buffer_class = 'a GtkSourceBufferClass.class
    where type 'a gutter_class = 'a GtkSourceGutterClass.class
    where type 'a mark_attributes_class = 'a GtkSourceMarkAttributesClass.class
    where type 'a completion_class = 'a GtkSourceCompletionClass.class
    where type draw_spaces_flags_t = GtkSourceDrawSpacesFlags.t
    where type smart_home_end_type_t = GtkSourceSmartHomeEndType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_source_view_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_source_view_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val newWithBuffer_ = call (getSymbol "gtk_source_view_new_with_buffer") (GtkSourceBufferClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getAutoIndent_ = call (getSymbol "gtk_source_view_get_auto_indent") (GtkSourceViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getCompletion_ = call (getSymbol "gtk_source_view_get_completion") (GtkSourceViewClass.PolyML.cPtr --> GtkSourceCompletionClass.PolyML.cPtr)
      val getDrawSpaces_ = call (getSymbol "gtk_source_view_get_draw_spaces") (GtkSourceViewClass.PolyML.cPtr --> GtkSourceDrawSpacesFlags.PolyML.cVal)
      val getGutter_ = call (getSymbol "gtk_source_view_get_gutter") (GtkSourceViewClass.PolyML.cPtr &&> GtkTextWindowType.PolyML.cVal --> GtkSourceGutterClass.PolyML.cPtr)
      val getHighlightCurrentLine_ = call (getSymbol "gtk_source_view_get_highlight_current_line") (GtkSourceViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getIndentOnTab_ = call (getSymbol "gtk_source_view_get_indent_on_tab") (GtkSourceViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getIndentWidth_ = call (getSymbol "gtk_source_view_get_indent_width") (GtkSourceViewClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getInsertSpacesInsteadOfTabs_ = call (getSymbol "gtk_source_view_get_insert_spaces_instead_of_tabs") (GtkSourceViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getRightMarginPosition_ = call (getSymbol "gtk_source_view_get_right_margin_position") (GtkSourceViewClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getShowLineMarks_ = call (getSymbol "gtk_source_view_get_show_line_marks") (GtkSourceViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getShowLineNumbers_ = call (getSymbol "gtk_source_view_get_show_line_numbers") (GtkSourceViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getShowRightMargin_ = call (getSymbol "gtk_source_view_get_show_right_margin") (GtkSourceViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getSmartHomeEnd_ = call (getSymbol "gtk_source_view_get_smart_home_end") (GtkSourceViewClass.PolyML.cPtr --> GtkSourceSmartHomeEndType.PolyML.cVal)
      val getTabWidth_ = call (getSymbol "gtk_source_view_get_tab_width") (GtkSourceViewClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getVisualColumn_ = call (getSymbol "gtk_source_view_get_visual_column") (GtkSourceViewClass.PolyML.cPtr &&> GtkTextIterRecord.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val setAutoIndent_ = call (getSymbol "gtk_source_view_set_auto_indent") (GtkSourceViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setDrawSpaces_ = call (getSymbol "gtk_source_view_set_draw_spaces") (GtkSourceViewClass.PolyML.cPtr &&> GtkSourceDrawSpacesFlags.PolyML.cVal --> cVoid)
      val setHighlightCurrentLine_ = call (getSymbol "gtk_source_view_set_highlight_current_line") (GtkSourceViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setIndentOnTab_ = call (getSymbol "gtk_source_view_set_indent_on_tab") (GtkSourceViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setIndentWidth_ = call (getSymbol "gtk_source_view_set_indent_width") (GtkSourceViewClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setInsertSpacesInsteadOfTabs_ = call (getSymbol "gtk_source_view_set_insert_spaces_instead_of_tabs") (GtkSourceViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setMarkAttributes_ =
        call (getSymbol "gtk_source_view_set_mark_attributes")
          (
            GtkSourceViewClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GtkSourceMarkAttributesClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val setRightMarginPosition_ = call (getSymbol "gtk_source_view_set_right_margin_position") (GtkSourceViewClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val setShowLineMarks_ = call (getSymbol "gtk_source_view_set_show_line_marks") (GtkSourceViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setShowLineNumbers_ = call (getSymbol "gtk_source_view_set_show_line_numbers") (GtkSourceViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setShowRightMargin_ = call (getSymbol "gtk_source_view_set_show_right_margin") (GtkSourceViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setSmartHomeEnd_ = call (getSymbol "gtk_source_view_set_smart_home_end") (GtkSourceViewClass.PolyML.cPtr &&> GtkSourceSmartHomeEndType.PolyML.cVal --> cVoid)
      val setTabWidth_ = call (getSymbol "gtk_source_view_set_tab_width") (GtkSourceViewClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkSourceViewClass.class
    type 'a buffer_class = 'a GtkSourceBufferClass.class
    type 'a gutter_class = 'a GtkSourceGutterClass.class
    type 'a mark_attributes_class = 'a GtkSourceMarkAttributesClass.class
    type 'a completion_class = 'a GtkSourceCompletionClass.class
    type draw_spaces_flags_t = GtkSourceDrawSpacesFlags.t
    type smart_home_end_type_t = GtkSourceSmartHomeEndType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.FFI.withPtr ---> GtkScrollableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkSourceViewClass.FFI.fromPtr false) new_ ()
    fun newWithBuffer buffer = (GtkSourceBufferClass.FFI.withPtr ---> GtkSourceViewClass.FFI.fromPtr false) newWithBuffer_ buffer
    fun getAutoIndent self = (GtkSourceViewClass.FFI.withPtr ---> GBool.FFI.fromVal) getAutoIndent_ self
    fun getCompletion self = (GtkSourceViewClass.FFI.withPtr ---> GtkSourceCompletionClass.FFI.fromPtr false) getCompletion_ self
    fun getDrawSpaces self = (GtkSourceViewClass.FFI.withPtr ---> GtkSourceDrawSpacesFlags.FFI.fromVal) getDrawSpaces_ self
    fun getGutter self windowType = (GtkSourceViewClass.FFI.withPtr &&&> GtkTextWindowType.FFI.withVal ---> GtkSourceGutterClass.FFI.fromPtr false) getGutter_ (self & windowType)
    fun getHighlightCurrentLine self = (GtkSourceViewClass.FFI.withPtr ---> GBool.FFI.fromVal) getHighlightCurrentLine_ self
    fun getIndentOnTab self = (GtkSourceViewClass.FFI.withPtr ---> GBool.FFI.fromVal) getIndentOnTab_ self
    fun getIndentWidth self = (GtkSourceViewClass.FFI.withPtr ---> GInt32.FFI.fromVal) getIndentWidth_ self
    fun getInsertSpacesInsteadOfTabs self = (GtkSourceViewClass.FFI.withPtr ---> GBool.FFI.fromVal) getInsertSpacesInsteadOfTabs_ self
    fun getRightMarginPosition self = (GtkSourceViewClass.FFI.withPtr ---> GUInt32.FFI.fromVal) getRightMarginPosition_ self
    fun getShowLineMarks self = (GtkSourceViewClass.FFI.withPtr ---> GBool.FFI.fromVal) getShowLineMarks_ self
    fun getShowLineNumbers self = (GtkSourceViewClass.FFI.withPtr ---> GBool.FFI.fromVal) getShowLineNumbers_ self
    fun getShowRightMargin self = (GtkSourceViewClass.FFI.withPtr ---> GBool.FFI.fromVal) getShowRightMargin_ self
    fun getSmartHomeEnd self = (GtkSourceViewClass.FFI.withPtr ---> GtkSourceSmartHomeEndType.FFI.fromVal) getSmartHomeEnd_ self
    fun getTabWidth self = (GtkSourceViewClass.FFI.withPtr ---> GUInt32.FFI.fromVal) getTabWidth_ self
    fun getVisualColumn self iter = (GtkSourceViewClass.FFI.withPtr &&&> GtkTextIterRecord.FFI.withPtr ---> GUInt32.FFI.fromVal) getVisualColumn_ (self & iter)
    fun setAutoIndent self enable = (GtkSourceViewClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setAutoIndent_ (self & enable)
    fun setDrawSpaces self flags = (GtkSourceViewClass.FFI.withPtr &&&> GtkSourceDrawSpacesFlags.FFI.withVal ---> I) setDrawSpaces_ (self & flags)
    fun setHighlightCurrentLine self hl = (GtkSourceViewClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setHighlightCurrentLine_ (self & hl)
    fun setIndentOnTab self enable = (GtkSourceViewClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setIndentOnTab_ (self & enable)
    fun setIndentWidth self width = (GtkSourceViewClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setIndentWidth_ (self & width)
    fun setInsertSpacesInsteadOfTabs self enable = (GtkSourceViewClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setInsertSpacesInsteadOfTabs_ (self & enable)
    fun setMarkAttributes self category attributes priority =
      (
        GtkSourceViewClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GtkSourceMarkAttributesClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         ---> I
      )
        setMarkAttributes_
        (
          self
           & category
           & attributes
           & priority
        )
    fun setRightMarginPosition self pos = (GtkSourceViewClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) setRightMarginPosition_ (self & pos)
    fun setShowLineMarks self show = (GtkSourceViewClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setShowLineMarks_ (self & show)
    fun setShowLineNumbers self show = (GtkSourceViewClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setShowLineNumbers_ (self & show)
    fun setShowRightMargin self show = (GtkSourceViewClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setShowRightMargin_ (self & show)
    fun setSmartHomeEnd self smartHe = (GtkSourceViewClass.FFI.withPtr &&&> GtkSourceSmartHomeEndType.FFI.withVal ---> I) setSmartHomeEnd_ (self & smartHe)
    fun setTabWidth self width = (GtkSourceViewClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) setTabWidth_ (self & width)
    local
      open ClosureMarshal Signal
    in
      fun lineMarkActivatedSig f = signal "line-mark-activated" (get 0w1 GtkTextIterRecord.t &&&> get 0w2 GdkEvent.t ---> ret_void) (fn iter & event => f iter event)
      fun moveLinesSig f = signal "move-lines" (get 0w1 boolean &&&> get 0w2 int ---> ret_void) (fn copy & count => f copy count)
      fun moveWordsSig f = signal "move-words" (get 0w1 int ---> ret_void) f
      fun redoSig f = signal "redo" (void ---> ret_void) f
      fun showCompletionSig f = signal "show-completion" (void ---> ret_void) f
      fun smartHomeEndSig f = signal "smart-home-end" (get 0w1 GtkTextIterRecord.t &&&> get 0w2 int ---> ret_void) (fn iter & count => f iter count)
      fun undoSig f = signal "undo" (void ---> ret_void) f
    end
    local
      open Property
    in
      val autoIndentProp =
        {
          get = fn x => get "auto-indent" boolean x,
          set = fn x => set "auto-indent" boolean x
        }
      val completionProp = {get = fn x => get "completion" GtkSourceCompletionClass.tOpt x}
      val drawSpacesProp =
        {
          get = fn x => get "draw-spaces" GtkSourceDrawSpacesFlags.t x,
          set = fn x => set "draw-spaces" GtkSourceDrawSpacesFlags.t x
        }
      val highlightCurrentLineProp =
        {
          get = fn x => get "highlight-current-line" boolean x,
          set = fn x => set "highlight-current-line" boolean x
        }
      val indentOnTabProp =
        {
          get = fn x => get "indent-on-tab" boolean x,
          set = fn x => set "indent-on-tab" boolean x
        }
      val indentWidthProp =
        {
          get = fn x => get "indent-width" int x,
          set = fn x => set "indent-width" int x
        }
      val insertSpacesInsteadOfTabsProp =
        {
          get = fn x => get "insert-spaces-instead-of-tabs" boolean x,
          set = fn x => set "insert-spaces-instead-of-tabs" boolean x
        }
      val rightMarginPositionProp =
        {
          get = fn x => get "right-margin-position" uint x,
          set = fn x => set "right-margin-position" uint x
        }
      val showLineMarksProp =
        {
          get = fn x => get "show-line-marks" boolean x,
          set = fn x => set "show-line-marks" boolean x
        }
      val showLineNumbersProp =
        {
          get = fn x => get "show-line-numbers" boolean x,
          set = fn x => set "show-line-numbers" boolean x
        }
      val showRightMarginProp =
        {
          get = fn x => get "show-right-margin" boolean x,
          set = fn x => set "show-right-margin" boolean x
        }
      val smartHomeEndProp =
        {
          get = fn x => get "smart-home-end" GtkSourceSmartHomeEndType.t x,
          set = fn x => set "smart-home-end" GtkSourceSmartHomeEndType.t x
        }
      val tabWidthProp =
        {
          get = fn x => get "tab-width" uint x,
          set = fn x => set "tab-width" uint x
        }
    end
  end
