structure GtkSourceStyleSchemeChooserButton :>
  GTK_SOURCE_STYLE_SCHEME_CHOOSER_BUTTON
    where type 'a class = 'a GtkSourceStyleSchemeChooserButtonClass.class
    where type 'a style_scheme_chooser_class = 'a GtkSourceStyleSchemeChooserClass.class =
  struct
    val getType_ = _import "gtk_source_style_scheme_chooser_button_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_source_style_scheme_chooser_button_new" : unit -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    type 'a class = 'a GtkSourceStyleSchemeChooserButtonClass.class
    type 'a style_scheme_chooser_class = 'a GtkSourceStyleSchemeChooserClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActionable self = (GObjectObjectClass.FFI.withPtr ---> GtkActionableClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asStyleSchemeChooser self = (GObjectObjectClass.FFI.withPtr ---> GtkSourceStyleSchemeChooserClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkSourceStyleSchemeChooserButtonClass.FFI.fromPtr false) new_ ()
  end