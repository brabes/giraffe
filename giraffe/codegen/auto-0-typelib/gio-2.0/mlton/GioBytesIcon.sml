structure GioBytesIcon :>
  GIO_BYTES_ICON
    where type 'a class = 'a GioBytesIconClass.class
    where type 'a icon_class = 'a GioIconClass.class
    where type 'a loadable_icon_class = 'a GioLoadableIconClass.class =
  struct
    val getType_ = _import "g_bytes_icon_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_bytes_icon_new" : GLibBytesRecord.FFI.notnull GLibBytesRecord.FFI.p -> GioBytesIconClass.FFI.notnull GioBytesIconClass.FFI.p;
    val getBytes_ = _import "g_bytes_icon_get_bytes" : GioBytesIconClass.FFI.notnull GioBytesIconClass.FFI.p -> GLibBytesRecord.FFI.notnull GLibBytesRecord.FFI.p;
    type 'a class = 'a GioBytesIconClass.class
    type 'a icon_class = 'a GioIconClass.class
    type 'a loadable_icon_class = 'a GioLoadableIconClass.class
    type t = base class
    fun asIcon self = (GObjectObjectClass.FFI.withPtr ---> GioIconClass.FFI.fromPtr false) I self
    fun asLoadableIcon self = (GObjectObjectClass.FFI.withPtr ---> GioLoadableIconClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new bytes = (GLibBytesRecord.FFI.withPtr ---> GioBytesIconClass.FFI.fromPtr true) new_ bytes
    fun getBytes self = (GioBytesIconClass.FFI.withPtr ---> GLibBytesRecord.FFI.fromPtr false) getBytes_ self
    local
      open Property
    in
      val bytesProp =
        {
          get = fn x => get "bytes" GLibBytesRecord.tOpt x,
          set = fn x => set "bytes" GLibBytesRecord.tOpt x
        }
    end
  end