structure GioMemoryInputStream :>
  GIO_MEMORY_INPUT_STREAM
    where type 'a class = 'a GioMemoryInputStreamClass.class
    where type 'a seekable_class = 'a GioSeekableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_memory_input_stream_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_memory_input_stream_new") (PolyMLFFI.cVoid --> GioInputStreamClass.PolyML.cPtr)
    end
    type 'a class = 'a GioMemoryInputStreamClass.class
    type 'a seekable_class = 'a GioSeekableClass.class
    type t = base class
    fun asSeekable self = (GObjectObjectClass.FFI.withPtr ---> GioSeekableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioMemoryInputStreamClass.FFI.fromPtr true) new_ ()
  end
