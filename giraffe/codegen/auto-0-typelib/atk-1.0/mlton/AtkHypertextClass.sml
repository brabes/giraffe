structure AtkHypertextClass :>
  ATK_HYPERTEXT_CLASS
    where type C.opt = GObjectObjectClass.C.opt
    where type C.non_opt = GObjectObjectClass.C.non_opt
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a hypertext = unit
    type 'a class = 'a hypertext class
  end
