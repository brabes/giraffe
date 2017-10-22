signature GTK_MENU_BUTTON_CLASS =
  sig
    type 'a menu_button
    type 'a toggle_button_class
    include
      CLASS
        where type 'a class = 'a menu_button toggle_button_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end