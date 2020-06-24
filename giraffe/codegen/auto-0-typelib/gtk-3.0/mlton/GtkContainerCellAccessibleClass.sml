structure GtkContainerCellAccessibleClass :>
  GTK_CONTAINER_CELL_ACCESSIBLE_CLASS
    where type 'a cell_accessible_class = 'a GtkCellAccessibleClass.class
    where type C.opt = GtkCellAccessibleClass.C.opt
    where type C.non_opt = GtkCellAccessibleClass.C.non_opt
    where type 'a C.p = 'a GtkCellAccessibleClass.C.p =
  struct
    type 'a cell_accessible_class = 'a GtkCellAccessibleClass.class
    open GtkCellAccessibleClass
    type 'a container_cell_accessible = unit
    type 'a class = 'a container_cell_accessible class
    val getType_ = _import "gtk_container_cell_accessible_get_type" : unit -> GObjectType.FFI.val_;
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
