structure GioFileDescriptorBasedClass :>
  GIO_FILE_DESCRIPTOR_BASED_CLASS
    where type C.opt = GObjectObjectClass.C.opt
    where type C.non_opt = GObjectObjectClass.C.non_opt
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a file_descriptor_based = unit
    type 'a class = 'a file_descriptor_based class
  end
