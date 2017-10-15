structure GLibDate :>
  G_LIB_DATE
    where type t = GLibDateRecord.t
    where type time_val_t = GLibTimeValRecord.t
    where type date_month_t = GLibDateMonth.t
    where type date_weekday_t = GLibDateWeekday.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_date_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_date_new") (cVoid --> GLibDateRecord.PolyML.cPtr)
      val newDmy_ =
        call (getSymbol "g_date_new_dmy")
          (
            GUInt8.PolyML.cVal
             &&> GLibDateMonth.PolyML.cVal
             &&> GUInt16.PolyML.cVal
             --> GLibDateRecord.PolyML.cPtr
          )
      val newJulian_ = call (getSymbol "g_date_new_julian") (GUInt32.PolyML.cVal --> GLibDateRecord.PolyML.cPtr)
      val addDays_ = call (getSymbol "g_date_add_days") (GLibDateRecord.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val addMonths_ = call (getSymbol "g_date_add_months") (GLibDateRecord.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val addYears_ = call (getSymbol "g_date_add_years") (GLibDateRecord.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val clamp_ =
        call (getSymbol "g_date_clamp")
          (
            GLibDateRecord.PolyML.cPtr
             &&> GLibDateRecord.PolyML.cPtr
             &&> GLibDateRecord.PolyML.cPtr
             --> cVoid
          )
      val clear_ = call (getSymbol "g_date_clear") (GLibDateRecord.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val compare_ = call (getSymbol "g_date_compare") (GLibDateRecord.PolyML.cPtr &&> GLibDateRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val daysBetween_ = call (getSymbol "g_date_days_between") (GLibDateRecord.PolyML.cPtr &&> GLibDateRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getDay_ = call (getSymbol "g_date_get_day") (GLibDateRecord.PolyML.cPtr --> GUInt8.PolyML.cVal)
      val getDayOfYear_ = call (getSymbol "g_date_get_day_of_year") (GLibDateRecord.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getIso8601WeekOfYear_ = call (getSymbol "g_date_get_iso8601_week_of_year") (GLibDateRecord.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getJulian_ = call (getSymbol "g_date_get_julian") (GLibDateRecord.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getMondayWeekOfYear_ = call (getSymbol "g_date_get_monday_week_of_year") (GLibDateRecord.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getMonth_ = call (getSymbol "g_date_get_month") (GLibDateRecord.PolyML.cPtr --> GLibDateMonth.PolyML.cVal)
      val getSundayWeekOfYear_ = call (getSymbol "g_date_get_sunday_week_of_year") (GLibDateRecord.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getWeekday_ = call (getSymbol "g_date_get_weekday") (GLibDateRecord.PolyML.cPtr --> GLibDateWeekday.PolyML.cVal)
      val getYear_ = call (getSymbol "g_date_get_year") (GLibDateRecord.PolyML.cPtr --> GUInt16.PolyML.cVal)
      val isFirstOfMonth_ = call (getSymbol "g_date_is_first_of_month") (GLibDateRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val isLastOfMonth_ = call (getSymbol "g_date_is_last_of_month") (GLibDateRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val order_ = call (getSymbol "g_date_order") (GLibDateRecord.PolyML.cPtr &&> GLibDateRecord.PolyML.cPtr --> cVoid)
      val setDay_ = call (getSymbol "g_date_set_day") (GLibDateRecord.PolyML.cPtr &&> GUInt8.PolyML.cVal --> cVoid)
      val setDmy_ =
        call (getSymbol "g_date_set_dmy")
          (
            GLibDateRecord.PolyML.cPtr
             &&> GUInt8.PolyML.cVal
             &&> GLibDateMonth.PolyML.cVal
             &&> GUInt16.PolyML.cVal
             --> cVoid
          )
      val setJulian_ = call (getSymbol "g_date_set_julian") (GLibDateRecord.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val setMonth_ = call (getSymbol "g_date_set_month") (GLibDateRecord.PolyML.cPtr &&> GLibDateMonth.PolyML.cVal --> cVoid)
      val setParse_ = call (getSymbol "g_date_set_parse") (GLibDateRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setTimeT_ = call (getSymbol "g_date_set_time_t") (GLibDateRecord.PolyML.cPtr &&> GInt64.PolyML.cVal --> cVoid)
      val setTimeVal_ = call (getSymbol "g_date_set_time_val") (GLibDateRecord.PolyML.cPtr &&> GLibTimeValRecord.PolyML.cPtr --> cVoid)
      val setYear_ = call (getSymbol "g_date_set_year") (GLibDateRecord.PolyML.cPtr &&> GUInt16.PolyML.cVal --> cVoid)
      val subtractDays_ = call (getSymbol "g_date_subtract_days") (GLibDateRecord.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val subtractMonths_ = call (getSymbol "g_date_subtract_months") (GLibDateRecord.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val subtractYears_ = call (getSymbol "g_date_subtract_years") (GLibDateRecord.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val valid_ = call (getSymbol "g_date_valid") (GLibDateRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getDaysInMonth_ = call (getSymbol "g_date_get_days_in_month") (GLibDateMonth.PolyML.cVal &&> GUInt16.PolyML.cVal --> GUInt8.PolyML.cVal)
      val getMondayWeeksInYear_ = call (getSymbol "g_date_get_monday_weeks_in_year") (GUInt16.PolyML.cVal --> GUInt8.PolyML.cVal)
      val getSundayWeeksInYear_ = call (getSymbol "g_date_get_sunday_weeks_in_year") (GUInt16.PolyML.cVal --> GUInt8.PolyML.cVal)
      val isLeapYear_ = call (getSymbol "g_date_is_leap_year") (GUInt16.PolyML.cVal --> GBool.PolyML.cVal)
      val strftime_ =
        call (getSymbol "g_date_strftime")
          (
            Utf8.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> GLibDateRecord.PolyML.cPtr
             --> GUInt64.PolyML.cVal
          )
      val validDay_ = call (getSymbol "g_date_valid_day") (GUInt8.PolyML.cVal --> GBool.PolyML.cVal)
      val validDmy_ =
        call (getSymbol "g_date_valid_dmy")
          (
            GUInt8.PolyML.cVal
             &&> GLibDateMonth.PolyML.cVal
             &&> GUInt16.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val validJulian_ = call (getSymbol "g_date_valid_julian") (GUInt32.PolyML.cVal --> GBool.PolyML.cVal)
      val validMonth_ = call (getSymbol "g_date_valid_month") (GLibDateMonth.PolyML.cVal --> GBool.PolyML.cVal)
      val validWeekday_ = call (getSymbol "g_date_valid_weekday") (GLibDateWeekday.PolyML.cVal --> GBool.PolyML.cVal)
      val validYear_ = call (getSymbol "g_date_valid_year") (GUInt16.PolyML.cVal --> GBool.PolyML.cVal)
    end
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