structure GioFileDescriptorBased :>
  GIO_FILE_DESCRIPTOR_BASED
    where type 'a class_t = 'a GioFileDescriptorBasedClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_file_descriptor_based_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getFd_ = call (load_sym libgio "g_file_descriptor_based_get_fd") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
    end
    type 'a class_t = 'a GioFileDescriptorBasedClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getFd self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getFd_ self
  end
