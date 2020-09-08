structure GioTlsServerConnection :>
  GIO_TLS_SERVER_CONNECTION
    where type 'a class = 'a GioTlsServerConnectionClass.class
    where type 'a tls_certificate_class = 'a GioTlsCertificateClass.class
    where type 'a i_o_stream_class = 'a GioIOStreamClass.class
    where type tls_authentication_mode_t = GioTlsAuthenticationMode.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_tls_server_connection_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (getSymbol "g_tls_server_connection_new")
          (
            GioIOStreamClass.PolyML.cPtr
             &&> GioTlsCertificateClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioTlsServerConnectionClass.PolyML.cPtr
          )
    end
    type 'a class = 'a GioTlsServerConnectionClass.class
    type 'a tls_certificate_class = 'a GioTlsCertificateClass.class
    type 'a i_o_stream_class = 'a GioIOStreamClass.class
    type tls_authentication_mode_t = GioTlsAuthenticationMode.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (baseIoStream, certificate) =
      (
        GioIOStreamClass.FFI.withPtr false
         &&&> GioTlsCertificateClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GioTlsServerConnectionClass.FFI.fromPtr true
      )
        new_
        (
          baseIoStream
           & certificate
           & []
        )
    local
      open ValueAccessor
    in
      val authenticationModeProp =
        {
          name = "authentication-mode",
          gtype = fn () => C.gtype GioTlsAuthenticationMode.t (),
          get = fn x => fn () => C.get GioTlsAuthenticationMode.t x,
          set = fn x => C.set GioTlsAuthenticationMode.t x,
          init = fn x => C.set GioTlsAuthenticationMode.t x
        }
    end
  end
