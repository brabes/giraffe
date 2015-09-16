signature GTK_CELL_RENDERER_ACCEL_CLASS =
  sig
    type 'a cell_renderer_accel
    type 'a cell_renderer_text_class_t
    type 'a t = 'a cell_renderer_accel cell_renderer_text_class_t
    val toBase : 'a t -> base t
    val t : (base t, 'a t) GObject.Value.accessor
    val tOpt : (base t option, 'a t option) GObject.Value.accessor
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr :
          bool
           -> notnull p
           -> 'a t
        val fromOptPtr :
          bool
           -> unit p
           -> 'a t option
      end
  end
