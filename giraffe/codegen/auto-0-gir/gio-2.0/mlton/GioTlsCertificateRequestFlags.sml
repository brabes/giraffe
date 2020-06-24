structure GioTlsCertificateRequestFlags :> GIO_TLS_CERTIFICATE_REQUEST_FLAGS =
  struct
    datatype enum =
      NONE
    structure Enum =
      Enum(
        type enum = enum
        val null = NONE
        val toInt = fn NONE => 0
        exception Value of GInt.t
        val fromInt =
          fn
            0 => NONE
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "g_tls_certificate_request_flags_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
