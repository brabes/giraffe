structure GtkWindow :>
  GTK_WINDOW
    where type 'a class = 'a GtkWindowClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a window_group_class = 'a GtkWindowGroupClass.class
    where type 'a accel_group_class = 'a GtkAccelGroupClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type 'a application_class = 'a GtkApplicationClass.class
    where type window_type_t = GtkWindowType.t
    where type window_position_t = GtkWindowPosition.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_window_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_window_new") (GtkWindowType.PolyML.cVal --> GtkWidgetClass.PolyML.cPtr)
      val getDefaultIconName_ = call (getSymbol "gtk_window_get_default_icon_name") (PolyMLFFI.cVoid --> Utf8.PolyML.cOutPtr)
      val setAutoStartupNotification_ = call (getSymbol "gtk_window_set_auto_startup_notification") (GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setDefaultIcon_ = call (getSymbol "gtk_window_set_default_icon") (GdkPixbufPixbufClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setDefaultIconFromFile_ = call (getSymbol "gtk_window_set_default_icon_from_file") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GBool.PolyML.cVal)
      val setDefaultIconName_ = call (getSymbol "gtk_window_set_default_icon_name") (Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val activateDefault_ = call (getSymbol "gtk_window_activate_default") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val activateFocus_ = call (getSymbol "gtk_window_activate_focus") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val activateKey_ = call (getSymbol "gtk_window_activate_key") (GtkWindowClass.PolyML.cPtr &&> GdkEventKeyRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val addAccelGroup_ = call (getSymbol "gtk_window_add_accel_group") (GtkWindowClass.PolyML.cPtr &&> GtkAccelGroupClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val addMnemonic_ =
        call (getSymbol "gtk_window_add_mnemonic")
          (
            GtkWindowClass.PolyML.cPtr
             &&> GUInt.PolyML.cVal
             &&> GtkWidgetClass.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val beginMoveDrag_ =
        call (getSymbol "gtk_window_begin_move_drag")
          (
            GtkWindowClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val beginResizeDrag_ =
        call (getSymbol "gtk_window_begin_resize_drag")
          (
            GtkWindowClass.PolyML.cPtr
             &&> GdkWindowEdge.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val deiconify_ = call (getSymbol "gtk_window_deiconify") (GtkWindowClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val fullscreen_ = call (getSymbol "gtk_window_fullscreen") (GtkWindowClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val getAcceptFocus_ = call (getSymbol "gtk_window_get_accept_focus") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getApplication_ = call (getSymbol "gtk_window_get_application") (GtkWindowClass.PolyML.cPtr --> GtkApplicationClass.PolyML.cPtr)
      val getDecorated_ = call (getSymbol "gtk_window_get_decorated") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getDefaultSize_ =
        call (getSymbol "gtk_window_get_default_size")
          (
            GtkWindowClass.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val getDefaultWidget_ = call (getSymbol "gtk_window_get_default_widget") (GtkWindowClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getDeletable_ = call (getSymbol "gtk_window_get_deletable") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getDestroyWithParent_ = call (getSymbol "gtk_window_get_destroy_with_parent") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getFocus_ = call (getSymbol "gtk_window_get_focus") (GtkWindowClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getFocusOnMap_ = call (getSymbol "gtk_window_get_focus_on_map") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getFocusVisible_ = call (getSymbol "gtk_window_get_focus_visible") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getGravity_ = call (getSymbol "gtk_window_get_gravity") (GtkWindowClass.PolyML.cPtr --> GdkGravity.PolyML.cVal)
      val getGroup_ = call (getSymbol "gtk_window_get_group") (GtkWindowClass.PolyML.cPtr --> GtkWindowGroupClass.PolyML.cPtr)
      val getHasResizeGrip_ = call (getSymbol "gtk_window_get_has_resize_grip") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getIcon_ = call (getSymbol "gtk_window_get_icon") (GtkWindowClass.PolyML.cPtr --> GdkPixbufPixbufClass.PolyML.cPtr)
      val getIconName_ = call (getSymbol "gtk_window_get_icon_name") (GtkWindowClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getMnemonicModifier_ = call (getSymbol "gtk_window_get_mnemonic_modifier") (GtkWindowClass.PolyML.cPtr --> GdkModifierType.PolyML.cVal)
      val getMnemonicsVisible_ = call (getSymbol "gtk_window_get_mnemonics_visible") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getModal_ = call (getSymbol "gtk_window_get_modal") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getOpacity_ = call (getSymbol "gtk_window_get_opacity") (GtkWindowClass.PolyML.cPtr --> GDouble.PolyML.cVal)
      val getPosition_ =
        call (getSymbol "gtk_window_get_position")
          (
            GtkWindowClass.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val getResizable_ = call (getSymbol "gtk_window_get_resizable") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getResizeGripArea_ = call (getSymbol "gtk_window_get_resize_grip_area") (GtkWindowClass.PolyML.cPtr &&> GdkRectangleRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getRole_ = call (getSymbol "gtk_window_get_role") (GtkWindowClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getScreen_ = call (getSymbol "gtk_window_get_screen") (GtkWindowClass.PolyML.cPtr --> GdkScreenClass.PolyML.cPtr)
      val getSize_ =
        call (getSymbol "gtk_window_get_size")
          (
            GtkWindowClass.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val getSkipPagerHint_ = call (getSymbol "gtk_window_get_skip_pager_hint") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getSkipTaskbarHint_ = call (getSymbol "gtk_window_get_skip_taskbar_hint") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getTitle_ = call (getSymbol "gtk_window_get_title") (GtkWindowClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getTransientFor_ = call (getSymbol "gtk_window_get_transient_for") (GtkWindowClass.PolyML.cPtr --> GtkWindowClass.PolyML.cPtr)
      val getTypeHint_ = call (getSymbol "gtk_window_get_type_hint") (GtkWindowClass.PolyML.cPtr --> GdkWindowTypeHint.PolyML.cVal)
      val getUrgencyHint_ = call (getSymbol "gtk_window_get_urgency_hint") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getWindowType_ = call (getSymbol "gtk_window_get_window_type") (GtkWindowClass.PolyML.cPtr --> GtkWindowType.PolyML.cVal)
      val hasGroup_ = call (getSymbol "gtk_window_has_group") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val hasToplevelFocus_ = call (getSymbol "gtk_window_has_toplevel_focus") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val iconify_ = call (getSymbol "gtk_window_iconify") (GtkWindowClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val isActive_ = call (getSymbol "gtk_window_is_active") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val maximize_ = call (getSymbol "gtk_window_maximize") (GtkWindowClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val mnemonicActivate_ =
        call (getSymbol "gtk_window_mnemonic_activate")
          (
            GtkWindowClass.PolyML.cPtr
             &&> GUInt.PolyML.cVal
             &&> GdkModifierType.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val move_ =
        call (getSymbol "gtk_window_move")
          (
            GtkWindowClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val parseGeometry_ = call (getSymbol "gtk_window_parse_geometry") (GtkWindowClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val present_ = call (getSymbol "gtk_window_present") (GtkWindowClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val presentWithTime_ = call (getSymbol "gtk_window_present_with_time") (GtkWindowClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> PolyMLFFI.cVoid)
      val propagateKeyEvent_ = call (getSymbol "gtk_window_propagate_key_event") (GtkWindowClass.PolyML.cPtr &&> GdkEventKeyRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val removeAccelGroup_ = call (getSymbol "gtk_window_remove_accel_group") (GtkWindowClass.PolyML.cPtr &&> GtkAccelGroupClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val removeMnemonic_ =
        call (getSymbol "gtk_window_remove_mnemonic")
          (
            GtkWindowClass.PolyML.cPtr
             &&> GUInt.PolyML.cVal
             &&> GtkWidgetClass.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val reshowWithInitialSize_ = call (getSymbol "gtk_window_reshow_with_initial_size") (GtkWindowClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val resize_ =
        call (getSymbol "gtk_window_resize")
          (
            GtkWindowClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val resizeGripIsVisible_ = call (getSymbol "gtk_window_resize_grip_is_visible") (GtkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val resizeToGeometry_ =
        call (getSymbol "gtk_window_resize_to_geometry")
          (
            GtkWindowClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setAcceptFocus_ = call (getSymbol "gtk_window_set_accept_focus") (GtkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setApplication_ = call (getSymbol "gtk_window_set_application") (GtkWindowClass.PolyML.cPtr &&> GtkApplicationClass.PolyML.cOptPtr --> PolyMLFFI.cVoid)
      val setDecorated_ = call (getSymbol "gtk_window_set_decorated") (GtkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setDefault_ = call (getSymbol "gtk_window_set_default") (GtkWindowClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cOptPtr --> PolyMLFFI.cVoid)
      val setDefaultGeometry_ =
        call (getSymbol "gtk_window_set_default_geometry")
          (
            GtkWindowClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setDefaultSize_ =
        call (getSymbol "gtk_window_set_default_size")
          (
            GtkWindowClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setDeletable_ = call (getSymbol "gtk_window_set_deletable") (GtkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setDestroyWithParent_ = call (getSymbol "gtk_window_set_destroy_with_parent") (GtkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setFocus_ = call (getSymbol "gtk_window_set_focus") (GtkWindowClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cOptPtr --> PolyMLFFI.cVoid)
      val setFocusOnMap_ = call (getSymbol "gtk_window_set_focus_on_map") (GtkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setFocusVisible_ = call (getSymbol "gtk_window_set_focus_visible") (GtkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setGeometryHints_ =
        call (getSymbol "gtk_window_set_geometry_hints")
          (
            GtkWindowClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cOptPtr
             &&> GdkGeometryRecord.PolyML.cOptPtr
             &&> GdkWindowHints.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setGravity_ = call (getSymbol "gtk_window_set_gravity") (GtkWindowClass.PolyML.cPtr &&> GdkGravity.PolyML.cVal --> PolyMLFFI.cVoid)
      val setHasResizeGrip_ = call (getSymbol "gtk_window_set_has_resize_grip") (GtkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setHasUserRefCount_ = call (getSymbol "gtk_window_set_has_user_ref_count") (GtkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setIcon_ = call (getSymbol "gtk_window_set_icon") (GtkWindowClass.PolyML.cPtr &&> GdkPixbufPixbufClass.PolyML.cOptPtr --> PolyMLFFI.cVoid)
      val setIconFromFile_ =
        call (getSymbol "gtk_window_set_icon_from_file")
          (
            GtkWindowClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val setIconName_ = call (getSymbol "gtk_window_set_icon_name") (GtkWindowClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> PolyMLFFI.cVoid)
      val setKeepAbove_ = call (getSymbol "gtk_window_set_keep_above") (GtkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setKeepBelow_ = call (getSymbol "gtk_window_set_keep_below") (GtkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setMnemonicModifier_ = call (getSymbol "gtk_window_set_mnemonic_modifier") (GtkWindowClass.PolyML.cPtr &&> GdkModifierType.PolyML.cVal --> PolyMLFFI.cVoid)
      val setMnemonicsVisible_ = call (getSymbol "gtk_window_set_mnemonics_visible") (GtkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setModal_ = call (getSymbol "gtk_window_set_modal") (GtkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setOpacity_ = call (getSymbol "gtk_window_set_opacity") (GtkWindowClass.PolyML.cPtr &&> GDouble.PolyML.cVal --> PolyMLFFI.cVoid)
      val setPosition_ = call (getSymbol "gtk_window_set_position") (GtkWindowClass.PolyML.cPtr &&> GtkWindowPosition.PolyML.cVal --> PolyMLFFI.cVoid)
      val setResizable_ = call (getSymbol "gtk_window_set_resizable") (GtkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setRole_ = call (getSymbol "gtk_window_set_role") (GtkWindowClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setScreen_ = call (getSymbol "gtk_window_set_screen") (GtkWindowClass.PolyML.cPtr &&> GdkScreenClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setSkipPagerHint_ = call (getSymbol "gtk_window_set_skip_pager_hint") (GtkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setSkipTaskbarHint_ = call (getSymbol "gtk_window_set_skip_taskbar_hint") (GtkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setStartupId_ = call (getSymbol "gtk_window_set_startup_id") (GtkWindowClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setTitle_ = call (getSymbol "gtk_window_set_title") (GtkWindowClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setTransientFor_ = call (getSymbol "gtk_window_set_transient_for") (GtkWindowClass.PolyML.cPtr &&> GtkWindowClass.PolyML.cOptPtr --> PolyMLFFI.cVoid)
      val setTypeHint_ = call (getSymbol "gtk_window_set_type_hint") (GtkWindowClass.PolyML.cPtr &&> GdkWindowTypeHint.PolyML.cVal --> PolyMLFFI.cVoid)
      val setUrgencyHint_ = call (getSymbol "gtk_window_set_urgency_hint") (GtkWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setWmclass_ =
        call (getSymbol "gtk_window_set_wmclass")
          (
            GtkWindowClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> PolyMLFFI.cVoid
          )
      val stick_ = call (getSymbol "gtk_window_stick") (GtkWindowClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val unfullscreen_ = call (getSymbol "gtk_window_unfullscreen") (GtkWindowClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val unmaximize_ = call (getSymbol "gtk_window_unmaximize") (GtkWindowClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val unstick_ = call (getSymbol "gtk_window_unstick") (GtkWindowClass.PolyML.cPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkWindowClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a window_group_class = 'a GtkWindowGroupClass.class
    type 'a accel_group_class = 'a GtkAccelGroupClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a application_class = 'a GtkApplicationClass.class
    type window_type_t = GtkWindowType.t
    type window_position_t = GtkWindowPosition.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new type' = (GtkWindowType.FFI.withVal ---> GtkWindowClass.FFI.fromPtr false) new_ type'
    fun getDefaultIconName () = (I ---> Utf8.FFI.fromPtr 0) getDefaultIconName_ ()
    fun setAutoStartupNotification setting = (GBool.FFI.withVal ---> I) setAutoStartupNotification_ setting
    fun setDefaultIcon icon = (GdkPixbufPixbufClass.FFI.withPtr ---> I) setDefaultIcon_ icon
    fun setDefaultIconFromFile filename = (Utf8.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GBool.FFI.fromVal) setDefaultIconFromFile_ (filename & [])
    fun setDefaultIconName name = (Utf8.FFI.withPtr ---> I) setDefaultIconName_ name
    fun activateDefault self = (GtkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) activateDefault_ self
    fun activateFocus self = (GtkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) activateFocus_ self
    fun activateKey self event = (GtkWindowClass.FFI.withPtr &&&> GdkEventKeyRecord.FFI.withPtr ---> GBool.FFI.fromVal) activateKey_ (self & event)
    fun addAccelGroup self accelGroup = (GtkWindowClass.FFI.withPtr &&&> GtkAccelGroupClass.FFI.withPtr ---> I) addAccelGroup_ (self & accelGroup)
    fun addMnemonic self keyval target =
      (
        GtkWindowClass.FFI.withPtr
         &&&> GUInt.FFI.withVal
         &&&> GtkWidgetClass.FFI.withPtr
         ---> I
      )
        addMnemonic_
        (
          self
           & keyval
           & target
        )
    fun beginMoveDrag self button rootX rootY timestamp =
      (
        GtkWindowClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
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
    fun beginResizeDrag self edge button rootX rootY timestamp =
      (
        GtkWindowClass.FFI.withPtr
         &&&> GdkWindowEdge.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
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
    fun deiconify self = (GtkWindowClass.FFI.withPtr ---> I) deiconify_ self
    fun fullscreen self = (GtkWindowClass.FFI.withPtr ---> I) fullscreen_ self
    fun getAcceptFocus self = (GtkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) getAcceptFocus_ self
    fun getApplication self = (GtkWindowClass.FFI.withPtr ---> GtkApplicationClass.FFI.fromPtr false) getApplication_ self
    fun getDecorated self = (GtkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) getDecorated_ self
    fun getDefaultSize self =
      let
        val width
         & height
         & () =
          (
            GtkWindowClass.FFI.withPtr
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getDefaultSize_
            (
              self
               & GInt.null
               & GInt.null
            )
      in
        (width, height)
      end
    fun getDefaultWidget self = (GtkWindowClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getDefaultWidget_ self
    fun getDeletable self = (GtkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) getDeletable_ self
    fun getDestroyWithParent self = (GtkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) getDestroyWithParent_ self
    fun getFocus self = (GtkWindowClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getFocus_ self
    fun getFocusOnMap self = (GtkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) getFocusOnMap_ self
    fun getFocusVisible self = (GtkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) getFocusVisible_ self
    fun getGravity self = (GtkWindowClass.FFI.withPtr ---> GdkGravity.FFI.fromVal) getGravity_ self
    fun getGroup self = (GtkWindowClass.FFI.withPtr ---> GtkWindowGroupClass.FFI.fromPtr false) getGroup_ self
    fun getHasResizeGrip self = (GtkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) getHasResizeGrip_ self
    fun getIcon self = (GtkWindowClass.FFI.withPtr ---> GdkPixbufPixbufClass.FFI.fromPtr false) getIcon_ self
    fun getIconName self = (GtkWindowClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getIconName_ self
    fun getMnemonicModifier self = (GtkWindowClass.FFI.withPtr ---> GdkModifierType.FFI.fromVal) getMnemonicModifier_ self
    fun getMnemonicsVisible self = (GtkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) getMnemonicsVisible_ self
    fun getModal self = (GtkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) getModal_ self
    fun getOpacity self = (GtkWindowClass.FFI.withPtr ---> GDouble.FFI.fromVal) getOpacity_ self
    fun getPosition self =
      let
        val rootX
         & rootY
         & () =
          (
            GtkWindowClass.FFI.withPtr
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getPosition_
            (
              self
               & GInt.null
               & GInt.null
            )
      in
        (rootX, rootY)
      end
    fun getResizable self = (GtkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) getResizable_ self
    fun getResizeGripArea self =
      let
        val rect & retVal = (GtkWindowClass.FFI.withPtr &&&> GdkRectangleRecord.FFI.withNewPtr ---> GdkRectangleRecord.FFI.fromPtr true && GBool.FFI.fromVal) getResizeGripArea_ (self & ())
      in
        if retVal then SOME rect else NONE
      end
    fun getRole self = (GtkWindowClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getRole_ self
    fun getScreen self = (GtkWindowClass.FFI.withPtr ---> GdkScreenClass.FFI.fromPtr false) getScreen_ self
    fun getSize self =
      let
        val width
         & height
         & () =
          (
            GtkWindowClass.FFI.withPtr
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getSize_
            (
              self
               & GInt.null
               & GInt.null
            )
      in
        (width, height)
      end
    fun getSkipPagerHint self = (GtkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) getSkipPagerHint_ self
    fun getSkipTaskbarHint self = (GtkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) getSkipTaskbarHint_ self
    fun getTitle self = (GtkWindowClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getTitle_ self
    fun getTransientFor self = (GtkWindowClass.FFI.withPtr ---> GtkWindowClass.FFI.fromPtr false) getTransientFor_ self
    fun getTypeHint self = (GtkWindowClass.FFI.withPtr ---> GdkWindowTypeHint.FFI.fromVal) getTypeHint_ self
    fun getUrgencyHint self = (GtkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) getUrgencyHint_ self
    fun getWindowType self = (GtkWindowClass.FFI.withPtr ---> GtkWindowType.FFI.fromVal) getWindowType_ self
    fun hasGroup self = (GtkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) hasGroup_ self
    fun hasToplevelFocus self = (GtkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) hasToplevelFocus_ self
    fun iconify self = (GtkWindowClass.FFI.withPtr ---> I) iconify_ self
    fun isActive self = (GtkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) isActive_ self
    fun maximize self = (GtkWindowClass.FFI.withPtr ---> I) maximize_ self
    fun mnemonicActivate self keyval modifier =
      (
        GtkWindowClass.FFI.withPtr
         &&&> GUInt.FFI.withVal
         &&&> GdkModifierType.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        mnemonicActivate_
        (
          self
           & keyval
           & modifier
        )
    fun move self x y =
      (
        GtkWindowClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        move_
        (
          self
           & x
           & y
        )
    fun parseGeometry self geometry = (GtkWindowClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) parseGeometry_ (self & geometry)
    fun present self = (GtkWindowClass.FFI.withPtr ---> I) present_ self
    fun presentWithTime self timestamp = (GtkWindowClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) presentWithTime_ (self & timestamp)
    fun propagateKeyEvent self event = (GtkWindowClass.FFI.withPtr &&&> GdkEventKeyRecord.FFI.withPtr ---> GBool.FFI.fromVal) propagateKeyEvent_ (self & event)
    fun removeAccelGroup self accelGroup = (GtkWindowClass.FFI.withPtr &&&> GtkAccelGroupClass.FFI.withPtr ---> I) removeAccelGroup_ (self & accelGroup)
    fun removeMnemonic self keyval target =
      (
        GtkWindowClass.FFI.withPtr
         &&&> GUInt.FFI.withVal
         &&&> GtkWidgetClass.FFI.withPtr
         ---> I
      )
        removeMnemonic_
        (
          self
           & keyval
           & target
        )
    fun reshowWithInitialSize self = (GtkWindowClass.FFI.withPtr ---> I) reshowWithInitialSize_ self
    fun resize self width height =
      (
        GtkWindowClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        resize_
        (
          self
           & width
           & height
        )
    fun resizeGripIsVisible self = (GtkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) resizeGripIsVisible_ self
    fun resizeToGeometry self width height =
      (
        GtkWindowClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        resizeToGeometry_
        (
          self
           & width
           & height
        )
    fun setAcceptFocus self setting = (GtkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setAcceptFocus_ (self & setting)
    fun setApplication self application = (GtkWindowClass.FFI.withPtr &&&> GtkApplicationClass.FFI.withOptPtr ---> I) setApplication_ (self & application)
    fun setDecorated self setting = (GtkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setDecorated_ (self & setting)
    fun setDefault self defaultWidget = (GtkWindowClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withOptPtr ---> I) setDefault_ (self & defaultWidget)
    fun setDefaultGeometry self width height =
      (
        GtkWindowClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        setDefaultGeometry_
        (
          self
           & width
           & height
        )
    fun setDefaultSize self width height =
      (
        GtkWindowClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        setDefaultSize_
        (
          self
           & width
           & height
        )
    fun setDeletable self setting = (GtkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setDeletable_ (self & setting)
    fun setDestroyWithParent self setting = (GtkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setDestroyWithParent_ (self & setting)
    fun setFocus self focus = (GtkWindowClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withOptPtr ---> I) setFocus_ (self & focus)
    fun setFocusOnMap self setting = (GtkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setFocusOnMap_ (self & setting)
    fun setFocusVisible self setting = (GtkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setFocusVisible_ (self & setting)
    fun setGeometryHints self geometryWidget geometry geomMask =
      (
        GtkWindowClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withOptPtr
         &&&> GdkGeometryRecord.FFI.withOptPtr
         &&&> GdkWindowHints.FFI.withVal
         ---> I
      )
        setGeometryHints_
        (
          self
           & geometryWidget
           & geometry
           & geomMask
        )
    fun setGravity self gravity = (GtkWindowClass.FFI.withPtr &&&> GdkGravity.FFI.withVal ---> I) setGravity_ (self & gravity)
    fun setHasResizeGrip self value = (GtkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setHasResizeGrip_ (self & value)
    fun setHasUserRefCount self setting = (GtkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setHasUserRefCount_ (self & setting)
    fun setIcon self icon = (GtkWindowClass.FFI.withPtr &&&> GdkPixbufPixbufClass.FFI.withOptPtr ---> I) setIcon_ (self & icon)
    fun setIconFromFile self filename =
      (
        GtkWindowClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
      )
        setIconFromFile_
        (
          self
           & filename
           & []
        )
    fun setIconName self name = (GtkWindowClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setIconName_ (self & name)
    fun setKeepAbove self setting = (GtkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setKeepAbove_ (self & setting)
    fun setKeepBelow self setting = (GtkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setKeepBelow_ (self & setting)
    fun setMnemonicModifier self modifier = (GtkWindowClass.FFI.withPtr &&&> GdkModifierType.FFI.withVal ---> I) setMnemonicModifier_ (self & modifier)
    fun setMnemonicsVisible self setting = (GtkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setMnemonicsVisible_ (self & setting)
    fun setModal self modal = (GtkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setModal_ (self & modal)
    fun setOpacity self opacity = (GtkWindowClass.FFI.withPtr &&&> GDouble.FFI.withVal ---> I) setOpacity_ (self & opacity)
    fun setPosition self position = (GtkWindowClass.FFI.withPtr &&&> GtkWindowPosition.FFI.withVal ---> I) setPosition_ (self & position)
    fun setResizable self resizable = (GtkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setResizable_ (self & resizable)
    fun setRole self role = (GtkWindowClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setRole_ (self & role)
    fun setScreen self screen = (GtkWindowClass.FFI.withPtr &&&> GdkScreenClass.FFI.withPtr ---> I) setScreen_ (self & screen)
    fun setSkipPagerHint self setting = (GtkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setSkipPagerHint_ (self & setting)
    fun setSkipTaskbarHint self setting = (GtkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setSkipTaskbarHint_ (self & setting)
    fun setStartupId self startupId = (GtkWindowClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setStartupId_ (self & startupId)
    fun setTitle self title = (GtkWindowClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setTitle_ (self & title)
    fun setTransientFor self parent = (GtkWindowClass.FFI.withPtr &&&> GtkWindowClass.FFI.withOptPtr ---> I) setTransientFor_ (self & parent)
    fun setTypeHint self hint = (GtkWindowClass.FFI.withPtr &&&> GdkWindowTypeHint.FFI.withVal ---> I) setTypeHint_ (self & hint)
    fun setUrgencyHint self setting = (GtkWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setUrgencyHint_ (self & setting)
    fun setWmclass self wmclassName wmclassClass =
      (
        GtkWindowClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        setWmclass_
        (
          self
           & wmclassName
           & wmclassClass
        )
    fun stick self = (GtkWindowClass.FFI.withPtr ---> I) stick_ self
    fun unfullscreen self = (GtkWindowClass.FFI.withPtr ---> I) unfullscreen_ self
    fun unmaximize self = (GtkWindowClass.FFI.withPtr ---> I) unmaximize_ self
    fun unstick self = (GtkWindowClass.FFI.withPtr ---> I) unstick_ self
    local
      open ClosureMarshal Signal
    in
      fun activateDefaultSig f = signal "activate-default" (void ---> ret_void) f
      fun activateFocusSig f = signal "activate-focus" (void ---> ret_void) f
      fun keysChangedSig f = signal "keys-changed" (void ---> ret_void) f
      fun setFocusSig f = signal "set-focus" (get 0w1 GtkWidgetClass.t ---> ret_void) f
    end
    local
      open Property
    in
      val acceptFocusProp =
        {
          get = fn x => get "accept-focus" boolean x,
          set = fn x => set "accept-focus" boolean x
        }
      val applicationProp =
        {
          get = fn x => get "application" GtkApplicationClass.tOpt x,
          set = fn x => set "application" GtkApplicationClass.tOpt x
        }
      val decoratedProp =
        {
          get = fn x => get "decorated" boolean x,
          set = fn x => set "decorated" boolean x
        }
      val defaultHeightProp =
        {
          get = fn x => get "default-height" int x,
          set = fn x => set "default-height" int x
        }
      val defaultWidthProp =
        {
          get = fn x => get "default-width" int x,
          set = fn x => set "default-width" int x
        }
      val deletableProp =
        {
          get = fn x => get "deletable" boolean x,
          set = fn x => set "deletable" boolean x
        }
      val destroyWithParentProp =
        {
          get = fn x => get "destroy-with-parent" boolean x,
          set = fn x => set "destroy-with-parent" boolean x
        }
      val focusOnMapProp =
        {
          get = fn x => get "focus-on-map" boolean x,
          set = fn x => set "focus-on-map" boolean x
        }
      val focusVisibleProp =
        {
          get = fn x => get "focus-visible" boolean x,
          set = fn x => set "focus-visible" boolean x
        }
      val gravityProp =
        {
          get = fn x => get "gravity" GdkGravity.t x,
          set = fn x => set "gravity" GdkGravity.t x
        }
      val hasResizeGripProp =
        {
          get = fn x => get "has-resize-grip" boolean x,
          set = fn x => set "has-resize-grip" boolean x
        }
      val hasToplevelFocusProp = {get = fn x => get "has-toplevel-focus" boolean x}
      val iconProp =
        {
          get = fn x => get "icon" GdkPixbufPixbufClass.tOpt x,
          set = fn x => set "icon" GdkPixbufPixbufClass.tOpt x
        }
      val iconNameProp =
        {
          get = fn x => get "icon-name" stringOpt x,
          set = fn x => set "icon-name" stringOpt x
        }
      val isActiveProp = {get = fn x => get "is-active" boolean x}
      val mnemonicsVisibleProp =
        {
          get = fn x => get "mnemonics-visible" boolean x,
          set = fn x => set "mnemonics-visible" boolean x
        }
      val modalProp =
        {
          get = fn x => get "modal" boolean x,
          set = fn x => set "modal" boolean x
        }
      val opacityProp =
        {
          get = fn x => get "opacity" double x,
          set = fn x => set "opacity" double x
        }
      val resizableProp =
        {
          get = fn x => get "resizable" boolean x,
          set = fn x => set "resizable" boolean x
        }
      val resizeGripVisibleProp = {get = fn x => get "resize-grip-visible" boolean x}
      val roleProp =
        {
          get = fn x => get "role" stringOpt x,
          set = fn x => set "role" stringOpt x
        }
      val screenProp =
        {
          get = fn x => get "screen" GdkScreenClass.tOpt x,
          set = fn x => set "screen" GdkScreenClass.tOpt x
        }
      val skipPagerHintProp =
        {
          get = fn x => get "skip-pager-hint" boolean x,
          set = fn x => set "skip-pager-hint" boolean x
        }
      val skipTaskbarHintProp =
        {
          get = fn x => get "skip-taskbar-hint" boolean x,
          set = fn x => set "skip-taskbar-hint" boolean x
        }
      val startupIdProp = {set = fn x => set "startup-id" stringOpt x}
      val titleProp =
        {
          get = fn x => get "title" stringOpt x,
          set = fn x => set "title" stringOpt x
        }
      val transientForProp =
        {
          get = fn x => get "transient-for" GtkWindowClass.tOpt x,
          set = fn x => set "transient-for" GtkWindowClass.tOpt x
        }
      val typeProp =
        {
          get = fn x => get "type" GtkWindowType.t x,
          set = fn x => set "type" GtkWindowType.t x
        }
      val typeHintProp =
        {
          get = fn x => get "type-hint" GdkWindowTypeHint.t x,
          set = fn x => set "type-hint" GdkWindowTypeHint.t x
        }
      val urgencyHintProp =
        {
          get = fn x => get "urgency-hint" boolean x,
          set = fn x => set "urgency-hint" boolean x
        }
      val windowPositionProp =
        {
          get = fn x => get "window-position" GtkWindowPosition.t x,
          set = fn x => set "window-position" GtkWindowPosition.t x
        }
    end
  end
