structure GioFileClass :>
  GIO_FILE_CLASS
    where type C.opt = GObjectObjectClass.C.opt
    where type C.non_opt = GObjectObjectClass.C.non_opt
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a file = unit
    type 'a class = 'a file class
  end
