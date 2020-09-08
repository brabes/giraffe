structure GtkShortcutLabel :>
  GTK_SHORTCUT_LABEL
    where type 'a class = 'a GtkShortcutLabelClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_shortcut_label_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_shortcut_label_new") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val getAccelerator_ = call (getSymbol "gtk_shortcut_label_get_accelerator") (GtkShortcutLabelClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getDisabledText_ = call (getSymbol "gtk_shortcut_label_get_disabled_text") (GtkShortcutLabelClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val setAccelerator_ = call (getSymbol "gtk_shortcut_label_set_accelerator") (GtkShortcutLabelClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setDisabledText_ = call (getSymbol "gtk_shortcut_label_set_disabled_text") (GtkShortcutLabelClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
    end
    type 'a class = 'a GtkShortcutLabelClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr false ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new accelerator = (Utf8.FFI.withPtr 0 ---> GtkShortcutLabelClass.FFI.fromPtr true) new_ accelerator
    fun getAccelerator self = (GtkShortcutLabelClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getAccelerator_ self
    fun getDisabledText self = (GtkShortcutLabelClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getDisabledText_ self
    fun setAccelerator self accelerator = (GtkShortcutLabelClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setAccelerator_ (self & accelerator)
    fun setDisabledText self disabledText = (GtkShortcutLabelClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setDisabledText_ (self & disabledText)
    local
      open ValueAccessor
    in
      val acceleratorProp =
        {
          name = "accelerator",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val disabledTextProp =
        {
          name = "disabled-text",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
    end
  end
