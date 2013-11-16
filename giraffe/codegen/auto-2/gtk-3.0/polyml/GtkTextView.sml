structure GtkTextView :>
  GTK_TEXT_VIEW
    where type 'a class_t = 'a GtkTextViewClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a scrollableclass_t = 'a GtkScrollableClass.t
    where type 'a textchildanchorclass_t = 'a GtkTextChildAnchorClass.t
    where type textattributesrecord_t = GtkTextAttributesRecord.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t
    where type 'a textmarkclass_t = 'a GtkTextMarkClass.t
    where type textiterrecord_t = GtkTextIterRecord.t
    where type textwindowtype_t = GtkTextWindowType.t
    where type deletetype_t = GtkDeleteType.t
    where type movementstep_t = GtkMovementStep.t
    where type scrollstep_t = GtkScrollStep.t
    where type 'a menuclass_t = 'a GtkMenuClass.t
    where type 'a textbufferclass_t = 'a GtkTextBufferClass.t
    where type justification_t = GtkJustification.t
    where type wrapmode_t = GtkWrapMode.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_text_view_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_text_view_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val newWithBuffer_ = call (load_sym libgtk "gtk_text_view_new_with_buffer") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val addChildAtAnchor_ =
        call (load_sym libgtk "gtk_text_view_add_child_at_anchor")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val addChildInWindow_ =
        call (load_sym libgtk "gtk_text_view_add_child_in_window")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GtkTextWindowType.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val backwardDisplayLine_ = call (load_sym libgtk "gtk_text_view_backward_display_line") (GObjectObjectClass.PolyML.PTR &&> GtkTextIterRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val backwardDisplayLineStart_ = call (load_sym libgtk "gtk_text_view_backward_display_line_start") (GObjectObjectClass.PolyML.PTR &&> GtkTextIterRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val bufferToWindowCoords_ =
        call (load_sym libgtk "gtk_text_view_buffer_to_window_coords")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTextWindowType.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val forwardDisplayLine_ = call (load_sym libgtk "gtk_text_view_forward_display_line") (GObjectObjectClass.PolyML.PTR &&> GtkTextIterRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val forwardDisplayLineEnd_ = call (load_sym libgtk "gtk_text_view_forward_display_line_end") (GObjectObjectClass.PolyML.PTR &&> GtkTextIterRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getAcceptsTab_ = call (load_sym libgtk "gtk_text_view_get_accepts_tab") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getBorderWindowSize_ = call (load_sym libgtk "gtk_text_view_get_border_window_size") (GObjectObjectClass.PolyML.PTR &&> GtkTextWindowType.PolyML.VAL --> FFI.Int32.PolyML.VAL)
      val getBuffer_ = call (load_sym libgtk "gtk_text_view_get_buffer") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getCursorLocations_ =
        call (load_sym libgtk "gtk_text_view_get_cursor_locations")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTextIterRecord.PolyML.OPTPTR
             &&> CairoRectangleIntRecord.PolyML.PTR
             &&> CairoRectangleIntRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val getCursorVisible_ = call (load_sym libgtk "gtk_text_view_get_cursor_visible") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getDefaultAttributes_ = call (load_sym libgtk "gtk_text_view_get_default_attributes") (GObjectObjectClass.PolyML.PTR --> GtkTextAttributesRecord.PolyML.PTR)
      val getEditable_ = call (load_sym libgtk "gtk_text_view_get_editable") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getIndent_ = call (load_sym libgtk "gtk_text_view_get_indent") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getIterAtLocation_ =
        call (load_sym libgtk "gtk_text_view_get_iter_at_location")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTextIterRecord.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val getIterAtPosition_ =
        call (load_sym libgtk "gtk_text_view_get_iter_at_position")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTextIterRecord.PolyML.PTR
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val getIterLocation_ =
        call (load_sym libgtk "gtk_text_view_get_iter_location")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTextIterRecord.PolyML.PTR
             &&> CairoRectangleIntRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val getJustification_ = call (load_sym libgtk "gtk_text_view_get_justification") (GObjectObjectClass.PolyML.PTR --> GtkJustification.PolyML.VAL)
      val getLeftMargin_ = call (load_sym libgtk "gtk_text_view_get_left_margin") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getLineAtY_ =
        call (load_sym libgtk "gtk_text_view_get_line_at_y")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTextIterRecord.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val getLineYrange_ =
        call (load_sym libgtk "gtk_text_view_get_line_yrange")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTextIterRecord.PolyML.PTR
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val getOverwrite_ = call (load_sym libgtk "gtk_text_view_get_overwrite") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getPixelsAboveLines_ = call (load_sym libgtk "gtk_text_view_get_pixels_above_lines") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getPixelsBelowLines_ = call (load_sym libgtk "gtk_text_view_get_pixels_below_lines") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getPixelsInsideWrap_ = call (load_sym libgtk "gtk_text_view_get_pixels_inside_wrap") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getRightMargin_ = call (load_sym libgtk "gtk_text_view_get_right_margin") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getTabs_ = call (load_sym libgtk "gtk_text_view_get_tabs") (GObjectObjectClass.PolyML.PTR --> PangoTabArrayRecord.PolyML.PTR)
      val getVisibleRect_ = call (load_sym libgtk "gtk_text_view_get_visible_rect") (GObjectObjectClass.PolyML.PTR &&> CairoRectangleIntRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val getWindow_ = call (load_sym libgtk "gtk_text_view_get_window") (GObjectObjectClass.PolyML.PTR &&> GtkTextWindowType.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val getWindowType_ = call (load_sym libgtk "gtk_text_view_get_window_type") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> GtkTextWindowType.PolyML.VAL)
      val getWrapMode_ = call (load_sym libgtk "gtk_text_view_get_wrap_mode") (GObjectObjectClass.PolyML.PTR --> GtkWrapMode.PolyML.VAL)
      val imContextFilterKeypress_ = call (load_sym libgtk "gtk_text_view_im_context_filter_keypress") (GObjectObjectClass.PolyML.PTR &&> GdkEventKeyRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val moveChild_ =
        call (load_sym libgtk "gtk_text_view_move_child")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val moveMarkOnscreen_ = call (load_sym libgtk "gtk_text_view_move_mark_onscreen") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val moveVisually_ =
        call (load_sym libgtk "gtk_text_view_move_visually")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTextIterRecord.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             --> FFI.Bool.PolyML.VAL
          )
      val placeCursorOnscreen_ = call (load_sym libgtk "gtk_text_view_place_cursor_onscreen") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val resetImContext_ = call (load_sym libgtk "gtk_text_view_reset_im_context") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val scrollMarkOnscreen_ = call (load_sym libgtk "gtk_text_view_scroll_mark_onscreen") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val scrollToIter_ =
        call (load_sym libgtk "gtk_text_view_scroll_to_iter")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTextIterRecord.PolyML.PTR
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Bool.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             --> FFI.Bool.PolyML.VAL
          )
      val scrollToMark_ =
        call (load_sym libgtk "gtk_text_view_scroll_to_mark")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Bool.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setAcceptsTab_ = call (load_sym libgtk "gtk_text_view_set_accepts_tab") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setBorderWindowSize_ =
        call (load_sym libgtk "gtk_text_view_set_border_window_size")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTextWindowType.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setBuffer_ = call (load_sym libgtk "gtk_text_view_set_buffer") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setCursorVisible_ = call (load_sym libgtk "gtk_text_view_set_cursor_visible") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setEditable_ = call (load_sym libgtk "gtk_text_view_set_editable") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setIndent_ = call (load_sym libgtk "gtk_text_view_set_indent") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.PolyML.VOID)
      val setJustification_ = call (load_sym libgtk "gtk_text_view_set_justification") (GObjectObjectClass.PolyML.PTR &&> GtkJustification.PolyML.VAL --> FFI.PolyML.VOID)
      val setLeftMargin_ = call (load_sym libgtk "gtk_text_view_set_left_margin") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.PolyML.VOID)
      val setOverwrite_ = call (load_sym libgtk "gtk_text_view_set_overwrite") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setPixelsAboveLines_ = call (load_sym libgtk "gtk_text_view_set_pixels_above_lines") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.PolyML.VOID)
      val setPixelsBelowLines_ = call (load_sym libgtk "gtk_text_view_set_pixels_below_lines") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.PolyML.VOID)
      val setPixelsInsideWrap_ = call (load_sym libgtk "gtk_text_view_set_pixels_inside_wrap") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.PolyML.VOID)
      val setRightMargin_ = call (load_sym libgtk "gtk_text_view_set_right_margin") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.PolyML.VOID)
      val setTabs_ = call (load_sym libgtk "gtk_text_view_set_tabs") (GObjectObjectClass.PolyML.PTR &&> PangoTabArrayRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val setWrapMode_ = call (load_sym libgtk "gtk_text_view_set_wrap_mode") (GObjectObjectClass.PolyML.PTR &&> GtkWrapMode.PolyML.VAL --> FFI.PolyML.VOID)
      val startsDisplayLine_ = call (load_sym libgtk "gtk_text_view_starts_display_line") (GObjectObjectClass.PolyML.PTR &&> GtkTextIterRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val windowToBufferCoords_ =
        call (load_sym libgtk "gtk_text_view_window_to_buffer_coords")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTextWindowType.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.PolyML.VOID
          )
    end
    type 'a class_t = 'a GtkTextViewClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a scrollableclass_t = 'a GtkScrollableClass.t
    type 'a textchildanchorclass_t = 'a GtkTextChildAnchorClass.t
    type textattributesrecord_t = GtkTextAttributesRecord.t
    type 'a widgetclass_t = 'a GtkWidgetClass.t
    type 'a textmarkclass_t = 'a GtkTextMarkClass.t
    type textiterrecord_t = GtkTextIterRecord.t
    type textwindowtype_t = GtkTextWindowType.t
    type deletetype_t = GtkDeleteType.t
    type movementstep_t = GtkMovementStep.t
    type scrollstep_t = GtkScrollStep.t
    type 'a menuclass_t = 'a GtkMenuClass.t
    type 'a textbufferclass_t = 'a GtkTextBufferClass.t
    type justification_t = GtkJustification.t
    type wrapmode_t = GtkWrapMode.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.C.withPtr ---> GtkScrollableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkTextViewClass.C.fromPtr false) new_ ()
    fun newWithBuffer buffer = (GObjectObjectClass.C.withPtr ---> GtkTextViewClass.C.fromPtr false) newWithBuffer_ buffer
    fun addChildAtAnchor self child anchor =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         ---> I
      )
        addChildAtAnchor_
        (
          self
           & child
           & anchor
        )
    fun addChildInWindow self child whichWindow xpos ypos =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GtkTextWindowType.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        addChildInWindow_
        (
          self
           & child
           & whichWindow
           & xpos
           & ypos
        )
    fun backwardDisplayLine self iter = (GObjectObjectClass.C.withPtr &&&> GtkTextIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) backwardDisplayLine_ (self & iter)
    fun backwardDisplayLineStart self iter = (GObjectObjectClass.C.withPtr &&&> GtkTextIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) backwardDisplayLineStart_ (self & iter)
    fun bufferToWindowCoords self win bufferX bufferY =
      let
        val windowX
         & windowY
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> GtkTextWindowType.C.withVal
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            bufferToWindowCoords_
            (
              self
               & win
               & bufferX
               & bufferY
               & 0
               & 0
            )
      in
        (windowX, windowY)
      end
    fun forwardDisplayLine self iter = (GObjectObjectClass.C.withPtr &&&> GtkTextIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) forwardDisplayLine_ (self & iter)
    fun forwardDisplayLineEnd self iter = (GObjectObjectClass.C.withPtr &&&> GtkTextIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) forwardDisplayLineEnd_ (self & iter)
    fun getAcceptsTab self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getAcceptsTab_ self
    fun getBorderWindowSize self type' = (GObjectObjectClass.C.withPtr &&&> GtkTextWindowType.C.withVal ---> FFI.Int32.C.fromVal) getBorderWindowSize_ (self & type')
    fun getBuffer self = (GObjectObjectClass.C.withPtr ---> GtkTextBufferClass.C.fromPtr false) getBuffer_ self
    fun getCursorLocations self iter =
      let
        val strong
         & weak
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> GtkTextIterRecord.C.withOptPtr
             &&&> CairoRectangleIntRecord.C.withNewPtr
             &&&> CairoRectangleIntRecord.C.withNewPtr
             ---> CairoRectangleIntRecord.C.fromPtr true
                   && CairoRectangleIntRecord.C.fromPtr true
                   && I
          )
            getCursorLocations_
            (
              self
               & iter
               & ()
               & ()
            )
      in
        (strong, weak)
      end
    fun getCursorVisible self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getCursorVisible_ self
    fun getDefaultAttributes self = (GObjectObjectClass.C.withPtr ---> GtkTextAttributesRecord.C.fromPtr true) getDefaultAttributes_ self
    fun getEditable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getEditable_ self
    fun getIndent self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getIndent_ self
    fun getIterAtLocation self x y =
      let
        val iter & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> GtkTextIterRecord.C.withNewPtr
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withVal
             ---> GtkTextIterRecord.C.fromPtr true && I
          )
            getIterAtLocation_
            (
              self
               & ()
               & x
               & y
            )
      in
        iter
      end
    fun getIterAtPosition self x y =
      let
        val iter
         & trailing
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> GtkTextIterRecord.C.withNewPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withVal
             ---> GtkTextIterRecord.C.fromPtr true
                   && FFI.Int32.C.fromVal
                   && I
          )
            getIterAtPosition_
            (
              self
               & ()
               & 0
               & x
               & y
            )
      in
        (iter, trailing)
      end
    fun getIterLocation self iter =
      let
        val location & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> GtkTextIterRecord.C.withPtr
             &&&> CairoRectangleIntRecord.C.withNewPtr
             ---> CairoRectangleIntRecord.C.fromPtr true && I
          )
            getIterLocation_
            (
              self
               & iter
               & ()
            )
      in
        location
      end
    fun getJustification self = (GObjectObjectClass.C.withPtr ---> GtkJustification.C.fromVal) getJustification_ self
    fun getLeftMargin self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getLeftMargin_ self
    fun getLineAtY self y =
      let
        val targetIter
         & lineTop
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> GtkTextIterRecord.C.withNewPtr
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withRefVal
             ---> GtkTextIterRecord.C.fromPtr true
                   && FFI.Int32.C.fromVal
                   && I
          )
            getLineAtY_
            (
              self
               & ()
               & y
               & 0
            )
      in
        (targetIter, lineTop)
      end
    fun getLineYrange self iter =
      let
        val y
         & height
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> GtkTextIterRecord.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getLineYrange_
            (
              self
               & iter
               & 0
               & 0
            )
      in
        (y, height)
      end
    fun getOverwrite self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getOverwrite_ self
    fun getPixelsAboveLines self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getPixelsAboveLines_ self
    fun getPixelsBelowLines self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getPixelsBelowLines_ self
    fun getPixelsInsideWrap self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getPixelsInsideWrap_ self
    fun getRightMargin self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getRightMargin_ self
    fun getTabs self = (GObjectObjectClass.C.withPtr ---> PangoTabArrayRecord.C.fromPtr true) getTabs_ self
    fun getVisibleRect self =
      let
        val visibleRect & () = (GObjectObjectClass.C.withPtr &&&> CairoRectangleIntRecord.C.withNewPtr ---> CairoRectangleIntRecord.C.fromPtr true && I) getVisibleRect_ (self & ())
      in
        visibleRect
      end
    fun getWindow self win = (GObjectObjectClass.C.withPtr &&&> GtkTextWindowType.C.withVal ---> GdkWindowClass.C.fromPtr false) getWindow_ (self & win)
    fun getWindowType self window = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> GtkTextWindowType.C.fromVal) getWindowType_ (self & window)
    fun getWrapMode self = (GObjectObjectClass.C.withPtr ---> GtkWrapMode.C.fromVal) getWrapMode_ self
    fun imContextFilterKeypress self event = (GObjectObjectClass.C.withPtr &&&> GdkEventKeyRecord.C.withPtr ---> FFI.Bool.C.fromVal) imContextFilterKeypress_ (self & event)
    fun moveChild self child xpos ypos =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        moveChild_
        (
          self
           & child
           & xpos
           & ypos
        )
    fun moveMarkOnscreen self mark = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) moveMarkOnscreen_ (self & mark)
    fun moveVisually self iter count =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> FFI.Int32.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        moveVisually_
        (
          self
           & iter
           & count
        )
    fun placeCursorOnscreen self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) placeCursorOnscreen_ self
    fun resetImContext self = (GObjectObjectClass.C.withPtr ---> I) resetImContext_ self
    fun scrollMarkOnscreen self mark = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) scrollMarkOnscreen_ (self & mark)
    fun scrollToIter self iter withinMargin useAlign xalign yalign =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.Bool.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        scrollToIter_
        (
          self
           & iter
           & withinMargin
           & useAlign
           & xalign
           & yalign
        )
    fun scrollToMark self mark withinMargin useAlign xalign yalign =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.Bool.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         ---> I
      )
        scrollToMark_
        (
          self
           & mark
           & withinMargin
           & useAlign
           & xalign
           & yalign
        )
    fun setAcceptsTab self acceptsTab = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAcceptsTab_ (self & acceptsTab)
    fun setBorderWindowSize self type' size =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkTextWindowType.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        setBorderWindowSize_
        (
          self
           & type'
           & size
        )
    fun setBuffer self buffer = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setBuffer_ (self & buffer)
    fun setCursorVisible self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setCursorVisible_ (self & setting)
    fun setEditable self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setEditable_ (self & setting)
    fun setIndent self indent = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setIndent_ (self & indent)
    fun setJustification self justification = (GObjectObjectClass.C.withPtr &&&> GtkJustification.C.withVal ---> I) setJustification_ (self & justification)
    fun setLeftMargin self leftMargin = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setLeftMargin_ (self & leftMargin)
    fun setOverwrite self overwrite = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setOverwrite_ (self & overwrite)
    fun setPixelsAboveLines self pixelsAboveLines = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setPixelsAboveLines_ (self & pixelsAboveLines)
    fun setPixelsBelowLines self pixelsBelowLines = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setPixelsBelowLines_ (self & pixelsBelowLines)
    fun setPixelsInsideWrap self pixelsInsideWrap = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setPixelsInsideWrap_ (self & pixelsInsideWrap)
    fun setRightMargin self rightMargin = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setRightMargin_ (self & rightMargin)
    fun setTabs self tabs = (GObjectObjectClass.C.withPtr &&&> PangoTabArrayRecord.C.withPtr ---> I) setTabs_ (self & tabs)
    fun setWrapMode self wrapMode = (GObjectObjectClass.C.withPtr &&&> GtkWrapMode.C.withVal ---> I) setWrapMode_ (self & wrapMode)
    fun startsDisplayLine self iter = (GObjectObjectClass.C.withPtr &&&> GtkTextIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) startsDisplayLine_ (self & iter)
    fun windowToBufferCoords self win windowX windowY =
      let
        val bufferX
         & bufferY
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> GtkTextWindowType.C.withVal
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            windowToBufferCoords_
            (
              self
               & win
               & windowX
               & windowY
               & 0
               & 0
            )
      in
        (bufferX, bufferY)
      end
    local
      open ClosureMarshal Signal
    in
      fun backspaceSig f = signal "backspace" (void ---> ret_void) f
      fun copyClipboardSig f = signal "copy-clipboard" (void ---> ret_void) f
      fun cutClipboardSig f = signal "cut-clipboard" (void ---> ret_void) f
      fun deleteFromCursorSig f = signal "delete-from-cursor" (get 0w1 GtkDeleteType.t &&&> get 0w2 int ---> ret_void) (fn type' & count => f type' count)
      fun insertAtCursorSig f = signal "insert-at-cursor" (get 0w1 string ---> ret_void) f
      fun moveCursorSig f =
        signal "move-cursor"
          (
            get 0w1 GtkMovementStep.t
             &&&> get 0w2 int
             &&&> get 0w3 boolean
             ---> ret_void
          )
          (
            fn
              step
               & count
               & extendSelection =>
                f step count extendSelection
          )
      fun moveViewportSig f = signal "move-viewport" (get 0w1 GtkScrollStep.t &&&> get 0w2 int ---> ret_void) (fn step & count => f step count)
      fun pasteClipboardSig f = signal "paste-clipboard" (void ---> ret_void) f
      fun populatePopupSig f = signal "populate-popup" (get 0w1 GtkMenuClass.t ---> ret_void) f
      fun preeditChangedSig f = signal "preedit-changed" (get 0w1 string ---> ret_void) f
      fun selectAllSig f = signal "select-all" (get 0w1 boolean ---> ret_void) f
      fun setAnchorSig f = signal "set-anchor" (void ---> ret_void) f
      fun toggleCursorVisibleSig f = signal "toggle-cursor-visible" (void ---> ret_void) f
      fun toggleOverwriteSig f = signal "toggle-overwrite" (void ---> ret_void) f
    end
    local
      open Property
    in
      val acceptsTabProp =
        {
          get = fn x => get "accepts-tab" boolean x,
          set = fn x => set "accepts-tab" boolean x
        }
      val bufferProp =
        {
          get = fn x => get "buffer" GtkTextBufferClass.tOpt x,
          set = fn x => set "buffer" GtkTextBufferClass.tOpt x
        }
      val cursorVisibleProp =
        {
          get = fn x => get "cursor-visible" boolean x,
          set = fn x => set "cursor-visible" boolean x
        }
      val editableProp =
        {
          get = fn x => get "editable" boolean x,
          set = fn x => set "editable" boolean x
        }
      val imModuleProp =
        {
          get = fn x => get "im-module" stringOpt x,
          set = fn x => set "im-module" stringOpt x
        }
      val indentProp =
        {
          get = fn x => get "indent" int x,
          set = fn x => set "indent" int x
        }
      val justificationProp =
        {
          get = fn x => get "justification" GtkJustification.t x,
          set = fn x => set "justification" GtkJustification.t x
        }
      val leftMarginProp =
        {
          get = fn x => get "left-margin" int x,
          set = fn x => set "left-margin" int x
        }
      val overwriteProp =
        {
          get = fn x => get "overwrite" boolean x,
          set = fn x => set "overwrite" boolean x
        }
      val pixelsAboveLinesProp =
        {
          get = fn x => get "pixels-above-lines" int x,
          set = fn x => set "pixels-above-lines" int x
        }
      val pixelsBelowLinesProp =
        {
          get = fn x => get "pixels-below-lines" int x,
          set = fn x => set "pixels-below-lines" int x
        }
      val pixelsInsideWrapProp =
        {
          get = fn x => get "pixels-inside-wrap" int x,
          set = fn x => set "pixels-inside-wrap" int x
        }
      val rightMarginProp =
        {
          get = fn x => get "right-margin" int x,
          set = fn x => set "right-margin" int x
        }
      val tabsProp =
        {
          get = fn x => get "tabs" PangoTabArrayRecord.tOpt x,
          set = fn x => set "tabs" PangoTabArrayRecord.tOpt x
        }
      val wrapModeProp =
        {
          get = fn x => get "wrap-mode" GtkWrapMode.t x,
          set = fn x => set "wrap-mode" GtkWrapMode.t x
        }
    end
  end
