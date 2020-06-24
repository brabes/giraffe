structure GtkCellRendererComboClass :>
  GTK_CELL_RENDERER_COMBO_CLASS
    where type 'a cell_renderer_text_class = 'a GtkCellRendererTextClass.class
    where type C.opt = GtkCellRendererTextClass.C.opt
    where type C.non_opt = GtkCellRendererTextClass.C.non_opt
    where type 'a C.p = 'a GtkCellRendererTextClass.C.p =
  struct
    type 'a cell_renderer_text_class = 'a GtkCellRendererTextClass.class
    open GtkCellRendererTextClass
    type 'a cell_renderer_combo = unit
    type 'a class = 'a cell_renderer_combo class
    val getType_ = _import "gtk_cell_renderer_combo_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_object" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.non_opt FFI.p;
    val getOptValue_ = _import "g_value_get_object" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.opt FFI.p;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_object" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.non_opt FFI.p -> unit;) (x1, x2)
    val setOptValue_ = fn x1 & x2 => (_import "g_value_set_object" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.opt FFI.p -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromPtr false) getValue_,
          setValue = (I &&&> FFI.withPtr ---> I) setValue_
        }
    val tOpt =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
          setValue = (I &&&> FFI.withOptPtr ---> I) setOptValue_
        }
  end
