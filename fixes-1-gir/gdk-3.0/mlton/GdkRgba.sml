structure GdkRgba :>
  GDK_RGBA
    where type t = GdkRgbaRecord.t =
  struct
    val getType_ = _import "gdk_rgba_get_type" : unit -> GObjectType.FFI.val_;
    val copy_ = _import "gdk_rgba_copy" : GdkRgbaRecord.FFI.non_opt GdkRgbaRecord.FFI.p -> GdkRgbaRecord.FFI.non_opt GdkRgbaRecord.FFI.p;
    val equal_ = fn x1 & x2 => (_import "gdk_rgba_equal" : GdkRgbaRecord.FFI.non_opt GdkRgbaRecord.FFI.p * GdkRgbaRecord.FFI.non_opt GdkRgbaRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val hash_ = _import "gdk_rgba_hash" : GdkRgbaRecord.FFI.non_opt GdkRgbaRecord.FFI.p -> GUInt.FFI.val_;
    val parse_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gdk_rgba_parse" :
              GdkRgbaRecord.FFI.non_opt GdkRgbaRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val toString_ = _import "gdk_rgba_to_string" : GdkRgbaRecord.FFI.non_opt GdkRgbaRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    type t = GdkRgbaRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun copy self = (GdkRgbaRecord.FFI.withPtr false ---> GdkRgbaRecord.FFI.fromPtr true) copy_ self
    fun equal self p2 = (GdkRgbaRecord.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withPtr false ---> GBool.FFI.fromVal) equal_ (self & p2)
    fun hash self = (GdkRgbaRecord.FFI.withPtr false ---> GUInt.FFI.fromVal) hash_ self
    fun parse spec =
      let
        val rgba & retVal = (GdkRgbaRecord.FFI.withNewPtr &&&> Utf8.FFI.withPtr 0 ---> GdkRgbaRecord.FFI.fromPtr true && GBool.FFI.fromVal) parse_ (() & spec)
      in
        if retVal then SOME rgba else NONE
      end
    fun toString self = (GdkRgbaRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) toString_ self
  end