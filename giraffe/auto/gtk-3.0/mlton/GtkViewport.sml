structure GtkViewport :>
  GTK_VIEWPORT
    where type 'a class_t = 'a GtkViewportClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a scrollableclass_t = 'a GtkScrollableClass.t
    where type 'a adjustmentclass_t = 'a GtkAdjustmentClass.t
    where type shadowtype_t = GtkShadowType.t =
  struct
    val getType_ = _import "gtk_viewport_get_type" : unit -> GObjectType.C.val_;
    val new_ = fn x1 & x2 => (_import "gtk_viewport_new" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getBinWindow_ = _import "gtk_viewport_get_bin_window" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getShadowType_ = _import "gtk_viewport_get_shadow_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkShadowType.C.val_;
    val getViewWindow_ = _import "gtk_viewport_get_view_window" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val setShadowType_ = fn x1 & x2 => (_import "gtk_viewport_set_shadow_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkShadowType.C.val_ -> unit;) (x1, x2)
    type 'a class_t = 'a GtkViewportClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a scrollableclass_t = 'a GtkScrollableClass.t
    type 'a adjustmentclass_t = 'a GtkAdjustmentClass.t
    type shadowtype_t = GtkShadowType.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.C.withPtr ---> GtkScrollableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new hadjustment vadjustment = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> GtkViewportClass.C.fromPtr false) new_ (hadjustment & vadjustment)
    fun getBinWindow self = (GObjectObjectClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getBinWindow_ self
    fun getShadowType self = (GObjectObjectClass.C.withPtr ---> GtkShadowType.C.fromVal) getShadowType_ self
    fun getViewWindow self = (GObjectObjectClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getViewWindow_ self
    fun setShadowType self type' = (GObjectObjectClass.C.withPtr &&&> GtkShadowType.C.withVal ---> I) setShadowType_ (self & type')
    local
      open Property
    in
      val shadowTypeProp =
        {
          get = fn x => get "shadow-type" GtkShadowType.t x,
          set = fn x => set "shadow-type" GtkShadowType.t x
        }
    end
  end
