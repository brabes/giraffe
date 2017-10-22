structure GtkColorChooserDialogClass :>
  GTK_COLOR_CHOOSER_DIALOG_CLASS
    where type 'a dialog_class = 'a GtkDialogClass.class
    where type C.notnull = GtkDialogClass.C.notnull
    where type 'a C.p = 'a GtkDialogClass.C.p =
  struct
    type 'a dialog_class = 'a GtkDialogClass.class
    open GtkDialogClass
    type 'a color_chooser_dialog = unit
    type 'a class = 'a color_chooser_dialog class
  end