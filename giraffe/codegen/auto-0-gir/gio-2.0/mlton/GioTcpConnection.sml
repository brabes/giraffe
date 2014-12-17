structure GioTcpConnection :>
  GIO_TCP_CONNECTION
    where type 'a class_t = 'a GioTcpConnectionClass.t =
  struct
    val getType_ = _import "g_tcp_connection_get_type" : unit -> GObjectType.C.val_;
    val getGracefulDisconnect_ = _import "g_tcp_connection_get_graceful_disconnect" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val setGracefulDisconnect_ = fn x1 & x2 => (_import "g_tcp_connection_set_graceful_disconnect" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    type 'a class_t = 'a GioTcpConnectionClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getGracefulDisconnect self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getGracefulDisconnect_ self
    fun setGracefulDisconnect self gracefulDisconnect = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setGracefulDisconnect_ (self & gracefulDisconnect)
    local
      open Property
    in
      val gracefulDisconnectProp =
        {
          get = fn x => get "graceful-disconnect" boolean x,
          set = fn x => set "graceful-disconnect" boolean x
        }
    end
  end
