signature GIO =
  sig
    structure ActionClass : GIO_ACTION_CLASS
    structure ActionGroupClass : GIO_ACTION_GROUP_CLASS
    structure AppInfoClass : GIO_APP_INFO_CLASS
    structure AppInfoCreateFlags : GIO_APP_INFO_CREATE_FLAGS
    structure AppLaunchContextClass : GIO_APP_LAUNCH_CONTEXT_CLASS
    structure ApplicationClass : GIO_APPLICATION_CLASS
    structure ApplicationCommandLineClass : GIO_APPLICATION_COMMAND_LINE_CLASS
    structure ApplicationFlags : GIO_APPLICATION_FLAGS
    structure AskPasswordFlags : GIO_ASK_PASSWORD_FLAGS
    structure AsyncInitableClass : GIO_ASYNC_INITABLE_CLASS
    structure AsyncResultClass : GIO_ASYNC_RESULT_CLASS
    structure BusNameOwnerFlags : GIO_BUS_NAME_OWNER_FLAGS
    structure BusNameWatcherFlags : GIO_BUS_NAME_WATCHER_FLAGS
    structure BusType : GIO_BUS_TYPE
    structure CancellableClass : GIO_CANCELLABLE_CLASS
    structure CharsetConverterClass : GIO_CHARSET_CONVERTER_CLASS
    structure ConverterClass : GIO_CONVERTER_CLASS
    structure ConverterFlags : GIO_CONVERTER_FLAGS
    structure ConverterResult : GIO_CONVERTER_RESULT
    structure CredentialsClass : GIO_CREDENTIALS_CLASS
    structure CredentialsType : GIO_CREDENTIALS_TYPE
    structure DBusAuthObserverClass : GIO_D_BUS_AUTH_OBSERVER_CLASS
    structure DBusCallFlags : GIO_D_BUS_CALL_FLAGS
    structure DBusCapabilityFlags : GIO_D_BUS_CAPABILITY_FLAGS
    structure DBusConnectionClass : GIO_D_BUS_CONNECTION_CLASS
    structure DBusConnectionFlags : GIO_D_BUS_CONNECTION_FLAGS
    structure DBusError : GIO_D_BUS_ERROR
    structure DBusInterfaceClass : GIO_D_BUS_INTERFACE_CLASS
    structure DBusInterfaceSkeletonClass : GIO_D_BUS_INTERFACE_SKELETON_CLASS
    structure DBusInterfaceSkeletonFlags : GIO_D_BUS_INTERFACE_SKELETON_FLAGS
    structure DBusMessageClass : GIO_D_BUS_MESSAGE_CLASS
    structure DBusMessageByteOrder : GIO_D_BUS_MESSAGE_BYTE_ORDER
    structure DBusMessageFlags : GIO_D_BUS_MESSAGE_FLAGS
    structure DBusMessageHeaderField : GIO_D_BUS_MESSAGE_HEADER_FIELD
    structure DBusMessageType : GIO_D_BUS_MESSAGE_TYPE
    structure DBusMethodInvocationClass : GIO_D_BUS_METHOD_INVOCATION_CLASS
    structure DBusObjectClass : GIO_D_BUS_OBJECT_CLASS
    structure DBusObjectManagerClass : GIO_D_BUS_OBJECT_MANAGER_CLASS
    structure DBusObjectManagerClientClass : GIO_D_BUS_OBJECT_MANAGER_CLIENT_CLASS
    structure DBusObjectManagerClientFlags : GIO_D_BUS_OBJECT_MANAGER_CLIENT_FLAGS
    structure DBusObjectManagerServerClass : GIO_D_BUS_OBJECT_MANAGER_SERVER_CLASS
    structure DBusObjectProxyClass : GIO_D_BUS_OBJECT_PROXY_CLASS
    structure DBusObjectSkeletonClass : GIO_D_BUS_OBJECT_SKELETON_CLASS
    structure DBusPropertyInfoFlags : GIO_D_BUS_PROPERTY_INFO_FLAGS
    structure DBusProxyClass : GIO_D_BUS_PROXY_CLASS
    structure DBusProxyFlags : GIO_D_BUS_PROXY_FLAGS
    structure DBusSendMessageFlags : GIO_D_BUS_SEND_MESSAGE_FLAGS
    structure DBusServerClass : GIO_D_BUS_SERVER_CLASS
    structure DBusServerFlags : GIO_D_BUS_SERVER_FLAGS
    structure DBusSignalFlags : GIO_D_BUS_SIGNAL_FLAGS
    structure DBusSubtreeFlags : GIO_D_BUS_SUBTREE_FLAGS
    structure DataStreamByteOrder : GIO_DATA_STREAM_BYTE_ORDER
    structure DataStreamNewlineType : GIO_DATA_STREAM_NEWLINE_TYPE
    structure DesktopAppInfoClass : GIO_DESKTOP_APP_INFO_CLASS
    structure DesktopAppInfoLookupClass : GIO_DESKTOP_APP_INFO_LOOKUP_CLASS
    structure DriveClass : GIO_DRIVE_CLASS
    structure DriveStartFlags : GIO_DRIVE_START_FLAGS
    structure DriveStartStopType : GIO_DRIVE_START_STOP_TYPE
    structure EmblemClass : GIO_EMBLEM_CLASS
    structure EmblemOrigin : GIO_EMBLEM_ORIGIN
    structure EmblemedIconClass : GIO_EMBLEMED_ICON_CLASS
    structure FileClass : GIO_FILE_CLASS
    structure FileAttributeInfoFlags : GIO_FILE_ATTRIBUTE_INFO_FLAGS
    structure FileAttributeStatus : GIO_FILE_ATTRIBUTE_STATUS
    structure FileAttributeType : GIO_FILE_ATTRIBUTE_TYPE
    structure FileCopyFlags : GIO_FILE_COPY_FLAGS
    structure FileCreateFlags : GIO_FILE_CREATE_FLAGS
    structure FileDescriptorBasedClass : GIO_FILE_DESCRIPTOR_BASED_CLASS
    structure FileEnumeratorClass : GIO_FILE_ENUMERATOR_CLASS
    structure FileIconClass : GIO_FILE_ICON_CLASS
    structure FileInfoClass : GIO_FILE_INFO_CLASS
    structure FileMonitorClass : GIO_FILE_MONITOR_CLASS
    structure FileMonitorEvent : GIO_FILE_MONITOR_EVENT
    structure FileMonitorFlags : GIO_FILE_MONITOR_FLAGS
    structure FileQueryInfoFlags : GIO_FILE_QUERY_INFO_FLAGS
    structure FileType : GIO_FILE_TYPE
    structure FilenameCompleterClass : GIO_FILENAME_COMPLETER_CLASS
    structure FilesystemPreviewType : GIO_FILESYSTEM_PREVIEW_TYPE
    structure IOErrorEnum : GIO_I_O_ERROR_ENUM
    exception IOErrorEnum of IOErrorEnum.t
    structure IOModuleClass : GIO_I_O_MODULE_CLASS
    structure IOModuleScopeFlags : GIO_I_O_MODULE_SCOPE_FLAGS
    structure IOStreamClass : GIO_I_O_STREAM_CLASS
    structure IOStreamSpliceFlags : GIO_I_O_STREAM_SPLICE_FLAGS
    structure IconClass : GIO_ICON_CLASS
    structure InetAddressClass : GIO_INET_ADDRESS_CLASS
    structure InitableClass : GIO_INITABLE_CLASS
    structure InputStreamClass : GIO_INPUT_STREAM_CLASS
    structure LoadableIconClass : GIO_LOADABLE_ICON_CLASS
    structure MountClass : GIO_MOUNT_CLASS
    structure MountMountFlags : GIO_MOUNT_MOUNT_FLAGS
    structure MountOperationClass : GIO_MOUNT_OPERATION_CLASS
    structure MountOperationResult : GIO_MOUNT_OPERATION_RESULT
    structure MountUnmountFlags : GIO_MOUNT_UNMOUNT_FLAGS
    structure NetworkAddressClass : GIO_NETWORK_ADDRESS_CLASS
    structure NetworkServiceClass : GIO_NETWORK_SERVICE_CLASS
    structure OutputStreamClass : GIO_OUTPUT_STREAM_CLASS
    structure OutputStreamSpliceFlags : GIO_OUTPUT_STREAM_SPLICE_FLAGS
    structure PasswordSave : GIO_PASSWORD_SAVE
    structure PermissionClass : GIO_PERMISSION_CLASS
    structure PollableInputStreamClass : GIO_POLLABLE_INPUT_STREAM_CLASS
    structure PollableOutputStreamClass : GIO_POLLABLE_OUTPUT_STREAM_CLASS
    structure ProxyClass : GIO_PROXY_CLASS
    structure ProxyResolverClass : GIO_PROXY_RESOLVER_CLASS
    structure ResolverClass : GIO_RESOLVER_CLASS
    structure ResolverError : GIO_RESOLVER_ERROR
    exception ResolverError of ResolverError.t
    structure SeekableClass : GIO_SEEKABLE_CLASS
    structure SettingsClass : GIO_SETTINGS_CLASS
    structure SettingsBindFlags : GIO_SETTINGS_BIND_FLAGS
    structure SimpleActionClass : GIO_SIMPLE_ACTION_CLASS
    structure SimpleActionGroupClass : GIO_SIMPLE_ACTION_GROUP_CLASS
    structure SimpleAsyncResultClass : GIO_SIMPLE_ASYNC_RESULT_CLASS
    structure SocketClass : GIO_SOCKET_CLASS
    structure SocketAddressClass : GIO_SOCKET_ADDRESS_CLASS
    structure SocketAddressEnumeratorClass : GIO_SOCKET_ADDRESS_ENUMERATOR_CLASS
    structure SocketClientClass : GIO_SOCKET_CLIENT_CLASS
    structure SocketConnectableClass : GIO_SOCKET_CONNECTABLE_CLASS
    structure SocketControlMessageClass : GIO_SOCKET_CONTROL_MESSAGE_CLASS
    structure SocketFamily : GIO_SOCKET_FAMILY
    structure SocketListenerClass : GIO_SOCKET_LISTENER_CLASS
    structure SocketMsgFlags : GIO_SOCKET_MSG_FLAGS
    structure SocketProtocol : GIO_SOCKET_PROTOCOL
    structure SocketType : GIO_SOCKET_TYPE
    structure ThemedIconClass : GIO_THEMED_ICON_CLASS
    structure TlsAuthenticationMode : GIO_TLS_AUTHENTICATION_MODE
    structure TlsBackendClass : GIO_TLS_BACKEND_CLASS
    structure TlsCertificateClass : GIO_TLS_CERTIFICATE_CLASS
    structure TlsCertificateFlags : GIO_TLS_CERTIFICATE_FLAGS
    structure TlsClientConnectionClass : GIO_TLS_CLIENT_CONNECTION_CLASS
    structure TlsDatabaseClass : GIO_TLS_DATABASE_CLASS
    structure TlsDatabaseLookupFlags : GIO_TLS_DATABASE_LOOKUP_FLAGS
    structure TlsDatabaseVerifyFlags : GIO_TLS_DATABASE_VERIFY_FLAGS
    structure TlsError : GIO_TLS_ERROR
    exception TlsError of TlsError.t
    structure TlsFileDatabaseClass : GIO_TLS_FILE_DATABASE_CLASS
    structure TlsInteractionClass : GIO_TLS_INTERACTION_CLASS
    structure TlsInteractionResult : GIO_TLS_INTERACTION_RESULT
    structure TlsPasswordClass : GIO_TLS_PASSWORD_CLASS
    structure TlsPasswordFlags : GIO_TLS_PASSWORD_FLAGS
    structure TlsRehandshakeMode : GIO_TLS_REHANDSHAKE_MODE
    structure TlsServerConnectionClass : GIO_TLS_SERVER_CONNECTION_CLASS
    structure UnixFDListClass : GIO_UNIX_F_D_LIST_CLASS
    structure UnixMountMonitorClass : GIO_UNIX_MOUNT_MONITOR_CLASS
    structure UnixSocketAddressType : GIO_UNIX_SOCKET_ADDRESS_TYPE
    structure VfsClass : GIO_VFS_CLASS
    structure VolumeClass : GIO_VOLUME_CLASS
    structure VolumeMonitorClass : GIO_VOLUME_MONITOR_CLASS
    structure ZlibCompressorClass : GIO_ZLIB_COMPRESSOR_CLASS
    structure ZlibCompressorFormat : GIO_ZLIB_COMPRESSOR_FORMAT
    structure ZlibDecompressorClass : GIO_ZLIB_DECOMPRESSOR_CLASS
    structure Action :
      GIO_ACTION
        where type 'a class = 'a ActionClass.class
    structure ActionGroup :
      GIO_ACTION_GROUP
        where type 'a class = 'a ActionGroupClass.class
    structure AppInfo :
      GIO_APP_INFO
        where type 'a class = 'a AppInfoClass.class
        where type app_info_create_flags_t = AppInfoCreateFlags.t
        where type 'a app_launch_context_class = 'a AppLaunchContextClass.class
        where type 'a icon_class = 'a IconClass.class
    structure AppLaunchContext :
      GIO_APP_LAUNCH_CONTEXT
        where type 'a class = 'a AppLaunchContextClass.class
    structure Application :
      GIO_APPLICATION
        where type 'a class = 'a ApplicationClass.class
        where type 'a cancellable_class = 'a CancellableClass.class
        where type 'a application_command_line_class = 'a ApplicationCommandLineClass.class
        where type 'a file_class = 'a FileClass.class
        where type 'a action_group_class = 'a ActionGroupClass.class
        where type application_flags_t = ApplicationFlags.t
    structure ApplicationCommandLine :
      GIO_APPLICATION_COMMAND_LINE
        where type 'a class = 'a ApplicationCommandLineClass.class
    structure AsyncInitable :
      GIO_ASYNC_INITABLE
        where type 'a class = 'a AsyncInitableClass.class
        where type 'a async_result_class = 'a AsyncResultClass.class
    structure AsyncResult :
      GIO_ASYNC_RESULT
        where type 'a class = 'a AsyncResultClass.class
    structure Cancellable :
      GIO_CANCELLABLE
        where type 'a class = 'a CancellableClass.class
    structure CharsetConverter :
      GIO_CHARSET_CONVERTER
        where type 'a class = 'a CharsetConverterClass.class
        where type 'a converter_class = 'a ConverterClass.class
        where type 'a initable_class = 'a InitableClass.class
    structure Converter :
      GIO_CONVERTER
        where type 'a class = 'a ConverterClass.class
    structure Credentials :
      GIO_CREDENTIALS
        where type 'a class = 'a CredentialsClass.class
    structure DBusAuthObserver :
      GIO_D_BUS_AUTH_OBSERVER
        where type 'a class = 'a DBusAuthObserverClass.class
        where type 'a credentials_class = 'a CredentialsClass.class
        where type 'a i_o_stream_class = 'a IOStreamClass.class
    structure DBusConnection :
      GIO_D_BUS_CONNECTION
        where type 'a class = 'a DBusConnectionClass.class
        where type 'a async_initable_class = 'a AsyncInitableClass.class
        where type 'a initable_class = 'a InitableClass.class
        where type 'a unix_f_d_list_class = 'a UnixFDListClass.class
        where type d_bus_call_flags_t = DBusCallFlags.t
        where type 'a credentials_class = 'a CredentialsClass.class
        where type 'a async_result_class = 'a AsyncResultClass.class
        where type 'a cancellable_class = 'a CancellableClass.class
        where type d_bus_send_message_flags_t = DBusSendMessageFlags.t
        where type 'a d_bus_message_class = 'a DBusMessageClass.class
        where type 'a d_bus_auth_observer_class = 'a DBusAuthObserverClass.class
        where type d_bus_capability_flags_t = DBusCapabilityFlags.t
        where type d_bus_connection_flags_t = DBusConnectionFlags.t
        where type 'a i_o_stream_class = 'a IOStreamClass.class
    structure DBusMessage :
      GIO_D_BUS_MESSAGE
        where type 'a class = 'a DBusMessageClass.class
        where type d_bus_message_byte_order_t = DBusMessageByteOrder.t
        where type d_bus_message_flags_t = DBusMessageFlags.t
        where type d_bus_message_header_field_t = DBusMessageHeaderField.t
        where type d_bus_message_type_t = DBusMessageType.t
        where type 'a unix_f_d_list_class = 'a UnixFDListClass.class
    structure DBusObject :
      GIO_D_BUS_OBJECT
        where type 'a class = 'a DBusObjectClass.class
        where type 'a d_bus_interface_class = 'a DBusInterfaceClass.class
    structure DBusObjectManager :
      GIO_D_BUS_OBJECT_MANAGER
        where type 'a class = 'a DBusObjectManagerClass.class
        where type 'a d_bus_interface_class = 'a DBusInterfaceClass.class
        where type 'a d_bus_object_class = 'a DBusObjectClass.class
    structure DBusObjectManagerClient :
      GIO_D_BUS_OBJECT_MANAGER_CLIENT
        where type 'a class = 'a DBusObjectManagerClientClass.class
        where type 'a async_initable_class = 'a AsyncInitableClass.class
        where type 'a d_bus_object_manager_class = 'a DBusObjectManagerClass.class
        where type 'a initable_class = 'a InitableClass.class
        where type 'a async_result_class = 'a AsyncResultClass.class
        where type 'a d_bus_proxy_class = 'a DBusProxyClass.class
        where type 'a d_bus_object_proxy_class = 'a DBusObjectProxyClass.class
        where type bus_type_t = BusType.t
        where type 'a d_bus_connection_class = 'a DBusConnectionClass.class
        where type d_bus_object_manager_client_flags_t = DBusObjectManagerClientFlags.t
    structure DBusObjectManagerServer :
      GIO_D_BUS_OBJECT_MANAGER_SERVER
        where type 'a class = 'a DBusObjectManagerServerClass.class
        where type 'a d_bus_object_manager_class = 'a DBusObjectManagerClass.class
        where type 'a d_bus_object_skeleton_class = 'a DBusObjectSkeletonClass.class
        where type 'a d_bus_connection_class = 'a DBusConnectionClass.class
    structure DBusObjectProxy :
      GIO_D_BUS_OBJECT_PROXY
        where type 'a class = 'a DBusObjectProxyClass.class
        where type 'a d_bus_object_class = 'a DBusObjectClass.class
        where type 'a d_bus_connection_class = 'a DBusConnectionClass.class
    structure DBusObjectSkeleton :
      GIO_D_BUS_OBJECT_SKELETON
        where type 'a class = 'a DBusObjectSkeletonClass.class
        where type 'a d_bus_object_class = 'a DBusObjectClass.class
        where type 'a d_bus_method_invocation_class = 'a DBusMethodInvocationClass.class
        where type 'a d_bus_interface_skeleton_class = 'a DBusInterfaceSkeletonClass.class
    structure DBusServer :
      GIO_D_BUS_SERVER
        where type 'a class = 'a DBusServerClass.class
        where type 'a initable_class = 'a InitableClass.class
        where type 'a cancellable_class = 'a CancellableClass.class
        where type 'a d_bus_connection_class = 'a DBusConnectionClass.class
        where type 'a d_bus_auth_observer_class = 'a DBusAuthObserverClass.class
        where type d_bus_server_flags_t = DBusServerFlags.t
    structure DesktopAppInfo :
      GIO_DESKTOP_APP_INFO
        where type 'a class = 'a DesktopAppInfoClass.class
        where type 'a app_info_class = 'a AppInfoClass.class
    structure DesktopAppInfoLookup :
      GIO_DESKTOP_APP_INFO_LOOKUP
        where type 'a class = 'a DesktopAppInfoLookupClass.class
    structure Drive :
      GIO_DRIVE
        where type 'a class = 'a DriveClass.class
        where type 'a icon_class = 'a IconClass.class
        where type drive_start_stop_type_t = DriveStartStopType.t
        where type 'a async_result_class = 'a AsyncResultClass.class
    structure Emblem :
      GIO_EMBLEM
        where type 'a class = 'a EmblemClass.class
        where type 'a icon_class = 'a IconClass.class
        where type emblem_origin_t = EmblemOrigin.t
    structure EmblemedIcon :
      GIO_EMBLEMED_ICON
        where type 'a class = 'a EmblemedIconClass.class
        where type 'a emblem_class = 'a EmblemClass.class
        where type 'a icon_class = 'a IconClass.class
    structure FileDescriptorBased :
      GIO_FILE_DESCRIPTOR_BASED
        where type 'a class = 'a FileDescriptorBasedClass.class
    structure FileEnumerator :
      GIO_FILE_ENUMERATOR
        where type 'a class = 'a FileEnumeratorClass.class
        where type 'a async_result_class = 'a AsyncResultClass.class
        where type 'a file_info_class = 'a FileInfoClass.class
        where type 'a cancellable_class = 'a CancellableClass.class
        where type 'a file_class = 'a FileClass.class
    structure FileIOStreamClass :
      GIO_FILE_I_O_STREAM_CLASS
        where type 'a i_o_stream_class = 'a IOStreamClass.class
    structure FileIcon :
      GIO_FILE_ICON
        where type 'a class = 'a FileIconClass.class
        where type 'a icon_class = 'a IconClass.class
        where type 'a loadable_icon_class = 'a LoadableIconClass.class
        where type 'a file_class = 'a FileClass.class
    structure FileInputStreamClass :
      GIO_FILE_INPUT_STREAM_CLASS
        where type 'a input_stream_class = 'a InputStreamClass.class
    structure FileMonitor :
      GIO_FILE_MONITOR
        where type 'a class = 'a FileMonitorClass.class
        where type file_monitor_event_t = FileMonitorEvent.t
        where type 'a file_class = 'a FileClass.class
    structure FileOutputStreamClass :
      GIO_FILE_OUTPUT_STREAM_CLASS
        where type 'a output_stream_class = 'a OutputStreamClass.class
    structure FilenameCompleter :
      GIO_FILENAME_COMPLETER
        where type 'a class = 'a FilenameCompleterClass.class
    structure FilterInputStreamClass :
      GIO_FILTER_INPUT_STREAM_CLASS
        where type 'a input_stream_class = 'a InputStreamClass.class
    structure FilterOutputStreamClass :
      GIO_FILTER_OUTPUT_STREAM_CLASS
        where type 'a output_stream_class = 'a OutputStreamClass.class
    structure IOModule :
      GIO_I_O_MODULE
        where type 'a class = 'a IOModuleClass.class
    structure IOStream :
      GIO_I_O_STREAM
        where type 'a class = 'a IOStreamClass.class
        where type 'a cancellable_class = 'a CancellableClass.class
        where type 'a async_result_class = 'a AsyncResultClass.class
        where type 'a input_stream_class = 'a InputStreamClass.class
        where type 'a output_stream_class = 'a OutputStreamClass.class
    structure Icon :
      GIO_ICON
        where type 'a class = 'a IconClass.class
    structure InetAddress :
      GIO_INET_ADDRESS
        where type 'a class = 'a InetAddressClass.class
        where type socket_family_t = SocketFamily.t
    structure InetSocketAddressClass :
      GIO_INET_SOCKET_ADDRESS_CLASS
        where type 'a socket_address_class = 'a SocketAddressClass.class
    structure Initable :
      GIO_INITABLE
        where type 'a class = 'a InitableClass.class
        where type 'a cancellable_class = 'a CancellableClass.class
    structure InputStream :
      GIO_INPUT_STREAM
        where type 'a class = 'a InputStreamClass.class
        where type 'a cancellable_class = 'a CancellableClass.class
        where type 'a async_result_class = 'a AsyncResultClass.class
    structure LoadableIcon :
      GIO_LOADABLE_ICON
        where type 'a class = 'a LoadableIconClass.class
        where type 'a cancellable_class = 'a CancellableClass.class
        where type 'a input_stream_class = 'a InputStreamClass.class
        where type 'a async_result_class = 'a AsyncResultClass.class
    structure MemoryInputStreamClass :
      GIO_MEMORY_INPUT_STREAM_CLASS
        where type 'a input_stream_class = 'a InputStreamClass.class
    structure MemoryOutputStreamClass :
      GIO_MEMORY_OUTPUT_STREAM_CLASS
        where type 'a output_stream_class = 'a OutputStreamClass.class
    structure Mount :
      GIO_MOUNT
        where type 'a class = 'a MountClass.class
        where type 'a drive_class = 'a DriveClass.class
        where type 'a icon_class = 'a IconClass.class
        where type 'a file_class = 'a FileClass.class
        where type 'a volume_class = 'a VolumeClass.class
        where type 'a cancellable_class = 'a CancellableClass.class
        where type 'a async_result_class = 'a AsyncResultClass.class
    structure MountOperation :
      GIO_MOUNT_OPERATION
        where type 'a class = 'a MountOperationClass.class
        where type ask_password_flags_t = AskPasswordFlags.t
        where type mount_operation_result_t = MountOperationResult.t
        where type password_save_t = PasswordSave.t
    structure NativeVolumeMonitorClass :
      GIO_NATIVE_VOLUME_MONITOR_CLASS
        where type 'a volume_monitor_class = 'a VolumeMonitorClass.class
    structure NetworkAddress :
      GIO_NETWORK_ADDRESS
        where type 'a class = 'a NetworkAddressClass.class
        where type 'a socket_connectable_class = 'a SocketConnectableClass.class
    structure NetworkService :
      GIO_NETWORK_SERVICE
        where type 'a class = 'a NetworkServiceClass.class
        where type 'a socket_connectable_class = 'a SocketConnectableClass.class
    structure OutputStream :
      GIO_OUTPUT_STREAM
        where type 'a class = 'a OutputStreamClass.class
        where type output_stream_splice_flags_t = OutputStreamSpliceFlags.t
        where type 'a input_stream_class = 'a InputStreamClass.class
        where type 'a cancellable_class = 'a CancellableClass.class
        where type 'a async_result_class = 'a AsyncResultClass.class
    structure Permission :
      GIO_PERMISSION
        where type 'a class = 'a PermissionClass.class
        where type 'a cancellable_class = 'a CancellableClass.class
        where type 'a async_result_class = 'a AsyncResultClass.class
    structure PollableInputStream :
      GIO_POLLABLE_INPUT_STREAM
        where type 'a class = 'a PollableInputStreamClass.class
    structure PollableOutputStream :
      GIO_POLLABLE_OUTPUT_STREAM
        where type 'a class = 'a PollableOutputStreamClass.class
        where type 'a cancellable_class = 'a CancellableClass.class
    structure ProxyAddressEnumeratorClass :
      GIO_PROXY_ADDRESS_ENUMERATOR_CLASS
        where type 'a socket_address_enumerator_class = 'a SocketAddressEnumeratorClass.class
    structure ProxyResolver :
      GIO_PROXY_RESOLVER
        where type 'a class = 'a ProxyResolverClass.class
        where type 'a cancellable_class = 'a CancellableClass.class
        where type 'a async_result_class = 'a AsyncResultClass.class
    structure Resolver :
      GIO_RESOLVER
        where type 'a class = 'a ResolverClass.class
        where type 'a cancellable_class = 'a CancellableClass.class
        where type 'a inet_address_class = 'a InetAddressClass.class
        where type 'a async_result_class = 'a AsyncResultClass.class
    structure Seekable :
      GIO_SEEKABLE
        where type 'a class = 'a SeekableClass.class
        where type 'a cancellable_class = 'a CancellableClass.class
    structure SimpleAction :
      GIO_SIMPLE_ACTION
        where type 'a class = 'a SimpleActionClass.class
        where type 'a action_class = 'a ActionClass.class
    structure SimpleActionGroup :
      GIO_SIMPLE_ACTION_GROUP
        where type 'a class = 'a SimpleActionGroupClass.class
        where type 'a action_group_class = 'a ActionGroupClass.class
        where type 'a action_class = 'a ActionClass.class
    structure SimpleAsyncResult :
      GIO_SIMPLE_ASYNC_RESULT
        where type 'a class = 'a SimpleAsyncResultClass.class
        where type 'a async_result_class = 'a AsyncResultClass.class
    structure SimplePermissionClass :
      GIO_SIMPLE_PERMISSION_CLASS
        where type 'a permission_class = 'a PermissionClass.class
    structure SocketAddress :
      GIO_SOCKET_ADDRESS
        where type 'a class = 'a SocketAddressClass.class
        where type 'a socket_connectable_class = 'a SocketConnectableClass.class
        where type socket_family_t = SocketFamily.t
    structure SocketAddressEnumerator :
      GIO_SOCKET_ADDRESS_ENUMERATOR
        where type 'a class = 'a SocketAddressEnumeratorClass.class
        where type 'a cancellable_class = 'a CancellableClass.class
        where type 'a socket_address_class = 'a SocketAddressClass.class
        where type 'a async_result_class = 'a AsyncResultClass.class
    structure SocketConnectable :
      GIO_SOCKET_CONNECTABLE
        where type 'a class = 'a SocketConnectableClass.class
        where type 'a socket_address_enumerator_class = 'a SocketAddressEnumeratorClass.class
    structure SocketConnectionClass :
      GIO_SOCKET_CONNECTION_CLASS
        where type 'a i_o_stream_class = 'a IOStreamClass.class
    structure SocketControlMessage :
      GIO_SOCKET_CONTROL_MESSAGE
        where type 'a class = 'a SocketControlMessageClass.class
    structure SocketServiceClass :
      GIO_SOCKET_SERVICE_CLASS
        where type 'a socket_listener_class = 'a SocketListenerClass.class
    structure ThemedIcon :
      GIO_THEMED_ICON
        where type 'a class = 'a ThemedIconClass.class
        where type 'a icon_class = 'a IconClass.class
    structure TlsBackend :
      GIO_TLS_BACKEND
        where type 'a class = 'a TlsBackendClass.class
        where type 'a tls_database_class = 'a TlsDatabaseClass.class
    structure TlsCertificate :
      GIO_TLS_CERTIFICATE
        where type 'a class = 'a TlsCertificateClass.class
        where type tls_certificate_flags_t = TlsCertificateFlags.t
        where type 'a socket_connectable_class = 'a SocketConnectableClass.class
    structure TlsClientConnection :
      GIO_TLS_CLIENT_CONNECTION
        where type 'a class = 'a TlsClientConnectionClass.class
        where type 'a i_o_stream_class = 'a IOStreamClass.class
        where type 'a socket_connectable_class = 'a SocketConnectableClass.class
        where type tls_certificate_flags_t = TlsCertificateFlags.t
    structure TlsConnectionClass :
      GIO_TLS_CONNECTION_CLASS
        where type 'a i_o_stream_class = 'a IOStreamClass.class
    structure TlsDatabase :
      GIO_TLS_DATABASE
        where type 'a class = 'a TlsDatabaseClass.class
        where type tls_database_lookup_flags_t = TlsDatabaseLookupFlags.t
        where type 'a cancellable_class = 'a CancellableClass.class
        where type tls_database_verify_flags_t = TlsDatabaseVerifyFlags.t
        where type 'a tls_interaction_class = 'a TlsInteractionClass.class
        where type 'a socket_connectable_class = 'a SocketConnectableClass.class
        where type 'a tls_certificate_class = 'a TlsCertificateClass.class
        where type tls_certificate_flags_t = TlsCertificateFlags.t
        where type 'a async_result_class = 'a AsyncResultClass.class
    structure TlsFileDatabase :
      GIO_TLS_FILE_DATABASE
        where type 'a class = 'a TlsFileDatabaseClass.class
        where type 'a tls_database_class = 'a TlsDatabaseClass.class
    structure TlsInteraction :
      GIO_TLS_INTERACTION
        where type 'a class = 'a TlsInteractionClass.class
        where type 'a async_result_class = 'a AsyncResultClass.class
        where type tls_interaction_result_t = TlsInteractionResult.t
        where type 'a cancellable_class = 'a CancellableClass.class
        where type 'a tls_password_class = 'a TlsPasswordClass.class
    structure TlsPassword :
      GIO_TLS_PASSWORD
        where type 'a class = 'a TlsPasswordClass.class
        where type tls_password_flags_t = TlsPasswordFlags.t
    structure TlsServerConnection :
      GIO_TLS_SERVER_CONNECTION
        where type 'a class = 'a TlsServerConnectionClass.class
        where type 'a tls_certificate_class = 'a TlsCertificateClass.class
        where type 'a i_o_stream_class = 'a IOStreamClass.class
        where type tls_authentication_mode_t = TlsAuthenticationMode.t
    structure UnixCredentialsMessageClass :
      GIO_UNIX_CREDENTIALS_MESSAGE_CLASS
        where type 'a socket_control_message_class = 'a SocketControlMessageClass.class
    structure UnixFDList :
      GIO_UNIX_F_D_LIST
        where type 'a class = 'a UnixFDListClass.class
    structure UnixFDMessageClass :
      GIO_UNIX_F_D_MESSAGE_CLASS
        where type 'a socket_control_message_class = 'a SocketControlMessageClass.class
    structure UnixInputStreamClass :
      GIO_UNIX_INPUT_STREAM_CLASS
        where type 'a input_stream_class = 'a InputStreamClass.class
    structure UnixMountMonitor :
      GIO_UNIX_MOUNT_MONITOR
        where type 'a class = 'a UnixMountMonitorClass.class
    structure UnixOutputStreamClass :
      GIO_UNIX_OUTPUT_STREAM_CLASS
        where type 'a output_stream_class = 'a OutputStreamClass.class
    structure UnixSocketAddressClass :
      GIO_UNIX_SOCKET_ADDRESS_CLASS
        where type 'a socket_address_class = 'a SocketAddressClass.class
    structure Vfs :
      GIO_VFS
        where type 'a class = 'a VfsClass.class
        where type 'a file_class = 'a FileClass.class
    structure Volume :
      GIO_VOLUME
        where type 'a class = 'a VolumeClass.class
        where type 'a file_class = 'a FileClass.class
        where type 'a drive_class = 'a DriveClass.class
        where type 'a icon_class = 'a IconClass.class
        where type 'a mount_class = 'a MountClass.class
        where type 'a async_result_class = 'a AsyncResultClass.class
    structure VolumeMonitor :
      GIO_VOLUME_MONITOR
        where type 'a class = 'a VolumeMonitorClass.class
        where type 'a drive_class = 'a DriveClass.class
        where type 'a mount_class = 'a MountClass.class
        where type 'a volume_class = 'a VolumeClass.class
    structure ZlibCompressor :
      GIO_ZLIB_COMPRESSOR
        where type 'a class = 'a ZlibCompressorClass.class
        where type 'a converter_class = 'a ConverterClass.class
        where type 'a file_info_class = 'a FileInfoClass.class
        where type zlib_compressor_format_t = ZlibCompressorFormat.t
    structure ZlibDecompressor :
      GIO_ZLIB_DECOMPRESSOR
        where type 'a class = 'a ZlibDecompressorClass.class
        where type 'a converter_class = 'a ConverterClass.class
        where type 'a file_info_class = 'a FileInfoClass.class
        where type zlib_compressor_format_t = ZlibCompressorFormat.t
    structure BufferedInputStreamClass :
      GIO_BUFFERED_INPUT_STREAM_CLASS
        where type 'a filter_input_stream_class = 'a FilterInputStreamClass.class
    structure BufferedOutputStreamClass :
      GIO_BUFFERED_OUTPUT_STREAM_CLASS
        where type 'a filter_output_stream_class = 'a FilterOutputStreamClass.class
    structure ConverterInputStreamClass :
      GIO_CONVERTER_INPUT_STREAM_CLASS
        where type 'a filter_input_stream_class = 'a FilterInputStreamClass.class
    structure ConverterOutputStreamClass :
      GIO_CONVERTER_OUTPUT_STREAM_CLASS
        where type 'a filter_output_stream_class = 'a FilterOutputStreamClass.class
    structure DataOutputStreamClass :
      GIO_DATA_OUTPUT_STREAM_CLASS
        where type 'a filter_output_stream_class = 'a FilterOutputStreamClass.class
    structure FileIOStream :
      GIO_FILE_I_O_STREAM
        where type 'a class = 'a FileIOStreamClass.class
        where type 'a seekable_class = 'a SeekableClass.class
        where type 'a cancellable_class = 'a CancellableClass.class
        where type 'a file_info_class = 'a FileInfoClass.class
        where type 'a async_result_class = 'a AsyncResultClass.class
    structure FileInputStream :
      GIO_FILE_INPUT_STREAM
        where type 'a class = 'a FileInputStreamClass.class
        where type 'a seekable_class = 'a SeekableClass.class
        where type 'a cancellable_class = 'a CancellableClass.class
        where type 'a file_info_class = 'a FileInfoClass.class
        where type 'a async_result_class = 'a AsyncResultClass.class
    structure FileOutputStream :
      GIO_FILE_OUTPUT_STREAM
        where type 'a class = 'a FileOutputStreamClass.class
        where type 'a seekable_class = 'a SeekableClass.class
        where type 'a cancellable_class = 'a CancellableClass.class
        where type 'a file_info_class = 'a FileInfoClass.class
        where type 'a async_result_class = 'a AsyncResultClass.class
    structure FilterInputStream :
      GIO_FILTER_INPUT_STREAM
        where type 'a class = 'a FilterInputStreamClass.class
        where type 'a input_stream_class = 'a InputStreamClass.class
    structure FilterOutputStream :
      GIO_FILTER_OUTPUT_STREAM
        where type 'a class = 'a FilterOutputStreamClass.class
        where type 'a output_stream_class = 'a OutputStreamClass.class
    structure InetSocketAddress :
      GIO_INET_SOCKET_ADDRESS
        where type 'a class = 'a InetSocketAddressClass.class
        where type 'a socket_connectable_class = 'a SocketConnectableClass.class
        where type 'a inet_address_class = 'a InetAddressClass.class
    structure MemoryInputStream :
      GIO_MEMORY_INPUT_STREAM
        where type 'a class = 'a MemoryInputStreamClass.class
        where type 'a seekable_class = 'a SeekableClass.class
    structure MemoryOutputStream :
      GIO_MEMORY_OUTPUT_STREAM
        where type 'a class = 'a MemoryOutputStreamClass.class
        where type 'a seekable_class = 'a SeekableClass.class
    structure NativeVolumeMonitor :
      GIO_NATIVE_VOLUME_MONITOR
        where type 'a class = 'a NativeVolumeMonitorClass.class
    structure ProxyAddressClass :
      GIO_PROXY_ADDRESS_CLASS
        where type 'a inet_socket_address_class = 'a InetSocketAddressClass.class
    structure ProxyAddressEnumerator :
      GIO_PROXY_ADDRESS_ENUMERATOR
        where type 'a class = 'a ProxyAddressEnumeratorClass.class
        where type 'a socket_connectable_class = 'a SocketConnectableClass.class
    structure SimplePermission :
      GIO_SIMPLE_PERMISSION
        where type 'a class = 'a SimplePermissionClass.class
    structure Socket :
      GIO_SOCKET
        where type 'a class = 'a SocketClass.class
        where type 'a initable_class = 'a InitableClass.class
        where type 'a socket_connection_class = 'a SocketConnectionClass.class
        where type 'a credentials_class = 'a CredentialsClass.class
        where type 'a cancellable_class = 'a CancellableClass.class
        where type socket_family_t = SocketFamily.t
        where type socket_protocol_t = SocketProtocol.t
        where type 'a socket_address_class = 'a SocketAddressClass.class
        where type socket_type_t = SocketType.t
    structure SocketClient :
      GIO_SOCKET_CLIENT
        where type 'a class = 'a SocketClientClass.class
        where type 'a socket_connectable_class = 'a SocketConnectableClass.class
        where type 'a cancellable_class = 'a CancellableClass.class
        where type 'a socket_connection_class = 'a SocketConnectionClass.class
        where type 'a async_result_class = 'a AsyncResultClass.class
        where type socket_family_t = SocketFamily.t
        where type 'a socket_address_class = 'a SocketAddressClass.class
        where type socket_protocol_t = SocketProtocol.t
        where type tls_certificate_flags_t = TlsCertificateFlags.t
        where type socket_type_t = SocketType.t
    structure SocketConnection :
      GIO_SOCKET_CONNECTION
        where type 'a class = 'a SocketConnectionClass.class
        where type 'a socket_address_class = 'a SocketAddressClass.class
        where type 'a socket_class = 'a SocketClass.class
    structure SocketListener :
      GIO_SOCKET_LISTENER
        where type 'a class = 'a SocketListenerClass.class
        where type 'a socket_connection_class = 'a SocketConnectionClass.class
        where type 'a cancellable_class = 'a CancellableClass.class
        where type 'a async_result_class = 'a AsyncResultClass.class
        where type socket_protocol_t = SocketProtocol.t
        where type socket_type_t = SocketType.t
        where type 'a socket_address_class = 'a SocketAddressClass.class
        where type 'a socket_class = 'a SocketClass.class
    structure SocketService :
      GIO_SOCKET_SERVICE
        where type 'a class = 'a SocketServiceClass.class
        where type 'a socket_connection_class = 'a SocketConnectionClass.class
    structure TcpConnectionClass :
      GIO_TCP_CONNECTION_CLASS
        where type 'a socket_connection_class = 'a SocketConnectionClass.class
    structure ThreadedSocketServiceClass :
      GIO_THREADED_SOCKET_SERVICE_CLASS
        where type 'a socket_service_class = 'a SocketServiceClass.class
    structure TlsConnection :
      GIO_TLS_CONNECTION
        where type 'a class = 'a TlsConnectionClass.class
        where type 'a cancellable_class = 'a CancellableClass.class
        where type 'a async_result_class = 'a AsyncResultClass.class
        where type 'a i_o_stream_class = 'a IOStreamClass.class
        where type 'a tls_database_class = 'a TlsDatabaseClass.class
        where type 'a tls_interaction_class = 'a TlsInteractionClass.class
        where type 'a tls_certificate_class = 'a TlsCertificateClass.class
        where type tls_certificate_flags_t = TlsCertificateFlags.t
        where type tls_rehandshake_mode_t = TlsRehandshakeMode.t
    structure UnixConnectionClass :
      GIO_UNIX_CONNECTION_CLASS
        where type 'a socket_connection_class = 'a SocketConnectionClass.class
    structure UnixCredentialsMessage :
      GIO_UNIX_CREDENTIALS_MESSAGE
        where type 'a class = 'a UnixCredentialsMessageClass.class
        where type 'a credentials_class = 'a CredentialsClass.class
    structure UnixFDMessage :
      GIO_UNIX_F_D_MESSAGE
        where type 'a class = 'a UnixFDMessageClass.class
        where type 'a unix_f_d_list_class = 'a UnixFDListClass.class
    structure UnixInputStream :
      GIO_UNIX_INPUT_STREAM
        where type 'a class = 'a UnixInputStreamClass.class
        where type 'a pollable_input_stream_class = 'a PollableInputStreamClass.class
    structure UnixOutputStream :
      GIO_UNIX_OUTPUT_STREAM
        where type 'a class = 'a UnixOutputStreamClass.class
        where type 'a pollable_output_stream_class = 'a PollableOutputStreamClass.class
    structure UnixSocketAddress :
      GIO_UNIX_SOCKET_ADDRESS
        where type 'a class = 'a UnixSocketAddressClass.class
        where type 'a socket_connectable_class = 'a SocketConnectableClass.class
        where type unix_socket_address_type_t = UnixSocketAddressType.t
    structure BufferedInputStream :
      GIO_BUFFERED_INPUT_STREAM
        where type 'a class = 'a BufferedInputStreamClass.class
        where type 'a input_stream_class = 'a InputStreamClass.class
        where type 'a async_result_class = 'a AsyncResultClass.class
        where type 'a cancellable_class = 'a CancellableClass.class
    structure BufferedOutputStream :
      GIO_BUFFERED_OUTPUT_STREAM
        where type 'a class = 'a BufferedOutputStreamClass.class
        where type 'a output_stream_class = 'a OutputStreamClass.class
    structure ConverterInputStream :
      GIO_CONVERTER_INPUT_STREAM
        where type 'a class = 'a ConverterInputStreamClass.class
        where type 'a input_stream_class = 'a InputStreamClass.class
        where type 'a converter_class = 'a ConverterClass.class
    structure ConverterOutputStream :
      GIO_CONVERTER_OUTPUT_STREAM
        where type 'a class = 'a ConverterOutputStreamClass.class
        where type 'a output_stream_class = 'a OutputStreamClass.class
        where type 'a converter_class = 'a ConverterClass.class
    structure DataInputStreamClass :
      GIO_DATA_INPUT_STREAM_CLASS
        where type 'a buffered_input_stream_class = 'a BufferedInputStreamClass.class
    structure DataOutputStream :
      GIO_DATA_OUTPUT_STREAM
        where type 'a class = 'a DataOutputStreamClass.class
        where type 'a output_stream_class = 'a OutputStreamClass.class
        where type 'a cancellable_class = 'a CancellableClass.class
        where type data_stream_byte_order_t = DataStreamByteOrder.t
    structure Proxy :
      GIO_PROXY
        where type 'a class = 'a ProxyClass.class
        where type 'a cancellable_class = 'a CancellableClass.class
        where type 'a proxy_address_class = 'a ProxyAddressClass.class
        where type 'a i_o_stream_class = 'a IOStreamClass.class
        where type 'a async_result_class = 'a AsyncResultClass.class
    structure ProxyAddress :
      GIO_PROXY_ADDRESS
        where type 'a class = 'a ProxyAddressClass.class
        where type 'a socket_connectable_class = 'a SocketConnectableClass.class
        where type 'a inet_address_class = 'a InetAddressClass.class
    structure TcpConnection :
      GIO_TCP_CONNECTION
        where type 'a class = 'a TcpConnectionClass.class
    structure TcpWrapperConnectionClass :
      GIO_TCP_WRAPPER_CONNECTION_CLASS
        where type 'a tcp_connection_class = 'a TcpConnectionClass.class
    structure ThreadedSocketService :
      GIO_THREADED_SOCKET_SERVICE
        where type 'a class = 'a ThreadedSocketServiceClass.class
        where type 'a socket_connection_class = 'a SocketConnectionClass.class
    structure UnixConnection :
      GIO_UNIX_CONNECTION
        where type 'a class = 'a UnixConnectionClass.class
        where type 'a credentials_class = 'a CredentialsClass.class
        where type 'a cancellable_class = 'a CancellableClass.class
    structure DataInputStream :
      GIO_DATA_INPUT_STREAM
        where type 'a class = 'a DataInputStreamClass.class
        where type 'a input_stream_class = 'a InputStreamClass.class
        where type 'a cancellable_class = 'a CancellableClass.class
        where type 'a async_result_class = 'a AsyncResultClass.class
        where type data_stream_byte_order_t = DataStreamByteOrder.t
        where type data_stream_newline_type_t = DataStreamNewlineType.t
    structure TcpWrapperConnection :
      GIO_TCP_WRAPPER_CONNECTION
        where type 'a class = 'a TcpWrapperConnectionClass.class
        where type 'a socket_class = 'a SocketClass.class
        where type 'a i_o_stream_class = 'a IOStreamClass.class
    val DESKTOP_APP_INFO_LOOKUP_EXTENSION_POINT_NAME : string
    val FILE_ATTRIBUTE_ACCESS_CAN_DELETE : string
    val FILE_ATTRIBUTE_ACCESS_CAN_EXECUTE : string
    val FILE_ATTRIBUTE_ACCESS_CAN_READ : string
    val FILE_ATTRIBUTE_ACCESS_CAN_RENAME : string
    val FILE_ATTRIBUTE_ACCESS_CAN_TRASH : string
    val FILE_ATTRIBUTE_ACCESS_CAN_WRITE : string
    val FILE_ATTRIBUTE_DOS_IS_ARCHIVE : string
    val FILE_ATTRIBUTE_DOS_IS_SYSTEM : string
    val FILE_ATTRIBUTE_ETAG_VALUE : string
    val FILE_ATTRIBUTE_FILESYSTEM_FREE : string
    val FILE_ATTRIBUTE_FILESYSTEM_READONLY : string
    val FILE_ATTRIBUTE_FILESYSTEM_SIZE : string
    val FILE_ATTRIBUTE_FILESYSTEM_TYPE : string
    val FILE_ATTRIBUTE_FILESYSTEM_USE_PREVIEW : string
    val FILE_ATTRIBUTE_GVFS_BACKEND : string
    val FILE_ATTRIBUTE_ID_FILE : string
    val FILE_ATTRIBUTE_ID_FILESYSTEM : string
    val FILE_ATTRIBUTE_MOUNTABLE_CAN_EJECT : string
    val FILE_ATTRIBUTE_MOUNTABLE_CAN_MOUNT : string
    val FILE_ATTRIBUTE_MOUNTABLE_CAN_POLL : string
    val FILE_ATTRIBUTE_MOUNTABLE_CAN_START : string
    val FILE_ATTRIBUTE_MOUNTABLE_CAN_START_DEGRADED : string
    val FILE_ATTRIBUTE_MOUNTABLE_CAN_STOP : string
    val FILE_ATTRIBUTE_MOUNTABLE_CAN_UNMOUNT : string
    val FILE_ATTRIBUTE_MOUNTABLE_HAL_UDI : string
    val FILE_ATTRIBUTE_MOUNTABLE_IS_MEDIA_CHECK_AUTOMATIC : string
    val FILE_ATTRIBUTE_MOUNTABLE_START_STOP_TYPE : string
    val FILE_ATTRIBUTE_MOUNTABLE_UNIX_DEVICE : string
    val FILE_ATTRIBUTE_MOUNTABLE_UNIX_DEVICE_FILE : string
    val FILE_ATTRIBUTE_OWNER_GROUP : string
    val FILE_ATTRIBUTE_OWNER_USER : string
    val FILE_ATTRIBUTE_OWNER_USER_REAL : string
    val FILE_ATTRIBUTE_PREVIEW_ICON : string
    val FILE_ATTRIBUTE_SELINUX_CONTEXT : string
    val FILE_ATTRIBUTE_STANDARD_ALLOCATED_SIZE : string
    val FILE_ATTRIBUTE_STANDARD_CONTENT_TYPE : string
    val FILE_ATTRIBUTE_STANDARD_COPY_NAME : string
    val FILE_ATTRIBUTE_STANDARD_DESCRIPTION : string
    val FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME : string
    val FILE_ATTRIBUTE_STANDARD_EDIT_NAME : string
    val FILE_ATTRIBUTE_STANDARD_FAST_CONTENT_TYPE : string
    val FILE_ATTRIBUTE_STANDARD_ICON : string
    val FILE_ATTRIBUTE_STANDARD_IS_BACKUP : string
    val FILE_ATTRIBUTE_STANDARD_IS_HIDDEN : string
    val FILE_ATTRIBUTE_STANDARD_IS_SYMLINK : string
    val FILE_ATTRIBUTE_STANDARD_IS_VIRTUAL : string
    val FILE_ATTRIBUTE_STANDARD_NAME : string
    val FILE_ATTRIBUTE_STANDARD_SIZE : string
    val FILE_ATTRIBUTE_STANDARD_SORT_ORDER : string
    val FILE_ATTRIBUTE_STANDARD_SYMLINK_TARGET : string
    val FILE_ATTRIBUTE_STANDARD_TARGET_URI : string
    val FILE_ATTRIBUTE_STANDARD_TYPE : string
    val FILE_ATTRIBUTE_THUMBNAILING_FAILED : string
    val FILE_ATTRIBUTE_THUMBNAIL_PATH : string
    val FILE_ATTRIBUTE_TIME_ACCESS : string
    val FILE_ATTRIBUTE_TIME_ACCESS_USEC : string
    val FILE_ATTRIBUTE_TIME_CHANGED : string
    val FILE_ATTRIBUTE_TIME_CHANGED_USEC : string
    val FILE_ATTRIBUTE_TIME_CREATED : string
    val FILE_ATTRIBUTE_TIME_CREATED_USEC : string
    val FILE_ATTRIBUTE_TIME_MODIFIED : string
    val FILE_ATTRIBUTE_TIME_MODIFIED_USEC : string
    val FILE_ATTRIBUTE_TRASH_DELETION_DATE : string
    val FILE_ATTRIBUTE_TRASH_ITEM_COUNT : string
    val FILE_ATTRIBUTE_TRASH_ORIG_PATH : string
    val FILE_ATTRIBUTE_UNIX_BLOCKS : string
    val FILE_ATTRIBUTE_UNIX_BLOCK_SIZE : string
    val FILE_ATTRIBUTE_UNIX_DEVICE : string
    val FILE_ATTRIBUTE_UNIX_GID : string
    val FILE_ATTRIBUTE_UNIX_INODE : string
    val FILE_ATTRIBUTE_UNIX_IS_MOUNTPOINT : string
    val FILE_ATTRIBUTE_UNIX_MODE : string
    val FILE_ATTRIBUTE_UNIX_NLINK : string
    val FILE_ATTRIBUTE_UNIX_RDEV : string
    val FILE_ATTRIBUTE_UNIX_UID : string
    val NATIVE_VOLUME_MONITOR_EXTENSION_POINT_NAME : string
    val PROXY_EXTENSION_POINT_NAME : string
    val PROXY_RESOLVER_EXTENSION_POINT_NAME : string
    val TLS_BACKEND_EXTENSION_POINT_NAME : string
    val TLS_DATABASE_PURPOSE_AUTHENTICATE_CLIENT : string
    val TLS_DATABASE_PURPOSE_AUTHENTICATE_SERVER : string
    val VFS_EXTENSION_POINT_NAME : string
    val VOLUME_IDENTIFIER_KIND_HAL_UDI : string
    val VOLUME_IDENTIFIER_KIND_LABEL : string
    val VOLUME_IDENTIFIER_KIND_NFS_MOUNT : string
    val VOLUME_IDENTIFIER_KIND_UNIX_DEVICE : string
    val VOLUME_IDENTIFIER_KIND_UUID : string
    val VOLUME_MONITOR_EXTENSION_POINT_NAME : string
    val appInfoCreateFromCommandline :
      string
       -> string option
       -> AppInfoCreateFlags.t
       -> base AppInfoClass.class
    val appInfoGetDefaultForType :
      string
       -> bool
       -> base AppInfoClass.class
    val appInfoGetDefaultForUriScheme : string -> base AppInfoClass.class
    val appInfoLaunchDefaultForUri :
      string
       -> 'a AppLaunchContextClass.class option
       -> bool
    val appInfoResetTypeAssociations : string -> unit
    val busGetFinish : 'a AsyncResultClass.class -> base DBusConnectionClass.class
    val busGetSync :
      BusType.t
       -> 'a CancellableClass.class option
       -> base DBusConnectionClass.class
    val busOwnNameOnConnection :
      'a DBusConnectionClass.class
       -> string
       -> BusNameOwnerFlags.t
       -> GObject.ClosureRecord.t option
       -> GObject.ClosureRecord.t option
       -> LargeInt.int
    val busOwnName :
      BusType.t
       -> string
       -> BusNameOwnerFlags.t
       -> GObject.ClosureRecord.t option
       -> GObject.ClosureRecord.t option
       -> GObject.ClosureRecord.t option
       -> LargeInt.int
    val busUnownName : LargeInt.int -> unit
    val busUnwatchName : LargeInt.int -> unit
    val busWatchNameOnConnection :
      'a DBusConnectionClass.class
       -> string
       -> BusNameWatcherFlags.t
       -> GObject.ClosureRecord.t option
       -> GObject.ClosureRecord.t option
       -> LargeInt.int
    val busWatchName :
      BusType.t
       -> string
       -> BusNameWatcherFlags.t
       -> GObject.ClosureRecord.t option
       -> GObject.ClosureRecord.t option
       -> LargeInt.int
    val contentTypeCanBeExecutable : string -> bool
    val contentTypeEquals :
      string
       -> string
       -> bool
    val contentTypeFromMimeType : string -> string
    val contentTypeGetDescription : string -> string
    val contentTypeGetIcon : string -> base IconClass.class
    val contentTypeGetMimeType : string -> string
    val contentTypeGuess :
      string option
       -> Word8Vector.vector option
       -> string * bool
    val contentTypeGuessForTree : 'a FileClass.class -> string list
    val contentTypeIsA :
      string
       -> string
       -> bool
    val contentTypeIsUnknown : string -> bool
    val dbusAddressGetForBusSync :
      BusType.t
       -> 'a CancellableClass.class option
       -> string
    val dbusAddressGetStreamFinish :
      'a AsyncResultClass.class
       -> string
       -> base IOStreamClass.class
    val dbusAddressGetStreamSync :
      string
       -> string
       -> 'a CancellableClass.class option
       -> base IOStreamClass.class
    val dbusAnnotationInfoLookup :
      DBusAnnotationInfoRecord.t
       -> string
       -> string
    val dbusErrorQuark : unit -> LargeInt.int
    val dbusGenerateGuid : unit -> string
    val dbusGvalueToGvariant :
      GObject.ValueRecord.t
       -> GLib.VariantTypeRecord.t
       -> GLib.VariantRecord.t
    val dbusGvariantToGvalue :
      GLib.VariantRecord.t
       -> GObject.ValueRecord.t
       -> unit
    val dbusIsAddress : string -> bool
    val dbusIsGuid : string -> bool
    val dbusIsInterfaceName : string -> bool
    val dbusIsMemberName : string -> bool
    val dbusIsName : string -> bool
    val dbusIsSupportedAddress : string -> bool
    val dbusIsUniqueName : string -> bool
    val fileNewForCommandlineArg : string -> base FileClass.class
    val fileNewForPath : string -> base FileClass.class
    val fileNewForUri : string -> base FileClass.class
    val fileParseName : string -> base FileClass.class
    val iconNewForString : string -> base IconClass.class
    val ioErrorFromErrno : LargeInt.int -> IOErrorEnum.t
    val ioErrorQuark : unit -> LargeInt.int
    val ioExtensionPointLookup : string -> IOExtensionPointRecord.t
    val ioExtensionPointRegister : string -> IOExtensionPointRecord.t
    val ioModulesScanAllInDirectory : string -> unit
    val ioModulesScanAllInDirectoryWithScope :
      string
       -> IOModuleScopeRecord.t
       -> unit
    val ioSchedulerCancelAllJobs : unit -> unit
    val proxyGetDefaultForProtocol : string -> base ProxyClass.class
    val proxyResolverGetDefault : unit -> base ProxyResolverClass.class
    val resolverErrorQuark : unit -> LargeInt.int
    val tlsBackendGetDefault : unit -> base TlsBackendClass.class
    val tlsClientConnectionNew :
      'a IOStreamClass.class
       -> 'b SocketConnectableClass.class option
       -> base IOStreamClass.class
    val tlsErrorQuark : unit -> LargeInt.int
    val tlsFileDatabaseNew : string -> base TlsDatabaseClass.class
    val tlsServerConnectionNew :
      'a IOStreamClass.class
       -> 'b TlsCertificateClass.class option
       -> base IOStreamClass.class
    val unixIsMountPathSystemInternal : string -> bool
    val unixMountCompare :
      UnixMountEntryRecord.t
       -> UnixMountEntryRecord.t
       -> LargeInt.int
    val unixMountFree : UnixMountEntryRecord.t -> unit
    val unixMountGetDevicePath : UnixMountEntryRecord.t -> string
    val unixMountGetFsType : UnixMountEntryRecord.t -> string
    val unixMountGetMountPath : UnixMountEntryRecord.t -> string
    val unixMountGuessCanEject : UnixMountEntryRecord.t -> bool
    val unixMountGuessIcon : UnixMountEntryRecord.t -> base IconClass.class
    val unixMountGuessName : UnixMountEntryRecord.t -> string
    val unixMountGuessShouldDisplay : UnixMountEntryRecord.t -> bool
    val unixMountIsReadonly : UnixMountEntryRecord.t -> bool
    val unixMountIsSystemInternal : UnixMountEntryRecord.t -> bool
    val unixMountPointsChangedSince : LargeInt.int -> bool
    val unixMountsChangedSince : LargeInt.int -> bool
  end
