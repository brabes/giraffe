structure GtkMenuItemAccessible :>
  GTK_MENU_ITEM_ACCESSIBLE
    where type 'a class = 'a GtkMenuItemAccessibleClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_menu_item_accessible_get_type") (cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class = 'a GtkMenuItemAccessibleClass.class
    type t = base class
    fun asAction self = (GObjectObjectClass.FFI.withPtr ---> AtkActionClass.FFI.fromPtr false) I self
    fun asComponent self = (GObjectObjectClass.FFI.withPtr ---> AtkComponentClass.FFI.fromPtr false) I self
    fun asSelection self = (GObjectObjectClass.FFI.withPtr ---> AtkSelectionClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end