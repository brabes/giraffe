structure GioTlsConnectionClass :>
  GIO_TLS_CONNECTION_CLASS
    where type 'a i_o_stream_class = 'a GioIOStreamClass.class
    where type C.opt = GioIOStreamClass.C.opt
    where type C.non_opt = GioIOStreamClass.C.non_opt
    where type 'a C.p = 'a GioIOStreamClass.C.p =
  struct
    type 'a i_o_stream_class = 'a GioIOStreamClass.class
    open GioIOStreamClass
    type 'a tls_connection = unit
    type 'a class = 'a tls_connection class
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_tls_connection_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_object") (GObjectValueRecord.PolyML.cPtr --> PolyML.cPtr)
      val getOptValue_ = call (getSymbol "g_value_get_object") (GObjectValueRecord.PolyML.cPtr --> PolyML.cOptPtr)
      val setValue_ = call (getSymbol "g_value_set_object") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cPtr --> cVoid)
      val setOptValue_ = call (getSymbol "g_value_set_object") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cOptPtr --> cVoid)
    end
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromPtr false) getValue_,
          setValue = (I &&&> FFI.withPtr ---> I) setValue_
        }
    val tOpt =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
          setValue = (I &&&> FFI.withOptPtr ---> I) setOptValue_
        }
  end
