signature CAIRO_SURFACE =
  sig
    type record_t
    type t = record_t
    val getType : unit -> GObject.Type.t
  end
