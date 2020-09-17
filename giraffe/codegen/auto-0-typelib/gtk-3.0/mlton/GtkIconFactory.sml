structure GtkIconFactory :>
  GTK_ICON_FACTORY
    where type 'a class = 'a GtkIconFactoryClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type icon_set_t = GtkIconSetRecord.t =
  struct
    val getType_ = _import "gtk_icon_factory_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_icon_factory_new" : unit -> GtkIconFactoryClass.FFI.non_opt GtkIconFactoryClass.FFI.p;
    val lookupDefault_ = _import "mlton_gtk_icon_factory_lookup_default" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GtkIconSetRecord.FFI.non_opt GtkIconSetRecord.FFI.p;
    val add_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_icon_factory_add" :
              GtkIconFactoryClass.FFI.non_opt GtkIconFactoryClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GtkIconSetRecord.FFI.non_opt GtkIconSetRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val addDefault_ = _import "gtk_icon_factory_add_default" : GtkIconFactoryClass.FFI.non_opt GtkIconFactoryClass.FFI.p -> unit;
    val lookup_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_icon_factory_lookup" :
              GtkIconFactoryClass.FFI.non_opt GtkIconFactoryClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GtkIconSetRecord.FFI.non_opt GtkIconSetRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val removeDefault_ = _import "gtk_icon_factory_remove_default" : GtkIconFactoryClass.FFI.non_opt GtkIconFactoryClass.FFI.p -> unit;
    type 'a class = 'a GtkIconFactoryClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type icon_set_t = GtkIconSetRecord.t
    type t = base class
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkIconFactoryClass.FFI.fromPtr true) new_ ()
    fun lookupDefault stockId = (Utf8.FFI.withPtr 0 ---> GtkIconSetRecord.FFI.fromPtr false) lookupDefault_ stockId before Utf8.FFI.touchPtr stockId
    fun add self (stockId, iconSet) =
      (
        GtkIconFactoryClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GtkIconSetRecord.FFI.withPtr false
         ---> I
      )
        add_
        (
          self
           & stockId
           & iconSet
        )
    fun addDefault self = (GtkIconFactoryClass.FFI.withPtr false ---> I) addDefault_ self
    fun lookup self stockId = (GtkIconFactoryClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GtkIconSetRecord.FFI.fromPtr false) lookup_ (self & stockId) before GtkIconFactoryClass.FFI.touchPtr self before Utf8.FFI.touchPtr stockId
    fun removeDefault self = (GtkIconFactoryClass.FFI.withPtr false ---> I) removeDefault_ self
  end
