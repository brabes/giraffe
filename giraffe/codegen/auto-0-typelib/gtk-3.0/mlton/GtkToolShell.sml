structure GtkToolShell :>
  GTK_TOOL_SHELL
    where type 'a class_t = 'a GtkToolShellClass.t
    where type relief_style_t = GtkReliefStyle.t
    where type toolbar_style_t = GtkToolbarStyle.t
    where type orientation_t = GtkOrientation.t
    where type 'a size_group_class_t = 'a GtkSizeGroupClass.t =
  struct
    val getType_ = _import "gtk_tool_shell_get_type" : unit -> GObjectType.C.val_;
    val getEllipsizeMode_ = _import "gtk_tool_shell_get_ellipsize_mode" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> PangoEllipsizeMode.C.val_;
    val getIconSize_ = _import "gtk_tool_shell_get_icon_size" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.C.val_;
    val getOrientation_ = _import "gtk_tool_shell_get_orientation" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkOrientation.C.val_;
    val getReliefStyle_ = _import "gtk_tool_shell_get_relief_style" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkReliefStyle.C.val_;
    val getStyle_ = _import "gtk_tool_shell_get_style" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkToolbarStyle.C.val_;
    val getTextAlignment_ = _import "gtk_tool_shell_get_text_alignment" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Float.C.val_;
    val getTextOrientation_ = _import "gtk_tool_shell_get_text_orientation" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkOrientation.C.val_;
    val getTextSizeGroup_ = _import "gtk_tool_shell_get_text_size_group" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val rebuildMenu_ = _import "gtk_tool_shell_rebuild_menu" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    type 'a class_t = 'a GtkToolShellClass.t
    type relief_style_t = GtkReliefStyle.t
    type toolbar_style_t = GtkToolbarStyle.t
    type orientation_t = GtkOrientation.t
    type 'a size_group_class_t = 'a GtkSizeGroupClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getEllipsizeMode self = (GObjectObjectClass.C.withPtr ---> PangoEllipsizeMode.C.fromVal) getEllipsizeMode_ self
    fun getIconSize self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getIconSize_ self
    fun getOrientation self = (GObjectObjectClass.C.withPtr ---> GtkOrientation.C.fromVal) getOrientation_ self
    fun getReliefStyle self = (GObjectObjectClass.C.withPtr ---> GtkReliefStyle.C.fromVal) getReliefStyle_ self
    fun getStyle self = (GObjectObjectClass.C.withPtr ---> GtkToolbarStyle.C.fromVal) getStyle_ self
    fun getTextAlignment self = (GObjectObjectClass.C.withPtr ---> FFI.Float.C.fromVal) getTextAlignment_ self
    fun getTextOrientation self = (GObjectObjectClass.C.withPtr ---> GtkOrientation.C.fromVal) getTextOrientation_ self
    fun getTextSizeGroup self = (GObjectObjectClass.C.withPtr ---> GtkSizeGroupClass.C.fromPtr false) getTextSizeGroup_ self
    fun rebuildMenu self = (GObjectObjectClass.C.withPtr ---> I) rebuildMenu_ self
  end
