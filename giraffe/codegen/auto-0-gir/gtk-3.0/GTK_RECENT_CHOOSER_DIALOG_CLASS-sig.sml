signature GTK_RECENT_CHOOSER_DIALOG_CLASS =
  sig
    type 'a recent_chooser_dialog
    type 'a dialog_class
    include
      CLASS
        where type 'a class = 'a recent_chooser_dialog dialog_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end