signature GDK_PIXBUF_PIXBUF_SIMPLE_ANIM_ITER_CLASS =
  sig
    type 'a pixbufsimpleanimiter
    type 'a pixbufanimationiterclass_t
    type 'a t = 'a pixbufsimpleanimiter pixbufanimationiterclass_t
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
