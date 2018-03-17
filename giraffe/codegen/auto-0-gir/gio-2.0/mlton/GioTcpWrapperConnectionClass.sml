structure GioTcpWrapperConnectionClass :>
  GIO_TCP_WRAPPER_CONNECTION_CLASS
    where type 'a tcp_connection_class = 'a GioTcpConnectionClass.class
    where type C.notnull = GioTcpConnectionClass.C.notnull
    where type 'a C.p = 'a GioTcpConnectionClass.C.p =
  struct
    type 'a tcp_connection_class = 'a GioTcpConnectionClass.class
    open GioTcpConnectionClass
    type 'a tcp_wrapper_connection = unit
    type 'a class = 'a tcp_wrapper_connection class
    val getType_ = _import "g_tcp_wrapper_connection_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_object" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.notnull FFI.p;
    val getOptValue_ = _import "g_value_get_object" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> unit FFI.p;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_object" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.notnull FFI.p -> unit;) (x1, x2)
    val setOptValue_ = fn x1 & x2 => (_import "g_value_set_object" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * unit FFI.p -> unit;) (x1, x2)
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
