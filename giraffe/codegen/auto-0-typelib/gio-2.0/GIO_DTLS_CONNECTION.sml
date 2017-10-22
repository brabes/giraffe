signature GIO_DTLS_CONNECTION =
  sig
    type 'a class
    type 'a cancellable_class
    type 'a async_result_class
    type 'a datagram_based_class
    type 'a tls_database_class
    type 'a tls_interaction_class
    type 'a tls_certificate_class
    type tls_certificate_flags_t
    type tls_rehandshake_mode_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val close :
      'a class
       -> 'b cancellable_class option
       -> unit
    val closeFinish :
      'a class
       -> 'b async_result_class
       -> unit
    val emitAcceptCertificate :
      'a class
       -> 'b tls_certificate_class * tls_certificate_flags_t
       -> bool
    val getCertificate : 'a class -> base tls_certificate_class
    val getDatabase : 'a class -> base tls_database_class
    val getInteraction : 'a class -> base tls_interaction_class
    val getPeerCertificate : 'a class -> base tls_certificate_class
    val getPeerCertificateErrors : 'a class -> tls_certificate_flags_t
    val getRehandshakeMode : 'a class -> tls_rehandshake_mode_t
    val getRequireCloseNotify : 'a class -> bool
    val handshake :
      'a class
       -> 'b cancellable_class option
       -> unit
    val handshakeFinish :
      'a class
       -> 'b async_result_class
       -> unit
    val setCertificate :
      'a class
       -> 'b tls_certificate_class
       -> unit
    val setDatabase :
      'a class
       -> 'b tls_database_class
       -> unit
    val setInteraction :
      'a class
       -> 'b tls_interaction_class option
       -> unit
    val setRehandshakeMode :
      'a class
       -> tls_rehandshake_mode_t
       -> unit
    val setRequireCloseNotify :
      'a class
       -> bool
       -> unit
    val shutdown :
      'a class
       -> bool
           * bool
           * 'b cancellable_class option
       -> unit
    val shutdownFinish :
      'a class
       -> 'b async_result_class
       -> unit
    val acceptCertificateSig : (base tls_certificate_class * tls_certificate_flags_t -> bool) -> 'a class Signal.t
    val baseSocketProp : ('a class, base datagram_based_class option, 'b datagram_based_class option) Property.readwrite
    val certificateProp : ('a class, base tls_certificate_class option, 'b tls_certificate_class option) Property.readwrite
    val databaseProp : ('a class, base tls_database_class option, 'b tls_database_class option) Property.readwrite
    val interactionProp : ('a class, base tls_interaction_class option, 'b tls_interaction_class option) Property.readwrite
    val peerCertificateProp : ('a class, base tls_certificate_class option) Property.readonly
    val peerCertificateErrorsProp : ('a class, tls_certificate_flags_t) Property.readonly
    val rehandshakeModeProp : ('a class, tls_rehandshake_mode_t, tls_rehandshake_mode_t) Property.readwrite
    val requireCloseNotifyProp : ('a class, bool, bool) Property.readwrite
  end