structure GtkCheckButton :>
  GTK_CHECK_BUTTON
    where type 'a class_t = 'a GtkCheckButtonClass.t
    where type 'a activatable_class_t = 'a GtkActivatableClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t =
  struct
    val getType_ = _import "gtk_check_button_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_check_button_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newWithLabel_ = _import "mlton_gtk_check_button_new_with_label" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newWithMnemonic_ = _import "mlton_gtk_check_button_new_with_mnemonic" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    type 'a class_t = 'a GtkCheckButtonClass.t
    type 'a activatable_class_t = 'a GtkActivatableClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkCheckButtonClass.C.fromPtr false) new_ ()
    fun newWithLabel label = (FFI.String.C.withConstPtr ---> GtkCheckButtonClass.C.fromPtr false) newWithLabel_ label
    fun newWithMnemonic label = (FFI.String.C.withConstPtr ---> GtkCheckButtonClass.C.fromPtr false) newWithMnemonic_ label
  end
