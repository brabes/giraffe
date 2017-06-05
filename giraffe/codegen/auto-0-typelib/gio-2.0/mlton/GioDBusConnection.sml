structure GioDBusConnection :>
  GIO_D_BUS_CONNECTION
    where type 'a class = 'a GioDBusConnectionClass.class
    where type 'a async_initable_class = 'a GioAsyncInitableClass.class
    where type 'a initable_class = 'a GioInitableClass.class
    where type 'a unix_f_d_list_class = 'a GioUnixFDListClass.class
    where type d_bus_call_flags_t = GioDBusCallFlags.t
    where type 'a credentials_class = 'a GioCredentialsClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type d_bus_send_message_flags_t = GioDBusSendMessageFlags.t
    where type 'a d_bus_message_class = 'a GioDBusMessageClass.class
    where type 'a d_bus_auth_observer_class = 'a GioDBusAuthObserverClass.class
    where type d_bus_capability_flags_t = GioDBusCapabilityFlags.t
    where type d_bus_connection_flags_t = GioDBusConnectionFlags.t
    where type 'a i_o_stream_class = 'a GioIOStreamClass.class =
  struct
    val getType_ = _import "g_dbus_connection_get_type" : unit -> GObjectType.FFI.val_;
    val newFinish_ = fn x1 & x2 => (_import "g_dbus_connection_new_finish" : GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p * (unit, unit) GLibErrorRecord.FFI.r -> GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p;) (x1, x2)
    val newForAddressFinish_ = fn x1 & x2 => (_import "g_dbus_connection_new_for_address_finish" : GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p * (unit, unit) GLibErrorRecord.FFI.r -> GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p;) (x1, x2)
    val newForAddressSync_ =
      fn
        (x1, x2)
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_g_dbus_connection_new_for_address_sync" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GioDBusConnectionFlags.FFI.val_
               * unit GioDBusAuthObserverClass.FFI.p
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val newSync_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "mlton_g_dbus_connection_new_sync" :
              GioIOStreamClass.FFI.notnull GioIOStreamClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * GioDBusConnectionFlags.FFI.val_
               * unit GioDBusAuthObserverClass.FFI.p
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val callFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_dbus_connection_call_finish" :
              GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val callSync_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & (x6, x7)
         & (x8, x9)
         & x10
         & x11
         & x12
         & x13
         & x14
         & x15 =>
          (
            _import "mlton_g_dbus_connection_call_sync" :
              GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * unit GLibVariantRecord.FFI.p
               * unit GLibVariantTypeRecord.FFI.p
               * GioDBusCallFlags.FFI.val_
               * GInt32.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9,
              x10,
              x11,
              x12,
              x13,
              x14,
              x15
            )
    val callWithUnixFdListFinish_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_dbus_connection_call_with_unix_fd_list_finish" :
              GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p
               * (unit, GioUnixFDListClass.FFI.notnull) GioUnixFDListClass.FFI.r
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val callWithUnixFdListSync_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & (x6, x7)
         & (x8, x9)
         & x10
         & x11
         & x12
         & x13
         & x14
         & x15
         & x16
         & x17 =>
          (
            _import "mlton_g_dbus_connection_call_with_unix_fd_list_sync" :
              GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * unit GLibVariantRecord.FFI.p
               * unit GLibVariantTypeRecord.FFI.p
               * GioDBusCallFlags.FFI.val_
               * GInt32.FFI.val_
               * unit GioUnixFDListClass.FFI.p
               * (unit, GioUnixFDListClass.FFI.notnull) GioUnixFDListClass.FFI.r
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9,
              x10,
              x11,
              x12,
              x13,
              x14,
              x15,
              x16,
              x17
            )
    val closeFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_dbus_connection_close_finish" :
              GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val closeSync_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_dbus_connection_close_sync" :
              GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val emitSignal_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & (x6, x7)
         & (x8, x9)
         & x10
         & x11 =>
          (
            _import "mlton_g_dbus_connection_emit_signal" :
              GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * unit GLibVariantRecord.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9,
              x10,
              x11
            )
    val flushFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_dbus_connection_flush_finish" :
              GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val flushSync_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_dbus_connection_flush_sync" :
              GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getCapabilities_ = _import "g_dbus_connection_get_capabilities" : GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p -> GioDBusCapabilityFlags.FFI.val_;
    val getExitOnClose_ = _import "g_dbus_connection_get_exit_on_close" : GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p -> GBool.FFI.val_;
    val getGuid_ = _import "g_dbus_connection_get_guid" : GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getPeerCredentials_ = _import "g_dbus_connection_get_peer_credentials" : GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p -> GioCredentialsClass.FFI.notnull GioCredentialsClass.FFI.p;
    val getStream_ = _import "g_dbus_connection_get_stream" : GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p -> GioIOStreamClass.FFI.notnull GioIOStreamClass.FFI.p;
    val getUniqueName_ = _import "g_dbus_connection_get_unique_name" : GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val isClosed_ = _import "g_dbus_connection_is_closed" : GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p -> GBool.FFI.val_;
    val removeFilter_ = fn x1 & x2 => (_import "g_dbus_connection_remove_filter" : GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val sendMessage_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "g_dbus_connection_send_message" :
              GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p
               * GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p
               * GioDBusSendMessageFlags.FFI.val_
               * GUInt32.FFI.ref_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val sendMessageWithReplyFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_dbus_connection_send_message_with_reply_finish" :
              GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val sendMessageWithReplySync_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "g_dbus_connection_send_message_with_reply_sync" :
              GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p
               * GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p
               * GioDBusSendMessageFlags.FFI.val_
               * GInt32.FFI.val_
               * GUInt32.FFI.ref_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val setExitOnClose_ = fn x1 & x2 => (_import "g_dbus_connection_set_exit_on_close" : GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val signalUnsubscribe_ = fn x1 & x2 => (_import "g_dbus_connection_signal_unsubscribe" : GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val startMessageProcessing_ = _import "g_dbus_connection_start_message_processing" : GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p -> unit;
    val unregisterObject_ = fn x1 & x2 => (_import "g_dbus_connection_unregister_object" : GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p * GUInt32.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val unregisterSubtree_ = fn x1 & x2 => (_import "g_dbus_connection_unregister_subtree" : GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p * GUInt32.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    type 'a class = 'a GioDBusConnectionClass.class
    type 'a async_initable_class = 'a GioAsyncInitableClass.class
    type 'a initable_class = 'a GioInitableClass.class
    type 'a unix_f_d_list_class = 'a GioUnixFDListClass.class
    type d_bus_call_flags_t = GioDBusCallFlags.t
    type 'a credentials_class = 'a GioCredentialsClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type d_bus_send_message_flags_t = GioDBusSendMessageFlags.t
    type 'a d_bus_message_class = 'a GioDBusMessageClass.class
    type 'a d_bus_auth_observer_class = 'a GioDBusAuthObserverClass.class
    type d_bus_capability_flags_t = GioDBusCapabilityFlags.t
    type d_bus_connection_flags_t = GioDBusConnectionFlags.t
    type 'a i_o_stream_class = 'a GioIOStreamClass.class
    type t = base class
    fun asAsyncInitable self = (GObjectObjectClass.FFI.withPtr ---> GioAsyncInitableClass.FFI.fromPtr false) I self
    fun asInitable self = (GObjectObjectClass.FFI.withPtr ---> GioInitableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newFinish res = (GioAsyncResultClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GioDBusConnectionClass.FFI.fromPtr true) newFinish_ (res & [])
    fun newForAddressFinish res = (GioAsyncResultClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GioDBusConnectionClass.FFI.fromPtr true) newForAddressFinish_ (res & [])
    fun newForAddressSync address flags observer cancellable =
      (
        Utf8.FFI.withPtr
         &&&> GioDBusConnectionFlags.FFI.withVal
         &&&> GioDBusAuthObserverClass.FFI.withOptPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioDBusConnectionClass.FFI.fromPtr true
      )
        newForAddressSync_
        (
          address
           & flags
           & observer
           & cancellable
           & []
        )
    fun newSync stream guid flags observer cancellable =
      (
        GioIOStreamClass.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GioDBusConnectionFlags.FFI.withVal
         &&&> GioDBusAuthObserverClass.FFI.withOptPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioDBusConnectionClass.FFI.fromPtr true
      )
        newSync_
        (
          stream
           & guid
           & flags
           & observer
           & cancellable
           & []
        )
    fun callFinish self res =
      (
        GioDBusConnectionClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GLibVariantRecord.FFI.fromPtr true
      )
        callFinish_
        (
          self
           & res
           & []
        )
    fun callSync self busName objectPath interfaceName methodName parameters replyType flags timeoutMsec cancellable =
      (
        GioDBusConnectionClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibVariantRecord.FFI.withOptPtr
         &&&> GLibVariantTypeRecord.FFI.withOptPtr
         &&&> GioDBusCallFlags.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GLibVariantRecord.FFI.fromPtr true
      )
        callSync_
        (
          self
           & busName
           & objectPath
           & interfaceName
           & methodName
           & parameters
           & replyType
           & flags
           & timeoutMsec
           & cancellable
           & []
        )
    fun callWithUnixFdListFinish self res =
      let
        val outFdList & retVal =
          (
            GioDBusConnectionClass.FFI.withPtr
             &&&> GioUnixFDListClass.FFI.withRefOptPtr
             &&&> GioAsyncResultClass.FFI.withPtr
             &&&> GLibErrorRecord.handleError
             ---> GioUnixFDListClass.FFI.fromPtr true && GLibVariantRecord.FFI.fromPtr true
          )
            callWithUnixFdListFinish_
            (
              self
               & NONE
               & res
               & []
            )
      in
        (retVal, outFdList)
      end
    fun callWithUnixFdListSync self busName objectPath interfaceName methodName parameters replyType flags timeoutMsec fdList cancellable =
      let
        val outFdList & retVal =
          (
            GioDBusConnectionClass.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GLibVariantRecord.FFI.withOptPtr
             &&&> GLibVariantTypeRecord.FFI.withOptPtr
             &&&> GioDBusCallFlags.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> GioUnixFDListClass.FFI.withOptPtr
             &&&> GioUnixFDListClass.FFI.withRefOptPtr
             &&&> GioCancellableClass.FFI.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GioUnixFDListClass.FFI.fromPtr true && GLibVariantRecord.FFI.fromPtr true
          )
            callWithUnixFdListSync_
            (
              self
               & busName
               & objectPath
               & interfaceName
               & methodName
               & parameters
               & replyType
               & flags
               & timeoutMsec
               & fdList
               & NONE
               & cancellable
               & []
            )
      in
        (retVal, outFdList)
      end
    fun closeFinish self res =
      (
        GioDBusConnectionClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
      )
        closeFinish_
        (
          self
           & res
           & []
        )
    fun closeSync self cancellable =
      (
        GioDBusConnectionClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
      )
        closeSync_
        (
          self
           & cancellable
           & []
        )
    fun emitSignal self destinationBusName objectPath interfaceName signalName parameters =
      (
        GioDBusConnectionClass.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibVariantRecord.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
      )
        emitSignal_
        (
          self
           & destinationBusName
           & objectPath
           & interfaceName
           & signalName
           & parameters
           & []
        )
    fun flushFinish self res =
      (
        GioDBusConnectionClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
      )
        flushFinish_
        (
          self
           & res
           & []
        )
    fun flushSync self cancellable =
      (
        GioDBusConnectionClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
      )
        flushSync_
        (
          self
           & cancellable
           & []
        )
    fun getCapabilities self = (GioDBusConnectionClass.FFI.withPtr ---> GioDBusCapabilityFlags.FFI.fromVal) getCapabilities_ self
    fun getExitOnClose self = (GioDBusConnectionClass.FFI.withPtr ---> GBool.FFI.fromVal) getExitOnClose_ self
    fun getGuid self = (GioDBusConnectionClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getGuid_ self
    fun getPeerCredentials self = (GioDBusConnectionClass.FFI.withPtr ---> GioCredentialsClass.FFI.fromPtr false) getPeerCredentials_ self
    fun getStream self = (GioDBusConnectionClass.FFI.withPtr ---> GioIOStreamClass.FFI.fromPtr false) getStream_ self
    fun getUniqueName self = (GioDBusConnectionClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getUniqueName_ self
    fun isClosed self = (GioDBusConnectionClass.FFI.withPtr ---> GBool.FFI.fromVal) isClosed_ self
    fun removeFilter self filterId = (GioDBusConnectionClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) removeFilter_ (self & filterId)
    fun sendMessage self message flags =
      let
        val outSerial & retVal =
          (
            GioDBusConnectionClass.FFI.withPtr
             &&&> GioDBusMessageClass.FFI.withPtr
             &&&> GioDBusSendMessageFlags.FFI.withVal
             &&&> GUInt32.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GUInt32.FFI.fromVal && GBool.FFI.fromVal
          )
            sendMessage_
            (
              self
               & message
               & flags
               & GUInt32.null
               & []
            )
      in
        if retVal then SOME outSerial else NONE
      end
    fun sendMessageWithReplyFinish self res =
      (
        GioDBusConnectionClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioDBusMessageClass.FFI.fromPtr true
      )
        sendMessageWithReplyFinish_
        (
          self
           & res
           & []
        )
    fun sendMessageWithReplySync self message flags timeoutMsec cancellable =
      let
        val outSerial & retVal =
          (
            GioDBusConnectionClass.FFI.withPtr
             &&&> GioDBusMessageClass.FFI.withPtr
             &&&> GioDBusSendMessageFlags.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> GUInt32.FFI.withRefVal
             &&&> GioCancellableClass.FFI.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GUInt32.FFI.fromVal && GioDBusMessageClass.FFI.fromPtr true
          )
            sendMessageWithReplySync_
            (
              self
               & message
               & flags
               & timeoutMsec
               & GUInt32.null
               & cancellable
               & []
            )
      in
        (retVal, outSerial)
      end
    fun setExitOnClose self exitOnClose = (GioDBusConnectionClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setExitOnClose_ (self & exitOnClose)
    fun signalUnsubscribe self subscriptionId = (GioDBusConnectionClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) signalUnsubscribe_ (self & subscriptionId)
    fun startMessageProcessing self = (GioDBusConnectionClass.FFI.withPtr ---> I) startMessageProcessing_ self
    fun unregisterObject self registrationId = (GioDBusConnectionClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> GBool.FFI.fromVal) unregisterObject_ (self & registrationId)
    fun unregisterSubtree self registrationId = (GioDBusConnectionClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> GBool.FFI.fromVal) unregisterSubtree_ (self & registrationId)
    local
      open Property
    in
      val addressProp = {set = fn x => set "address" stringOpt x}
      val authenticationObserverProp = {set = fn x => set "authentication-observer" GioDBusAuthObserverClass.tOpt x}
      val capabilitiesProp = {get = fn x => get "capabilities" GioDBusCapabilityFlags.t x}
      val closedProp = {get = fn x => get "closed" boolean x}
      val exitOnCloseProp =
        {
          get = fn x => get "exit-on-close" boolean x,
          set = fn x => set "exit-on-close" boolean x
        }
      val flagsProp = {set = fn x => set "flags" GioDBusConnectionFlags.t x}
      val guidProp =
        {
          get = fn x => get "guid" stringOpt x,
          set = fn x => set "guid" stringOpt x
        }
      val streamProp =
        {
          get = fn x => get "stream" GioIOStreamClass.tOpt x,
          set = fn x => set "stream" GioIOStreamClass.tOpt x
        }
      val uniqueNameProp = {get = fn x => get "unique-name" stringOpt x}
    end
  end
