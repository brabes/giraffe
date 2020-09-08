structure GioUnixInputStream :>
  GIO_UNIX_INPUT_STREAM
    where type 'a class = 'a GioUnixInputStreamClass.class
    where type 'a file_descriptor_based_class = 'a GioFileDescriptorBasedClass.class
    where type 'a pollable_input_stream_class = 'a GioPollableInputStreamClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_unix_input_stream_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_unix_input_stream_new") (GInt.PolyML.cVal &&> GBool.PolyML.cVal --> GioInputStreamClass.PolyML.cPtr)
      val getCloseFd_ = call (getSymbol "g_unix_input_stream_get_close_fd") (GioUnixInputStreamClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getFd_ = call (getSymbol "g_unix_input_stream_get_fd") (GioUnixInputStreamClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val setCloseFd_ = call (getSymbol "g_unix_input_stream_set_close_fd") (GioUnixInputStreamClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GioUnixInputStreamClass.class
    type 'a file_descriptor_based_class = 'a GioFileDescriptorBasedClass.class
    type 'a pollable_input_stream_class = 'a GioPollableInputStreamClass.class
    type t = base class
    fun asFileDescriptorBased self = (GObjectObjectClass.FFI.withPtr false ---> GioFileDescriptorBasedClass.FFI.fromPtr false) I self
    fun asPollableInputStream self = (GObjectObjectClass.FFI.withPtr false ---> GioPollableInputStreamClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (fd, closeFd) = (GInt.FFI.withVal &&&> GBool.FFI.withVal ---> GioUnixInputStreamClass.FFI.fromPtr true) new_ (fd & closeFd)
    fun getCloseFd self = (GioUnixInputStreamClass.FFI.withPtr false ---> GBool.FFI.fromVal) getCloseFd_ self
    fun getFd self = (GioUnixInputStreamClass.FFI.withPtr false ---> GInt.FFI.fromVal) getFd_ self
    fun setCloseFd self closeFd = (GioUnixInputStreamClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setCloseFd_ (self & closeFd)
    local
      open ValueAccessor
    in
      val closeFdProp =
        {
          name = "close-fd",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val fdProp =
        {
          name = "fd",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = ignore,
          init = fn x => C.set int x
        }
    end
  end
