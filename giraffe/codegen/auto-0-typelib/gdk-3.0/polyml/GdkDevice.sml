structure GdkDevice :>
  GDK_DEVICE
    where type 'a class = 'a GdkDeviceClass.class
    where type grab_status_t = GdkGrabStatus.t
    where type 'a cursor_class = 'a GdkCursorClass.class
    where type event_mask_t = GdkEventMask.t
    where type grab_ownership_t = GdkGrabOwnership.t
    where type 'a window_class = 'a GdkWindowClass.class
    where type axis_use_t = GdkAxisUse.t
    where type modifier_type_t = GdkModifierType.t
    where type 'a screen_class = 'a GdkScreenClass.class
    where type axis_flags_t = GdkAxisFlags.t
    where type 'a device_manager_class = 'a GdkDeviceManagerClass.class
    where type 'a display_class = 'a GdkDisplayClass.class
    where type input_mode_t = GdkInputMode.t
    where type input_source_t = GdkInputSource.t
    where type 'a seat_class = 'a GdkSeatClass.class
    where type 'a device_tool_class = 'a GdkDeviceToolClass.class
    where type device_type_t = GdkDeviceType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_device_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val grabInfoLibgtkOnly_ =
        call (getSymbol "gdk_device_grab_info_libgtk_only")
          (
            GdkDisplayClass.PolyML.cPtr
             &&> GdkDeviceClass.PolyML.cPtr
             &&> GdkWindowClass.PolyML.cOutRef
             &&> GBool.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val getAssociatedDevice_ = call (getSymbol "gdk_device_get_associated_device") (GdkDeviceClass.PolyML.cPtr --> GdkDeviceClass.PolyML.cOptPtr)
      val getAxes_ = call (getSymbol "gdk_device_get_axes") (GdkDeviceClass.PolyML.cPtr --> GdkAxisFlags.PolyML.cVal)
      val getAxisUse_ = call (getSymbol "gdk_device_get_axis_use") (GdkDeviceClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> GdkAxisUse.PolyML.cVal)
      val getDeviceType_ = call (getSymbol "gdk_device_get_device_type") (GdkDeviceClass.PolyML.cPtr --> GdkDeviceType.PolyML.cVal)
      val getDisplay_ = call (getSymbol "gdk_device_get_display") (GdkDeviceClass.PolyML.cPtr --> GdkDisplayClass.PolyML.cPtr)
      val getHasCursor_ = call (getSymbol "gdk_device_get_has_cursor") (GdkDeviceClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getKey_ =
        call (getSymbol "gdk_device_get_key")
          (
            GdkDeviceClass.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             &&> GUInt32.PolyML.cRef
             &&> GdkModifierType.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val getLastEventWindow_ = call (getSymbol "gdk_device_get_last_event_window") (GdkDeviceClass.PolyML.cPtr --> GdkWindowClass.PolyML.cOptPtr)
      val getMode_ = call (getSymbol "gdk_device_get_mode") (GdkDeviceClass.PolyML.cPtr --> GdkInputMode.PolyML.cVal)
      val getNAxes_ = call (getSymbol "gdk_device_get_n_axes") (GdkDeviceClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getNKeys_ = call (getSymbol "gdk_device_get_n_keys") (GdkDeviceClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getName_ = call (getSymbol "gdk_device_get_name") (GdkDeviceClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPosition_ =
        call (getSymbol "gdk_device_get_position")
          (
            GdkDeviceClass.PolyML.cPtr
             &&> GdkScreenClass.PolyML.cOutRef
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
      val getPositionDouble_ =
        call (getSymbol "gdk_device_get_position_double")
          (
            GdkDeviceClass.PolyML.cPtr
             &&> GdkScreenClass.PolyML.cOutRef
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             --> cVoid
          )
      val getProductId_ = call (getSymbol "gdk_device_get_product_id") (GdkDeviceClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getSeat_ = call (getSymbol "gdk_device_get_seat") (GdkDeviceClass.PolyML.cPtr --> GdkSeatClass.PolyML.cPtr)
      val getSource_ = call (getSymbol "gdk_device_get_source") (GdkDeviceClass.PolyML.cPtr --> GdkInputSource.PolyML.cVal)
      val getVendorId_ = call (getSymbol "gdk_device_get_vendor_id") (GdkDeviceClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getWindowAtPosition_ =
        call (getSymbol "gdk_device_get_window_at_position")
          (
            GdkDeviceClass.PolyML.cPtr
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> GdkWindowClass.PolyML.cOptPtr
          )
      val getWindowAtPositionDouble_ =
        call (getSymbol "gdk_device_get_window_at_position_double")
          (
            GdkDeviceClass.PolyML.cPtr
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             --> GdkWindowClass.PolyML.cOptPtr
          )
      val grab_ =
        call (getSymbol "gdk_device_grab")
          (
            GdkDeviceClass.PolyML.cPtr
             &&> GdkWindowClass.PolyML.cPtr
             &&> GdkGrabOwnership.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> GdkEventMask.PolyML.cVal
             &&> GdkCursorClass.PolyML.cOptPtr
             &&> GUInt32.PolyML.cVal
             --> GdkGrabStatus.PolyML.cVal
          )
      val setAxisUse_ =
        call (getSymbol "gdk_device_set_axis_use")
          (
            GdkDeviceClass.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             &&> GdkAxisUse.PolyML.cVal
             --> cVoid
          )
      val setKey_ =
        call (getSymbol "gdk_device_set_key")
          (
            GdkDeviceClass.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             &&> GdkModifierType.PolyML.cVal
             --> cVoid
          )
      val setMode_ = call (getSymbol "gdk_device_set_mode") (GdkDeviceClass.PolyML.cPtr &&> GdkInputMode.PolyML.cVal --> GBool.PolyML.cVal)
      val ungrab_ = call (getSymbol "gdk_device_ungrab") (GdkDeviceClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val warp_ =
        call (getSymbol "gdk_device_warp")
          (
            GdkDeviceClass.PolyML.cPtr
             &&> GdkScreenClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
    end
    type 'a class = 'a GdkDeviceClass.class
    type grab_status_t = GdkGrabStatus.t
    type 'a cursor_class = 'a GdkCursorClass.class
    type event_mask_t = GdkEventMask.t
    type grab_ownership_t = GdkGrabOwnership.t
    type 'a window_class = 'a GdkWindowClass.class
    type axis_use_t = GdkAxisUse.t
    type modifier_type_t = GdkModifierType.t
    type 'a screen_class = 'a GdkScreenClass.class
    type axis_flags_t = GdkAxisFlags.t
    type 'a device_manager_class = 'a GdkDeviceManagerClass.class
    type 'a display_class = 'a GdkDisplayClass.class
    type input_mode_t = GdkInputMode.t
    type input_source_t = GdkInputSource.t
    type 'a seat_class = 'a GdkSeatClass.class
    type 'a device_tool_class = 'a GdkDeviceToolClass.class
    type device_type_t = GdkDeviceType.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun grabInfoLibgtkOnly (display, device) =
      let
        val grabWindow
         & ownerEvents
         & retVal =
          (
            GdkDisplayClass.FFI.withPtr false
             &&&> GdkDeviceClass.FFI.withPtr false
             &&&> GdkWindowClass.FFI.withRefOptPtr false
             &&&> GBool.FFI.withRefVal
             ---> GdkWindowClass.FFI.fromPtr false
                   && GBool.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            grabInfoLibgtkOnly_
            (
              display
               & device
               & NONE
               & GBool.null
            )
      in
        (if retVal then SOME (grabWindow, ownerEvents) else NONE) before GdkDisplayClass.FFI.touchPtr display before GdkDeviceClass.FFI.touchPtr device
      end
    fun getAssociatedDevice self = (GdkDeviceClass.FFI.withPtr false ---> GdkDeviceClass.FFI.fromOptPtr false) getAssociatedDevice_ self before GdkDeviceClass.FFI.touchPtr self
    fun getAxes self = (GdkDeviceClass.FFI.withPtr false ---> GdkAxisFlags.FFI.fromVal) getAxes_ self
    fun getAxisUse self index = (GdkDeviceClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> GdkAxisUse.FFI.fromVal) getAxisUse_ (self & index)
    fun getDeviceType self = (GdkDeviceClass.FFI.withPtr false ---> GdkDeviceType.FFI.fromVal) getDeviceType_ self
    fun getDisplay self = (GdkDeviceClass.FFI.withPtr false ---> GdkDisplayClass.FFI.fromPtr false) getDisplay_ self before GdkDeviceClass.FFI.touchPtr self
    fun getHasCursor self = (GdkDeviceClass.FFI.withPtr false ---> GBool.FFI.fromVal) getHasCursor_ self
    fun getKey self index =
      let
        val keyval
         & modifiers
         & retVal =
          (
            GdkDeviceClass.FFI.withPtr false
             &&&> GUInt32.FFI.withVal
             &&&> GUInt32.FFI.withRefVal
             &&&> GdkModifierType.FFI.withRefVal
             ---> GUInt32.FFI.fromVal
                   && GdkModifierType.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            getKey_
            (
              self
               & index
               & GUInt32.null
               & GdkModifierType.flags []
            )
      in
        if retVal then SOME (keyval, modifiers) else NONE
      end
    fun getLastEventWindow self = (GdkDeviceClass.FFI.withPtr false ---> GdkWindowClass.FFI.fromOptPtr false) getLastEventWindow_ self before GdkDeviceClass.FFI.touchPtr self
    fun getMode self = (GdkDeviceClass.FFI.withPtr false ---> GdkInputMode.FFI.fromVal) getMode_ self
    fun getNAxes self = (GdkDeviceClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getNAxes_ self
    fun getNKeys self = (GdkDeviceClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getNKeys_ self
    fun getName self = (GdkDeviceClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getName_ self before GdkDeviceClass.FFI.touchPtr self
    fun getPosition self =
      let
        val screen
         & x
         & y
         & () =
          (
            GdkDeviceClass.FFI.withPtr false
             &&&> GdkScreenClass.FFI.withRefOptPtr false
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GdkScreenClass.FFI.fromPtr false
                   && GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getPosition_
            (
              self
               & NONE
               & GInt32.null
               & GInt32.null
            )
      in
        (
          screen,
          x,
          y
        )
         before GdkDeviceClass.FFI.touchPtr self
      end
    fun getPositionDouble self =
      let
        val screen
         & x
         & y
         & () =
          (
            GdkDeviceClass.FFI.withPtr false
             &&&> GdkScreenClass.FFI.withRefOptPtr false
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             ---> GdkScreenClass.FFI.fromPtr false
                   && GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && I
          )
            getPositionDouble_
            (
              self
               & NONE
               & GDouble.null
               & GDouble.null
            )
      in
        (
          screen,
          x,
          y
        )
         before GdkDeviceClass.FFI.touchPtr self
      end
    fun getProductId self = (GdkDeviceClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getProductId_ self before GdkDeviceClass.FFI.touchPtr self
    fun getSeat self = (GdkDeviceClass.FFI.withPtr false ---> GdkSeatClass.FFI.fromPtr false) getSeat_ self before GdkDeviceClass.FFI.touchPtr self
    fun getSource self = (GdkDeviceClass.FFI.withPtr false ---> GdkInputSource.FFI.fromVal) getSource_ self
    fun getVendorId self = (GdkDeviceClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getVendorId_ self before GdkDeviceClass.FFI.touchPtr self
    fun getWindowAtPosition self =
      let
        val winX
         & winY
         & retVal =
          (
            GdkDeviceClass.FFI.withPtr false
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GdkWindowClass.FFI.fromOptPtr false
          )
            getWindowAtPosition_
            (
              self
               & GInt32.null
               & GInt32.null
            )
      in
        (
          retVal,
          winX,
          winY
        )
         before GdkDeviceClass.FFI.touchPtr self
      end
    fun getWindowAtPositionDouble self =
      let
        val winX
         & winY
         & retVal =
          (
            GdkDeviceClass.FFI.withPtr false
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             ---> GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && GdkWindowClass.FFI.fromOptPtr false
          )
            getWindowAtPositionDouble_
            (
              self
               & GDouble.null
               & GDouble.null
            )
      in
        (
          retVal,
          winX,
          winY
        )
         before GdkDeviceClass.FFI.touchPtr self
      end
    fun grab
      self
      (
        window,
        grabOwnership,
        ownerEvents,
        eventMask,
        cursor,
        time
      ) =
      (
        GdkDeviceClass.FFI.withPtr false
         &&&> GdkWindowClass.FFI.withPtr false
         &&&> GdkGrabOwnership.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GdkEventMask.FFI.withVal
         &&&> GdkCursorClass.FFI.withOptPtr false
         &&&> GUInt32.FFI.withVal
         ---> GdkGrabStatus.FFI.fromVal
      )
        grab_
        (
          self
           & window
           & grabOwnership
           & ownerEvents
           & eventMask
           & cursor
           & time
        )
    fun setAxisUse self (index, use) =
      (
        GdkDeviceClass.FFI.withPtr false
         &&&> GUInt32.FFI.withVal
         &&&> GdkAxisUse.FFI.withVal
         ---> I
      )
        setAxisUse_
        (
          self
           & index
           & use
        )
    fun setKey
      self
      (
        index,
        keyval,
        modifiers
      ) =
      (
        GdkDeviceClass.FFI.withPtr false
         &&&> GUInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         &&&> GdkModifierType.FFI.withVal
         ---> I
      )
        setKey_
        (
          self
           & index
           & keyval
           & modifiers
        )
    fun setMode self mode = (GdkDeviceClass.FFI.withPtr false &&&> GdkInputMode.FFI.withVal ---> GBool.FFI.fromVal) setMode_ (self & mode)
    fun ungrab self time = (GdkDeviceClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> I) ungrab_ (self & time)
    fun warp
      self
      (
        screen,
        x,
        y
      ) =
      (
        GdkDeviceClass.FFI.withPtr false
         &&&> GdkScreenClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        warp_
        (
          self
           & screen
           & x
           & y
        )
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (void ---> ret_void) f
      fun toolChangedSig f = signal "tool-changed" (get 0w1 GdkDeviceToolClass.t ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val associatedDeviceProp =
        {
          name = "associated-device",
          gtype = fn () => C.gtype GdkDeviceClass.tOpt (),
          get = fn x => fn () => C.get GdkDeviceClass.tOpt x,
          set = ignore,
          init = ignore
        }
      val axesProp =
        {
          name = "axes",
          gtype = fn () => C.gtype GdkAxisFlags.t (),
          get = fn x => fn () => C.get GdkAxisFlags.t x,
          set = ignore,
          init = ignore
        }
      val deviceManagerProp =
        {
          name = "device-manager",
          gtype = fn () => C.gtype GdkDeviceManagerClass.tOpt (),
          get = fn x => fn () => C.get GdkDeviceManagerClass.tOpt x,
          set = ignore,
          init = fn x => C.set GdkDeviceManagerClass.tOpt x
        }
      val displayProp =
        {
          name = "display",
          gtype = fn () => C.gtype GdkDisplayClass.tOpt (),
          get = fn x => fn () => C.get GdkDisplayClass.tOpt x,
          set = ignore,
          init = fn x => C.set GdkDisplayClass.tOpt x
        }
      val hasCursorProp =
        {
          name = "has-cursor",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = fn x => C.set boolean x
        }
      val inputModeProp =
        {
          name = "input-mode",
          gtype = fn () => C.gtype GdkInputMode.t (),
          get = fn x => fn () => C.get GdkInputMode.t x,
          set = fn x => C.set GdkInputMode.t x,
          init = fn x => C.set GdkInputMode.t x
        }
      val inputSourceProp =
        {
          name = "input-source",
          gtype = fn () => C.gtype GdkInputSource.t (),
          get = fn x => fn () => C.get GdkInputSource.t x,
          set = ignore,
          init = fn x => C.set GdkInputSource.t x
        }
      val nAxesProp =
        {
          name = "n-axes",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = ignore,
          init = ignore
        }
      val nameProp =
        {
          name = "name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
      val numTouchesProp =
        {
          name = "num-touches",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = ignore,
          init = fn x => C.set uint x
        }
      val productIdProp =
        {
          name = "product-id",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
      val seatProp =
        {
          name = "seat",
          gtype = fn () => C.gtype GdkSeatClass.tOpt (),
          get = fn x => fn () => C.get GdkSeatClass.tOpt x,
          set = fn x => C.set GdkSeatClass.tOpt x,
          init = fn x => C.set GdkSeatClass.tOpt x
        }
      val toolProp =
        {
          name = "tool",
          gtype = fn () => C.gtype GdkDeviceToolClass.tOpt (),
          get = fn x => fn () => C.get GdkDeviceToolClass.tOpt x,
          set = ignore,
          init = ignore
        }
      val typeProp =
        {
          name = "type",
          gtype = fn () => C.gtype GdkDeviceType.t (),
          get = fn x => fn () => C.get GdkDeviceType.t x,
          set = ignore,
          init = fn x => C.set GdkDeviceType.t x
        }
      val vendorIdProp =
        {
          name = "vendor-id",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
    end
  end
