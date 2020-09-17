structure GtkMenu :>
  GTK_MENU
    where type 'a class = 'a GtkMenuClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type scroll_type_t = GtkScrollType.t
    where type 'a accel_group_class = 'a GtkAccelGroupClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_menu_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_menu_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val newFromModel_ = call (getSymbol "gtk_menu_new_from_model") (GioMenuModelClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val attach_ =
        call (getSymbol "gtk_menu_attach")
          (
            GtkMenuClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             --> cVoid
          )
      val detach_ = call (getSymbol "gtk_menu_detach") (GtkMenuClass.PolyML.cPtr --> cVoid)
      val getAccelGroup_ = call (getSymbol "gtk_menu_get_accel_group") (GtkMenuClass.PolyML.cPtr --> GtkAccelGroupClass.PolyML.cPtr)
      val getAccelPath_ = call (getSymbol "gtk_menu_get_accel_path") (GtkMenuClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getActive_ = call (getSymbol "gtk_menu_get_active") (GtkMenuClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getAttachWidget_ = call (getSymbol "gtk_menu_get_attach_widget") (GtkMenuClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getMonitor_ = call (getSymbol "gtk_menu_get_monitor") (GtkMenuClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getReserveToggleSize_ = call (getSymbol "gtk_menu_get_reserve_toggle_size") (GtkMenuClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getTearoffState_ = call (getSymbol "gtk_menu_get_tearoff_state") (GtkMenuClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getTitle_ = call (getSymbol "gtk_menu_get_title") (GtkMenuClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val placeOnMonitor_ = call (getSymbol "gtk_menu_place_on_monitor") (GtkMenuClass.PolyML.cPtr &&> GdkMonitorClass.PolyML.cPtr --> cVoid)
      val popdown_ = call (getSymbol "gtk_menu_popdown") (GtkMenuClass.PolyML.cPtr --> cVoid)
      val popupAtPointer_ = call (getSymbol "gtk_menu_popup_at_pointer") (GtkMenuClass.PolyML.cPtr &&> GdkEvent.PolyML.cOptPtr --> cVoid)
      val popupAtRect_ =
        call (getSymbol "gtk_menu_popup_at_rect")
          (
            GtkMenuClass.PolyML.cPtr
             &&> GdkWindowClass.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             &&> GdkGravity.PolyML.cVal
             &&> GdkGravity.PolyML.cVal
             &&> GdkEvent.PolyML.cOptPtr
             --> cVoid
          )
      val popupAtWidget_ =
        call (getSymbol "gtk_menu_popup_at_widget")
          (
            GtkMenuClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GdkGravity.PolyML.cVal
             &&> GdkGravity.PolyML.cVal
             &&> GdkEvent.PolyML.cOptPtr
             --> cVoid
          )
      val reorderChild_ =
        call (getSymbol "gtk_menu_reorder_child")
          (
            GtkMenuClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val reposition_ = call (getSymbol "gtk_menu_reposition") (GtkMenuClass.PolyML.cPtr --> cVoid)
      val setAccelGroup_ = call (getSymbol "gtk_menu_set_accel_group") (GtkMenuClass.PolyML.cPtr &&> GtkAccelGroupClass.PolyML.cOptPtr --> cVoid)
      val setAccelPath_ = call (getSymbol "gtk_menu_set_accel_path") (GtkMenuClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setActive_ = call (getSymbol "gtk_menu_set_active") (GtkMenuClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val setMonitor_ = call (getSymbol "gtk_menu_set_monitor") (GtkMenuClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setReserveToggleSize_ = call (getSymbol "gtk_menu_set_reserve_toggle_size") (GtkMenuClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setScreen_ = call (getSymbol "gtk_menu_set_screen") (GtkMenuClass.PolyML.cPtr &&> GdkScreenClass.PolyML.cOptPtr --> cVoid)
      val setTearoffState_ = call (getSymbol "gtk_menu_set_tearoff_state") (GtkMenuClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setTitle_ = call (getSymbol "gtk_menu_set_title") (GtkMenuClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
    end
    type 'a class = 'a GtkMenuClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type scroll_type_t = GtkScrollType.t
    type 'a accel_group_class = 'a GtkAccelGroupClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkMenuClass.FFI.fromPtr false) new_ ()
    fun newFromModel model = (GioMenuModelClass.FFI.withPtr false ---> GtkMenuClass.FFI.fromPtr false) newFromModel_ model before GioMenuModelClass.FFI.touchPtr model
    fun attach
      self
      (
        child,
        leftAttach,
        rightAttach,
        topAttach,
        bottomAttach
      ) =
      (
        GtkMenuClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GUInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         ---> I
      )
        attach_
        (
          self
           & child
           & leftAttach
           & rightAttach
           & topAttach
           & bottomAttach
        )
    fun detach self = (GtkMenuClass.FFI.withPtr false ---> I) detach_ self
    fun getAccelGroup self = (GtkMenuClass.FFI.withPtr false ---> GtkAccelGroupClass.FFI.fromPtr false) getAccelGroup_ self before GtkMenuClass.FFI.touchPtr self
    fun getAccelPath self = (GtkMenuClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getAccelPath_ self before GtkMenuClass.FFI.touchPtr self
    fun getActive self = (GtkMenuClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false) getActive_ self before GtkMenuClass.FFI.touchPtr self
    fun getAttachWidget self = (GtkMenuClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false) getAttachWidget_ self before GtkMenuClass.FFI.touchPtr self
    fun getMonitor self = (GtkMenuClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getMonitor_ self
    fun getReserveToggleSize self = (GtkMenuClass.FFI.withPtr false ---> GBool.FFI.fromVal) getReserveToggleSize_ self
    fun getTearoffState self = (GtkMenuClass.FFI.withPtr false ---> GBool.FFI.fromVal) getTearoffState_ self
    fun getTitle self = (GtkMenuClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getTitle_ self before GtkMenuClass.FFI.touchPtr self
    fun placeOnMonitor self monitor = (GtkMenuClass.FFI.withPtr false &&&> GdkMonitorClass.FFI.withPtr false ---> I) placeOnMonitor_ (self & monitor)
    fun popdown self = (GtkMenuClass.FFI.withPtr false ---> I) popdown_ self
    fun popupAtPointer self triggerEvent = (GtkMenuClass.FFI.withPtr false &&&> GdkEvent.FFI.withOptPtr false ---> I) popupAtPointer_ (self & triggerEvent)
    fun popupAtRect
      self
      (
        rectWindow,
        rect,
        rectAnchor,
        menuAnchor,
        triggerEvent
      ) =
      (
        GtkMenuClass.FFI.withPtr false
         &&&> GdkWindowClass.FFI.withPtr false
         &&&> GdkRectangleRecord.FFI.withPtr false
         &&&> GdkGravity.FFI.withVal
         &&&> GdkGravity.FFI.withVal
         &&&> GdkEvent.FFI.withOptPtr false
         ---> I
      )
        popupAtRect_
        (
          self
           & rectWindow
           & rect
           & rectAnchor
           & menuAnchor
           & triggerEvent
        )
    fun popupAtWidget
      self
      (
        widget,
        widgetAnchor,
        menuAnchor,
        triggerEvent
      ) =
      (
        GtkMenuClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GdkGravity.FFI.withVal
         &&&> GdkGravity.FFI.withVal
         &&&> GdkEvent.FFI.withOptPtr false
         ---> I
      )
        popupAtWidget_
        (
          self
           & widget
           & widgetAnchor
           & menuAnchor
           & triggerEvent
        )
    fun reorderChild self (child, position) =
      (
        GtkMenuClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         ---> I
      )
        reorderChild_
        (
          self
           & child
           & position
        )
    fun reposition self = (GtkMenuClass.FFI.withPtr false ---> I) reposition_ self
    fun setAccelGroup self accelGroup = (GtkMenuClass.FFI.withPtr false &&&> GtkAccelGroupClass.FFI.withOptPtr false ---> I) setAccelGroup_ (self & accelGroup)
    fun setAccelPath self accelPath = (GtkMenuClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setAccelPath_ (self & accelPath)
    fun setActive self index = (GtkMenuClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> I) setActive_ (self & index)
    fun setMonitor self monitorNum = (GtkMenuClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setMonitor_ (self & monitorNum)
    fun setReserveToggleSize self reserveToggleSize = (GtkMenuClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setReserveToggleSize_ (self & reserveToggleSize)
    fun setScreen self screen = (GtkMenuClass.FFI.withPtr false &&&> GdkScreenClass.FFI.withOptPtr false ---> I) setScreen_ (self & screen)
    fun setTearoffState self tornOff = (GtkMenuClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setTearoffState_ (self & tornOff)
    fun setTitle self title = (GtkMenuClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setTitle_ (self & title)
    local
      open ClosureMarshal Signal
    in
      fun moveScrollSig f = signal "move-scroll" (get 0w1 GtkScrollType.t ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val accelGroupProp =
        {
          name = "accel-group",
          gtype = fn () => C.gtype GtkAccelGroupClass.tOpt (),
          get = fn x => fn () => C.get GtkAccelGroupClass.tOpt x,
          set = fn x => C.set GtkAccelGroupClass.tOpt x,
          init = fn x => C.set GtkAccelGroupClass.tOpt x
        }
      val accelPathProp =
        {
          name = "accel-path",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val activeProp =
        {
          name = "active",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val anchorHintsProp =
        {
          name = "anchor-hints",
          gtype = fn () => C.gtype GdkAnchorHints.t (),
          get = fn x => fn () => C.get GdkAnchorHints.t x,
          set = fn x => C.set GdkAnchorHints.t x,
          init = fn x => C.set GdkAnchorHints.t x
        }
      val attachWidgetProp =
        {
          name = "attach-widget",
          gtype = fn () => C.gtype GtkWidgetClass.tOpt (),
          get = fn x => fn () => C.get GtkWidgetClass.tOpt x,
          set = fn x => C.set GtkWidgetClass.tOpt x,
          init = fn x => C.set GtkWidgetClass.tOpt x
        }
      val menuTypeHintProp =
        {
          name = "menu-type-hint",
          gtype = fn () => C.gtype GdkWindowTypeHint.t (),
          get = fn x => fn () => C.get GdkWindowTypeHint.t x,
          set = fn x => C.set GdkWindowTypeHint.t x,
          init = fn x => C.set GdkWindowTypeHint.t x
        }
      val monitorProp =
        {
          name = "monitor",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val rectAnchorDxProp =
        {
          name = "rect-anchor-dx",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val rectAnchorDyProp =
        {
          name = "rect-anchor-dy",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val reserveToggleSizeProp =
        {
          name = "reserve-toggle-size",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val tearoffStateProp =
        {
          name = "tearoff-state",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val tearoffTitleProp =
        {
          name = "tearoff-title",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
    end
  end
