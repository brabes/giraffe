structure GtkAdjustment :>
  GTK_ADJUSTMENT
    where type 'a class = 'a GtkAdjustmentClass.class =
  struct
    val getType_ = _import "gtk_adjustment_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_adjustment_new" :
              GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               -> GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val changed_ = _import "gtk_adjustment_changed" : GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p -> unit;
    val clampPage_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_adjustment_clamp_page" :
              GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val configure_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "gtk_adjustment_configure" :
              GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val getLower_ = _import "gtk_adjustment_get_lower" : GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p -> GDouble.FFI.val_;
    val getMinimumIncrement_ = _import "gtk_adjustment_get_minimum_increment" : GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p -> GDouble.FFI.val_;
    val getPageIncrement_ = _import "gtk_adjustment_get_page_increment" : GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p -> GDouble.FFI.val_;
    val getPageSize_ = _import "gtk_adjustment_get_page_size" : GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p -> GDouble.FFI.val_;
    val getStepIncrement_ = _import "gtk_adjustment_get_step_increment" : GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p -> GDouble.FFI.val_;
    val getUpper_ = _import "gtk_adjustment_get_upper" : GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p -> GDouble.FFI.val_;
    val getValue_ = _import "gtk_adjustment_get_value" : GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p -> GDouble.FFI.val_;
    val setLower_ = fn x1 & x2 => (_import "gtk_adjustment_set_lower" : GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
    val setPageIncrement_ = fn x1 & x2 => (_import "gtk_adjustment_set_page_increment" : GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
    val setPageSize_ = fn x1 & x2 => (_import "gtk_adjustment_set_page_size" : GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
    val setStepIncrement_ = fn x1 & x2 => (_import "gtk_adjustment_set_step_increment" : GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
    val setUpper_ = fn x1 & x2 => (_import "gtk_adjustment_set_upper" : GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
    val setValue_ = fn x1 & x2 => (_import "gtk_adjustment_set_value" : GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
    val valueChanged_ = _import "gtk_adjustment_value_changed" : GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p -> unit;
    type 'a class = 'a GtkAdjustmentClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new
      (
        value,
        lower,
        upper,
        stepIncrement,
        pageIncrement,
        pageSize
      ) =
      (
        GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> GtkAdjustmentClass.FFI.fromPtr false
      )
        new_
        (
          value
           & lower
           & upper
           & stepIncrement
           & pageIncrement
           & pageSize
        )
    fun changed self = (GtkAdjustmentClass.FFI.withPtr false ---> I) changed_ self
    fun clampPage self (lower, upper) =
      (
        GtkAdjustmentClass.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        clampPage_
        (
          self
           & lower
           & upper
        )
    fun configure
      self
      (
        value,
        lower,
        upper,
        stepIncrement,
        pageIncrement,
        pageSize
      ) =
      (
        GtkAdjustmentClass.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        configure_
        (
          self
           & value
           & lower
           & upper
           & stepIncrement
           & pageIncrement
           & pageSize
        )
    fun getLower self = (GtkAdjustmentClass.FFI.withPtr false ---> GDouble.FFI.fromVal) getLower_ self
    fun getMinimumIncrement self = (GtkAdjustmentClass.FFI.withPtr false ---> GDouble.FFI.fromVal) getMinimumIncrement_ self
    fun getPageIncrement self = (GtkAdjustmentClass.FFI.withPtr false ---> GDouble.FFI.fromVal) getPageIncrement_ self
    fun getPageSize self = (GtkAdjustmentClass.FFI.withPtr false ---> GDouble.FFI.fromVal) getPageSize_ self
    fun getStepIncrement self = (GtkAdjustmentClass.FFI.withPtr false ---> GDouble.FFI.fromVal) getStepIncrement_ self
    fun getUpper self = (GtkAdjustmentClass.FFI.withPtr false ---> GDouble.FFI.fromVal) getUpper_ self
    fun getValue self = (GtkAdjustmentClass.FFI.withPtr false ---> GDouble.FFI.fromVal) getValue_ self
    fun setLower self lower = (GtkAdjustmentClass.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I) setLower_ (self & lower)
    fun setPageIncrement self pageIncrement = (GtkAdjustmentClass.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I) setPageIncrement_ (self & pageIncrement)
    fun setPageSize self pageSize = (GtkAdjustmentClass.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I) setPageSize_ (self & pageSize)
    fun setStepIncrement self stepIncrement = (GtkAdjustmentClass.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I) setStepIncrement_ (self & stepIncrement)
    fun setUpper self upper = (GtkAdjustmentClass.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I) setUpper_ (self & upper)
    fun setValue self value = (GtkAdjustmentClass.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I) setValue_ (self & value)
    fun valueChanged self = (GtkAdjustmentClass.FFI.withPtr false ---> I) valueChanged_ self
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (void ---> ret_void) f
      fun valueChangedSig f = signal "value-changed" (void ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val lowerProp =
        {
          name = "lower",
          gtype = fn () => C.gtype double (),
          get = fn x => fn () => C.get double x,
          set = fn x => C.set double x,
          init = fn x => C.set double x
        }
      val pageIncrementProp =
        {
          name = "page-increment",
          gtype = fn () => C.gtype double (),
          get = fn x => fn () => C.get double x,
          set = fn x => C.set double x,
          init = fn x => C.set double x
        }
      val pageSizeProp =
        {
          name = "page-size",
          gtype = fn () => C.gtype double (),
          get = fn x => fn () => C.get double x,
          set = fn x => C.set double x,
          init = fn x => C.set double x
        }
      val stepIncrementProp =
        {
          name = "step-increment",
          gtype = fn () => C.gtype double (),
          get = fn x => fn () => C.get double x,
          set = fn x => C.set double x,
          init = fn x => C.set double x
        }
      val upperProp =
        {
          name = "upper",
          gtype = fn () => C.gtype double (),
          get = fn x => fn () => C.get double x,
          set = fn x => C.set double x,
          init = fn x => C.set double x
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
