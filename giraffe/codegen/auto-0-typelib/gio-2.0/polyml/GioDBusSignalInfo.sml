structure GioDBusSignalInfo :>
  GIO_D_BUS_SIGNAL_INFO
    where type t = GioDBusSignalInfoRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_dbus_signal_info_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
    end
    type t = GioDBusSignalInfoRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
