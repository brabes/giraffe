structure GioCredentials :>
  GIO_CREDENTIALS
    where type 'a class_t = 'a GioCredentialsClass.t
    where type credentialstype_t = GioCredentialsType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_credentials_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_credentials_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getUnixUser_ = call (load_sym libgio "g_credentials_get_unix_user") (GObjectObjectClass.PolyML.PTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> FFI.PolyML.UInt32.VAL)
      val isSameUser_ =
        call (load_sym libgio "g_credentials_is_same_user")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Bool.VAL
          )
      val setNative_ = call (load_sym libgio "g_credentials_set_native") (GObjectObjectClass.PolyML.PTR &&> GioCredentialsType.PolyML.VAL --> FFI.PolyML.VOID)
      val setUnixUser_ =
        call (load_sym libgio "g_credentials_set_unix_user")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.UInt32.VAL
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Bool.VAL
          )
      val toString_ = call (load_sym libgio "g_credentials_to_string") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
    end
    type 'a class_t = 'a GioCredentialsClass.t
    type credentialstype_t = GioCredentialsType.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioCredentialsClass.C.fromPtr true) new_ ()
    fun getUnixUser self = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.C.handleError ---> FFI.UInt32.fromVal) getUnixUser_ (self & [])
    fun isSameUser self otherCredentials =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
      )
        isSameUser_
        (
          self
           & otherCredentials
           & []
        )
    fun setNative self nativeType = (GObjectObjectClass.C.withPtr &&&> GioCredentialsType.C.withVal ---> I) setNative_ (self & nativeType)
    fun setUnixUser self uid =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt32.withVal
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
      )
        setUnixUser_
        (
          self
           & uid
           & []
        )
    fun toString self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr true) toString_ self
  end
