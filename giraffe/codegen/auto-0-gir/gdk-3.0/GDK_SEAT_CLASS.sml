signature GDK_SEAT_CLASS =
  sig
    type 'a seat
    include
      CLASS
        where type 'a class = 'a seat GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end