structure GLibDate :>
  G_LIB_DATE
    where type t = GLibDateRecord.t
    where type time_val_t = GLibTimeValRecord.t
    where type date_month_t = GLibDateMonth.t
    where type date_weekday_t = GLibDateWeekday.t =
  struct
    val getType_ = _import "g_date_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_date_new" : unit -> GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p;
    val newDmy_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_date_new_dmy" :
              GUInt8.FFI.val_
               * GLibDateMonth.FFI.val_
               * GUInt16.FFI.val_
               -> GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newJulian_ = _import "g_date_new_julian" : GUInt32.FFI.val_ -> GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p;
    val addDays_ = fn x1 & x2 => (_import "g_date_add_days" : GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val addMonths_ = fn x1 & x2 => (_import "g_date_add_months" : GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val addYears_ = fn x1 & x2 => (_import "g_date_add_years" : GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val clamp_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_date_clamp" :
              GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p
               * GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p
               * GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val clear_ = fn x1 & x2 => (_import "g_date_clear" : GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val compare_ = fn x1 & x2 => (_import "g_date_compare" : GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p * GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p -> GInt32.FFI.val_;) (x1, x2)
    val daysBetween_ = fn x1 & x2 => (_import "g_date_days_between" : GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p * GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p -> GInt32.FFI.val_;) (x1, x2)
    val getDay_ = _import "g_date_get_day" : GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p -> GUInt8.FFI.val_;
    val getDayOfYear_ = _import "g_date_get_day_of_year" : GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p -> GUInt32.FFI.val_;
    val getIso8601WeekOfYear_ = _import "g_date_get_iso8601_week_of_year" : GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p -> GUInt32.FFI.val_;
    val getJulian_ = _import "g_date_get_julian" : GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p -> GUInt32.FFI.val_;
    val getMondayWeekOfYear_ = _import "g_date_get_monday_week_of_year" : GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p -> GUInt32.FFI.val_;
    val getMonth_ = _import "g_date_get_month" : GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p -> GLibDateMonth.FFI.val_;
    val getSundayWeekOfYear_ = _import "g_date_get_sunday_week_of_year" : GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p -> GUInt32.FFI.val_;
    val getWeekday_ = _import "g_date_get_weekday" : GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p -> GLibDateWeekday.FFI.val_;
    val getYear_ = _import "g_date_get_year" : GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p -> GUInt16.FFI.val_;
    val isFirstOfMonth_ = _import "g_date_is_first_of_month" : GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p -> GBool.FFI.val_;
    val isLastOfMonth_ = _import "g_date_is_last_of_month" : GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p -> GBool.FFI.val_;
    val order_ = fn x1 & x2 => (_import "g_date_order" : GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p * GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p -> unit;) (x1, x2)
    val setDay_ = fn x1 & x2 => (_import "g_date_set_day" : GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p * GUInt8.FFI.val_ -> unit;) (x1, x2)
    val setDmy_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_date_set_dmy" :
              GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p
               * GUInt8.FFI.val_
               * GLibDateMonth.FFI.val_
               * GUInt16.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setJulian_ = fn x1 & x2 => (_import "g_date_set_julian" : GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val setMonth_ = fn x1 & x2 => (_import "g_date_set_month" : GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p * GLibDateMonth.FFI.val_ -> unit;) (x1, x2)
    val setParse_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_date_set_parse" :
              GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setTime_ = fn x1 & x2 => (_import "g_date_set_time" : GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setTimeT_ = fn x1 & x2 => (_import "g_date_set_time_t" : GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p * GInt64.FFI.val_ -> unit;) (x1, x2)
    val setTimeVal_ = fn x1 & x2 => (_import "g_date_set_time_val" : GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p * GLibTimeValRecord.FFI.non_opt GLibTimeValRecord.FFI.p -> unit;) (x1, x2)
    val setYear_ = fn x1 & x2 => (_import "g_date_set_year" : GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p * GUInt16.FFI.val_ -> unit;) (x1, x2)
    val subtractDays_ = fn x1 & x2 => (_import "g_date_subtract_days" : GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val subtractMonths_ = fn x1 & x2 => (_import "g_date_subtract_months" : GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val subtractYears_ = fn x1 & x2 => (_import "g_date_subtract_years" : GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val valid_ = _import "g_date_valid" : GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p -> GBool.FFI.val_;
    val getDaysInMonth_ = fn x1 & x2 => (_import "g_date_get_days_in_month" : GLibDateMonth.FFI.val_ * GUInt16.FFI.val_ -> GUInt8.FFI.val_;) (x1, x2)
    val getMondayWeeksInYear_ = _import "g_date_get_monday_weeks_in_year" : GUInt16.FFI.val_ -> GUInt8.FFI.val_;
    val getSundayWeeksInYear_ = _import "g_date_get_sunday_weeks_in_year" : GUInt16.FFI.val_ -> GUInt8.FFI.val_;
    val isLeapYear_ = _import "g_date_is_leap_year" : GUInt16.FFI.val_ -> GBool.FFI.val_;
    val strftime_ =
      fn
        (x1, x2)
         & x3
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_date_strftime" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GUInt64.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GLibDateRecord.FFI.non_opt GLibDateRecord.FFI.p
               -> GUInt64.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val validDay_ = _import "g_date_valid_day" : GUInt8.FFI.val_ -> GBool.FFI.val_;
    val validDmy_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_date_valid_dmy" :
              GUInt8.FFI.val_
               * GLibDateMonth.FFI.val_
               * GUInt16.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val validJulian_ = _import "g_date_valid_julian" : GUInt32.FFI.val_ -> GBool.FFI.val_;
    val validMonth_ = _import "g_date_valid_month" : GLibDateMonth.FFI.val_ -> GBool.FFI.val_;
    val validWeekday_ = _import "g_date_valid_weekday" : GLibDateWeekday.FFI.val_ -> GBool.FFI.val_;
    val validYear_ = _import "g_date_valid_year" : GUInt16.FFI.val_ -> GBool.FFI.val_;
    type t = GLibDateRecord.t
    type time_val_t = GLibTimeValRecord.t
    type date_month_t = GLibDateMonth.t
    type date_weekday_t = GLibDateWeekday.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GLibDateRecord.FFI.fromPtr true) new_ ()
    fun newDmy
      (
        day,
        month,
        year
      ) =
      (
        GUInt8.FFI.withVal
         &&&> GLibDateMonth.FFI.withVal
         &&&> GUInt16.FFI.withVal
         ---> GLibDateRecord.FFI.fromPtr true
      )
        newDmy_
        (
          day
           & month
           & year
        )
    fun newJulian julianDay = (GUInt32.FFI.withVal ---> GLibDateRecord.FFI.fromPtr true) newJulian_ julianDay
    fun addDays self nDays = (GLibDateRecord.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) addDays_ (self & nDays)
    fun addMonths self nMonths = (GLibDateRecord.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) addMonths_ (self & nMonths)
    fun addYears self nYears = (GLibDateRecord.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) addYears_ (self & nYears)
    fun clamp self (minDate, maxDate) =
      (
        GLibDateRecord.FFI.withPtr
         &&&> GLibDateRecord.FFI.withPtr
         &&&> GLibDateRecord.FFI.withPtr
         ---> I
      )
        clamp_
        (
          self
           & minDate
           & maxDate
        )
    fun clear self nDates = (GLibDateRecord.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) clear_ (self & nDates)
    fun compare self rhs = (GLibDateRecord.FFI.withPtr &&&> GLibDateRecord.FFI.withPtr ---> GInt32.FFI.fromVal) compare_ (self & rhs)
    fun daysBetween self date2 = (GLibDateRecord.FFI.withPtr &&&> GLibDateRecord.FFI.withPtr ---> GInt32.FFI.fromVal) daysBetween_ (self & date2)
    fun getDay self = (GLibDateRecord.FFI.withPtr ---> GUInt8.FFI.fromVal) getDay_ self
    fun getDayOfYear self = (GLibDateRecord.FFI.withPtr ---> GUInt32.FFI.fromVal) getDayOfYear_ self
    fun getIso8601WeekOfYear self = (GLibDateRecord.FFI.withPtr ---> GUInt32.FFI.fromVal) getIso8601WeekOfYear_ self
    fun getJulian self = (GLibDateRecord.FFI.withPtr ---> GUInt32.FFI.fromVal) getJulian_ self
    fun getMondayWeekOfYear self = (GLibDateRecord.FFI.withPtr ---> GUInt32.FFI.fromVal) getMondayWeekOfYear_ self
    fun getMonth self = (GLibDateRecord.FFI.withPtr ---> GLibDateMonth.FFI.fromVal) getMonth_ self
    fun getSundayWeekOfYear self = (GLibDateRecord.FFI.withPtr ---> GUInt32.FFI.fromVal) getSundayWeekOfYear_ self
    fun getWeekday self = (GLibDateRecord.FFI.withPtr ---> GLibDateWeekday.FFI.fromVal) getWeekday_ self
    fun getYear self = (GLibDateRecord.FFI.withPtr ---> GUInt16.FFI.fromVal) getYear_ self
    fun isFirstOfMonth self = (GLibDateRecord.FFI.withPtr ---> GBool.FFI.fromVal) isFirstOfMonth_ self
    fun isLastOfMonth self = (GLibDateRecord.FFI.withPtr ---> GBool.FFI.fromVal) isLastOfMonth_ self
    fun order self date2 = (GLibDateRecord.FFI.withPtr &&&> GLibDateRecord.FFI.withPtr ---> I) order_ (self & date2)
    fun setDay self day = (GLibDateRecord.FFI.withPtr &&&> GUInt8.FFI.withVal ---> I) setDay_ (self & day)
    fun setDmy
      self
      (
        day,
        month,
        y
      ) =
      (
        GLibDateRecord.FFI.withPtr
         &&&> GUInt8.FFI.withVal
         &&&> GLibDateMonth.FFI.withVal
         &&&> GUInt16.FFI.withVal
         ---> I
      )
        setDmy_
        (
          self
           & day
           & month
           & y
        )
    fun setJulian self julianDate = (GLibDateRecord.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) setJulian_ (self & julianDate)
    fun setMonth self month = (GLibDateRecord.FFI.withPtr &&&> GLibDateMonth.FFI.withVal ---> I) setMonth_ (self & month)
    fun setParse self str = (GLibDateRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setParse_ (self & str)
    fun setTime self time = (GLibDateRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setTime_ (self & time)
    fun setTimeT self timet = (GLibDateRecord.FFI.withPtr &&&> GInt64.FFI.withVal ---> I) setTimeT_ (self & timet)
    fun setTimeVal self timeval = (GLibDateRecord.FFI.withPtr &&&> GLibTimeValRecord.FFI.withPtr ---> I) setTimeVal_ (self & timeval)
    fun setYear self year = (GLibDateRecord.FFI.withPtr &&&> GUInt16.FFI.withVal ---> I) setYear_ (self & year)
    fun subtractDays self nDays = (GLibDateRecord.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) subtractDays_ (self & nDays)
    fun subtractMonths self nMonths = (GLibDateRecord.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) subtractMonths_ (self & nMonths)
    fun subtractYears self nYears = (GLibDateRecord.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) subtractYears_ (self & nYears)
    fun valid self = (GLibDateRecord.FFI.withPtr ---> GBool.FFI.fromVal) valid_ self
    fun getDaysInMonth (month, year) = (GLibDateMonth.FFI.withVal &&&> GUInt16.FFI.withVal ---> GUInt8.FFI.fromVal) getDaysInMonth_ (month & year)
    fun getMondayWeeksInYear year = (GUInt16.FFI.withVal ---> GUInt8.FFI.fromVal) getMondayWeeksInYear_ year
    fun getSundayWeeksInYear year = (GUInt16.FFI.withVal ---> GUInt8.FFI.fromVal) getSundayWeeksInYear_ year
    fun isLeapYear year = (GUInt16.FFI.withVal ---> GBool.FFI.fromVal) isLeapYear_ year
    fun strftime
      (
        s,
        slen,
        format,
        date
      ) =
      (
        Utf8.FFI.withPtr
         &&&> GUInt64.FFI.withVal
         &&&> Utf8.FFI.withPtr
         &&&> GLibDateRecord.FFI.withPtr
         ---> GUInt64.FFI.fromVal
      )
        strftime_
        (
          s
           & slen
           & format
           & date
        )
    fun validDay day = (GUInt8.FFI.withVal ---> GBool.FFI.fromVal) validDay_ day
    fun validDmy
      (
        day,
        month,
        year
      ) =
      (
        GUInt8.FFI.withVal
         &&&> GLibDateMonth.FFI.withVal
         &&&> GUInt16.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        validDmy_
        (
          day
           & month
           & year
        )
    fun validJulian julianDate = (GUInt32.FFI.withVal ---> GBool.FFI.fromVal) validJulian_ julianDate
    fun validMonth month = (GLibDateMonth.FFI.withVal ---> GBool.FFI.fromVal) validMonth_ month
    fun validWeekday weekday = (GLibDateWeekday.FFI.withVal ---> GBool.FFI.fromVal) validWeekday_ weekday
    fun validYear year = (GUInt16.FFI.withVal ---> GBool.FFI.fromVal) validYear_ year
  end
