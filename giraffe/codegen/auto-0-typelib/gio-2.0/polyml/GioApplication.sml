structure GioApplication :>
  GIO_APPLICATION
    where type 'a class = 'a GioApplicationClass.class
    where type 'a action_map_class = 'a GioActionMapClass.class
    where type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a notification_class = 'a GioNotificationClass.class
    where type 'a application_command_line_class = 'a GioApplicationCommandLineClass.class
    where type file_class_c_ptr_array_n_t = GioFileClassCPtrArrayN.t
    where type 'a action_group_class = 'a GioActionGroupClass.class
    where type application_flags_t = GioApplicationFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_application_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_application_new") (Utf8.PolyML.cInOptPtr &&> GioApplicationFlags.PolyML.cVal --> GioApplicationClass.PolyML.cPtr)
      val getDefault_ = call (getSymbol "g_application_get_default") (cVoid --> GioApplicationClass.PolyML.cPtr)
      val idIsValid_ = call (getSymbol "g_application_id_is_valid") (Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val activate_ = call (getSymbol "g_application_activate") (GioApplicationClass.PolyML.cPtr --> cVoid)
      val addMainOption_ =
        call (getSymbol "g_application_add_main_option")
          (
            GioApplicationClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt8.PolyML.cVal
             &&> GLibOptionFlags.PolyML.cVal
             &&> GLibOptionArg.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             --> cVoid
          )
      val addOptionGroup_ = call (getSymbol "g_application_add_option_group") (GioApplicationClass.PolyML.cPtr &&> GLibOptionGroupRecord.PolyML.cPtr --> cVoid)
      val bindBusyProperty_ =
        call (getSymbol "g_application_bind_busy_property")
          (
            GioApplicationClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val getApplicationId_ = call (getSymbol "g_application_get_application_id") (GioApplicationClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getDbusConnection_ = call (getSymbol "g_application_get_dbus_connection") (GioApplicationClass.PolyML.cPtr --> GioDBusConnectionClass.PolyML.cPtr)
      val getDbusObjectPath_ = call (getSymbol "g_application_get_dbus_object_path") (GioApplicationClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getFlags_ = call (getSymbol "g_application_get_flags") (GioApplicationClass.PolyML.cPtr --> GioApplicationFlags.PolyML.cVal)
      val getInactivityTimeout_ = call (getSymbol "g_application_get_inactivity_timeout") (GioApplicationClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getIsBusy_ = call (getSymbol "g_application_get_is_busy") (GioApplicationClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getIsRegistered_ = call (getSymbol "g_application_get_is_registered") (GioApplicationClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getIsRemote_ = call (getSymbol "g_application_get_is_remote") (GioApplicationClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getResourceBasePath_ = call (getSymbol "g_application_get_resource_base_path") (GioApplicationClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val hold_ = call (getSymbol "g_application_hold") (GioApplicationClass.PolyML.cPtr --> cVoid)
      val markBusy_ = call (getSymbol "g_application_mark_busy") (GioApplicationClass.PolyML.cPtr --> cVoid)
      val open_ =
        call (getSymbol "g_application_open")
          (
            GioApplicationClass.PolyML.cPtr
             &&> GioFileClassCPtrArrayN.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val quit_ = call (getSymbol "g_application_quit") (GioApplicationClass.PolyML.cPtr --> cVoid)
      val register_ =
        call (getSymbol "g_application_register")
          (
            GioApplicationClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val release_ = call (getSymbol "g_application_release") (GioApplicationClass.PolyML.cPtr --> cVoid)
      val run_ =
        call (getSymbol "g_application_run")
          (
            GioApplicationClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> Utf8CPtrArrayN.PolyML.cInOptPtr
             --> GInt32.PolyML.cVal
          )
      val sendNotification_ =
        call (getSymbol "g_application_send_notification")
          (
            GioApplicationClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GioNotificationClass.PolyML.cPtr
             --> cVoid
          )
      val setActionGroup_ = call (getSymbol "g_application_set_action_group") (GioApplicationClass.PolyML.cPtr &&> GioActionGroupClass.PolyML.cOptPtr --> cVoid)
      val setApplicationId_ = call (getSymbol "g_application_set_application_id") (GioApplicationClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setDefault_ = call (getSymbol "g_application_set_default") (GioApplicationClass.PolyML.cPtr --> cVoid)
      val setFlags_ = call (getSymbol "g_application_set_flags") (GioApplicationClass.PolyML.cPtr &&> GioApplicationFlags.PolyML.cVal --> cVoid)
      val setInactivityTimeout_ = call (getSymbol "g_application_set_inactivity_timeout") (GioApplicationClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val setResourceBasePath_ = call (getSymbol "g_application_set_resource_base_path") (GioApplicationClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val unbindBusyProperty_ =
        call (getSymbol "g_application_unbind_busy_property")
          (
            GioApplicationClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val unmarkBusy_ = call (getSymbol "g_application_unmark_busy") (GioApplicationClass.PolyML.cPtr --> cVoid)
      val withdrawNotification_ = call (getSymbol "g_application_withdraw_notification") (GioApplicationClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
    end
    type 'a class = 'a GioApplicationClass.class
    type 'a action_map_class = 'a GioActionMapClass.class
    type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a notification_class = 'a GioNotificationClass.class
    type 'a application_command_line_class = 'a GioApplicationCommandLineClass.class
    type file_class_c_ptr_array_n_t = GioFileClassCPtrArrayN.t
    type 'a action_group_class = 'a GioActionGroupClass.class
    type application_flags_t = GioApplicationFlags.t
    type t = base class
    fun asActionGroup self = (GObjectObjectClass.FFI.withPtr false ---> GioActionGroupClass.FFI.fromPtr false) I self
    fun asActionMap self = (GObjectObjectClass.FFI.withPtr false ---> GioActionMapClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (applicationId, flags) = (Utf8.FFI.withOptPtr 0 &&&> GioApplicationFlags.FFI.withVal ---> GioApplicationClass.FFI.fromPtr true) new_ (applicationId & flags)
    fun getDefault () = (I ---> GioApplicationClass.FFI.fromPtr false) getDefault_ ()
    fun idIsValid applicationId = (Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) idIsValid_ applicationId
    fun activate self = (GioApplicationClass.FFI.withPtr false ---> I) activate_ self
    fun addMainOption
      self
      (
        longName,
        shortName,
        flags,
        arg,
        description,
        argDescription
      ) =
      (
        GioApplicationClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt8.FFI.withVal
         &&&> GLibOptionFlags.FFI.withVal
         &&&> GLibOptionArg.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withOptPtr 0
         ---> I
      )
        addMainOption_
        (
          self
           & longName
           & shortName
           & flags
           & arg
           & description
           & argDescription
        )
    fun addOptionGroup self group = (GioApplicationClass.FFI.withPtr false &&&> GLibOptionGroupRecord.FFI.withPtr true ---> I) addOptionGroup_ (self & group)
    fun bindBusyProperty self (object, property) =
      (
        GioApplicationClass.FFI.withPtr false
         &&&> GObjectObjectClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         ---> I
      )
        bindBusyProperty_
        (
          self
           & object
           & property
        )
    fun getApplicationId self = (GioApplicationClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getApplicationId_ self
    fun getDbusConnection self = (GioApplicationClass.FFI.withPtr false ---> GioDBusConnectionClass.FFI.fromPtr false) getDbusConnection_ self
    fun getDbusObjectPath self = (GioApplicationClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getDbusObjectPath_ self
    fun getFlags self = (GioApplicationClass.FFI.withPtr false ---> GioApplicationFlags.FFI.fromVal) getFlags_ self
    fun getInactivityTimeout self = (GioApplicationClass.FFI.withPtr false ---> GUInt32.FFI.fromVal) getInactivityTimeout_ self
    fun getIsBusy self = (GioApplicationClass.FFI.withPtr false ---> GBool.FFI.fromVal) getIsBusy_ self
    fun getIsRegistered self = (GioApplicationClass.FFI.withPtr false ---> GBool.FFI.fromVal) getIsRegistered_ self
    fun getIsRemote self = (GioApplicationClass.FFI.withPtr false ---> GBool.FFI.fromVal) getIsRemote_ self
    fun getResourceBasePath self = (GioApplicationClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getResourceBasePath_ self
    fun hold self = (GioApplicationClass.FFI.withPtr false ---> I) hold_ self
    fun markBusy self = (GioApplicationClass.FFI.withPtr false ---> I) markBusy_ self
    fun open' self (files, hint) =
      let
        val nFiles = LargeInt.fromInt (GioFileClassCPtrArrayN.length files)
        val () =
          (
            GioApplicationClass.FFI.withPtr false
             &&&> GioFileClassCPtrArrayN.FFI.withPtr 0
             &&&> GInt32.FFI.withVal
             &&&> Utf8.FFI.withPtr 0
             ---> I
          )
            open_
            (
              self
               & files
               & nFiles
               & hint
            )
      in
        ()
      end
    fun quit self = (GioApplicationClass.FFI.withPtr false ---> I) quit_ self
    fun register self cancellable =
      (
        GioApplicationClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        register_
        (
          self
           & cancellable
           & []
        )
    fun release self = (GioApplicationClass.FFI.withPtr false ---> I) release_ self
    fun run self argv =
      let
        val argc =
          case argv of
            SOME argv => LargeInt.fromInt (Utf8CPtrArrayN.length argv)
          | NONE => GInt32.null
        val retVal =
          (
            GioApplicationClass.FFI.withPtr false
             &&&> GInt32.FFI.withVal
             &&&> Utf8CPtrArrayN.FFI.withOptPtr 0
             ---> GInt32.FFI.fromVal
          )
            run_
            (
              self
               & argc
               & argv
            )
      in
        retVal
      end
    fun sendNotification self (id, notification) =
      (
        GioApplicationClass.FFI.withPtr false
         &&&> Utf8.FFI.withOptPtr 0
         &&&> GioNotificationClass.FFI.withPtr false
         ---> I
      )
        sendNotification_
        (
          self
           & id
           & notification
        )
    fun setActionGroup self actionGroup = (GioApplicationClass.FFI.withPtr false &&&> GioActionGroupClass.FFI.withOptPtr false ---> I) setActionGroup_ (self & actionGroup)
    fun setApplicationId self applicationId = (GioApplicationClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setApplicationId_ (self & applicationId)
    fun setDefault self = (GioApplicationClass.FFI.withPtr false ---> I) setDefault_ self
    fun setFlags self flags = (GioApplicationClass.FFI.withPtr false &&&> GioApplicationFlags.FFI.withVal ---> I) setFlags_ (self & flags)
    fun setInactivityTimeout self inactivityTimeout = (GioApplicationClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> I) setInactivityTimeout_ (self & inactivityTimeout)
    fun setResourceBasePath self resourcePath = (GioApplicationClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setResourceBasePath_ (self & resourcePath)
    fun unbindBusyProperty self (object, property) =
      (
        GioApplicationClass.FFI.withPtr false
         &&&> GObjectObjectClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         ---> I
      )
        unbindBusyProperty_
        (
          self
           & object
           & property
        )
    fun unmarkBusy self = (GioApplicationClass.FFI.withPtr false ---> I) unmarkBusy_ self
    fun withdrawNotification self id = (GioApplicationClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) withdrawNotification_ (self & id)
    local
      open ClosureMarshal Signal
    in
      fun activateSig f = signal "activate" (void ---> ret_void) f
      fun commandLineSig f = signal "command-line" (get 0w1 GioApplicationCommandLineClass.t ---> ret int) f
      fun handleLocalOptionsSig f = signal "handle-local-options" (get 0w1 GLibVariantDictRecord.t ---> ret int) f
      fun openSig f =
        signal "open"
          (
            get 0w1 GioFileClassCPtrArrayN.t
             &&&> get 0w2 int
             &&&> get 0w3 string
             ---> ret_void
          )
          (
            fn
              files
               & nFiles
               & hint =>
                f (files (LargeInt.toInt nFiles), hint)
          )
      fun shutdownSig f = signal "shutdown" (void ---> ret_void) f
      fun startupSig f = signal "startup" (void ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val actionGroupProp =
        {
          name = "action-group",
          gtype = fn () => C.gtype GioActionGroupClass.tOpt (),
          get = ignore,
          set = fn x => C.set GioActionGroupClass.tOpt x,
          init = fn x => C.set GioActionGroupClass.tOpt x
        }
      val applicationIdProp =
        {
          name = "application-id",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val flagsProp =
        {
          name = "flags",
          gtype = fn () => C.gtype GioApplicationFlags.t (),
          get = fn x => fn () => C.get GioApplicationFlags.t x,
          set = fn x => C.set GioApplicationFlags.t x,
          init = fn x => C.set GioApplicationFlags.t x
        }
      val inactivityTimeoutProp =
        {
          name = "inactivity-timeout",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val isBusyProp =
        {
          name = "is-busy",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = ignore
        }
      val isRegisteredProp =
        {
          name = "is-registered",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = ignore
        }
      val isRemoteProp =
        {
          name = "is-remote",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = ignore
        }
      val resourceBasePathProp =
        {
          name = "resource-base-path",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
    end
  end
