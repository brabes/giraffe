signature GIO_SOCKET_FAMILY =
  sig
    datatype enum =
      INVALID
    | UNIX
    | IPV_4
    | IPV_6
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
