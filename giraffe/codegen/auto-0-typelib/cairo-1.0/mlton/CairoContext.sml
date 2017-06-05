structure CairoContext :>
  CAIRO_CONTEXT
    where type t = CairoContextRecord.t =
  struct
    val getType_ = _import "cairo_gobject_context_get_type" : unit -> GObjectType.FFI.val_;
    type t = CairoContextRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
