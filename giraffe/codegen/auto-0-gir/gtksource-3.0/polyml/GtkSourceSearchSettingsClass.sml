structure GtkSourceSearchSettingsClass :>
  GTK_SOURCE_SEARCH_SETTINGS_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a search_settings = unit
    type 'a class = 'a search_settings class
  end