structure GtkSourceMarkAttributes :>
  GTK_SOURCE_MARK_ATTRIBUTES
    where type 'a class = 'a GtkSourceMarkAttributesClass.class
    where type 'a mark_class = 'a GtkSourceMarkClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_source_mark_attributes_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_source_mark_attributes_new") (cVoid --> GtkSourceMarkAttributesClass.PolyML.cPtr)
      val getBackground_ = call (getSymbol "gtk_source_mark_attributes_get_background") (GtkSourceMarkAttributesClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getGicon_ = call (getSymbol "gtk_source_mark_attributes_get_gicon") (GtkSourceMarkAttributesClass.PolyML.cPtr --> GioIconClass.PolyML.cPtr)
      val getIconName_ = call (getSymbol "gtk_source_mark_attributes_get_icon_name") (GtkSourceMarkAttributesClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPixbuf_ = call (getSymbol "gtk_source_mark_attributes_get_pixbuf") (GtkSourceMarkAttributesClass.PolyML.cPtr --> GdkPixbufPixbufClass.PolyML.cPtr)
      val getStockId_ = call (getSymbol "gtk_source_mark_attributes_get_stock_id") (GtkSourceMarkAttributesClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getTooltipMarkup_ = call (getSymbol "gtk_source_mark_attributes_get_tooltip_markup") (GtkSourceMarkAttributesClass.PolyML.cPtr &&> GtkSourceMarkClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getTooltipText_ = call (getSymbol "gtk_source_mark_attributes_get_tooltip_text") (GtkSourceMarkAttributesClass.PolyML.cPtr &&> GtkSourceMarkClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val renderIcon_ =
        call (getSymbol "gtk_source_mark_attributes_render_icon")
          (
            GtkSourceMarkAttributesClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             --> GdkPixbufPixbufClass.PolyML.cPtr
          )
      val setBackground_ = call (getSymbol "gtk_source_mark_attributes_set_background") (GtkSourceMarkAttributesClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> cVoid)
      val setGicon_ = call (getSymbol "gtk_source_mark_attributes_set_gicon") (GtkSourceMarkAttributesClass.PolyML.cPtr &&> GioIconClass.PolyML.cPtr --> cVoid)
      val setIconName_ = call (getSymbol "gtk_source_mark_attributes_set_icon_name") (GtkSourceMarkAttributesClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setPixbuf_ = call (getSymbol "gtk_source_mark_attributes_set_pixbuf") (GtkSourceMarkAttributesClass.PolyML.cPtr &&> GdkPixbufPixbufClass.PolyML.cPtr --> cVoid)
      val setStockId_ = call (getSymbol "gtk_source_mark_attributes_set_stock_id") (GtkSourceMarkAttributesClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
    end
    type 'a class = 'a GtkSourceMarkAttributesClass.class
    type 'a mark_class = 'a GtkSourceMarkClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkSourceMarkAttributesClass.FFI.fromPtr true) new_ ()
    fun getBackground self =
      let
        val background & retVal = (GtkSourceMarkAttributesClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withNewPtr ---> GdkRgbaRecord.FFI.fromPtr true && GBool.FFI.fromVal) getBackground_ (self & ())
      in
        if retVal then SOME background else NONE
      end
    fun getGicon self = (GtkSourceMarkAttributesClass.FFI.withPtr false ---> GioIconClass.FFI.fromPtr false) getGicon_ self before GtkSourceMarkAttributesClass.FFI.touchPtr self
    fun getIconName self = (GtkSourceMarkAttributesClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getIconName_ self before GtkSourceMarkAttributesClass.FFI.touchPtr self
    fun getPixbuf self = (GtkSourceMarkAttributesClass.FFI.withPtr false ---> GdkPixbufPixbufClass.FFI.fromPtr false) getPixbuf_ self before GtkSourceMarkAttributesClass.FFI.touchPtr self
    fun getStockId self = (GtkSourceMarkAttributesClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getStockId_ self before GtkSourceMarkAttributesClass.FFI.touchPtr self
    fun getTooltipMarkup self mark = (GtkSourceMarkAttributesClass.FFI.withPtr false &&&> GtkSourceMarkClass.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) getTooltipMarkup_ (self & mark)
    fun getTooltipText self mark = (GtkSourceMarkAttributesClass.FFI.withPtr false &&&> GtkSourceMarkClass.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) getTooltipText_ (self & mark)
    fun renderIcon self (widget, size) =
      (
        GtkSourceMarkAttributesClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         ---> GdkPixbufPixbufClass.FFI.fromPtr false
      )
        renderIcon_
        (
          self
           & widget
           & size
        )
       before GtkSourceMarkAttributesClass.FFI.touchPtr self
       before GtkWidgetClass.FFI.touchPtr widget
    fun setBackground self background = (GtkSourceMarkAttributesClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withPtr false ---> I) setBackground_ (self & background)
    fun setGicon self gicon = (GtkSourceMarkAttributesClass.FFI.withPtr false &&&> GioIconClass.FFI.withPtr false ---> I) setGicon_ (self & gicon)
    fun setIconName self iconName = (GtkSourceMarkAttributesClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setIconName_ (self & iconName)
    fun setPixbuf self pixbuf = (GtkSourceMarkAttributesClass.FFI.withPtr false &&&> GdkPixbufPixbufClass.FFI.withPtr false ---> I) setPixbuf_ (self & pixbuf)
    fun setStockId self stockId = (GtkSourceMarkAttributesClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setStockId_ (self & stockId)
    local
      open ClosureMarshal Signal
    in
      fun queryTooltipMarkupSig f = signal "query-tooltip-markup" (get 0w1 GtkSourceMarkClass.t ---> ret string) f
      fun queryTooltipTextSig f = signal "query-tooltip-text" (get 0w1 GtkSourceMarkClass.t ---> ret string) f
    end
    local
      open ValueAccessor
    in
      val backgroundProp =
        {
          name = "background",
          gtype = fn () => C.gtype GdkRgbaRecord.tOpt (),
          get = fn x => fn () => C.get GdkRgbaRecord.tOpt x,
          set = fn x => C.set GdkRgbaRecord.tOpt x,
          init = fn x => C.set GdkRgbaRecord.tOpt x
        }
      val giconProp =
        {
          name = "gicon",
          gtype = fn () => C.gtype GioIconClass.tOpt (),
          get = fn x => fn () => C.get GioIconClass.tOpt x,
          set = fn x => C.set GioIconClass.tOpt x,
          init = fn x => C.set GioIconClass.tOpt x
        }
      val iconNameProp =
        {
          name = "icon-name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val pixbufProp =
        {
          name = "pixbuf",
          gtype = fn () => C.gtype GdkPixbufPixbufClass.tOpt (),
          get = fn x => fn () => C.get GdkPixbufPixbufClass.tOpt x,
          set = fn x => C.set GdkPixbufPixbufClass.tOpt x,
          init = fn x => C.set GdkPixbufPixbufClass.tOpt x
        }
      val stockIdProp =
        {
          name = "stock-id",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
    end
  end
