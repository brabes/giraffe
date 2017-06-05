signature GTK_RECENT_INFO =
  sig
    type t
    val getType : unit -> GObject.Type.t
    val createAppInfo :
      t
       -> string option
       -> base Gio.AppInfoClass.class
    val exists : t -> bool
    val getAdded : t -> LargeInt.int
    val getAge : t -> LargeInt.int
    val getApplicationInfo :
      t
       -> string
       -> (string
            * LargeInt.int
            * LargeInt.int)
            option
    val getApplications : t -> string list
    val getDescription : t -> string
    val getDisplayName : t -> string
    val getGicon : t -> base Gio.IconClass.class
    val getGroups : t -> string list
    val getIcon :
      t
       -> LargeInt.int
       -> base GdkPixbuf.PixbufClass.class
    val getMimeType : t -> string
    val getModified : t -> LargeInt.int
    val getPrivateHint : t -> bool
    val getShortName : t -> string
    val getUri : t -> string
    val getUriDisplay : t -> string
    val getVisited : t -> LargeInt.int
    val hasApplication :
      t
       -> string
       -> bool
    val hasGroup :
      t
       -> string
       -> bool
    val isLocal : t -> bool
    val lastApplication : t -> string
    val match :
      t
       -> t
       -> bool
  end
