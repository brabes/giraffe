structure GtkColorSelection :>
  GTK_COLOR_SELECTION
    where type 'a class_t = 'a GtkColorSelectionClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a orientableclass_t = 'a GtkOrientableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_color_selection_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_color_selection_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getCurrentAlpha_ = call (load_sym libgtk "gtk_color_selection_get_current_alpha") (GObjectObjectClass.PolyML.PTR --> FFI.UInt16.PolyML.VAL)
      val getCurrentColor_ = call (load_sym libgtk "gtk_color_selection_get_current_color") (GObjectObjectClass.PolyML.PTR &&> GdkColorRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val getCurrentRgba_ = call (load_sym libgtk "gtk_color_selection_get_current_rgba") (GObjectObjectClass.PolyML.PTR &&> GdkRgbaRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val getHasOpacityControl_ = call (load_sym libgtk "gtk_color_selection_get_has_opacity_control") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getHasPalette_ = call (load_sym libgtk "gtk_color_selection_get_has_palette") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getPreviousAlpha_ = call (load_sym libgtk "gtk_color_selection_get_previous_alpha") (GObjectObjectClass.PolyML.PTR --> FFI.UInt16.PolyML.VAL)
      val getPreviousColor_ = call (load_sym libgtk "gtk_color_selection_get_previous_color") (GObjectObjectClass.PolyML.PTR &&> GdkColorRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val getPreviousRgba_ = call (load_sym libgtk "gtk_color_selection_get_previous_rgba") (GObjectObjectClass.PolyML.PTR &&> GdkRgbaRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val isAdjusting_ = call (load_sym libgtk "gtk_color_selection_is_adjusting") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val setCurrentAlpha_ = call (load_sym libgtk "gtk_color_selection_set_current_alpha") (GObjectObjectClass.PolyML.PTR &&> FFI.UInt16.PolyML.VAL --> FFI.PolyML.VOID)
      val setCurrentColor_ = call (load_sym libgtk "gtk_color_selection_set_current_color") (GObjectObjectClass.PolyML.PTR &&> GdkColorRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val setCurrentRgba_ = call (load_sym libgtk "gtk_color_selection_set_current_rgba") (GObjectObjectClass.PolyML.PTR &&> GdkRgbaRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val setHasOpacityControl_ = call (load_sym libgtk "gtk_color_selection_set_has_opacity_control") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setHasPalette_ = call (load_sym libgtk "gtk_color_selection_set_has_palette") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setPreviousAlpha_ = call (load_sym libgtk "gtk_color_selection_set_previous_alpha") (GObjectObjectClass.PolyML.PTR &&> FFI.UInt16.PolyML.VAL --> FFI.PolyML.VOID)
      val setPreviousColor_ = call (load_sym libgtk "gtk_color_selection_set_previous_color") (GObjectObjectClass.PolyML.PTR &&> GdkColorRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val setPreviousRgba_ = call (load_sym libgtk "gtk_color_selection_set_previous_rgba") (GObjectObjectClass.PolyML.PTR &&> GdkRgbaRecord.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkColorSelectionClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a orientableclass_t = 'a GtkOrientableClass.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkColorSelectionClass.C.fromPtr false) new_ ()
    fun getCurrentAlpha self = (GObjectObjectClass.C.withPtr ---> FFI.UInt16.C.fromVal) getCurrentAlpha_ self
    fun getCurrentColor self =
      let
        val color & () = (GObjectObjectClass.C.withPtr &&&> GdkColorRecord.C.withNewPtr ---> GdkColorRecord.C.fromPtr true && I) getCurrentColor_ (self & ())
      in
        color
      end
    fun getCurrentRgba self =
      let
        val rgba & () = (GObjectObjectClass.C.withPtr &&&> GdkRgbaRecord.C.withNewPtr ---> GdkRgbaRecord.C.fromPtr true && I) getCurrentRgba_ (self & ())
      in
        rgba
      end
    fun getHasOpacityControl self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getHasOpacityControl_ self
    fun getHasPalette self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getHasPalette_ self
    fun getPreviousAlpha self = (GObjectObjectClass.C.withPtr ---> FFI.UInt16.C.fromVal) getPreviousAlpha_ self
    fun getPreviousColor self =
      let
        val color & () = (GObjectObjectClass.C.withPtr &&&> GdkColorRecord.C.withNewPtr ---> GdkColorRecord.C.fromPtr true && I) getPreviousColor_ (self & ())
      in
        color
      end
    fun getPreviousRgba self =
      let
        val rgba & () = (GObjectObjectClass.C.withPtr &&&> GdkRgbaRecord.C.withNewPtr ---> GdkRgbaRecord.C.fromPtr true && I) getPreviousRgba_ (self & ())
      in
        rgba
      end
    fun isAdjusting self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isAdjusting_ self
    fun setCurrentAlpha self alpha = (GObjectObjectClass.C.withPtr &&&> FFI.UInt16.C.withVal ---> I) setCurrentAlpha_ (self & alpha)
    fun setCurrentColor self color = (GObjectObjectClass.C.withPtr &&&> GdkColorRecord.C.withPtr ---> I) setCurrentColor_ (self & color)
    fun setCurrentRgba self rgba = (GObjectObjectClass.C.withPtr &&&> GdkRgbaRecord.C.withPtr ---> I) setCurrentRgba_ (self & rgba)
    fun setHasOpacityControl self hasOpacity = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHasOpacityControl_ (self & hasOpacity)
    fun setHasPalette self hasPalette = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHasPalette_ (self & hasPalette)
    fun setPreviousAlpha self alpha = (GObjectObjectClass.C.withPtr &&&> FFI.UInt16.C.withVal ---> I) setPreviousAlpha_ (self & alpha)
    fun setPreviousColor self color = (GObjectObjectClass.C.withPtr &&&> GdkColorRecord.C.withPtr ---> I) setPreviousColor_ (self & color)
    fun setPreviousRgba self rgba = (GObjectObjectClass.C.withPtr &&&> GdkRgbaRecord.C.withPtr ---> I) setPreviousRgba_ (self & rgba)
    local
      open ClosureMarshal Signal
    in
      fun colorChangedSig f = signal "color-changed" (void ---> ret_void) f
    end
    local
      open Property
    in
      val currentAlphaProp =
        {
          get = fn x => get "current-alpha" uint x,
          set = fn x => set "current-alpha" uint x
        }
      val currentColorProp =
        {
          get = fn x => get "current-color" GdkColorRecord.tOpt x,
          set = fn x => set "current-color" GdkColorRecord.tOpt x
        }
      val currentRgbaProp =
        {
          get = fn x => get "current-rgba" GdkRgbaRecord.tOpt x,
          set = fn x => set "current-rgba" GdkRgbaRecord.tOpt x
        }
      val hasOpacityControlProp =
        {
          get = fn x => get "has-opacity-control" boolean x,
          set = fn x => set "has-opacity-control" boolean x
        }
      val hasPaletteProp =
        {
          get = fn x => get "has-palette" boolean x,
          set = fn x => set "has-palette" boolean x
        }
    end
  end