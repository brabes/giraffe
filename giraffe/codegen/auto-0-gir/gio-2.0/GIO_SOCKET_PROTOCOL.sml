signature GIO_SOCKET_PROTOCOL =
  sig
    datatype enum =
      UNKNOWN
    | DEFAULT
    | TCP
    | UDP
    | SCTP
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
