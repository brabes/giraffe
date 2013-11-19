structure GtkRange :>
  GTK_RANGE
    where type 'a class_t = 'a GtkRangeClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a orientableclass_t = 'a GtkOrientableClass.t
    where type scrolltype_t = GtkScrollType.t
    where type 'a adjustmentclass_t = 'a GtkAdjustmentClass.t
    where type sensitivitytype_t = GtkSensitivityType.t =
  struct
    val getType_ = _import "gtk_range_get_type" : unit -> GObjectType.C.val_;
    val getAdjustment_ = _import "gtk_range_get_adjustment" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getFillLevel_ = _import "gtk_range_get_fill_level" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Double.C.val_;
    val getFlippable_ = _import "gtk_range_get_flippable" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getInverted_ = _import "gtk_range_get_inverted" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getLowerStepperSensitivity_ = _import "gtk_range_get_lower_stepper_sensitivity" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkSensitivityType.C.val_;
    val getMinSliderSize_ = _import "gtk_range_get_min_slider_size" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.C.val_;
    val getRangeRect_ = fn x1 & x2 => (_import "gtk_range_get_range_rect" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * CairoRectangleIntRecord.C.notnull CairoRectangleIntRecord.C.p -> unit;) (x1, x2)
    val getRestrictToFillLevel_ = _import "gtk_range_get_restrict_to_fill_level" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getRoundDigits_ = _import "gtk_range_get_round_digits" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.C.val_;
    val getShowFillLevel_ = _import "gtk_range_get_show_fill_level" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getSliderRange_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_range_get_slider_range" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getSliderSizeFixed_ = _import "gtk_range_get_slider_size_fixed" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getUpperStepperSensitivity_ = _import "gtk_range_get_upper_stepper_sensitivity" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkSensitivityType.C.val_;
    val getValue_ = _import "gtk_range_get_value" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Double.C.val_;
    val setAdjustment_ = fn x1 & x2 => (_import "gtk_range_set_adjustment" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setFillLevel_ = fn x1 & x2 => (_import "gtk_range_set_fill_level" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Double.C.val_ -> unit;) (x1, x2)
    val setFlippable_ = fn x1 & x2 => (_import "gtk_range_set_flippable" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setIncrements_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_range_set_increments" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setInverted_ = fn x1 & x2 => (_import "gtk_range_set_inverted" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setLowerStepperSensitivity_ = fn x1 & x2 => (_import "gtk_range_set_lower_stepper_sensitivity" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkSensitivityType.C.val_ -> unit;) (x1, x2)
    val setMinSliderSize_ = fn x1 & x2 => (_import "gtk_range_set_min_slider_size" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setRange_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_range_set_range" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setRestrictToFillLevel_ = fn x1 & x2 => (_import "gtk_range_set_restrict_to_fill_level" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setRoundDigits_ = fn x1 & x2 => (_import "gtk_range_set_round_digits" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setShowFillLevel_ = fn x1 & x2 => (_import "gtk_range_set_show_fill_level" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setSliderSizeFixed_ = fn x1 & x2 => (_import "gtk_range_set_slider_size_fixed" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setUpperStepperSensitivity_ = fn x1 & x2 => (_import "gtk_range_set_upper_stepper_sensitivity" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkSensitivityType.C.val_ -> unit;) (x1, x2)
    val setValue_ = fn x1 & x2 => (_import "gtk_range_set_value" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Double.C.val_ -> unit;) (x1, x2)
    type 'a class_t = 'a GtkRangeClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a orientableclass_t = 'a GtkOrientableClass.t
    type scrolltype_t = GtkScrollType.t
    type 'a adjustmentclass_t = 'a GtkAdjustmentClass.t
    type sensitivitytype_t = GtkSensitivityType.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getAdjustment self = (GObjectObjectClass.C.withPtr ---> GtkAdjustmentClass.C.fromPtr false) getAdjustment_ self
    fun getFillLevel self = (GObjectObjectClass.C.withPtr ---> FFI.Double.C.fromVal) getFillLevel_ self
    fun getFlippable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getFlippable_ self
    fun getInverted self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getInverted_ self
    fun getLowerStepperSensitivity self = (GObjectObjectClass.C.withPtr ---> GtkSensitivityType.C.fromVal) getLowerStepperSensitivity_ self
    fun getMinSliderSize self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getMinSliderSize_ self
    fun getRangeRect self =
      let
        val rangeRect & () = (GObjectObjectClass.C.withPtr &&&> CairoRectangleIntRecord.C.withNewPtr ---> CairoRectangleIntRecord.C.fromPtr true && I) getRangeRect_ (self & ())
      in
        rangeRect
      end
    fun getRestrictToFillLevel self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getRestrictToFillLevel_ self
    fun getRoundDigits self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getRoundDigits_ self
    fun getShowFillLevel self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowFillLevel_ self
    fun getSliderRange self =
      let
        val sliderStart
         & sliderEnd
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getSliderRange_
            (
              self
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (sliderStart, sliderEnd)
      end
    fun getSliderSizeFixed self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getSliderSizeFixed_ self
    fun getUpperStepperSensitivity self = (GObjectObjectClass.C.withPtr ---> GtkSensitivityType.C.fromVal) getUpperStepperSensitivity_ self
    fun getValue self = (GObjectObjectClass.C.withPtr ---> FFI.Double.C.fromVal) getValue_ self
    fun setAdjustment self adjustment = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setAdjustment_ (self & adjustment)
    fun setFillLevel self fillLevel = (GObjectObjectClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setFillLevel_ (self & fillLevel)
    fun setFlippable self flippable = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setFlippable_ (self & flippable)
    fun setIncrements self step page =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         ---> I
      )
        setIncrements_
        (
          self
           & step
           & page
        )
    fun setInverted self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setInverted_ (self & setting)
    fun setLowerStepperSensitivity self sensitivity = (GObjectObjectClass.C.withPtr &&&> GtkSensitivityType.C.withVal ---> I) setLowerStepperSensitivity_ (self & sensitivity)
    fun setMinSliderSize self minSize = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setMinSliderSize_ (self & minSize)
    fun setRange self min max =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         ---> I
      )
        setRange_
        (
          self
           & min
           & max
        )
    fun setRestrictToFillLevel self restrictToFillLevel = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setRestrictToFillLevel_ (self & restrictToFillLevel)
    fun setRoundDigits self roundDigits = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setRoundDigits_ (self & roundDigits)
    fun setShowFillLevel self showFillLevel = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowFillLevel_ (self & showFillLevel)
    fun setSliderSizeFixed self sizeFixed = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSliderSizeFixed_ (self & sizeFixed)
    fun setUpperStepperSensitivity self sensitivity = (GObjectObjectClass.C.withPtr &&&> GtkSensitivityType.C.withVal ---> I) setUpperStepperSensitivity_ (self & sensitivity)
    fun setValue self value = (GObjectObjectClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setValue_ (self & value)
    local
      open ClosureMarshal Signal
    in
      fun adjustBoundsSig f = signal "adjust-bounds" (get 0w1 double ---> ret_void) f
      fun changeValueSig f = signal "change-value" (get 0w1 GtkScrollType.t &&&> get 0w2 double ---> ret boolean) (fn scroll & value => f scroll value)
      fun moveSliderSig f = signal "move-slider" (get 0w1 GtkScrollType.t ---> ret_void) f
      fun valueChangedSig f = signal "value-changed" (void ---> ret_void) f
    end
    local
      open Property
    in
      val adjustmentProp =
        {
          get = fn x => get "adjustment" GtkAdjustmentClass.tOpt x,
          set = fn x => set "adjustment" GtkAdjustmentClass.tOpt x
        }
      val fillLevelProp =
        {
          get = fn x => get "fill-level" double x,
          set = fn x => set "fill-level" double x
        }
      val invertedProp =
        {
          get = fn x => get "inverted" boolean x,
          set = fn x => set "inverted" boolean x
        }
      val lowerStepperSensitivityProp =
        {
          get = fn x => get "lower-stepper-sensitivity" GtkSensitivityType.t x,
          set = fn x => set "lower-stepper-sensitivity" GtkSensitivityType.t x
        }
      val restrictToFillLevelProp =
        {
          get = fn x => get "restrict-to-fill-level" boolean x,
          set = fn x => set "restrict-to-fill-level" boolean x
        }
      val roundDigitsProp =
        {
          get = fn x => get "round-digits" int x,
          set = fn x => set "round-digits" int x
        }
      val showFillLevelProp =
        {
          get = fn x => get "show-fill-level" boolean x,
          set = fn x => set "show-fill-level" boolean x
        }
      val upperStepperSensitivityProp =
        {
          get = fn x => get "upper-stepper-sensitivity" GtkSensitivityType.t x,
          set = fn x => set "upper-stepper-sensitivity" GtkSensitivityType.t x
        }
    end
  end