signature GIO_SOCKET_CONTROL_MESSAGE =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val deserialize :
      LargeInt.int
       -> LargeInt.int
       -> Word8Vector.vector
       -> base class
    val getLevel : 'a class -> LargeInt.int
    val getMsgType : 'a class -> LargeInt.int
    val getSize : 'a class -> LargeInt.int
  end
