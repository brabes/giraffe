structure GioDtlsConnectionClass :>
  GIO_DTLS_CONNECTION_CLASS
    where type C.opt = GObjectObjectClass.C.opt
    where type C.non_opt = GObjectObjectClass.C.non_opt
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a dtls_connection = unit
    type 'a class = 'a dtls_connection class
  end
