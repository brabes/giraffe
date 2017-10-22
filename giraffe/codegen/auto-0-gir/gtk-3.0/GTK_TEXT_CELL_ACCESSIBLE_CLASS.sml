signature GTK_TEXT_CELL_ACCESSIBLE_CLASS =
  sig
    type 'a text_cell_accessible
    type 'a renderer_cell_accessible_class
    include
      CLASS
        where type 'a class = 'a text_cell_accessible renderer_cell_accessible_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end