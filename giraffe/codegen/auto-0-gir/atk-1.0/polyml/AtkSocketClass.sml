structure AtkSocketClass :>
  ATK_SOCKET_CLASS
    where type 'a object_class_t = 'a AtkObjectClass.t
    where type C.notnull = AtkObjectClass.C.notnull
    where type 'a C.p = 'a AtkObjectClass.C.p =
  struct
    type 'a socket = unit
    type 'a object_class_t = 'a AtkObjectClass.t
    type 'a t = 'a socket object_class_t
    fun toBase obj = obj
    val t = AtkObjectClass.t
    val tOpt = AtkObjectClass.tOpt
    structure C = AtkObjectClass.C
  end
