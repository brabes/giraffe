signature GTK_LOCK_BUTTON_ACCESSIBLE_CLASS =
  sig
    type 'a lock_button_accessible
    type 'a button_accessible_class
    include
      CLASS
        where type 'a class = 'a lock_button_accessible button_accessible_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end