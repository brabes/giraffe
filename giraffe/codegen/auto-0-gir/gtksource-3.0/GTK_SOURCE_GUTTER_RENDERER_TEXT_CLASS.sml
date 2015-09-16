signature GTK_SOURCE_GUTTER_RENDERER_TEXT_CLASS =
  sig
    type 'a gutter_renderer_text
    type 'a gutter_renderer_class_t
    type 'a t = 'a gutter_renderer_text gutter_renderer_class_t
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
