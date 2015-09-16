signature GTK_APPLICATION =
  sig
    type 'a class_t
    type 'a window_class_t
    type t = base class_t
    val asActionGroup : 'a class_t -> base Gio.ActionGroupClass.t
    val getType : unit -> GObject.Type.t
    val new :
      string
       -> Gio.ApplicationFlags.t
       -> base class_t
    val addWindow :
      'a class_t
       -> 'b window_class_t
       -> unit
    val removeWindow :
      'a class_t
       -> 'b window_class_t
       -> unit
    val windowAddedSig : (base window_class_t -> unit) -> 'a class_t Signal.signal
    val windowRemovedSig : (base window_class_t -> unit) -> 'a class_t Signal.signal
  end
