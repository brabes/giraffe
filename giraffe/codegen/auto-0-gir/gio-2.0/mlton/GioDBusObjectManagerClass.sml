structure GioDBusObjectManagerClass :>
  GIO_D_BUS_OBJECT_MANAGER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    type 'a d_bus_object_manager = unit
    type 'a t = 'a d_bus_object_manager GObjectObjectClass.t
    fun toBase obj = obj
    val t = GObjectObjectClass.t
    val tOpt = GObjectObjectClass.tOpt
    structure C = GObjectObjectClass.C
  end
