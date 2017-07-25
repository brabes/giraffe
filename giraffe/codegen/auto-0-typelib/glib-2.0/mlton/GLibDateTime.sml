structure GLibDateTime :>
  G_LIB_DATE_TIME
    where type t = GLibDateTimeRecord.t
    where type time_val_t = GLibTimeValRecord.t
    where type time_zone_t = GLibTimeZoneRecord.t =
  struct
    val getType_ = _import "g_date_time_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "g_date_time_new" :
              GLibTimeZoneRecord.FFI.notnull GLibTimeZoneRecord.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GDouble.FFI.val_
               -> GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p;
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
    val newFromTimevalLocal_ = _import "g_date_time_new_from_timeval_local" : GLibTimeValRecord.FFI.notnull GLibTimeValRecord.FFI.p -> GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p;
    val newFromTimevalUtc_ = _import "g_date_time_new_from_timeval_utc" : GLibTimeValRecord.FFI.notnull GLibTimeValRecord.FFI.p -> GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p;
    val newFromUnixLocal_ = _import "g_date_time_new_from_unix_local" : GInt64.FFI.val_ -> GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p;
    val newFromUnixUtc_ = _import "g_date_time_new_from_unix_utc" : GInt64.FFI.val_ -> GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p;
    val newLocal_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "g_date_time_new_local" :
              GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GDouble.FFI.val_
               -> GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val newNow_ = _import "g_date_time_new_now" : GLibTimeZoneRecord.FFI.notnull GLibTimeZoneRecord.FFI.p -> GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p;
    val newNowLocal_ = _import "g_date_time_new_now_local" : unit -> GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p;
    val newNowUtc_ = _import "g_date_time_new_now_utc" : unit -> GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p;
    val newUtc_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "g_date_time_new_utc" :
              GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GDouble.FFI.val_
               -> GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val add_ = fn x1 & x2 => (_import "g_date_time_add" : GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p * GInt64.FFI.val_ -> GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p;) (x1, x2)
    val addDays_ = fn x1 & x2 => (_import "g_date_time_add_days" : GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p * GInt32.FFI.val_ -> GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p;) (x1, x2)
    val addFull_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "g_date_time_add_full" :
              GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GDouble.FFI.val_
               -> GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p;
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
    val addHours_ = fn x1 & x2 => (_import "g_date_time_add_hours" : GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p * GInt32.FFI.val_ -> GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p;) (x1, x2)
    val addMinutes_ = fn x1 & x2 => (_import "g_date_time_add_minutes" : GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p * GInt32.FFI.val_ -> GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p;) (x1, x2)
    val addMonths_ = fn x1 & x2 => (_import "g_date_time_add_months" : GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p * GInt32.FFI.val_ -> GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p;) (x1, x2)
    val addSeconds_ = fn x1 & x2 => (_import "g_date_time_add_seconds" : GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p * GDouble.FFI.val_ -> GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p;) (x1, x2)
    val addWeeks_ = fn x1 & x2 => (_import "g_date_time_add_weeks" : GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p * GInt32.FFI.val_ -> GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p;) (x1, x2)
    val addYears_ = fn x1 & x2 => (_import "g_date_time_add_years" : GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p * GInt32.FFI.val_ -> GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p;) (x1, x2)
    val difference_ = fn x1 & x2 => (_import "g_date_time_difference" : GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p * GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p -> GInt64.FFI.val_;) (x1, x2)
    val format_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_date_time_format" :
              GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getDayOfMonth_ = _import "g_date_time_get_day_of_month" : GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p -> GInt32.FFI.val_;
    val getDayOfWeek_ = _import "g_date_time_get_day_of_week" : GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p -> GInt32.FFI.val_;
    val getDayOfYear_ = _import "g_date_time_get_day_of_year" : GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p -> GInt32.FFI.val_;
    val getHour_ = _import "g_date_time_get_hour" : GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p -> GInt32.FFI.val_;
    val getMicrosecond_ = _import "g_date_time_get_microsecond" : GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p -> GInt32.FFI.val_;
    val getMinute_ = _import "g_date_time_get_minute" : GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p -> GInt32.FFI.val_;
    val getMonth_ = _import "g_date_time_get_month" : GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p -> GInt32.FFI.val_;
    val getSecond_ = _import "g_date_time_get_second" : GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p -> GInt32.FFI.val_;
    val getSeconds_ = _import "g_date_time_get_seconds" : GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p -> GDouble.FFI.val_;
    val getTimezoneAbbreviation_ = _import "g_date_time_get_timezone_abbreviation" : GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getUtcOffset_ = _import "g_date_time_get_utc_offset" : GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p -> GInt64.FFI.val_;
    val getWeekNumberingYear_ = _import "g_date_time_get_week_numbering_year" : GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p -> GInt32.FFI.val_;
    val getWeekOfYear_ = _import "g_date_time_get_week_of_year" : GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p -> GInt32.FFI.val_;
    val getYear_ = _import "g_date_time_get_year" : GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p -> GInt32.FFI.val_;
    val getYmd_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_date_time_get_ymd" :
              GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val isDaylightSavings_ = _import "g_date_time_is_daylight_savings" : GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p -> GBool.FFI.val_;
    val toLocal_ = _import "g_date_time_to_local" : GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p -> GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p;
    val toTimeval_ = fn x1 & x2 => (_import "g_date_time_to_timeval" : GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p * GLibTimeValRecord.FFI.notnull GLibTimeValRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val toTimezone_ = fn x1 & x2 => (_import "g_date_time_to_timezone" : GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p * GLibTimeZoneRecord.FFI.notnull GLibTimeZoneRecord.FFI.p -> GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p;) (x1, x2)
    val toUnix_ = _import "g_date_time_to_unix" : GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p -> GInt64.FFI.val_;
    val toUtc_ = _import "g_date_time_to_utc" : GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p -> GLibDateTimeRecord.FFI.notnull GLibDateTimeRecord.FFI.p;
    type t = GLibDateTimeRecord.t
    type time_val_t = GLibTimeValRecord.t
    type time_zone_t = GLibTimeZoneRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new
      (
        tz,
        year,
        month,
        day,
        hour,
        minute,
        seconds
      ) =
      (
        GLibTimeZoneRecord.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> GLibDateTimeRecord.FFI.fromPtr true
      )
        new_
        (
          tz
           & year
           & month
           & day
           & hour
           & minute
           & seconds
        )
    fun newFromTimevalLocal tv = (GLibTimeValRecord.FFI.withPtr ---> GLibDateTimeRecord.FFI.fromPtr true) newFromTimevalLocal_ tv
    fun newFromTimevalUtc tv = (GLibTimeValRecord.FFI.withPtr ---> GLibDateTimeRecord.FFI.fromPtr true) newFromTimevalUtc_ tv
    fun newFromUnixLocal t = (GInt64.FFI.withVal ---> GLibDateTimeRecord.FFI.fromPtr true) newFromUnixLocal_ t
    fun newFromUnixUtc t = (GInt64.FFI.withVal ---> GLibDateTimeRecord.FFI.fromPtr true) newFromUnixUtc_ t
    fun newLocal
      (
        year,
        month,
        day,
        hour,
        minute,
        seconds
      ) =
      (
        GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> GLibDateTimeRecord.FFI.fromPtr true
      )
        newLocal_
        (
          year
           & month
           & day
           & hour
           & minute
           & seconds
        )
    fun newNow tz = (GLibTimeZoneRecord.FFI.withPtr ---> GLibDateTimeRecord.FFI.fromPtr true) newNow_ tz
    fun newNowLocal () = (I ---> GLibDateTimeRecord.FFI.fromPtr true) newNowLocal_ ()
    fun newNowUtc () = (I ---> GLibDateTimeRecord.FFI.fromPtr true) newNowUtc_ ()
    fun newUtc
      (
        year,
        month,
        day,
        hour,
        minute,
        seconds
      ) =
      (
        GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> GLibDateTimeRecord.FFI.fromPtr true
      )
        newUtc_
        (
          year
           & month
           & day
           & hour
           & minute
           & seconds
        )
    fun add self timespan = (GLibDateTimeRecord.FFI.withPtr &&&> GInt64.FFI.withVal ---> GLibDateTimeRecord.FFI.fromPtr true) add_ (self & timespan)
    fun addDays self days = (GLibDateTimeRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GLibDateTimeRecord.FFI.fromPtr true) addDays_ (self & days)
    fun addFull
      self
      (
        years,
        months,
        days,
        hours,
        minutes,
        seconds
      ) =
      (
        GLibDateTimeRecord.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> GLibDateTimeRecord.FFI.fromPtr true
      )
        addFull_
        (
          self
           & years
           & months
           & days
           & hours
           & minutes
           & seconds
        )
    fun addHours self hours = (GLibDateTimeRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GLibDateTimeRecord.FFI.fromPtr true) addHours_ (self & hours)
    fun addMinutes self minutes = (GLibDateTimeRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GLibDateTimeRecord.FFI.fromPtr true) addMinutes_ (self & minutes)
    fun addMonths self months = (GLibDateTimeRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GLibDateTimeRecord.FFI.fromPtr true) addMonths_ (self & months)
    fun addSeconds self seconds = (GLibDateTimeRecord.FFI.withPtr &&&> GDouble.FFI.withVal ---> GLibDateTimeRecord.FFI.fromPtr true) addSeconds_ (self & seconds)
    fun addWeeks self weeks = (GLibDateTimeRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GLibDateTimeRecord.FFI.fromPtr true) addWeeks_ (self & weeks)
    fun addYears self years = (GLibDateTimeRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GLibDateTimeRecord.FFI.fromPtr true) addYears_ (self & years)
    fun difference self begin = (GLibDateTimeRecord.FFI.withPtr &&&> GLibDateTimeRecord.FFI.withPtr ---> GInt64.FFI.fromVal) difference_ (self & begin)
    fun format self format = (GLibDateTimeRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) format_ (self & format)
    fun getDayOfMonth self = (GLibDateTimeRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getDayOfMonth_ self
    fun getDayOfWeek self = (GLibDateTimeRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getDayOfWeek_ self
    fun getDayOfYear self = (GLibDateTimeRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getDayOfYear_ self
    fun getHour self = (GLibDateTimeRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getHour_ self
    fun getMicrosecond self = (GLibDateTimeRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getMicrosecond_ self
    fun getMinute self = (GLibDateTimeRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getMinute_ self
    fun getMonth self = (GLibDateTimeRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getMonth_ self
    fun getSecond self = (GLibDateTimeRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getSecond_ self
    fun getSeconds self = (GLibDateTimeRecord.FFI.withPtr ---> GDouble.FFI.fromVal) getSeconds_ self
    fun getTimezoneAbbreviation self = (GLibDateTimeRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getTimezoneAbbreviation_ self
    fun getUtcOffset self = (GLibDateTimeRecord.FFI.withPtr ---> GInt64.FFI.fromVal) getUtcOffset_ self
    fun getWeekNumberingYear self = (GLibDateTimeRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getWeekNumberingYear_ self
    fun getWeekOfYear self = (GLibDateTimeRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getWeekOfYear_ self
    fun getYear self = (GLibDateTimeRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getYear_ self
    fun getYmd self =
      let
        val year
         & month
         & day
         & () =
          (
            GLibDateTimeRecord.FFI.withPtr
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getYmd_
            (
              self
               & GInt32.null
               & GInt32.null
               & GInt32.null
            )
      in
        (
          year,
          month,
          day
        )
      end
    fun isDaylightSavings self = (GLibDateTimeRecord.FFI.withPtr ---> GBool.FFI.fromVal) isDaylightSavings_ self
    fun toLocal self = (GLibDateTimeRecord.FFI.withPtr ---> GLibDateTimeRecord.FFI.fromPtr true) toLocal_ self
    fun toTimeval self tv = (GLibDateTimeRecord.FFI.withPtr &&&> GLibTimeValRecord.FFI.withPtr ---> GBool.FFI.fromVal) toTimeval_ (self & tv)
    fun toTimezone self tz = (GLibDateTimeRecord.FFI.withPtr &&&> GLibTimeZoneRecord.FFI.withPtr ---> GLibDateTimeRecord.FFI.fromPtr true) toTimezone_ (self & tz)
    fun toUnix self = (GLibDateTimeRecord.FFI.withPtr ---> GInt64.FFI.fromVal) toUnix_ self
    fun toUtc self = (GLibDateTimeRecord.FFI.withPtr ---> GLibDateTimeRecord.FFI.fromPtr true) toUtc_ self
  end
