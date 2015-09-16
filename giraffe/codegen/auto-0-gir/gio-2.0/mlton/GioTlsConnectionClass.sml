structure GioTlsConnectionClass :>
  GIO_TLS_CONNECTION_CLASS
    where type 'a i_o_stream_class_t = 'a GioIOStreamClass.t
    where type C.notnull = GioIOStreamClass.C.notnull
    where type 'a C.p = 'a GioIOStreamClass.C.p =
  struct
    type 'a tls_connection = unit
    type 'a i_o_stream_class_t = 'a GioIOStreamClass.t
    type 'a t = 'a tls_connection i_o_stream_class_t
    fun toBase obj = obj
    val t = GioIOStreamClass.t
    val tOpt = GioIOStreamClass.tOpt
    structure C = GioIOStreamClass.C
  end
