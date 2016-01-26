structure GtkNumerableIcon :>
  GTK_NUMERABLE_ICON
    where type 'a class_t = 'a GtkNumerableIconClass.t
    where type 'a style_context_class_t = 'a GtkStyleContextClass.t =
  struct
    val getType_ = _import "gtk_numerable_icon_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_numerable_icon_new" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newWithStyleContext_ = fn x1 & x2 => (_import "gtk_numerable_icon_new_with_style_context" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getBackgroundGicon_ = _import "gtk_numerable_icon_get_background_gicon" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getBackgroundIconName_ = _import "gtk_numerable_icon_get_background_icon_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getCount_ = _import "gtk_numerable_icon_get_count" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getLabel_ = _import "gtk_numerable_icon_get_label" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getStyleContext_ = _import "gtk_numerable_icon_get_style_context" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val setBackgroundGicon_ = fn x1 & x2 => (_import "gtk_numerable_icon_set_background_gicon" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setBackgroundIconName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_numerable_icon_set_background_icon_name" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * unit GCharVec.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setCount_ = fn x1 & x2 => (_import "gtk_numerable_icon_set_count" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setLabel_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_numerable_icon_set_label" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * unit GCharVec.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setStyleContext_ = fn x1 & x2 => (_import "gtk_numerable_icon_set_style_context" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    type 'a class_t = 'a GtkNumerableIconClass.t
    type 'a style_context_class_t = 'a GtkStyleContextClass.t
    type t = base class_t
    fun asIcon self = (GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new baseIcon = (GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr true) new_ baseIcon
    fun newWithStyleContext baseIcon context = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr true) newWithStyleContext_ (baseIcon & context)
    fun getBackgroundGicon self = (GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr false) getBackgroundGicon_ self
    fun getBackgroundIconName self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getBackgroundIconName_ self
    fun getCount self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getCount_ self
    fun getLabel self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getLabel_ self
    fun getStyleContext self = (GObjectObjectClass.C.withPtr ---> GtkStyleContextClass.C.fromPtr false) getStyleContext_ self
    fun setBackgroundGicon self icon = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setBackgroundGicon_ (self & icon)
    fun setBackgroundIconName self iconName = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstOptPtr ---> I) setBackgroundIconName_ (self & iconName)
    fun setCount self count = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setCount_ (self & count)
    fun setLabel self label = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstOptPtr ---> I) setLabel_ (self & label)
    fun setStyleContext self style = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setStyleContext_ (self & style)
    local
      open Property
    in
      val backgroundIconProp =
        {
          get = fn x => get "background-icon" GioIconClass.tOpt x,
          set = fn x => set "background-icon" GioIconClass.tOpt x
        }
      val backgroundIconNameProp =
        {
          get = fn x => get "background-icon-name" stringOpt x,
          set = fn x => set "background-icon-name" stringOpt x
        }
      val countProp =
        {
          get = fn x => get "count" int x,
          set = fn x => set "count" int x
        }
      val labelProp =
        {
          get = fn x => get "label" stringOpt x,
          set = fn x => set "label" stringOpt x
        }
      val styleContextProp =
        {
          get = fn x => get "style-context" GtkStyleContextClass.tOpt x,
          set = fn x => set "style-context" GtkStyleContextClass.tOpt x
        }
    end
  end
