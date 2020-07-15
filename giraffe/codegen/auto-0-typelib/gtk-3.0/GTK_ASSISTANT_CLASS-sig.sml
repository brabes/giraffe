signature GTK_ASSISTANT_CLASS =
  sig
    type 'a assistant
    type 'a window_class
    include
      CLASS
        where type 'a class = 'a assistant window_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end