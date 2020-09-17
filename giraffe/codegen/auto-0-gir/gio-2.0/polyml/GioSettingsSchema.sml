structure GioSettingsSchema :>
  GIO_SETTINGS_SCHEMA
    where type t = GioSettingsSchemaRecord.t
    where type settings_schema_key_t = GioSettingsSchemaKeyRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_settings_schema_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getId_ = call (getSymbol "g_settings_schema_get_id") (GioSettingsSchemaRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getKey_ = call (getSymbol "g_settings_schema_get_key") (GioSettingsSchemaRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioSettingsSchemaKeyRecord.PolyML.cPtr)
      val getPath_ = call (getSymbol "g_settings_schema_get_path") (GioSettingsSchemaRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val hasKey_ = call (getSymbol "g_settings_schema_has_key") (GioSettingsSchemaRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val listChildren_ = call (getSymbol "g_settings_schema_list_children") (GioSettingsSchemaRecord.PolyML.cPtr --> Utf8CPtrArray.PolyML.cOutPtr)
      val listKeys_ = call (getSymbol "g_settings_schema_list_keys") (GioSettingsSchemaRecord.PolyML.cPtr --> Utf8CPtrArray.PolyML.cOutPtr)
    end
    type t = GioSettingsSchemaRecord.t
    type settings_schema_key_t = GioSettingsSchemaKeyRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getId self = (GioSettingsSchemaRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getId_ self before GioSettingsSchemaRecord.FFI.touchPtr self
    fun getKey self name = (GioSettingsSchemaRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GioSettingsSchemaKeyRecord.FFI.fromPtr true) getKey_ (self & name)
    fun getPath self = (GioSettingsSchemaRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getPath_ self before GioSettingsSchemaRecord.FFI.touchPtr self
    fun hasKey self name = (GioSettingsSchemaRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) hasKey_ (self & name)
    fun listChildren self = (GioSettingsSchemaRecord.FFI.withPtr false ---> Utf8CPtrArray.FFI.fromPtr ~1) listChildren_ self
    fun listKeys self = (GioSettingsSchemaRecord.FFI.withPtr false ---> Utf8CPtrArray.FFI.fromPtr ~1) listKeys_ self
  end
