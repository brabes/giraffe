signature GDK_G_L_ERROR =
  sig
    datatype enum =
      NOT_AVAILABLE
    | UNSUPPORTED_FORMAT
    | UNSUPPORTED_PROFILE
    include
      ENUM
        where type t = enum
    exception Error of t
    val handler : GLib.ErrorRecord.handler
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end