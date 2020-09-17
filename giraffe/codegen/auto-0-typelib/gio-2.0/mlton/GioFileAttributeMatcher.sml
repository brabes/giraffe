structure GioFileAttributeMatcher :>
  GIO_FILE_ATTRIBUTE_MATCHER
    where type t = GioFileAttributeMatcherRecord.t =
  struct
    val getType_ = _import "g_file_attribute_matcher_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "mlton_g_file_attribute_matcher_new" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GioFileAttributeMatcherRecord.FFI.non_opt GioFileAttributeMatcherRecord.FFI.p;
    val enumerateNamespace_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_attribute_matcher_enumerate_namespace" :
              GioFileAttributeMatcherRecord.FFI.non_opt GioFileAttributeMatcherRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val enumerateNext_ = _import "g_file_attribute_matcher_enumerate_next" : GioFileAttributeMatcherRecord.FFI.non_opt GioFileAttributeMatcherRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val matches_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_attribute_matcher_matches" :
              GioFileAttributeMatcherRecord.FFI.non_opt GioFileAttributeMatcherRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val matchesOnly_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_attribute_matcher_matches_only" :
              GioFileAttributeMatcherRecord.FFI.non_opt GioFileAttributeMatcherRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val subtract_ = fn x1 & x2 => (_import "g_file_attribute_matcher_subtract" : GioFileAttributeMatcherRecord.FFI.non_opt GioFileAttributeMatcherRecord.FFI.p * GioFileAttributeMatcherRecord.FFI.non_opt GioFileAttributeMatcherRecord.FFI.p -> GioFileAttributeMatcherRecord.FFI.non_opt GioFileAttributeMatcherRecord.FFI.p;) (x1, x2)
    val toString_ = _import "g_file_attribute_matcher_to_string" : GioFileAttributeMatcherRecord.FFI.non_opt GioFileAttributeMatcherRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    type t = GioFileAttributeMatcherRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new attributes = (Utf8.FFI.withPtr 0 ---> GioFileAttributeMatcherRecord.FFI.fromPtr true) new_ attributes
    fun enumerateNamespace self ns = (GioFileAttributeMatcherRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) enumerateNamespace_ (self & ns)
    fun enumerateNext self = (GioFileAttributeMatcherRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) enumerateNext_ self before GioFileAttributeMatcherRecord.FFI.touchPtr self
    fun matches self attribute = (GioFileAttributeMatcherRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) matches_ (self & attribute)
    fun matchesOnly self attribute = (GioFileAttributeMatcherRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) matchesOnly_ (self & attribute)
    fun subtract self subtract = (GioFileAttributeMatcherRecord.FFI.withPtr false &&&> GioFileAttributeMatcherRecord.FFI.withPtr false ---> GioFileAttributeMatcherRecord.FFI.fromPtr true) subtract_ (self & subtract)
    fun toString self = (GioFileAttributeMatcherRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) toString_ self
  end
