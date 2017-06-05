structure GioCancellable :>
  GIO_CANCELLABLE
    where type 'a class = 'a GioCancellableClass.class =
  struct
    val getType_ = _import "g_cancellable_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_cancellable_new" : unit -> GioCancellableClass.FFI.notnull GioCancellableClass.FFI.p;
    val getCurrent_ = _import "g_cancellable_get_current" : unit -> GioCancellableClass.FFI.notnull GioCancellableClass.FFI.p;
    val cancel_ = _import "g_cancellable_cancel" : GioCancellableClass.FFI.notnull GioCancellableClass.FFI.p -> unit;
    val disconnect_ = fn x1 & x2 => (_import "g_cancellable_disconnect" : GioCancellableClass.FFI.notnull GioCancellableClass.FFI.p * GULong.FFI.val_ -> unit;) (x1, x2)
    val getFd_ = _import "g_cancellable_get_fd" : GioCancellableClass.FFI.notnull GioCancellableClass.FFI.p -> GInt.FFI.val_;
    val isCancelled_ = _import "g_cancellable_is_cancelled" : GioCancellableClass.FFI.notnull GioCancellableClass.FFI.p -> GBool.FFI.val_;
    val makePollfd_ = fn x1 & x2 => (_import "g_cancellable_make_pollfd" : GioCancellableClass.FFI.notnull GioCancellableClass.FFI.p * GLibPollFDRecord.FFI.notnull GLibPollFDRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val popCurrent_ = _import "g_cancellable_pop_current" : GioCancellableClass.FFI.notnull GioCancellableClass.FFI.p -> unit;
    val pushCurrent_ = _import "g_cancellable_push_current" : GioCancellableClass.FFI.notnull GioCancellableClass.FFI.p -> unit;
    val releaseFd_ = _import "g_cancellable_release_fd" : GioCancellableClass.FFI.notnull GioCancellableClass.FFI.p -> unit;
    val reset_ = _import "g_cancellable_reset" : GioCancellableClass.FFI.notnull GioCancellableClass.FFI.p -> unit;
    val setErrorIfCancelled_ = fn x1 & x2 => (_import "g_cancellable_set_error_if_cancelled" : GioCancellableClass.FFI.notnull GioCancellableClass.FFI.p * (unit, unit) GLibErrorRecord.FFI.r -> GBool.FFI.val_;) (x1, x2)
    type 'a class = 'a GioCancellableClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioCancellableClass.FFI.fromPtr true) new_ ()
    fun getCurrent () = (I ---> GioCancellableClass.FFI.fromPtr false) getCurrent_ ()
    fun cancel self = (GioCancellableClass.FFI.withPtr ---> I) cancel_ self
    fun disconnect self handlerId = (GioCancellableClass.FFI.withPtr &&&> GULong.FFI.withVal ---> I) disconnect_ (self & handlerId)
    fun getFd self = (GioCancellableClass.FFI.withPtr ---> GInt.FFI.fromVal) getFd_ self
    fun isCancelled self = (GioCancellableClass.FFI.withPtr ---> GBool.FFI.fromVal) isCancelled_ self
    fun makePollfd self pollfd = (GioCancellableClass.FFI.withPtr &&&> GLibPollFDRecord.FFI.withPtr ---> GBool.FFI.fromVal) makePollfd_ (self & pollfd)
    fun popCurrent self = (GioCancellableClass.FFI.withPtr ---> I) popCurrent_ self
    fun pushCurrent self = (GioCancellableClass.FFI.withPtr ---> I) pushCurrent_ self
    fun releaseFd self = (GioCancellableClass.FFI.withPtr ---> I) releaseFd_ self
    fun reset self = (GioCancellableClass.FFI.withPtr ---> I) reset_ self
    fun setErrorIfCancelled self = (GioCancellableClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GBool.FFI.fromVal) setErrorIfCancelled_ (self & [])
    local
      open ClosureMarshal Signal
    in
      fun cancelledSig f = signal "cancelled" (void ---> ret_void) f
    end
  end
