structure GtkAppChooserDialog :>
  GTK_APP_CHOOSER_DIALOG
    where type 'a class = 'a GtkAppChooserDialogClass.class
    where type 'a app_chooser_class = 'a GtkAppChooserClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type dialog_flags_t = GtkDialogFlags.t
    where type 'a window_class = 'a GtkWindowClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_app_chooser_dialog_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (getSymbol "gtk_app_chooser_dialog_new")
          (
            GtkWindowClass.PolyML.cOptPtr
             &&> GtkDialogFlags.PolyML.cVal
             &&> GioFileClass.PolyML.cPtr
             --> GtkWidgetClass.PolyML.cPtr
          )
      val newForContentType_ =
        call (getSymbol "gtk_app_chooser_dialog_new_for_content_type")
          (
            GtkWindowClass.PolyML.cOptPtr
             &&> GtkDialogFlags.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> GtkWidgetClass.PolyML.cPtr
          )
      val getHeading_ = call (getSymbol "gtk_app_chooser_dialog_get_heading") (GtkAppChooserDialogClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getWidget_ = call (getSymbol "gtk_app_chooser_dialog_get_widget") (GtkAppChooserDialogClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val setHeading_ = call (getSymbol "gtk_app_chooser_dialog_set_heading") (GtkAppChooserDialogClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
    end
    type 'a class = 'a GtkAppChooserDialogClass.class
    type 'a app_chooser_class = 'a GtkAppChooserClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type dialog_flags_t = GtkDialogFlags.t
    type 'a window_class = 'a GtkWindowClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asAppChooser self = (GObjectObjectClass.FFI.withPtr false ---> GtkAppChooserClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new
      (
        parent,
        flags,
        file
      ) =
      (
        GtkWindowClass.FFI.withOptPtr false
         &&&> GtkDialogFlags.FFI.withVal
         &&&> GioFileClass.FFI.withPtr false
         ---> GtkAppChooserDialogClass.FFI.fromPtr false
      )
        new_
        (
          parent
           & flags
           & file
        )
       before GtkWindowClass.FFI.touchOptPtr parent
       before GioFileClass.FFI.touchPtr file
    fun newForContentType
      (
        parent,
        flags,
        contentType
      ) =
      (
        GtkWindowClass.FFI.withOptPtr false
         &&&> GtkDialogFlags.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         ---> GtkAppChooserDialogClass.FFI.fromPtr false
      )
        newForContentType_
        (
          parent
           & flags
           & contentType
        )
       before GtkWindowClass.FFI.touchOptPtr parent
       before Utf8.FFI.touchPtr contentType
    fun getHeading self = (GtkAppChooserDialogClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getHeading_ self before GtkAppChooserDialogClass.FFI.touchPtr self
    fun getWidget self = (GtkAppChooserDialogClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false) getWidget_ self before GtkAppChooserDialogClass.FFI.touchPtr self
    fun setHeading self heading = (GtkAppChooserDialogClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setHeading_ (self & heading)
    local
      open ValueAccessor
    in
      val gfileProp =
        {
          name = "gfile",
          gtype = fn () => C.gtype GioFileClass.tOpt (),
          get = fn x => fn () => C.get GioFileClass.tOpt x,
          set = ignore,
          init = fn x => C.set GioFileClass.tOpt x
        }
      val headingProp =
        {
          name = "heading",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
    end
  end
