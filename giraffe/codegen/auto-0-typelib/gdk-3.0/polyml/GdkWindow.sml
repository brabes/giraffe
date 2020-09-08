structure GdkWindow :>
  GDK_WINDOW
    where type 'a class = 'a GdkWindowClass.class
    where type window_attributes_type_t = GdkWindowAttributesType.t
    where type window_attr_t = GdkWindowAttrRecord.t
    where type window_edge_t = GdkWindowEdge.t
    where type 'a g_l_context_class = 'a GdkGLContextClass.class
    where type 'a drawing_context_class = 'a GdkDrawingContextClass.class
    where type 'a display_class = 'a GdkDisplayClass.class
    where type drag_protocol_t = GdkDragProtocol.t
    where type 'a frame_clock_class = 'a GdkFrameClockClass.class
    where type modifier_type_t = GdkModifierType.t
    where type 'a screen_class = 'a GdkScreenClass.class
    where type window_state_t = GdkWindowState.t
    where type 'a visual_class = 'a GdkVisualClass.class
    where type window_type_t = GdkWindowType.t
    where type rectangle_t = GdkRectangleRecord.t
    where type color_t = GdkColorRecord.t
    where type rgba_t = GdkRgbaRecord.t
    where type w_m_decoration_t = GdkWMDecoration.t
    where type 'a device_class = 'a GdkDeviceClass.class
    where type fullscreen_mode_t = GdkFullscreenMode.t
    where type w_m_function_t = GdkWMFunction.t
    where type window_hints_t = GdkWindowHints.t
    where type geometry_t = GdkGeometryRecord.t
    where type event_mask_t = GdkEventMask.t
    where type input_source_t = GdkInputSource.t
    where type window_type_hint_t = GdkWindowTypeHint.t
    where type 'a event_union = 'a GdkEvent.union
    where type 'a cursor_class = 'a GdkCursorClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_window_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (getSymbol "gdk_window_new")
          (
            GdkWindowClass.PolyML.cOptPtr
             &&> GdkWindowAttrRecord.PolyML.cPtr
             &&> GdkWindowAttributesType.PolyML.cVal
             --> GdkWindowClass.PolyML.cPtr
          )
      val atPointer_ = call (getSymbol "gdk_window_at_pointer") (GInt32.PolyML.cRef &&> GInt32.PolyML.cRef --> GdkWindowClass.PolyML.cPtr)
      val constrainSize_ =
        call (getSymbol "gdk_window_constrain_size")
          (
            GdkGeometryRecord.PolyML.cPtr
             &&> GdkWindowHints.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
      val processAllUpdates_ = call (getSymbol "gdk_window_process_all_updates") (cVoid --> cVoid)
      val setDebugUpdates_ = call (getSymbol "gdk_window_set_debug_updates") (GBool.PolyML.cVal --> cVoid)
      val beep_ = call (getSymbol "gdk_window_beep") (GdkWindowClass.PolyML.cPtr --> cVoid)
      val beginDrawFrame_ = call (getSymbol "gdk_window_begin_draw_frame") (GdkWindowClass.PolyML.cPtr &&> CairoRegionRecord.PolyML.cPtr --> GdkDrawingContextClass.PolyML.cPtr)
      val beginMoveDrag_ =
        call (getSymbol "gdk_window_begin_move_drag")
          (
            GdkWindowClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             --> cVoid
          )
      val beginMoveDragForDevice_ =
        call (getSymbol "gdk_window_begin_move_drag_for_device")
          (
            GdkWindowClass.PolyML.cPtr
             &&> GdkDeviceClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             --> cVoid
          )
      val beginPaintRect_ = call (getSymbol "gdk_window_begin_paint_rect") (GdkWindowClass.PolyML.cPtr &&> GdkRectangleRecord.PolyML.cPtr --> cVoid)
      val beginPaintRegion_ = call (getSymbol "gdk_window_begin_paint_region") (GdkWindowClass.PolyML.cPtr &&> CairoRegionRecord.PolyML.cPtr --> cVoid)
      val beginResizeDrag_ =
        call (getSymbol "gdk_window_begin_resize_drag")
          (
            GdkWindowClass.PolyML.cPtr
             &&> GdkWindowEdge.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             --> cVoid
          )
      val beginResizeDragForDevice_ =
        call (getSymbol "gdk_window_begin_resize_drag_for_device")
          (
            GdkWindowClass.PolyML.cPtr
             &&> GdkWindowEdge.PolyML.cVal
             &&> GdkDeviceClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             --> cVoid
          )
      val configureFinished_ = call (getSymbol "gdk_window_configure_finished") (GdkWindowClass.PolyML.cPtr --> cVoid)
      val coordsFromParent_ =
        call (getSymbol "gdk_window_coords_from_parent")
          (
            GdkWindowClass.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             --> cVoid
          )
      val coordsToParent_ =
        call (getSymbol "gdk_window_coords_to_parent")
          (
            GdkWindowClass.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             --> cVoid
          )
      val createGlContext_ = call (getSymbol "gdk_window_create_gl_context") (GdkWindowClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GdkGLContextClass.PolyML.cPtr)
      val createSimilarImageSurface_ =
        call (getSymbol "gdk_window_create_similar_image_surface")
          (
            GdkWindowClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> CairoSurfaceRecord.PolyML.cPtr
          )
      val createSimilarSurface_ =
        call (getSymbol "gdk_window_create_similar_surface")
          (
            GdkWindowClass.PolyML.cPtr
             &&> CairoContent.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> CairoSurfaceRecord.PolyML.cPtr
          )
      val deiconify_ = call (getSymbol "gdk_window_deiconify") (GdkWindowClass.PolyML.cPtr --> cVoid)
      val destroy_ = call (getSymbol "gdk_window_destroy") (GdkWindowClass.PolyML.cPtr --> cVoid)
      val destroyNotify_ = call (getSymbol "gdk_window_destroy_notify") (GdkWindowClass.PolyML.cPtr --> cVoid)
      val enableSynchronizedConfigure_ = call (getSymbol "gdk_window_enable_synchronized_configure") (GdkWindowClass.PolyML.cPtr --> cVoid)
      val endDrawFrame_ = call (getSymbol "gdk_window_end_draw_frame") (GdkWindowClass.PolyML.cPtr &&> GdkDrawingContextClass.PolyML.cPtr --> cVoid)
      val endPaint_ = call (getSymbol "gdk_window_end_paint") (GdkWindowClass.PolyML.cPtr --> cVoid)
      val ensureNative_ = call (getSymbol "gdk_window_ensure_native") (GdkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val flush_ = call (getSymbol "gdk_window_flush") (GdkWindowClass.PolyML.cPtr --> cVoid)
      val focus_ = call (getSymbol "gdk_window_focus") (GdkWindowClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val freezeToplevelUpdatesLibgtkOnly_ = call (getSymbol "gdk_window_freeze_toplevel_updates_libgtk_only") (GdkWindowClass.PolyML.cPtr --> cVoid)
      val freezeUpdates_ = call (getSymbol "gdk_window_freeze_updates") (GdkWindowClass.PolyML.cPtr --> cVoid)
      val fullscreen_ = call (getSymbol "gdk_window_fullscreen") (GdkWindowClass.PolyML.cPtr --> cVoid)
      val fullscreenOnMonitor_ = call (getSymbol "gdk_window_fullscreen_on_monitor") (GdkWindowClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val geometryChanged_ = call (getSymbol "gdk_window_geometry_changed") (GdkWindowClass.PolyML.cPtr --> cVoid)
      val getAcceptFocus_ = call (getSymbol "gdk_window_get_accept_focus") (GdkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getBackgroundPattern_ = call (getSymbol "gdk_window_get_background_pattern") (GdkWindowClass.PolyML.cPtr --> CairoPatternRecord.PolyML.cOptPtr)
      val getClipRegion_ = call (getSymbol "gdk_window_get_clip_region") (GdkWindowClass.PolyML.cPtr --> CairoRegionRecord.PolyML.cPtr)
      val getComposited_ = call (getSymbol "gdk_window_get_composited") (GdkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getCursor_ = call (getSymbol "gdk_window_get_cursor") (GdkWindowClass.PolyML.cPtr --> GdkCursorClass.PolyML.cOptPtr)
      val getDecorations_ = call (getSymbol "gdk_window_get_decorations") (GdkWindowClass.PolyML.cPtr &&> GdkWMDecoration.PolyML.cRef --> GBool.PolyML.cVal)
      val getDeviceCursor_ = call (getSymbol "gdk_window_get_device_cursor") (GdkWindowClass.PolyML.cPtr &&> GdkDeviceClass.PolyML.cPtr --> GdkCursorClass.PolyML.cOptPtr)
      val getDeviceEvents_ = call (getSymbol "gdk_window_get_device_events") (GdkWindowClass.PolyML.cPtr &&> GdkDeviceClass.PolyML.cPtr --> GdkEventMask.PolyML.cVal)
      val getDevicePosition_ =
        call (getSymbol "gdk_window_get_device_position")
          (
            GdkWindowClass.PolyML.cPtr
             &&> GdkDeviceClass.PolyML.cPtr
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             &&> GdkModifierType.PolyML.cRef
             --> GdkWindowClass.PolyML.cOptPtr
          )
      val getDevicePositionDouble_ =
        call (getSymbol "gdk_window_get_device_position_double")
          (
            GdkWindowClass.PolyML.cPtr
             &&> GdkDeviceClass.PolyML.cPtr
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             &&> GdkModifierType.PolyML.cRef
             --> GdkWindowClass.PolyML.cOptPtr
          )
      val getDisplay_ = call (getSymbol "gdk_window_get_display") (GdkWindowClass.PolyML.cPtr --> GdkDisplayClass.PolyML.cPtr)
      val getDragProtocol_ = call (getSymbol "gdk_window_get_drag_protocol") (GdkWindowClass.PolyML.cPtr &&> GdkWindowClass.PolyML.cOutRef --> GdkDragProtocol.PolyML.cVal)
      val getEffectiveParent_ = call (getSymbol "gdk_window_get_effective_parent") (GdkWindowClass.PolyML.cPtr --> GdkWindowClass.PolyML.cPtr)
      val getEffectiveToplevel_ = call (getSymbol "gdk_window_get_effective_toplevel") (GdkWindowClass.PolyML.cPtr --> GdkWindowClass.PolyML.cPtr)
      val getEventCompression_ = call (getSymbol "gdk_window_get_event_compression") (GdkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getEvents_ = call (getSymbol "gdk_window_get_events") (GdkWindowClass.PolyML.cPtr --> GdkEventMask.PolyML.cVal)
      val getFocusOnMap_ = call (getSymbol "gdk_window_get_focus_on_map") (GdkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getFrameClock_ = call (getSymbol "gdk_window_get_frame_clock") (GdkWindowClass.PolyML.cPtr --> GdkFrameClockClass.PolyML.cPtr)
      val getFrameExtents_ = call (getSymbol "gdk_window_get_frame_extents") (GdkWindowClass.PolyML.cPtr &&> GdkRectangleRecord.PolyML.cPtr --> cVoid)
      val getFullscreenMode_ = call (getSymbol "gdk_window_get_fullscreen_mode") (GdkWindowClass.PolyML.cPtr --> GdkFullscreenMode.PolyML.cVal)
      val getGeometry_ =
        call (getSymbol "gdk_window_get_geometry")
          (
            GdkWindowClass.PolyML.cPtr
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
      val getGroup_ = call (getSymbol "gdk_window_get_group") (GdkWindowClass.PolyML.cPtr --> GdkWindowClass.PolyML.cPtr)
      val getHeight_ = call (getSymbol "gdk_window_get_height") (GdkWindowClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getModalHint_ = call (getSymbol "gdk_window_get_modal_hint") (GdkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getOrigin_ =
        call (getSymbol "gdk_window_get_origin")
          (
            GdkWindowClass.PolyML.cPtr
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> GInt32.PolyML.cVal
          )
      val getParent_ = call (getSymbol "gdk_window_get_parent") (GdkWindowClass.PolyML.cPtr --> GdkWindowClass.PolyML.cPtr)
      val getPassThrough_ = call (getSymbol "gdk_window_get_pass_through") (GdkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getPointer_ =
        call (getSymbol "gdk_window_get_pointer")
          (
            GdkWindowClass.PolyML.cPtr
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             &&> GdkModifierType.PolyML.cRef
             --> GdkWindowClass.PolyML.cOptPtr
          )
      val getPosition_ =
        call (getSymbol "gdk_window_get_position")
          (
            GdkWindowClass.PolyML.cPtr
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
      val getRootCoords_ =
        call (getSymbol "gdk_window_get_root_coords")
          (
            GdkWindowClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
      val getRootOrigin_ =
        call (getSymbol "gdk_window_get_root_origin")
          (
            GdkWindowClass.PolyML.cPtr
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
      val getScaleFactor_ = call (getSymbol "gdk_window_get_scale_factor") (GdkWindowClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getScreen_ = call (getSymbol "gdk_window_get_screen") (GdkWindowClass.PolyML.cPtr --> GdkScreenClass.PolyML.cPtr)
      val getSourceEvents_ = call (getSymbol "gdk_window_get_source_events") (GdkWindowClass.PolyML.cPtr &&> GdkInputSource.PolyML.cVal --> GdkEventMask.PolyML.cVal)
      val getState_ = call (getSymbol "gdk_window_get_state") (GdkWindowClass.PolyML.cPtr --> GdkWindowState.PolyML.cVal)
      val getSupportMultidevice_ = call (getSymbol "gdk_window_get_support_multidevice") (GdkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getToplevel_ = call (getSymbol "gdk_window_get_toplevel") (GdkWindowClass.PolyML.cPtr --> GdkWindowClass.PolyML.cPtr)
      val getTypeHint_ = call (getSymbol "gdk_window_get_type_hint") (GdkWindowClass.PolyML.cPtr --> GdkWindowTypeHint.PolyML.cVal)
      val getUpdateArea_ = call (getSymbol "gdk_window_get_update_area") (GdkWindowClass.PolyML.cPtr --> CairoRegionRecord.PolyML.cPtr)
      val getVisibleRegion_ = call (getSymbol "gdk_window_get_visible_region") (GdkWindowClass.PolyML.cPtr --> CairoRegionRecord.PolyML.cPtr)
      val getVisual_ = call (getSymbol "gdk_window_get_visual") (GdkWindowClass.PolyML.cPtr --> GdkVisualClass.PolyML.cPtr)
      val getWidth_ = call (getSymbol "gdk_window_get_width") (GdkWindowClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getWindowType_ = call (getSymbol "gdk_window_get_window_type") (GdkWindowClass.PolyML.cPtr --> GdkWindowType.PolyML.cVal)
      val hasNative_ = call (getSymbol "gdk_window_has_native") (GdkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val hide_ = call (getSymbol "gdk_window_hide") (GdkWindowClass.PolyML.cPtr --> cVoid)
      val iconify_ = call (getSymbol "gdk_window_iconify") (GdkWindowClass.PolyML.cPtr --> cVoid)
      val inputShapeCombineRegion_ =
        call (getSymbol "gdk_window_input_shape_combine_region")
          (
            GdkWindowClass.PolyML.cPtr
             &&> CairoRegionRecord.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val invalidateRect_ =
        call (getSymbol "gdk_window_invalidate_rect")
          (
            GdkWindowClass.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cOptPtr
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val invalidateRegion_ =
        call (getSymbol "gdk_window_invalidate_region")
          (
            GdkWindowClass.PolyML.cPtr
             &&> CairoRegionRecord.PolyML.cPtr
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val isDestroyed_ = call (getSymbol "gdk_window_is_destroyed") (GdkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isInputOnly_ = call (getSymbol "gdk_window_is_input_only") (GdkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isShaped_ = call (getSymbol "gdk_window_is_shaped") (GdkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isViewable_ = call (getSymbol "gdk_window_is_viewable") (GdkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isVisible_ = call (getSymbol "gdk_window_is_visible") (GdkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val lower_ = call (getSymbol "gdk_window_lower") (GdkWindowClass.PolyML.cPtr --> cVoid)
      val markPaintFromClip_ = call (getSymbol "gdk_window_mark_paint_from_clip") (GdkWindowClass.PolyML.cPtr &&> CairoContextRecord.PolyML.cPtr --> cVoid)
      val maximize_ = call (getSymbol "gdk_window_maximize") (GdkWindowClass.PolyML.cPtr --> cVoid)
      val mergeChildInputShapes_ = call (getSymbol "gdk_window_merge_child_input_shapes") (GdkWindowClass.PolyML.cPtr --> cVoid)
      val mergeChildShapes_ = call (getSymbol "gdk_window_merge_child_shapes") (GdkWindowClass.PolyML.cPtr --> cVoid)
      val move_ =
        call (getSymbol "gdk_window_move")
          (
            GdkWindowClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val moveRegion_ =
        call (getSymbol "gdk_window_move_region")
          (
            GdkWindowClass.PolyML.cPtr
             &&> CairoRegionRecord.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val moveResize_ =
        call (getSymbol "gdk_window_move_resize")
          (
            GdkWindowClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val processUpdates_ = call (getSymbol "gdk_window_process_updates") (GdkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val raise_ = call (getSymbol "gdk_window_raise") (GdkWindowClass.PolyML.cPtr --> cVoid)
      val registerDnd_ = call (getSymbol "gdk_window_register_dnd") (GdkWindowClass.PolyML.cPtr --> cVoid)
      val reparent_ =
        call (getSymbol "gdk_window_reparent")
          (
            GdkWindowClass.PolyML.cPtr
             &&> GdkWindowClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val resize_ =
        call (getSymbol "gdk_window_resize")
          (
            GdkWindowClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val restack_ =
        call (getSymbol "gdk_window_restack")
          (
            GdkWindowClass.PolyML.cPtr
             &&> GdkWindowClass.PolyML.cOptPtr
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val scroll_ =
        call (getSymbol "gdk_window_scroll")
          (
            GdkWindowClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val setAcceptFocus_ = call (getSymbol "gdk_window_set_accept_focus") (GdkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setBackground_ = call (getSymbol "gdk_window_set_background") (GdkWindowClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cPtr --> cVoid)
      val setBackgroundPattern_ = call (getSymbol "gdk_window_set_background_pattern") (GdkWindowClass.PolyML.cPtr &&> CairoPatternRecord.PolyML.cOptPtr --> cVoid)
      val setBackgroundRgba_ = call (getSymbol "gdk_window_set_background_rgba") (GdkWindowClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> cVoid)
      val setChildInputShapes_ = call (getSymbol "gdk_window_set_child_input_shapes") (GdkWindowClass.PolyML.cPtr --> cVoid)
      val setChildShapes_ = call (getSymbol "gdk_window_set_child_shapes") (GdkWindowClass.PolyML.cPtr --> cVoid)
      val setComposited_ = call (getSymbol "gdk_window_set_composited") (GdkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setCursor_ = call (getSymbol "gdk_window_set_cursor") (GdkWindowClass.PolyML.cPtr &&> GdkCursorClass.PolyML.cOptPtr --> cVoid)
      val setDecorations_ = call (getSymbol "gdk_window_set_decorations") (GdkWindowClass.PolyML.cPtr &&> GdkWMDecoration.PolyML.cVal --> cVoid)
      val setDeviceCursor_ =
        call (getSymbol "gdk_window_set_device_cursor")
          (
            GdkWindowClass.PolyML.cPtr
             &&> GdkDeviceClass.PolyML.cPtr
             &&> GdkCursorClass.PolyML.cPtr
             --> cVoid
          )
      val setDeviceEvents_ =
        call (getSymbol "gdk_window_set_device_events")
          (
            GdkWindowClass.PolyML.cPtr
             &&> GdkDeviceClass.PolyML.cPtr
             &&> GdkEventMask.PolyML.cVal
             --> cVoid
          )
      val setEventCompression_ = call (getSymbol "gdk_window_set_event_compression") (GdkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setEvents_ = call (getSymbol "gdk_window_set_events") (GdkWindowClass.PolyML.cPtr &&> GdkEventMask.PolyML.cVal --> cVoid)
      val setFocusOnMap_ = call (getSymbol "gdk_window_set_focus_on_map") (GdkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setFullscreenMode_ = call (getSymbol "gdk_window_set_fullscreen_mode") (GdkWindowClass.PolyML.cPtr &&> GdkFullscreenMode.PolyML.cVal --> cVoid)
      val setFunctions_ = call (getSymbol "gdk_window_set_functions") (GdkWindowClass.PolyML.cPtr &&> GdkWMFunction.PolyML.cVal --> cVoid)
      val setGeometryHints_ =
        call (getSymbol "gdk_window_set_geometry_hints")
          (
            GdkWindowClass.PolyML.cPtr
             &&> GdkGeometryRecord.PolyML.cPtr
             &&> GdkWindowHints.PolyML.cVal
             --> cVoid
          )
      val setGroup_ = call (getSymbol "gdk_window_set_group") (GdkWindowClass.PolyML.cPtr &&> GdkWindowClass.PolyML.cOptPtr --> cVoid)
      val setIconName_ = call (getSymbol "gdk_window_set_icon_name") (GdkWindowClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setKeepAbove_ = call (getSymbol "gdk_window_set_keep_above") (GdkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setKeepBelow_ = call (getSymbol "gdk_window_set_keep_below") (GdkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setModalHint_ = call (getSymbol "gdk_window_set_modal_hint") (GdkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setOpacity_ = call (getSymbol "gdk_window_set_opacity") (GdkWindowClass.PolyML.cPtr &&> GDouble.PolyML.cVal --> cVoid)
      val setOpaqueRegion_ = call (getSymbol "gdk_window_set_opaque_region") (GdkWindowClass.PolyML.cPtr &&> CairoRegionRecord.PolyML.cOptPtr --> cVoid)
      val setOverrideRedirect_ = call (getSymbol "gdk_window_set_override_redirect") (GdkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setPassThrough_ = call (getSymbol "gdk_window_set_pass_through") (GdkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setRole_ = call (getSymbol "gdk_window_set_role") (GdkWindowClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setShadowWidth_ =
        call (getSymbol "gdk_window_set_shadow_width")
          (
            GdkWindowClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val setSkipPagerHint_ = call (getSymbol "gdk_window_set_skip_pager_hint") (GdkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setSkipTaskbarHint_ = call (getSymbol "gdk_window_set_skip_taskbar_hint") (GdkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setSourceEvents_ =
        call (getSymbol "gdk_window_set_source_events")
          (
            GdkWindowClass.PolyML.cPtr
             &&> GdkInputSource.PolyML.cVal
             &&> GdkEventMask.PolyML.cVal
             --> cVoid
          )
      val setStartupId_ = call (getSymbol "gdk_window_set_startup_id") (GdkWindowClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setStaticGravities_ = call (getSymbol "gdk_window_set_static_gravities") (GdkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> GBool.PolyML.cVal)
      val setSupportMultidevice_ = call (getSymbol "gdk_window_set_support_multidevice") (GdkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setTitle_ = call (getSymbol "gdk_window_set_title") (GdkWindowClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setTransientFor_ = call (getSymbol "gdk_window_set_transient_for") (GdkWindowClass.PolyML.cPtr &&> GdkWindowClass.PolyML.cPtr --> cVoid)
      val setTypeHint_ = call (getSymbol "gdk_window_set_type_hint") (GdkWindowClass.PolyML.cPtr &&> GdkWindowTypeHint.PolyML.cVal --> cVoid)
      val setUrgencyHint_ = call (getSymbol "gdk_window_set_urgency_hint") (GdkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setUserData_ = call (getSymbol "gdk_window_set_user_data") (GdkWindowClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> cVoid)
      val shapeCombineRegion_ =
        call (getSymbol "gdk_window_shape_combine_region")
          (
            GdkWindowClass.PolyML.cPtr
             &&> CairoRegionRecord.PolyML.cOptPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val show_ = call (getSymbol "gdk_window_show") (GdkWindowClass.PolyML.cPtr --> cVoid)
      val showUnraised_ = call (getSymbol "gdk_window_show_unraised") (GdkWindowClass.PolyML.cPtr --> cVoid)
      val showWindowMenu_ = call (getSymbol "gdk_window_show_window_menu") (GdkWindowClass.PolyML.cPtr &&> GdkEvent.PolyML.cPtr --> GBool.PolyML.cVal)
      val stick_ = call (getSymbol "gdk_window_stick") (GdkWindowClass.PolyML.cPtr --> cVoid)
      val thawToplevelUpdatesLibgtkOnly_ = call (getSymbol "gdk_window_thaw_toplevel_updates_libgtk_only") (GdkWindowClass.PolyML.cPtr --> cVoid)
      val thawUpdates_ = call (getSymbol "gdk_window_thaw_updates") (GdkWindowClass.PolyML.cPtr --> cVoid)
      val unfullscreen_ = call (getSymbol "gdk_window_unfullscreen") (GdkWindowClass.PolyML.cPtr --> cVoid)
      val unmaximize_ = call (getSymbol "gdk_window_unmaximize") (GdkWindowClass.PolyML.cPtr --> cVoid)
      val unstick_ = call (getSymbol "gdk_window_unstick") (GdkWindowClass.PolyML.cPtr --> cVoid)
      val withdraw_ = call (getSymbol "gdk_window_withdraw") (GdkWindowClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GdkWindowClass.class
    type window_attributes_type_t = GdkWindowAttributesType.t
    type window_attr_t = GdkWindowAttrRecord.t
    type window_edge_t = GdkWindowEdge.t
    type 'a g_l_context_class = 'a GdkGLContextClass.class
    type 'a drawing_context_class = 'a GdkDrawingContextClass.class
    type 'a display_class = 'a GdkDisplayClass.class
    type drag_protocol_t = GdkDragProtocol.t
    type 'a frame_clock_class = 'a GdkFrameClockClass.class
    type modifier_type_t = GdkModifierType.t
    type 'a screen_class = 'a GdkScreenClass.class
    type window_state_t = GdkWindowState.t
    type 'a visual_class = 'a GdkVisualClass.class
    type window_type_t = GdkWindowType.t
    type rectangle_t = GdkRectangleRecord.t
    type color_t = GdkColorRecord.t
    type rgba_t = GdkRgbaRecord.t
    type w_m_decoration_t = GdkWMDecoration.t
    type 'a device_class = 'a GdkDeviceClass.class
    type fullscreen_mode_t = GdkFullscreenMode.t
    type w_m_function_t = GdkWMFunction.t
    type window_hints_t = GdkWindowHints.t
    type geometry_t = GdkGeometryRecord.t
    type event_mask_t = GdkEventMask.t
    type input_source_t = GdkInputSource.t
    type window_type_hint_t = GdkWindowTypeHint.t
    type 'a event_union = 'a GdkEvent.union
    type 'a cursor_class = 'a GdkCursorClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new
      (
        parent,
        attributes,
        attributesMask
      ) =
      (
        GdkWindowClass.FFI.withOptPtr false
         &&&> GdkWindowAttrRecord.FFI.withPtr false
         &&&> GdkWindowAttributesType.FFI.withVal
         ---> GdkWindowClass.FFI.fromPtr true
      )
        new_
        (
          parent
           & attributes
           & attributesMask
        )
    fun atPointer () =
      let
        val winX
         & winY
         & retVal =
          (
            GInt32.FFI.withRefVal &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GdkWindowClass.FFI.fromPtr false
          )
            atPointer_
            (GInt32.null & GInt32.null)
      in
        (
          retVal,
          winX,
          winY
        )
      end
    fun constrainSize
      (
        geometry,
        flags,
        width,
        height
      ) =
      let
        val newWidth
         & newHeight
         & () =
          (
            GdkGeometryRecord.FFI.withPtr false
             &&&> GdkWindowHints.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            constrainSize_
            (
              geometry
               & flags
               & width
               & height
               & GInt32.null
               & GInt32.null
            )
      in
        (newWidth, newHeight)
      end
    fun processAllUpdates () = (I ---> I) processAllUpdates_ ()
    fun setDebugUpdates setting = (GBool.FFI.withVal ---> I) setDebugUpdates_ setting
    fun beep self = (GdkWindowClass.FFI.withPtr false ---> I) beep_ self
    fun beginDrawFrame self region = (GdkWindowClass.FFI.withPtr false &&&> CairoRegionRecord.FFI.withPtr false ---> GdkDrawingContextClass.FFI.fromPtr false) beginDrawFrame_ (self & region)
    fun beginMoveDrag
      self
      (
        button,
        rootX,
        rootY,
        timestamp
      ) =
      (
        GdkWindowClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         ---> I
      )
        beginMoveDrag_
        (
          self
           & button
           & rootX
           & rootY
           & timestamp
        )
    fun beginMoveDragForDevice
      self
      (
        device,
        button,
        rootX,
        rootY,
        timestamp
      ) =
      (
        GdkWindowClass.FFI.withPtr false
         &&&> GdkDeviceClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         ---> I
      )
        beginMoveDragForDevice_
        (
          self
           & device
           & button
           & rootX
           & rootY
           & timestamp
        )
    fun beginPaintRect self rectangle = (GdkWindowClass.FFI.withPtr false &&&> GdkRectangleRecord.FFI.withPtr false ---> I) beginPaintRect_ (self & rectangle)
    fun beginPaintRegion self region = (GdkWindowClass.FFI.withPtr false &&&> CairoRegionRecord.FFI.withPtr false ---> I) beginPaintRegion_ (self & region)
    fun beginResizeDrag
      self
      (
        edge,
        button,
        rootX,
        rootY,
        timestamp
      ) =
      (
        GdkWindowClass.FFI.withPtr false
         &&&> GdkWindowEdge.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         ---> I
      )
        beginResizeDrag_
        (
          self
           & edge
           & button
           & rootX
           & rootY
           & timestamp
        )
    fun beginResizeDragForDevice
      self
      (
        edge,
        device,
        button,
        rootX,
        rootY,
        timestamp
      ) =
      (
        GdkWindowClass.FFI.withPtr false
         &&&> GdkWindowEdge.FFI.withVal
         &&&> GdkDeviceClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         ---> I
      )
        beginResizeDragForDevice_
        (
          self
           & edge
           & device
           & button
           & rootX
           & rootY
           & timestamp
        )
    fun configureFinished self = (GdkWindowClass.FFI.withPtr false ---> I) configureFinished_ self
    fun coordsFromParent self (parentX, parentY) =
      let
        val x
         & y
         & () =
          (
            GdkWindowClass.FFI.withPtr false
             &&&> GDouble.FFI.withVal
             &&&> GDouble.FFI.withVal
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             ---> GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && I
          )
            coordsFromParent_
            (
              self
               & parentX
               & parentY
               & GDouble.null
               & GDouble.null
            )
      in
        (x, y)
      end
    fun coordsToParent self (x, y) =
      let
        val parentX
         & parentY
         & () =
          (
            GdkWindowClass.FFI.withPtr false
             &&&> GDouble.FFI.withVal
             &&&> GDouble.FFI.withVal
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             ---> GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && I
          )
            coordsToParent_
            (
              self
               & x
               & y
               & GDouble.null
               & GDouble.null
            )
      in
        (parentX, parentY)
      end
    fun createGlContext self = (GdkWindowClass.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> GdkGLContextClass.FFI.fromPtr true) createGlContext_ (self & [])
    fun createSimilarImageSurface
      self
      (
        format,
        width,
        height,
        scale
      ) =
      (
        GdkWindowClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> CairoSurfaceRecord.FFI.fromPtr true
      )
        createSimilarImageSurface_
        (
          self
           & format
           & width
           & height
           & scale
        )
    fun createSimilarSurface
      self
      (
        content,
        width,
        height
      ) =
      (
        GdkWindowClass.FFI.withPtr false
         &&&> CairoContent.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> CairoSurfaceRecord.FFI.fromPtr true
      )
        createSimilarSurface_
        (
          self
           & content
           & width
           & height
        )
    fun deiconify self = (GdkWindowClass.FFI.withPtr false ---> I) deiconify_ self
    fun destroy self = (GdkWindowClass.FFI.withPtr false ---> I) destroy_ self
    fun destroyNotify self = (GdkWindowClass.FFI.withPtr false ---> I) destroyNotify_ self
    fun enableSynchronizedConfigure self = (GdkWindowClass.FFI.withPtr false ---> I) enableSynchronizedConfigure_ self
    fun endDrawFrame self context = (GdkWindowClass.FFI.withPtr false &&&> GdkDrawingContextClass.FFI.withPtr false ---> I) endDrawFrame_ (self & context)
    fun endPaint self = (GdkWindowClass.FFI.withPtr false ---> I) endPaint_ self
    fun ensureNative self = (GdkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) ensureNative_ self
    fun flush self = (GdkWindowClass.FFI.withPtr false ---> I) flush_ self
    fun focus self timestamp = (GdkWindowClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> I) focus_ (self & timestamp)
    fun freezeToplevelUpdatesLibgtkOnly self = (GdkWindowClass.FFI.withPtr false ---> I) freezeToplevelUpdatesLibgtkOnly_ self
    fun freezeUpdates self = (GdkWindowClass.FFI.withPtr false ---> I) freezeUpdates_ self
    fun fullscreen self = (GdkWindowClass.FFI.withPtr false ---> I) fullscreen_ self
    fun fullscreenOnMonitor self monitor = (GdkWindowClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) fullscreenOnMonitor_ (self & monitor)
    fun geometryChanged self = (GdkWindowClass.FFI.withPtr false ---> I) geometryChanged_ self
    fun getAcceptFocus self = (GdkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) getAcceptFocus_ self
    fun getBackgroundPattern self = (GdkWindowClass.FFI.withPtr false ---> CairoPatternRecord.FFI.fromOptPtr false) getBackgroundPattern_ self
    fun getClipRegion self = (GdkWindowClass.FFI.withPtr false ---> CairoRegionRecord.FFI.fromPtr true) getClipRegion_ self
    fun getComposited self = (GdkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) getComposited_ self
    fun getCursor self = (GdkWindowClass.FFI.withPtr false ---> GdkCursorClass.FFI.fromOptPtr false) getCursor_ self
    fun getDecorations self =
      let
        val decorations & retVal = (GdkWindowClass.FFI.withPtr false &&&> GdkWMDecoration.FFI.withRefVal ---> GdkWMDecoration.FFI.fromVal && GBool.FFI.fromVal) getDecorations_ (self & GdkWMDecoration.flags [])
      in
        if retVal then SOME decorations else NONE
      end
    fun getDeviceCursor self device = (GdkWindowClass.FFI.withPtr false &&&> GdkDeviceClass.FFI.withPtr false ---> GdkCursorClass.FFI.fromOptPtr false) getDeviceCursor_ (self & device)
    fun getDeviceEvents self device = (GdkWindowClass.FFI.withPtr false &&&> GdkDeviceClass.FFI.withPtr false ---> GdkEventMask.FFI.fromVal) getDeviceEvents_ (self & device)
    fun getDevicePosition self device =
      let
        val x
         & y
         & mask
         & retVal =
          (
            GdkWindowClass.FFI.withPtr false
             &&&> GdkDeviceClass.FFI.withPtr false
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             &&&> GdkModifierType.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GdkModifierType.FFI.fromVal
                   && GdkWindowClass.FFI.fromOptPtr false
          )
            getDevicePosition_
            (
              self
               & device
               & GInt32.null
               & GInt32.null
               & GdkModifierType.flags []
            )
      in
        (
          retVal,
          x,
          y,
          mask
        )
      end
    fun getDevicePositionDouble self device =
      let
        val x
         & y
         & mask
         & retVal =
          (
            GdkWindowClass.FFI.withPtr false
             &&&> GdkDeviceClass.FFI.withPtr false
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             &&&> GdkModifierType.FFI.withRefVal
             ---> GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && GdkModifierType.FFI.fromVal
                   && GdkWindowClass.FFI.fromOptPtr false
          )
            getDevicePositionDouble_
            (
              self
               & device
               & GDouble.null
               & GDouble.null
               & GdkModifierType.flags []
            )
      in
        (
          retVal,
          x,
          y,
          mask
        )
      end
    fun getDisplay self = (GdkWindowClass.FFI.withPtr false ---> GdkDisplayClass.FFI.fromPtr false) getDisplay_ self
    fun getDragProtocol self =
      let
        val target & retVal = (GdkWindowClass.FFI.withPtr false &&&> GdkWindowClass.FFI.withRefOptPtr true ---> GdkWindowClass.FFI.fromPtr true && GdkDragProtocol.FFI.fromVal) getDragProtocol_ (self & NONE)
      in
        (retVal, target)
      end
    fun getEffectiveParent self = (GdkWindowClass.FFI.withPtr false ---> GdkWindowClass.FFI.fromPtr false) getEffectiveParent_ self
    fun getEffectiveToplevel self = (GdkWindowClass.FFI.withPtr false ---> GdkWindowClass.FFI.fromPtr false) getEffectiveToplevel_ self
    fun getEventCompression self = (GdkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) getEventCompression_ self
    fun getEvents self = (GdkWindowClass.FFI.withPtr false ---> GdkEventMask.FFI.fromVal) getEvents_ self
    fun getFocusOnMap self = (GdkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) getFocusOnMap_ self
    fun getFrameClock self = (GdkWindowClass.FFI.withPtr false ---> GdkFrameClockClass.FFI.fromPtr false) getFrameClock_ self
    fun getFrameExtents self =
      let
        val rect & () = (GdkWindowClass.FFI.withPtr false &&&> GdkRectangleRecord.FFI.withNewPtr ---> GdkRectangleRecord.FFI.fromPtr true && I) getFrameExtents_ (self & ())
      in
        rect
      end
    fun getFullscreenMode self = (GdkWindowClass.FFI.withPtr false ---> GdkFullscreenMode.FFI.fromVal) getFullscreenMode_ self
    fun getGeometry self =
      let
        val x
         & y
         & width
         & height
         & () =
          (
            GdkWindowClass.FFI.withPtr false
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getGeometry_
            (
              self
               & GInt32.null
               & GInt32.null
               & GInt32.null
               & GInt32.null
            )
      in
        (
          x,
          y,
          width,
          height
        )
      end
    fun getGroup self = (GdkWindowClass.FFI.withPtr false ---> GdkWindowClass.FFI.fromPtr false) getGroup_ self
    fun getHeight self = (GdkWindowClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getHeight_ self
    fun getModalHint self = (GdkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) getModalHint_ self
    fun getOrigin self =
      let
        val x
         & y
         & retVal =
          (
            GdkWindowClass.FFI.withPtr false
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
          )
            getOrigin_
            (
              self
               & GInt32.null
               & GInt32.null
            )
      in
        (
          retVal,
          x,
          y
        )
      end
    fun getParent self = (GdkWindowClass.FFI.withPtr false ---> GdkWindowClass.FFI.fromPtr false) getParent_ self
    fun getPassThrough self = (GdkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) getPassThrough_ self
    fun getPointer self =
      let
        val x
         & y
         & mask
         & retVal =
          (
            GdkWindowClass.FFI.withPtr false
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             &&&> GdkModifierType.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GdkModifierType.FFI.fromVal
                   && GdkWindowClass.FFI.fromOptPtr false
          )
            getPointer_
            (
              self
               & GInt32.null
               & GInt32.null
               & GdkModifierType.flags []
            )
      in
        (
          retVal,
          x,
          y,
          mask
        )
      end
    fun getPosition self =
      let
        val x
         & y
         & () =
          (
            GdkWindowClass.FFI.withPtr false
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getPosition_
            (
              self
               & GInt32.null
               & GInt32.null
            )
      in
        (x, y)
      end
    fun getRootCoords self (x, y) =
      let
        val rootX
         & rootY
         & () =
          (
            GdkWindowClass.FFI.withPtr false
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getRootCoords_
            (
              self
               & x
               & y
               & GInt32.null
               & GInt32.null
            )
      in
        (rootX, rootY)
      end
    fun getRootOrigin self =
      let
        val x
         & y
         & () =
          (
            GdkWindowClass.FFI.withPtr false
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getRootOrigin_
            (
              self
               & GInt32.null
               & GInt32.null
            )
      in
        (x, y)
      end
    fun getScaleFactor self = (GdkWindowClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getScaleFactor_ self
    fun getScreen self = (GdkWindowClass.FFI.withPtr false ---> GdkScreenClass.FFI.fromPtr false) getScreen_ self
    fun getSourceEvents self source = (GdkWindowClass.FFI.withPtr false &&&> GdkInputSource.FFI.withVal ---> GdkEventMask.FFI.fromVal) getSourceEvents_ (self & source)
    fun getState self = (GdkWindowClass.FFI.withPtr false ---> GdkWindowState.FFI.fromVal) getState_ self
    fun getSupportMultidevice self = (GdkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) getSupportMultidevice_ self
    fun getToplevel self = (GdkWindowClass.FFI.withPtr false ---> GdkWindowClass.FFI.fromPtr false) getToplevel_ self
    fun getTypeHint self = (GdkWindowClass.FFI.withPtr false ---> GdkWindowTypeHint.FFI.fromVal) getTypeHint_ self
    fun getUpdateArea self = (GdkWindowClass.FFI.withPtr false ---> CairoRegionRecord.FFI.fromPtr true) getUpdateArea_ self
    fun getVisibleRegion self = (GdkWindowClass.FFI.withPtr false ---> CairoRegionRecord.FFI.fromPtr true) getVisibleRegion_ self
    fun getVisual self = (GdkWindowClass.FFI.withPtr false ---> GdkVisualClass.FFI.fromPtr false) getVisual_ self
    fun getWidth self = (GdkWindowClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getWidth_ self
    fun getWindowType self = (GdkWindowClass.FFI.withPtr false ---> GdkWindowType.FFI.fromVal) getWindowType_ self
    fun hasNative self = (GdkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) hasNative_ self
    fun hide self = (GdkWindowClass.FFI.withPtr false ---> I) hide_ self
    fun iconify self = (GdkWindowClass.FFI.withPtr false ---> I) iconify_ self
    fun inputShapeCombineRegion
      self
      (
        shapeRegion,
        offsetX,
        offsetY
      ) =
      (
        GdkWindowClass.FFI.withPtr false
         &&&> CairoRegionRecord.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        inputShapeCombineRegion_
        (
          self
           & shapeRegion
           & offsetX
           & offsetY
        )
    fun invalidateRect self (rect, invalidateChildren) =
      (
        GdkWindowClass.FFI.withPtr false
         &&&> GdkRectangleRecord.FFI.withOptPtr false
         &&&> GBool.FFI.withVal
         ---> I
      )
        invalidateRect_
        (
          self
           & rect
           & invalidateChildren
        )
    fun invalidateRegion self (region, invalidateChildren) =
      (
        GdkWindowClass.FFI.withPtr false
         &&&> CairoRegionRecord.FFI.withPtr false
         &&&> GBool.FFI.withVal
         ---> I
      )
        invalidateRegion_
        (
          self
           & region
           & invalidateChildren
        )
    fun isDestroyed self = (GdkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) isDestroyed_ self
    fun isInputOnly self = (GdkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) isInputOnly_ self
    fun isShaped self = (GdkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) isShaped_ self
    fun isViewable self = (GdkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) isViewable_ self
    fun isVisible self = (GdkWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) isVisible_ self
    fun lower self = (GdkWindowClass.FFI.withPtr false ---> I) lower_ self
    fun markPaintFromClip self cr = (GdkWindowClass.FFI.withPtr false &&&> CairoContextRecord.FFI.withPtr false ---> I) markPaintFromClip_ (self & cr)
    fun maximize self = (GdkWindowClass.FFI.withPtr false ---> I) maximize_ self
    fun mergeChildInputShapes self = (GdkWindowClass.FFI.withPtr false ---> I) mergeChildInputShapes_ self
    fun mergeChildShapes self = (GdkWindowClass.FFI.withPtr false ---> I) mergeChildShapes_ self
    fun move self (x, y) =
      (
        GdkWindowClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        move_
        (
          self
           & x
           & y
        )
    fun moveRegion
      self
      (
        region,
        dx,
        dy
      ) =
      (
        GdkWindowClass.FFI.withPtr false
         &&&> CairoRegionRecord.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        moveRegion_
        (
          self
           & region
           & dx
           & dy
        )
    fun moveResize
      self
      (
        x,
        y,
        width,
        height
      ) =
      (
        GdkWindowClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        moveResize_
        (
          self
           & x
           & y
           & width
           & height
        )
    fun processUpdates self updateChildren = (GdkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) processUpdates_ (self & updateChildren)
    fun raise' self = (GdkWindowClass.FFI.withPtr false ---> I) raise_ self
    fun registerDnd self = (GdkWindowClass.FFI.withPtr false ---> I) registerDnd_ self
    fun reparent
      self
      (
        newParent,
        x,
        y
      ) =
      (
        GdkWindowClass.FFI.withPtr false
         &&&> GdkWindowClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        reparent_
        (
          self
           & newParent
           & x
           & y
        )
    fun resize self (width, height) =
      (
        GdkWindowClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        resize_
        (
          self
           & width
           & height
        )
    fun restack self (sibling, above) =
      (
        GdkWindowClass.FFI.withPtr false
         &&&> GdkWindowClass.FFI.withOptPtr false
         &&&> GBool.FFI.withVal
         ---> I
      )
        restack_
        (
          self
           & sibling
           & above
        )
    fun scroll self (dx, dy) =
      (
        GdkWindowClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        scroll_
        (
          self
           & dx
           & dy
        )
    fun setAcceptFocus self acceptFocus = (GdkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setAcceptFocus_ (self & acceptFocus)
    fun setBackground self color = (GdkWindowClass.FFI.withPtr false &&&> GdkColorRecord.FFI.withPtr false ---> I) setBackground_ (self & color)
    fun setBackgroundPattern self pattern = (GdkWindowClass.FFI.withPtr false &&&> CairoPatternRecord.FFI.withOptPtr false ---> I) setBackgroundPattern_ (self & pattern)
    fun setBackgroundRgba self rgba = (GdkWindowClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withPtr false ---> I) setBackgroundRgba_ (self & rgba)
    fun setChildInputShapes self = (GdkWindowClass.FFI.withPtr false ---> I) setChildInputShapes_ self
    fun setChildShapes self = (GdkWindowClass.FFI.withPtr false ---> I) setChildShapes_ self
    fun setComposited self composited = (GdkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setComposited_ (self & composited)
    fun setCursor self cursor = (GdkWindowClass.FFI.withPtr false &&&> GdkCursorClass.FFI.withOptPtr false ---> I) setCursor_ (self & cursor)
    fun setDecorations self decorations = (GdkWindowClass.FFI.withPtr false &&&> GdkWMDecoration.FFI.withVal ---> I) setDecorations_ (self & decorations)
    fun setDeviceCursor self (device, cursor) =
      (
        GdkWindowClass.FFI.withPtr false
         &&&> GdkDeviceClass.FFI.withPtr false
         &&&> GdkCursorClass.FFI.withPtr false
         ---> I
      )
        setDeviceCursor_
        (
          self
           & device
           & cursor
        )
    fun setDeviceEvents self (device, eventMask) =
      (
        GdkWindowClass.FFI.withPtr false
         &&&> GdkDeviceClass.FFI.withPtr false
         &&&> GdkEventMask.FFI.withVal
         ---> I
      )
        setDeviceEvents_
        (
          self
           & device
           & eventMask
        )
    fun setEventCompression self eventCompression = (GdkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setEventCompression_ (self & eventCompression)
    fun setEvents self eventMask = (GdkWindowClass.FFI.withPtr false &&&> GdkEventMask.FFI.withVal ---> I) setEvents_ (self & eventMask)
    fun setFocusOnMap self focusOnMap = (GdkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setFocusOnMap_ (self & focusOnMap)
    fun setFullscreenMode self mode = (GdkWindowClass.FFI.withPtr false &&&> GdkFullscreenMode.FFI.withVal ---> I) setFullscreenMode_ (self & mode)
    fun setFunctions self functions = (GdkWindowClass.FFI.withPtr false &&&> GdkWMFunction.FFI.withVal ---> I) setFunctions_ (self & functions)
    fun setGeometryHints self (geometry, geomMask) =
      (
        GdkWindowClass.FFI.withPtr false
         &&&> GdkGeometryRecord.FFI.withPtr false
         &&&> GdkWindowHints.FFI.withVal
         ---> I
      )
        setGeometryHints_
        (
          self
           & geometry
           & geomMask
        )
    fun setGroup self leader = (GdkWindowClass.FFI.withPtr false &&&> GdkWindowClass.FFI.withOptPtr false ---> I) setGroup_ (self & leader)
    fun setIconName self name = (GdkWindowClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setIconName_ (self & name)
    fun setKeepAbove self setting = (GdkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setKeepAbove_ (self & setting)
    fun setKeepBelow self setting = (GdkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setKeepBelow_ (self & setting)
    fun setModalHint self modal = (GdkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setModalHint_ (self & modal)
    fun setOpacity self opacity = (GdkWindowClass.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I) setOpacity_ (self & opacity)
    fun setOpaqueRegion self region = (GdkWindowClass.FFI.withPtr false &&&> CairoRegionRecord.FFI.withOptPtr false ---> I) setOpaqueRegion_ (self & region)
    fun setOverrideRedirect self overrideRedirect = (GdkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setOverrideRedirect_ (self & overrideRedirect)
    fun setPassThrough self passThrough = (GdkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setPassThrough_ (self & passThrough)
    fun setRole self role = (GdkWindowClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setRole_ (self & role)
    fun setShadowWidth
      self
      (
        left,
        right,
        top,
        bottom
      ) =
      (
        GdkWindowClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        setShadowWidth_
        (
          self
           & left
           & right
           & top
           & bottom
        )
    fun setSkipPagerHint self skipsPager = (GdkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setSkipPagerHint_ (self & skipsPager)
    fun setSkipTaskbarHint self skipsTaskbar = (GdkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setSkipTaskbarHint_ (self & skipsTaskbar)
    fun setSourceEvents self (source, eventMask) =
      (
        GdkWindowClass.FFI.withPtr false
         &&&> GdkInputSource.FFI.withVal
         &&&> GdkEventMask.FFI.withVal
         ---> I
      )
        setSourceEvents_
        (
          self
           & source
           & eventMask
        )
    fun setStartupId self startupId = (GdkWindowClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setStartupId_ (self & startupId)
    fun setStaticGravities self useStatic = (GdkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> GBool.FFI.fromVal) setStaticGravities_ (self & useStatic)
    fun setSupportMultidevice self supportMultidevice = (GdkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setSupportMultidevice_ (self & supportMultidevice)
    fun setTitle self title = (GdkWindowClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setTitle_ (self & title)
    fun setTransientFor self parent = (GdkWindowClass.FFI.withPtr false &&&> GdkWindowClass.FFI.withPtr false ---> I) setTransientFor_ (self & parent)
    fun setTypeHint self hint = (GdkWindowClass.FFI.withPtr false &&&> GdkWindowTypeHint.FFI.withVal ---> I) setTypeHint_ (self & hint)
    fun setUrgencyHint self urgent = (GdkWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setUrgencyHint_ (self & urgent)
    fun setUserData self userData = (GdkWindowClass.FFI.withPtr false &&&> GObjectObjectClass.FFI.withOptPtr false ---> I) setUserData_ (self & userData)
    fun shapeCombineRegion
      self
      (
        shapeRegion,
        offsetX,
        offsetY
      ) =
      (
        GdkWindowClass.FFI.withPtr false
         &&&> CairoRegionRecord.FFI.withOptPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        shapeCombineRegion_
        (
          self
           & shapeRegion
           & offsetX
           & offsetY
        )
    fun show self = (GdkWindowClass.FFI.withPtr false ---> I) show_ self
    fun showUnraised self = (GdkWindowClass.FFI.withPtr false ---> I) showUnraised_ self
    fun showWindowMenu self event = (GdkWindowClass.FFI.withPtr false &&&> GdkEvent.FFI.withPtr false ---> GBool.FFI.fromVal) showWindowMenu_ (self & event)
    fun stick self = (GdkWindowClass.FFI.withPtr false ---> I) stick_ self
    fun thawToplevelUpdatesLibgtkOnly self = (GdkWindowClass.FFI.withPtr false ---> I) thawToplevelUpdatesLibgtkOnly_ self
    fun thawUpdates self = (GdkWindowClass.FFI.withPtr false ---> I) thawUpdates_ self
    fun unfullscreen self = (GdkWindowClass.FFI.withPtr false ---> I) unfullscreen_ self
    fun unmaximize self = (GdkWindowClass.FFI.withPtr false ---> I) unmaximize_ self
    fun unstick self = (GdkWindowClass.FFI.withPtr false ---> I) unstick_ self
    fun withdraw self = (GdkWindowClass.FFI.withPtr false ---> I) withdraw_ self
    local
      open ClosureMarshal Signal
    in
      fun createSurfaceSig f = signal "create-surface" (get 0w1 int &&&> get 0w2 int ---> ret CairoSurfaceRecord.t) (fn width & height => f (width, height))
      fun fromEmbedderSig f =
        signal "from-embedder"
          (
            get 0w1 double &&&> get 0w2 double
             ---> set 0w3 double
                   && set 0w4 double
                   && ret_void
          )
          (
            fn
              embedderX & embedderY =>
                let
                  val (offscreenX, offscreenY) = f (embedderX, embedderY)
                in
                  offscreenX
                   & offscreenY
                   & ()
                end
          )
      fun pickEmbeddedChildSig f = signal "pick-embedded-child" (get 0w1 double &&&> get 0w2 double ---> ret GdkWindowClass.tOpt) (fn x & y => f (x, y))
      fun toEmbedderSig f =
        signal "to-embedder"
          (
            get 0w1 double &&&> get 0w2 double
             ---> set 0w3 double
                   && set 0w4 double
                   && ret_void
          )
          (
            fn
              offscreenX & offscreenY =>
                let
                  val (embedderX, embedderY) = f (offscreenX, offscreenY)
                in
                  embedderX
                   & embedderY
                   & ()
                end
          )
    end
    local
      open ValueAccessor
    in
      val cursorProp =
        {
          name = "cursor",
          gtype = fn () => C.gtype GdkCursorClass.tOpt (),
          get = fn x => fn () => C.get GdkCursorClass.tOpt x,
          set = fn x => C.set GdkCursorClass.tOpt x,
          init = fn x => C.set GdkCursorClass.tOpt x
        }
    end
  end
