signature GTK_SOURCE_REGION =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : 'a Gtk.TextBufferClass.class -> base class
    val addRegion :
      'a class
       -> 'b class option
       -> unit
    val addSubregion :
      'a class
       -> Gtk.TextIterRecord.t * Gtk.TextIterRecord.t
       -> unit
    val getBounds : 'a class -> (Gtk.TextIterRecord.t * Gtk.TextIterRecord.t) option
    val getBuffer : 'a class -> base Gtk.TextBufferClass.class option
    val intersectRegion :
      'a class
       -> 'b class option
       -> base class option
    val intersectSubregion :
      'a class
       -> Gtk.TextIterRecord.t * Gtk.TextIterRecord.t
       -> base class option
    val isEmpty : 'a class -> bool
    val subtractRegion :
      'a class
       -> 'b class option
       -> unit
    val subtractSubregion :
      'a class
       -> Gtk.TextIterRecord.t * Gtk.TextIterRecord.t
       -> unit
    val toString : 'a class -> string option
    val bufferProp : ('a class, unit -> base Gtk.TextBufferClass.class option, unit, 'b Gtk.TextBufferClass.class option -> unit) Property.t
  end
