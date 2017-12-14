structure GtkHBox :>
  GTK_H_BOX
    where type 'a class = 'a GtkHBoxClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class =
  struct
    val getType_ = _import "gtk_hbox_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = fn x1 & x2 => (_import "gtk_hbox_new" : GBool.FFI.val_ * GInt.FFI.val_ -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;) (x1, x2)
    type 'a class = 'a GtkHBoxClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (homogeneous, spacing) = (GBool.FFI.withVal &&&> GInt.FFI.withVal ---> GtkHBoxClass.FFI.fromPtr false) new_ (homogeneous & spacing)
  end
