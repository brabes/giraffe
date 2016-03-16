structure GioCredentials :>
  GIO_CREDENTIALS
    where type 'a class_t = 'a GioCredentialsClass.t =
  struct
    val getType_ = _import "g_credentials_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_credentials_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getUnixUser_ = fn x1 & x2 => (_import "g_credentials_get_unix_user" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * (unit, unit) GLibErrorRecord.C.r -> FFI.UInt.C.val_;) (x1, x2)
    val isSameUser_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_credentials_is_same_user" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setUnixUser_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_credentials_set_unix_user" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.UInt.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val toString_ = _import "g_credentials_to_string" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    type 'a class_t = 'a GioCredentialsClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioCredentialsClass.C.fromPtr true) new_ ()
    fun getUnixUser self = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.handleError ---> FFI.UInt.C.fromVal) getUnixUser_ (self & [])
    fun isSameUser self otherCredentials =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        isSameUser_
        (
          self
           & otherCredentials
           & []
        )
    fun setUnixUser self uid =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt.C.withVal
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        setUnixUser_
        (
          self
           & uid
           & []
        )
    fun toString self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) toString_ self
  end
