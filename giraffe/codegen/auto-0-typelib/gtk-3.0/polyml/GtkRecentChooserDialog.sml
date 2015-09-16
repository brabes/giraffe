structure GtkRecentChooserDialog :>
  GTK_RECENT_CHOOSER_DIALOG
    where type 'a class_t = 'a GtkRecentChooserDialogClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a recent_chooser_class_t = 'a GtkRecentChooserClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_recent_chooser_dialog_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
    end
    type 'a class_t = 'a GtkRecentChooserDialogClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type 'a recent_chooser_class_t = 'a GtkRecentChooserClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asRecentChooser self = (GObjectObjectClass.C.withPtr ---> GtkRecentChooserClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
