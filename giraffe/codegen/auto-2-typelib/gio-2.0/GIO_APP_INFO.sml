signature GIO_APP_INFO =
  sig
    type 'a class_t
    type 'a iconclass_t
    type 'a applaunchcontextclass_t
    type appinfocreateflags_t
    val getType : unit -> GObject.Type.t
    val createFromCommandline :
      string
       -> string option
       -> appinfocreateflags_t
       -> base class_t
    val getDefaultForType :
      string
       -> bool
       -> base class_t
    val getDefaultForUriScheme : string -> base class_t
    val launchDefaultForUri :
      string
       -> 'a applaunchcontextclass_t option
       -> bool
    val resetTypeAssociations : string -> unit
    val addSupportsType :
      'a class_t
       -> string
       -> bool
    val canDelete : 'a class_t -> bool
    val canRemoveSupportsType : 'a class_t -> bool
    val delete : 'a class_t -> bool
    val dup : 'a class_t -> base class_t
    val equal :
      'a class_t
       -> 'b class_t
       -> bool
    val getCommandline : 'a class_t -> string
    val getDescription : 'a class_t -> string
    val getDisplayName : 'a class_t -> string
    val getExecutable : 'a class_t -> string
    val getIcon : 'a class_t -> base iconclass_t
    val getId : 'a class_t -> string
    val getName : 'a class_t -> string
    val removeSupportsType :
      'a class_t
       -> string
       -> bool
    val setAsDefaultForExtension :
      'a class_t
       -> string
       -> bool
    val setAsDefaultForType :
      'a class_t
       -> string
       -> bool
    val setAsLastUsedForType :
      'a class_t
       -> string
       -> bool
    val shouldShow : 'a class_t -> bool
    val supportsFiles : 'a class_t -> bool
    val supportsUris : 'a class_t -> bool
  end