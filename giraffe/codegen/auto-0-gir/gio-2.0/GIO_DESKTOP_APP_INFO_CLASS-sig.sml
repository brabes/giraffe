signature GIO_DESKTOP_APP_INFO_CLASS =
  sig
    type 'a desktop_app_info
    include
      CLASS
        where type 'a class = 'a desktop_app_info GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end