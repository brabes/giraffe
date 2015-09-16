signature GIO_NATIVE_VOLUME_MONITOR_CLASS =
  sig
    type 'a native_volume_monitor
    type 'a volume_monitor_class_t
    type 'a t = 'a native_volume_monitor volume_monitor_class_t
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
