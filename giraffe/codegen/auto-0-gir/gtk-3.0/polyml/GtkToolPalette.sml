structure GtkToolPalette :>
  GTK_TOOL_PALETTE
    where type 'a class = 'a GtkToolPaletteClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type 'a scrollable_class = 'a GtkScrollableClass.class
    where type target_entry_t = GtkTargetEntryRecord.t
    where type dest_defaults_t = GtkDestDefaults.t
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type selection_data_t = GtkSelectionDataRecord.t
    where type 'a tool_item_class = 'a GtkToolItemClass.class
    where type tool_palette_drag_targets_t = GtkToolPaletteDragTargets.t
    where type 'a tool_item_group_class = 'a GtkToolItemGroupClass.class
    where type icon_size_t = GtkIconSize.t
    where type toolbar_style_t = GtkToolbarStyle.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_tool_palette_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_tool_palette_new") (PolyMLFFI.cVoid --> GtkWidgetClass.PolyML.cPtr)
      val getDragTargetGroup_ = call (load_sym libgtk "gtk_tool_palette_get_drag_target_group") (PolyMLFFI.cVoid --> GtkTargetEntryRecord.PolyML.cPtr)
      val getDragTargetItem_ = call (load_sym libgtk "gtk_tool_palette_get_drag_target_item") (PolyMLFFI.cVoid --> GtkTargetEntryRecord.PolyML.cPtr)
      val addDragDest_ =
        call (load_sym libgtk "gtk_tool_palette_add_drag_dest")
          (
            GtkToolPaletteClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GtkDestDefaults.PolyML.cVal
             &&> GtkToolPaletteDragTargets.PolyML.cVal
             &&> GdkDragAction.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val getDragItem_ = call (load_sym libgtk "gtk_tool_palette_get_drag_item") (GtkToolPaletteClass.PolyML.cPtr &&> GtkSelectionDataRecord.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getDropGroup_ =
        call (load_sym libgtk "gtk_tool_palette_get_drop_group")
          (
            GtkToolPaletteClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> GtkToolItemGroupClass.PolyML.cPtr
          )
      val getDropItem_ =
        call (load_sym libgtk "gtk_tool_palette_get_drop_item")
          (
            GtkToolPaletteClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> GtkToolItemClass.PolyML.cPtr
          )
      val getExclusive_ = call (load_sym libgtk "gtk_tool_palette_get_exclusive") (GtkToolPaletteClass.PolyML.cPtr &&> GtkToolItemGroupClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getExpand_ = call (load_sym libgtk "gtk_tool_palette_get_expand") (GtkToolPaletteClass.PolyML.cPtr &&> GtkToolItemGroupClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getGroupPosition_ = call (load_sym libgtk "gtk_tool_palette_get_group_position") (GtkToolPaletteClass.PolyML.cPtr &&> GtkToolItemGroupClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getIconSize_ = call (load_sym libgtk "gtk_tool_palette_get_icon_size") (GtkToolPaletteClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getStyle_ = call (load_sym libgtk "gtk_tool_palette_get_style") (GtkToolPaletteClass.PolyML.cPtr --> GtkToolbarStyle.PolyML.cVal)
      val setDragSource_ = call (load_sym libgtk "gtk_tool_palette_set_drag_source") (GtkToolPaletteClass.PolyML.cPtr &&> GtkToolPaletteDragTargets.PolyML.cVal --> PolyMLFFI.cVoid)
      val setExclusive_ =
        call (load_sym libgtk "gtk_tool_palette_set_exclusive")
          (
            GtkToolPaletteClass.PolyML.cPtr
             &&> GtkToolItemGroupClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setExpand_ =
        call (load_sym libgtk "gtk_tool_palette_set_expand")
          (
            GtkToolPaletteClass.PolyML.cPtr
             &&> GtkToolItemGroupClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setGroupPosition_ =
        call (load_sym libgtk "gtk_tool_palette_set_group_position")
          (
            GtkToolPaletteClass.PolyML.cPtr
             &&> GtkToolItemGroupClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setIconSize_ = call (load_sym libgtk "gtk_tool_palette_set_icon_size") (GtkToolPaletteClass.PolyML.cPtr &&> GInt.PolyML.cVal --> PolyMLFFI.cVoid)
      val setStyle_ = call (load_sym libgtk "gtk_tool_palette_set_style") (GtkToolPaletteClass.PolyML.cPtr &&> GtkToolbarStyle.PolyML.cVal --> PolyMLFFI.cVoid)
      val unsetIconSize_ = call (load_sym libgtk "gtk_tool_palette_unset_icon_size") (GtkToolPaletteClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val unsetStyle_ = call (load_sym libgtk "gtk_tool_palette_unset_style") (GtkToolPaletteClass.PolyML.cPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkToolPaletteClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type 'a scrollable_class = 'a GtkScrollableClass.class
    type target_entry_t = GtkTargetEntryRecord.t
    type dest_defaults_t = GtkDestDefaults.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type selection_data_t = GtkSelectionDataRecord.t
    type 'a tool_item_class = 'a GtkToolItemClass.class
    type tool_palette_drag_targets_t = GtkToolPaletteDragTargets.t
    type 'a tool_item_group_class = 'a GtkToolItemGroupClass.class
    type icon_size_t = GtkIconSize.t
    type toolbar_style_t = GtkToolbarStyle.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr ---> GtkOrientableClass.FFI.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.FFI.withPtr ---> GtkScrollableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkToolPaletteClass.FFI.fromPtr false) new_ ()
    fun getDragTargetGroup () = (I ---> GtkTargetEntryRecord.FFI.fromPtr false) getDragTargetGroup_ ()
    fun getDragTargetItem () = (I ---> GtkTargetEntryRecord.FFI.fromPtr false) getDragTargetItem_ ()
    fun addDragDest self widget flags targets actions =
      (
        GtkToolPaletteClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GtkDestDefaults.FFI.withVal
         &&&> GtkToolPaletteDragTargets.FFI.withVal
         &&&> GdkDragAction.FFI.withVal
         ---> I
      )
        addDragDest_
        (
          self
           & widget
           & flags
           & targets
           & actions
        )
    fun getDragItem self selection = (GtkToolPaletteClass.FFI.withPtr &&&> GtkSelectionDataRecord.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getDragItem_ (self & selection)
    fun getDropGroup self x y =
      (
        GtkToolPaletteClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> GtkToolItemGroupClass.FFI.fromPtr false
      )
        getDropGroup_
        (
          self
           & x
           & y
        )
    fun getDropItem self x y =
      (
        GtkToolPaletteClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> GtkToolItemClass.FFI.fromPtr false
      )
        getDropItem_
        (
          self
           & x
           & y
        )
    fun getExclusive self group = (GtkToolPaletteClass.FFI.withPtr &&&> GtkToolItemGroupClass.FFI.withPtr ---> GBool.FFI.fromVal) getExclusive_ (self & group)
    fun getExpand self group = (GtkToolPaletteClass.FFI.withPtr &&&> GtkToolItemGroupClass.FFI.withPtr ---> GBool.FFI.fromVal) getExpand_ (self & group)
    fun getGroupPosition self group = (GtkToolPaletteClass.FFI.withPtr &&&> GtkToolItemGroupClass.FFI.withPtr ---> GInt.FFI.fromVal) getGroupPosition_ (self & group)
    fun getIconSize self = (GtkToolPaletteClass.FFI.withPtr ---> GInt.FFI.fromVal) getIconSize_ self
    fun getStyle self = (GtkToolPaletteClass.FFI.withPtr ---> GtkToolbarStyle.FFI.fromVal) getStyle_ self
    fun setDragSource self targets = (GtkToolPaletteClass.FFI.withPtr &&&> GtkToolPaletteDragTargets.FFI.withVal ---> I) setDragSource_ (self & targets)
    fun setExclusive self group exclusive =
      (
        GtkToolPaletteClass.FFI.withPtr
         &&&> GtkToolItemGroupClass.FFI.withPtr
         &&&> GBool.FFI.withVal
         ---> I
      )
        setExclusive_
        (
          self
           & group
           & exclusive
        )
    fun setExpand self group expand =
      (
        GtkToolPaletteClass.FFI.withPtr
         &&&> GtkToolItemGroupClass.FFI.withPtr
         &&&> GBool.FFI.withVal
         ---> I
      )
        setExpand_
        (
          self
           & group
           & expand
        )
    fun setGroupPosition self group position =
      (
        GtkToolPaletteClass.FFI.withPtr
         &&&> GtkToolItemGroupClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         ---> I
      )
        setGroupPosition_
        (
          self
           & group
           & position
        )
    fun setIconSize self iconSize = (GtkToolPaletteClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setIconSize_ (self & iconSize)
    fun setStyle self style = (GtkToolPaletteClass.FFI.withPtr &&&> GtkToolbarStyle.FFI.withVal ---> I) setStyle_ (self & style)
    fun unsetIconSize self = (GtkToolPaletteClass.FFI.withPtr ---> I) unsetIconSize_ self
    fun unsetStyle self = (GtkToolPaletteClass.FFI.withPtr ---> I) unsetStyle_ self
    local
      open Property
    in
      val iconSizeProp =
        {
          get = fn x => get "icon-size" GtkIconSize.t x,
          set = fn x => set "icon-size" GtkIconSize.t x
        }
      val iconSizeSetProp =
        {
          get = fn x => get "icon-size-set" boolean x,
          set = fn x => set "icon-size-set" boolean x
        }
      val toolbarStyleProp =
        {
          get = fn x => get "toolbar-style" GtkToolbarStyle.t x,
          set = fn x => set "toolbar-style" GtkToolbarStyle.t x
        }
    end
  end
