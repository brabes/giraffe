structure GtkLevelBar :>
  GTK_LEVEL_BAR
    where type 'a class = 'a GtkLevelBarClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type level_bar_mode_t = GtkLevelBarMode.t =
  struct
    val getType_ = _import "gtk_level_bar_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_level_bar_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val newForInterval_ = fn x1 & x2 => (_import "gtk_level_bar_new_for_interval" : GDouble.FFI.val_ * GDouble.FFI.val_ -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;) (x1, x2)
    val addOffsetValue_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_level_bar_add_offset_value" :
              GtkLevelBarClass.FFI.non_opt GtkLevelBarClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GDouble.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getInverted_ = _import "gtk_level_bar_get_inverted" : GtkLevelBarClass.FFI.non_opt GtkLevelBarClass.FFI.p -> GBool.FFI.val_;
    val getMaxValue_ = _import "gtk_level_bar_get_max_value" : GtkLevelBarClass.FFI.non_opt GtkLevelBarClass.FFI.p -> GDouble.FFI.val_;
    val getMinValue_ = _import "gtk_level_bar_get_min_value" : GtkLevelBarClass.FFI.non_opt GtkLevelBarClass.FFI.p -> GDouble.FFI.val_;
    val getMode_ = _import "gtk_level_bar_get_mode" : GtkLevelBarClass.FFI.non_opt GtkLevelBarClass.FFI.p -> GtkLevelBarMode.FFI.val_;
    val getOffsetValue_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_level_bar_get_offset_value" :
              GtkLevelBarClass.FFI.non_opt GtkLevelBarClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * GDouble.FFI.ref_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getValue_ = _import "gtk_level_bar_get_value" : GtkLevelBarClass.FFI.non_opt GtkLevelBarClass.FFI.p -> GDouble.FFI.val_;
    val removeOffsetValue_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_level_bar_remove_offset_value" :
              GtkLevelBarClass.FFI.non_opt GtkLevelBarClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setInverted_ = fn x1 & x2 => (_import "gtk_level_bar_set_inverted" : GtkLevelBarClass.FFI.non_opt GtkLevelBarClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setMaxValue_ = fn x1 & x2 => (_import "gtk_level_bar_set_max_value" : GtkLevelBarClass.FFI.non_opt GtkLevelBarClass.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
    val setMinValue_ = fn x1 & x2 => (_import "gtk_level_bar_set_min_value" : GtkLevelBarClass.FFI.non_opt GtkLevelBarClass.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
    val setMode_ = fn x1 & x2 => (_import "gtk_level_bar_set_mode" : GtkLevelBarClass.FFI.non_opt GtkLevelBarClass.FFI.p * GtkLevelBarMode.FFI.val_ -> unit;) (x1, x2)
    val setValue_ = fn x1 & x2 => (_import "gtk_level_bar_set_value" : GtkLevelBarClass.FFI.non_opt GtkLevelBarClass.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkLevelBarClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type level_bar_mode_t = GtkLevelBarMode.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr false ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkLevelBarClass.FFI.fromPtr false) new_ ()
    fun newForInterval (minValue, maxValue) = (GDouble.FFI.withVal &&&> GDouble.FFI.withVal ---> GtkLevelBarClass.FFI.fromPtr false) newForInterval_ (minValue & maxValue)
    fun addOffsetValue self (name, value) =
      (
        GtkLevelBarClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GDouble.FFI.withVal
         ---> I
      )
        addOffsetValue_
        (
          self
           & name
           & value
        )
    fun getInverted self = (GtkLevelBarClass.FFI.withPtr false ---> GBool.FFI.fromVal) getInverted_ self
    fun getMaxValue self = (GtkLevelBarClass.FFI.withPtr false ---> GDouble.FFI.fromVal) getMaxValue_ self
    fun getMinValue self = (GtkLevelBarClass.FFI.withPtr false ---> GDouble.FFI.fromVal) getMinValue_ self
    fun getMode self = (GtkLevelBarClass.FFI.withPtr false ---> GtkLevelBarMode.FFI.fromVal) getMode_ self
    fun getOffsetValue self name =
      let
        val value & retVal =
          (
            GtkLevelBarClass.FFI.withPtr false
             &&&> Utf8.FFI.withOptPtr 0
             &&&> GDouble.FFI.withRefVal
             ---> GDouble.FFI.fromVal && GBool.FFI.fromVal
          )
            getOffsetValue_
            (
              self
               & name
               & GDouble.null
            )
      in
        if retVal then SOME value else NONE
      end
    fun getValue self = (GtkLevelBarClass.FFI.withPtr false ---> GDouble.FFI.fromVal) getValue_ self
    fun removeOffsetValue self name = (GtkLevelBarClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) removeOffsetValue_ (self & name)
    fun setInverted self inverted = (GtkLevelBarClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setInverted_ (self & inverted)
    fun setMaxValue self value = (GtkLevelBarClass.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I) setMaxValue_ (self & value)
    fun setMinValue self value = (GtkLevelBarClass.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I) setMinValue_ (self & value)
    fun setMode self mode = (GtkLevelBarClass.FFI.withPtr false &&&> GtkLevelBarMode.FFI.withVal ---> I) setMode_ (self & mode)
    fun setValue self value = (GtkLevelBarClass.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I) setValue_ (self & value)
    local
      open ClosureMarshal Signal
    in
      fun offsetChangedSig f = signal "offset-changed" (get 0w1 string ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val invertedProp =
        {
          name = "inverted",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val maxValueProp =
        {
          name = "max-value",
          gtype = fn () => C.gtype double (),
          get = fn x => fn () => C.get double x,
          set = fn x => C.set double x,
          init = fn x => C.set double x
        }
      val minValueProp =
        {
          name = "min-value",
          gtype = fn () => C.gtype double (),
          get = fn x => fn () => C.get double x,
          set = fn x => C.set double x,
          init = fn x => C.set double x
        }
      val modeProp =
        {
          name = "mode",
          gtype = fn () => C.gtype GtkLevelBarMode.t (),
          get = fn x => fn () => C.get GtkLevelBarMode.t x,
          set = fn x => C.set GtkLevelBarMode.t x,
          init = fn x => C.set GtkLevelBarMode.t x
        }
      val valueProp =
        {
          name = "value",
          gtype = fn () => C.gtype double (),
          get = fn x => fn () => C.get double x,
          set = fn x => C.set double x,
          init = fn x => C.set double x
        }
    end
  end
