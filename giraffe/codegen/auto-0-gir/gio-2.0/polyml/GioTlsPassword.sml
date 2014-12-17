structure GioTlsPassword :>
  GIO_TLS_PASSWORD
    where type 'a class_t = 'a GioTlsPasswordClass.t
    where type tlspasswordflags_t = GioTlsPasswordFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_tls_password_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_tls_password_new") (GioTlsPasswordFlags.PolyML.VAL &&> FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val getDescription_ = call (load_sym libgio "g_tls_password_get_description") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getFlags_ = call (load_sym libgio "g_tls_password_get_flags") (GObjectObjectClass.PolyML.PTR --> GioTlsPasswordFlags.PolyML.VAL)
      val getWarning_ = call (load_sym libgio "g_tls_password_get_warning") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val setDescription_ = call (load_sym libgio "g_tls_password_set_description") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val setFlags_ = call (load_sym libgio "g_tls_password_set_flags") (GObjectObjectClass.PolyML.PTR &&> GioTlsPasswordFlags.PolyML.VAL --> FFI.PolyML.VOID)
      val setWarning_ = call (load_sym libgio "g_tls_password_set_warning") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GioTlsPasswordClass.t
    type tlspasswordflags_t = GioTlsPasswordFlags.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new flags description = (GioTlsPasswordFlags.C.withVal &&&> FFI.String.C.withConstPtr ---> GioTlsPasswordClass.C.fromPtr true) new_ (flags & description)
    fun getDescription self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getDescription_ self
    fun getFlags self = (GObjectObjectClass.C.withPtr ---> GioTlsPasswordFlags.C.fromVal) getFlags_ self
    fun getWarning self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getWarning_ self
    fun setDescription self description = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setDescription_ (self & description)
    fun setFlags self flags = (GObjectObjectClass.C.withPtr &&&> GioTlsPasswordFlags.C.withVal ---> I) setFlags_ (self & flags)
    fun setWarning self warning = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setWarning_ (self & warning)
    local
      open Property
    in
      val descriptionProp =
        {
          get = fn x => get "description" stringOpt x,
          set = fn x => set "description" stringOpt x
        }
      val flagsProp =
        {
          get = fn x => get "flags" GioTlsPasswordFlags.t x,
          set = fn x => set "flags" GioTlsPasswordFlags.t x
        }
      val warningProp =
        {
          get = fn x => get "warning" stringOpt x,
          set = fn x => set "warning" stringOpt x
        }
    end
  end
