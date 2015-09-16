structure GioTcpConnectionClass :>
  GIO_TCP_CONNECTION_CLASS
    where type 'a socket_connection_class_t = 'a GioSocketConnectionClass.t
    where type C.notnull = GioSocketConnectionClass.C.notnull
    where type 'a C.p = 'a GioSocketConnectionClass.C.p =
  struct
    type 'a tcp_connection = unit
    type 'a socket_connection_class_t = 'a GioSocketConnectionClass.t
    type 'a t = 'a tcp_connection socket_connection_class_t
    fun toBase obj = obj
    val t = GioSocketConnectionClass.t
    val tOpt = GioSocketConnectionClass.tOpt
    structure C = GioSocketConnectionClass.C
  end
