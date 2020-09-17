structure GtkAccelLabel :>
  GTK_ACCEL_LABEL
    where type 'a class = 'a GtkAccelLabelClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_accel_label_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "mlton_gtk_accel_label_new" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getAccel_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_accel_label_get_accel" :
              GtkAccelLabelClass.FFI.non_opt GtkAccelLabelClass.FFI.p
               * GUInt.FFI.ref_
               * GdkModifierType.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getAccelWidget_ = _import "gtk_accel_label_get_accel_widget" : GtkAccelLabelClass.FFI.non_opt GtkAccelLabelClass.FFI.p -> GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p;
    val getAccelWidth_ = _import "gtk_accel_label_get_accel_width" : GtkAccelLabelClass.FFI.non_opt GtkAccelLabelClass.FFI.p -> GUInt.FFI.val_;
    val refetch_ = _import "gtk_accel_label_refetch" : GtkAccelLabelClass.FFI.non_opt GtkAccelLabelClass.FFI.p -> GBool.FFI.val_;
    val setAccel_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_accel_label_set_accel" :
              GtkAccelLabelClass.FFI.non_opt GtkAccelLabelClass.FFI.p
               * GUInt.FFI.val_
               * GdkModifierType.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setAccelClosure_ = fn x1 & x2 => (_import "gtk_accel_label_set_accel_closure" : GtkAccelLabelClass.FFI.non_opt GtkAccelLabelClass.FFI.p * GObjectClosureRecord.FFI.non_opt GObjectClosureRecord.FFI.p -> unit;) (x1, x2)
    val setAccelWidget_ = fn x1 & x2 => (_import "gtk_accel_label_set_accel_widget" : GtkAccelLabelClass.FFI.non_opt GtkAccelLabelClass.FFI.p * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GtkAccelLabelClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new string = (Utf8.FFI.withPtr 0 ---> GtkAccelLabelClass.FFI.fromPtr false) new_ string before Utf8.FFI.touchPtr string
    fun getAccel self =
      let
        val acceleratorKey
         & acceleratorMods
         & () =
          (
            GtkAccelLabelClass.FFI.withPtr false
             &&&> GUInt.FFI.withRefVal
             &&&> GdkModifierType.FFI.withRefVal
             ---> GUInt.FFI.fromVal
                   && GdkModifierType.FFI.fromVal
                   && I
          )
            getAccel_
            (
              self
               & GUInt.null
               & GdkModifierType.flags []
            )
      in
        (acceleratorKey, acceleratorMods)
      end
    fun getAccelWidget self = (GtkAccelLabelClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getAccelWidget_ self before GtkAccelLabelClass.FFI.touchPtr self
    fun getAccelWidth self = (GtkAccelLabelClass.FFI.withPtr false ---> GUInt.FFI.fromVal) getAccelWidth_ self
    fun refetch self = (GtkAccelLabelClass.FFI.withPtr false ---> GBool.FFI.fromVal) refetch_ self
    fun setAccel self (acceleratorKey, acceleratorMods) =
      (
        GtkAccelLabelClass.FFI.withPtr false
         &&&> GUInt.FFI.withVal
         &&&> GdkModifierType.FFI.withVal
         ---> I
      )
        setAccel_
        (
          self
           & acceleratorKey
           & acceleratorMods
        )
    fun setAccelClosure self accelClosure = (GtkAccelLabelClass.FFI.withPtr false &&&> GObjectClosureRecord.FFI.withPtr false ---> I) setAccelClosure_ (self & accelClosure)
    fun setAccelWidget self accelWidget = (GtkAccelLabelClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> I) setAccelWidget_ (self & accelWidget)
    local
      open ValueAccessor
    in
      val accelClosureProp =
        {
          name = "accel-closure",
          gtype = fn () => C.gtype GObjectClosureRecord.tOpt (),
          get = fn x => fn () => C.get GObjectClosureRecord.tOpt x,
          set = fn x => C.set GObjectClosureRecord.tOpt x,
          init = fn x => C.set GObjectClosureRecord.tOpt x
        }
      val accelWidgetProp =
        {
          name = "accel-widget",
          gtype = fn () => C.gtype GtkWidgetClass.tOpt (),
          get = fn x => fn () => C.get GtkWidgetClass.tOpt x,
          set = fn x => C.set GtkWidgetClass.tOpt x,
          init = fn x => C.set GtkWidgetClass.tOpt x
        }
    end
  end
