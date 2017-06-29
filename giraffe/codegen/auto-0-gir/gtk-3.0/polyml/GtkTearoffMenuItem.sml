structure GtkTearoffMenuItem :>
  GTK_TEAROFF_MENU_ITEM
    where type 'a class = 'a GtkTearoffMenuItemClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_tearoff_menu_item_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_tearoff_menu_item_new") (PolyMLFFI.cVoid --> GtkWidgetClass.PolyML.cPtr)
    end
    type 'a class = 'a GtkTearoffMenuItemClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkTearoffMenuItemClass.FFI.fromPtr false) new_ ()
  end
