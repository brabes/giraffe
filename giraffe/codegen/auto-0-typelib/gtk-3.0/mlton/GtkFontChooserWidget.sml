structure GtkFontChooserWidget :>
  GTK_FONT_CHOOSER_WIDGET
    where type 'a class_t = 'a GtkFontChooserWidgetClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a fontchooserclass_t = 'a GtkFontChooserClass.t
    where type 'a orientableclass_t = 'a GtkOrientableClass.t =
  struct
    val getType_ = _import "gtk_font_chooser_widget_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_font_chooser_widget_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    type 'a class_t = 'a GtkFontChooserWidgetClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a fontchooserclass_t = 'a GtkFontChooserClass.t
    type 'a orientableclass_t = 'a GtkOrientableClass.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asFontChooser self = (GObjectObjectClass.C.withPtr ---> GtkFontChooserClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkFontChooserWidgetClass.C.fromPtr false) new_ ()
  end