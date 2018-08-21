structure GLibIOFunc :>
  G_LIB_I_O_FUNC
    where type i_o_channel_t = GLibIOChannelRecord.t
    where type i_o_condition_t = GLibIOCondition.t =
  struct
    type i_o_channel_t = GLibIOChannelRecord.t
    type i_o_condition_t = GLibIOCondition.t
    type func = i_o_channel_t * i_o_condition_t -> bool
    type t = func

    structure C =
      struct
        structure Pointer = CPointerInternal
        type notnull = Pointer.notnull
        type 'a p = 'a Pointer.p
      end

    structure IOCallbackTable = CallbackTable(type callback = t)

    local
      fun dispatch
        (
          channel : GLibIOChannelRecord.FFI.notnull GLibIOChannelRecord.FFI.p,
          condition : GLibIOCondition.FFI.val_,
          id : IOCallbackTable.id
        ) : bool =
        case IOCallbackTable.lookup id of
          SOME f => (
            f (GLibIOChannelRecord.FFI.fromPtr false channel, GLibIOCondition.FFI.fromVal condition)
              handle
                e => (
                  GiraffeLog.critical (exnMessage e);
                  false  (* return false to remove the source *)
                )
          )
        | NONE   => (
            GiraffeLog.critical (
              concat [
                "IO source callback error: source function id ",
                IOCallbackTable.fmtId id,
                " is invalid (callback does not exist)\n"
              ]
            );
            true (* return true to prevent an attempt
                  * to remove a non-existent source *)
          )
    in
      val _ =
        _export "giraffe_io_dispatch_smlside"
          : (GLibIOChannelRecord.FFI.notnull GLibIOChannelRecord.FFI.p
              * GLibIOCondition.FFI.val_
              * IOCallbackTable.id
              -> bool)
             -> unit;
      dispatch
    end

    val _ = _export "giraffe_io_destroy_smlside" : (IOCallbackTable.id -> unit) -> unit; 
    IOCallbackTable.remove

    structure FFI =
      struct
        type notnull = C.notnull
        type 'a p = 'a C.p

        type callback = IOCallbackTable.id
        fun withCallback f callback =
          let
            val callbackId = IOCallbackTable.add callback
          in
            f callbackId
              handle
                e => (IOCallbackTable.remove callbackId; raise e)
          end
        fun withOptCallback f optCallback =
          case optCallback of
            SOME callback => withCallback f callback
          | NONE          => f IOCallbackTable.nullId

        fun withPtrToDispatch f () = f (_address "giraffe_io_dispatch" : MLton.Pointer.t;)
        fun withOptPtrToDispatch f =
          fn
            true  => withPtrToDispatch f ()
          | false => f MLton.Pointer.null

        fun withPtrToDestroy f () = f (_address "giraffe_io_destroy" : MLton.Pointer.t;)
        fun withOptPtrToDestroy f =
          fn
            true  => withPtrToDestroy f ()
          | false => f MLton.Pointer.null
      end
  end
