signature GTK_SOURCE_COMPLETION_PROVIDER_CLASS =
  sig
    type 'a completion_provider
    type 'a t = 'a completion_provider GObject.ObjectClass.t
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
