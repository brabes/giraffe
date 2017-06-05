signature GIO =
  sig
    structure ActionGroupClass : GIO_ACTION_GROUP_CLASS
    structure AppInfoClass : GIO_APP_INFO_CLASS
    structure AppLaunchContextClass : GIO_APP_LAUNCH_CONTEXT_CLASS
    structure ApplicationClass : GIO_APPLICATION_CLASS
    structure ApplicationCommandLineClass : GIO_APPLICATION_COMMAND_LINE_CLASS
    structure ApplicationFlags : GIO_APPLICATION_FLAGS
    structure AsyncResultClass : GIO_ASYNC_RESULT_CLASS
    structure CancellableClass : GIO_CANCELLABLE_CLASS
    structure EmblemedIconClass : GIO_EMBLEMED_ICON_CLASS
    structure FileClass : GIO_FILE_CLASS
    structure IconClass : GIO_ICON_CLASS
    structure InitableClass : GIO_INITABLE_CLASS
    structure InputStreamClass : GIO_INPUT_STREAM_CLASS
    structure MountOperationClass : GIO_MOUNT_OPERATION_CLASS
    structure OutputStreamClass : GIO_OUTPUT_STREAM_CLASS
    structure PermissionClass : GIO_PERMISSION_CLASS
    structure Application :
      GIO_APPLICATION
        where type 'a class = 'a ApplicationClass.class
        where type 'a cancellable_class = 'a CancellableClass.class
        where type 'a application_command_line_class = 'a ApplicationCommandLineClass.class
        where type 'a file_class = 'a FileClass.class
        where type 'a action_group_class = 'a ActionGroupClass.class
        where type application_flags_t = ApplicationFlags.t
  end
