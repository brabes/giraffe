structure GdkScreen :>
  GDK_SCREEN
    where type 'a class = 'a GdkScreenClass.class
    where type 'a display_class = 'a GdkDisplayClass.class
    where type 'a window_class = 'a GdkWindowClass.class
    where type 'a visual_class = 'a GdkVisualClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_screen_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getDefault_ = call (getSymbol "gdk_screen_get_default") (cVoid --> GdkScreenClass.PolyML.cPtr)
      val height_ = call (getSymbol "gdk_screen_height") (cVoid --> GInt32.PolyML.cVal)
      val heightMm_ = call (getSymbol "gdk_screen_height_mm") (cVoid --> GInt32.PolyML.cVal)
      val width_ = call (getSymbol "gdk_screen_width") (cVoid --> GInt32.PolyML.cVal)
      val widthMm_ = call (getSymbol "gdk_screen_width_mm") (cVoid --> GInt32.PolyML.cVal)
      val getActiveWindow_ = call (getSymbol "gdk_screen_get_active_window") (GdkScreenClass.PolyML.cPtr --> GdkWindowClass.PolyML.cPtr)
      val getDisplay_ = call (getSymbol "gdk_screen_get_display") (GdkScreenClass.PolyML.cPtr --> GdkDisplayClass.PolyML.cPtr)
      val getFontOptions_ = call (getSymbol "gdk_screen_get_font_options") (GdkScreenClass.PolyML.cPtr --> CairoFontOptionsRecord.PolyML.cPtr)
      val getHeight_ = call (getSymbol "gdk_screen_get_height") (GdkScreenClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getHeightMm_ = call (getSymbol "gdk_screen_get_height_mm") (GdkScreenClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getMonitorAtPoint_ =
        call (getSymbol "gdk_screen_get_monitor_at_point")
          (
            GdkScreenClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> GInt32.PolyML.cVal
          )
      val getMonitorAtWindow_ = call (getSymbol "gdk_screen_get_monitor_at_window") (GdkScreenClass.PolyML.cPtr &&> GdkWindowClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getMonitorGeometry_ =
        call (getSymbol "gdk_screen_get_monitor_geometry")
          (
            GdkScreenClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> CairoRectangleIntRecord.PolyML.cPtr
             --> cVoid
          )
      val getMonitorHeightMm_ = call (getSymbol "gdk_screen_get_monitor_height_mm") (GdkScreenClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> GInt32.PolyML.cVal)
      val getMonitorPlugName_ = call (getSymbol "gdk_screen_get_monitor_plug_name") (GdkScreenClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val getMonitorWidthMm_ = call (getSymbol "gdk_screen_get_monitor_width_mm") (GdkScreenClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> GInt32.PolyML.cVal)
      val getNMonitors_ = call (getSymbol "gdk_screen_get_n_monitors") (GdkScreenClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getNumber_ = call (getSymbol "gdk_screen_get_number") (GdkScreenClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getPrimaryMonitor_ = call (getSymbol "gdk_screen_get_primary_monitor") (GdkScreenClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getResolution_ = call (getSymbol "gdk_screen_get_resolution") (GdkScreenClass.PolyML.cPtr --> GDouble.PolyML.cVal)
      val getRgbaVisual_ = call (getSymbol "gdk_screen_get_rgba_visual") (GdkScreenClass.PolyML.cPtr --> GdkVisualClass.PolyML.cPtr)
      val getRootWindow_ = call (getSymbol "gdk_screen_get_root_window") (GdkScreenClass.PolyML.cPtr --> GdkWindowClass.PolyML.cPtr)
      val getSetting_ =
        call (getSymbol "gdk_screen_get_setting")
          (
            GdkScreenClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectValueRecord.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val getSystemVisual_ = call (getSymbol "gdk_screen_get_system_visual") (GdkScreenClass.PolyML.cPtr --> GdkVisualClass.PolyML.cPtr)
      val getWidth_ = call (getSymbol "gdk_screen_get_width") (GdkScreenClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getWidthMm_ = call (getSymbol "gdk_screen_get_width_mm") (GdkScreenClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val isComposited_ = call (getSymbol "gdk_screen_is_composited") (GdkScreenClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val makeDisplayName_ = call (getSymbol "gdk_screen_make_display_name") (GdkScreenClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val setFontOptions_ = call (getSymbol "gdk_screen_set_font_options") (GdkScreenClass.PolyML.cPtr &&> CairoFontOptionsRecord.PolyML.cOptPtr --> cVoid)
      val setResolution_ = call (getSymbol "gdk_screen_set_resolution") (GdkScreenClass.PolyML.cPtr &&> GDouble.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GdkScreenClass.class
    type 'a display_class = 'a GdkDisplayClass.class
    type 'a window_class = 'a GdkWindowClass.class
    type 'a visual_class = 'a GdkVisualClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getDefault () = (I ---> GdkScreenClass.FFI.fromPtr false) getDefault_ ()
    fun height () = (I ---> GInt32.FFI.fromVal) height_ ()
    fun heightMm () = (I ---> GInt32.FFI.fromVal) heightMm_ ()
    fun width () = (I ---> GInt32.FFI.fromVal) width_ ()
    fun widthMm () = (I ---> GInt32.FFI.fromVal) widthMm_ ()
    fun getActiveWindow self = (GdkScreenClass.FFI.withPtr ---> GdkWindowClass.FFI.fromPtr true) getActiveWindow_ self
    fun getDisplay self = (GdkScreenClass.FFI.withPtr ---> GdkDisplayClass.FFI.fromPtr false) getDisplay_ self
    fun getFontOptions self = (GdkScreenClass.FFI.withPtr ---> CairoFontOptionsRecord.FFI.fromPtr false) getFontOptions_ self
    fun getHeight self = (GdkScreenClass.FFI.withPtr ---> GInt32.FFI.fromVal) getHeight_ self
    fun getHeightMm self = (GdkScreenClass.FFI.withPtr ---> GInt32.FFI.fromVal) getHeightMm_ self
    fun getMonitorAtPoint self x y =
      (
        GdkScreenClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> GInt32.FFI.fromVal
      )
        getMonitorAtPoint_
        (
          self
           & x
           & y
        )
    fun getMonitorAtWindow self window = (GdkScreenClass.FFI.withPtr &&&> GdkWindowClass.FFI.withPtr ---> GInt32.FFI.fromVal) getMonitorAtWindow_ (self & window)
    fun getMonitorGeometry self monitorNum =
      let
        val dest & () =
          (
            GdkScreenClass.FFI.withPtr
             &&&> GInt32.FFI.withVal
             &&&> CairoRectangleIntRecord.FFI.withNewPtr
             ---> CairoRectangleIntRecord.FFI.fromPtr true && I
          )
            getMonitorGeometry_
            (
              self
               & monitorNum
               & ()
            )
      in
        dest
      end
    fun getMonitorHeightMm self monitorNum = (GdkScreenClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> GInt32.FFI.fromVal) getMonitorHeightMm_ (self & monitorNum)
    fun getMonitorPlugName self monitorNum = (GdkScreenClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> Utf8.FFI.fromPtr 1) getMonitorPlugName_ (self & monitorNum)
    fun getMonitorWidthMm self monitorNum = (GdkScreenClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> GInt32.FFI.fromVal) getMonitorWidthMm_ (self & monitorNum)
    fun getNMonitors self = (GdkScreenClass.FFI.withPtr ---> GInt32.FFI.fromVal) getNMonitors_ self
    fun getNumber self = (GdkScreenClass.FFI.withPtr ---> GInt32.FFI.fromVal) getNumber_ self
    fun getPrimaryMonitor self = (GdkScreenClass.FFI.withPtr ---> GInt32.FFI.fromVal) getPrimaryMonitor_ self
    fun getResolution self = (GdkScreenClass.FFI.withPtr ---> GDouble.FFI.fromVal) getResolution_ self
    fun getRgbaVisual self = (GdkScreenClass.FFI.withPtr ---> GdkVisualClass.FFI.fromPtr false) getRgbaVisual_ self
    fun getRootWindow self = (GdkScreenClass.FFI.withPtr ---> GdkWindowClass.FFI.fromPtr false) getRootWindow_ self
    fun getSetting self name value =
      (
        GdkScreenClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GObjectValueRecord.FFI.withPtr
         ---> GBool.FFI.fromVal
      )
        getSetting_
        (
          self
           & name
           & value
        )
    fun getSystemVisual self = (GdkScreenClass.FFI.withPtr ---> GdkVisualClass.FFI.fromPtr false) getSystemVisual_ self
    fun getWidth self = (GdkScreenClass.FFI.withPtr ---> GInt32.FFI.fromVal) getWidth_ self
    fun getWidthMm self = (GdkScreenClass.FFI.withPtr ---> GInt32.FFI.fromVal) getWidthMm_ self
    fun isComposited self = (GdkScreenClass.FFI.withPtr ---> GBool.FFI.fromVal) isComposited_ self
    fun makeDisplayName self = (GdkScreenClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) makeDisplayName_ self
    fun setFontOptions self options = (GdkScreenClass.FFI.withPtr &&&> CairoFontOptionsRecord.FFI.withOptPtr ---> I) setFontOptions_ (self & options)
    fun setResolution self dpi = (GdkScreenClass.FFI.withPtr &&&> GDouble.FFI.withVal ---> I) setResolution_ (self & dpi)
    local
      open ClosureMarshal Signal
    in
      fun compositedChangedSig f = signal "composited-changed" (void ---> ret_void) f
      fun monitorsChangedSig f = signal "monitors-changed" (void ---> ret_void) f
      fun sizeChangedSig f = signal "size-changed" (void ---> ret_void) f
    end
    local
      open Property
    in
      val resolutionProp =
        {
          get = fn x => get "resolution" double x,
          set = fn x => set "resolution" double x
        }
    end
  end
