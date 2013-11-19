structure GioTlsConnection :>
  GIO_TLS_CONNECTION
    where type 'a class_t = 'a GioTlsConnectionClass.t
    where type 'a cancellableclass_t = 'a GioCancellableClass.t
    where type 'a asyncresultclass_t = 'a GioAsyncResultClass.t
    where type 'a iostreamclass_t = 'a GioIOStreamClass.t
    where type 'a tlsdatabaseclass_t = 'a GioTlsDatabaseClass.t
    where type 'a tlsinteractionclass_t = 'a GioTlsInteractionClass.t
    where type 'a tlscertificateclass_t = 'a GioTlsCertificateClass.t
    where type tlscertificateflags_t = GioTlsCertificateFlags.t
    where type tlsrehandshakemode_t = GioTlsRehandshakeMode.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_tls_connection_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val emitAcceptCertificate_ =
        call (load_sym libgio "g_tls_connection_emit_accept_certificate")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GioTlsCertificateFlags.PolyML.VAL
             --> FFI.Bool.PolyML.VAL
          )
      val getCertificate_ = call (load_sym libgio "g_tls_connection_get_certificate") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getDatabase_ = call (load_sym libgio "g_tls_connection_get_database") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getInteraction_ = call (load_sym libgio "g_tls_connection_get_interaction") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getPeerCertificate_ = call (load_sym libgio "g_tls_connection_get_peer_certificate") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getPeerCertificateErrors_ = call (load_sym libgio "g_tls_connection_get_peer_certificate_errors") (GObjectObjectClass.PolyML.PTR --> GioTlsCertificateFlags.PolyML.VAL)
      val getRehandshakeMode_ = call (load_sym libgio "g_tls_connection_get_rehandshake_mode") (GObjectObjectClass.PolyML.PTR --> GioTlsRehandshakeMode.PolyML.VAL)
      val getRequireCloseNotify_ = call (load_sym libgio "g_tls_connection_get_require_close_notify") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val handshake_ =
        call (load_sym libgio "g_tls_connection_handshake")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val handshakeFinish_ =
        call (load_sym libgio "g_tls_connection_handshake_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val setCertificate_ = call (load_sym libgio "g_tls_connection_set_certificate") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setDatabase_ = call (load_sym libgio "g_tls_connection_set_database") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setInteraction_ = call (load_sym libgio "g_tls_connection_set_interaction") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setRehandshakeMode_ = call (load_sym libgio "g_tls_connection_set_rehandshake_mode") (GObjectObjectClass.PolyML.PTR &&> GioTlsRehandshakeMode.PolyML.VAL --> FFI.PolyML.VOID)
      val setRequireCloseNotify_ = call (load_sym libgio "g_tls_connection_set_require_close_notify") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GioTlsConnectionClass.t
    type 'a cancellableclass_t = 'a GioCancellableClass.t
    type 'a asyncresultclass_t = 'a GioAsyncResultClass.t
    type 'a iostreamclass_t = 'a GioIOStreamClass.t
    type 'a tlsdatabaseclass_t = 'a GioTlsDatabaseClass.t
    type 'a tlsinteractionclass_t = 'a GioTlsInteractionClass.t
    type 'a tlscertificateclass_t = 'a GioTlsCertificateClass.t
    type tlscertificateflags_t = GioTlsCertificateFlags.t
    type tlsrehandshakemode_t = GioTlsRehandshakeMode.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun emitAcceptCertificate self peerCert errors =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GioTlsCertificateFlags.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        emitAcceptCertificate_
        (
          self
           & peerCert
           & errors
        )
    fun getCertificate self = (GObjectObjectClass.C.withPtr ---> GioTlsCertificateClass.C.fromPtr false) getCertificate_ self
    fun getDatabase self = (GObjectObjectClass.C.withPtr ---> GioTlsDatabaseClass.C.fromPtr false) getDatabase_ self
    fun getInteraction self = (GObjectObjectClass.C.withPtr ---> GioTlsInteractionClass.C.fromPtr false) getInteraction_ self
    fun getPeerCertificate self = (GObjectObjectClass.C.withPtr ---> GioTlsCertificateClass.C.fromPtr false) getPeerCertificate_ self
    fun getPeerCertificateErrors self = (GObjectObjectClass.C.withPtr ---> GioTlsCertificateFlags.C.fromVal) getPeerCertificateErrors_ self
    fun getRehandshakeMode self = (GObjectObjectClass.C.withPtr ---> GioTlsRehandshakeMode.C.fromVal) getRehandshakeMode_ self
    fun getRequireCloseNotify self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getRequireCloseNotify_ self
    fun handshake self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        handshake_
        (
          self
           & cancellable
           & []
        )
    fun handshakeFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        handshakeFinish_
        (
          self
           & result
           & []
        )
    fun setCertificate self certificate = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setCertificate_ (self & certificate)
    fun setDatabase self database = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setDatabase_ (self & database)
    fun setInteraction self interaction = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setInteraction_ (self & interaction)
    fun setRehandshakeMode self mode = (GObjectObjectClass.C.withPtr &&&> GioTlsRehandshakeMode.C.withVal ---> I) setRehandshakeMode_ (self & mode)
    fun setRequireCloseNotify self requireCloseNotify = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setRequireCloseNotify_ (self & requireCloseNotify)
    local
      open ClosureMarshal Signal
    in
      fun acceptCertificateSig f = signal "accept-certificate" (get 0w1 GioTlsCertificateClass.t &&&> get 0w2 GioTlsCertificateFlags.t ---> ret boolean) (fn peerCert & errors => f peerCert errors)
    end
    local
      open Property
    in
      val baseIoStreamProp =
        {
          get = fn x => get "base-io-stream" GioIOStreamClass.tOpt x,
          set = fn x => set "base-io-stream" GioIOStreamClass.tOpt x
        }
      val certificateProp =
        {
          get = fn x => get "certificate" GioTlsCertificateClass.tOpt x,
          set = fn x => set "certificate" GioTlsCertificateClass.tOpt x
        }
      val databaseProp =
        {
          get = fn x => get "database" GioTlsDatabaseClass.tOpt x,
          set = fn x => set "database" GioTlsDatabaseClass.tOpt x
        }
      val interactionProp =
        {
          get = fn x => get "interaction" GioTlsInteractionClass.tOpt x,
          set = fn x => set "interaction" GioTlsInteractionClass.tOpt x
        }
      val peerCertificateProp = {get = fn x => get "peer-certificate" GioTlsCertificateClass.tOpt x}
      val peerCertificateErrorsProp = {get = fn x => get "peer-certificate-errors" GioTlsCertificateFlags.t x}
      val rehandshakeModeProp =
        {
          get = fn x => get "rehandshake-mode" GioTlsRehandshakeMode.t x,
          set = fn x => set "rehandshake-mode" GioTlsRehandshakeMode.t x
        }
      val requireCloseNotifyProp =
        {
          get = fn x => get "require-close-notify" boolean x,
          set = fn x => set "require-close-notify" boolean x
        }
      val useSystemCertdbProp =
        {
          get = fn x => get "use-system-certdb" boolean x,
          set = fn x => set "use-system-certdb" boolean x
        }
    end
  end