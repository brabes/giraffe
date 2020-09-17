structure GLibSource :>
  G_LIB_SOURCE
    where type t = GLibSourceRecord.t
    where type main_context_t = GLibMainContextRecord.t
    where type time_val_t = GLibTimeValRecord.t =
  struct
    val getType_ = _import "g_source_get_type" : unit -> GObjectType.FFI.val_;
    val addChildSource_ = fn x1 & x2 => (_import "g_source_add_child_source" : GLibSourceRecord.FFI.non_opt GLibSourceRecord.FFI.p * GLibSourceRecord.FFI.non_opt GLibSourceRecord.FFI.p -> unit;) (x1, x2)
    val attach_ = fn x1 & x2 => (_import "g_source_attach" : GLibSourceRecord.FFI.non_opt GLibSourceRecord.FFI.p * GLibMainContextRecord.FFI.opt GLibMainContextRecord.FFI.p -> GUInt32.FFI.val_;) (x1, x2)
    val destroy_ = _import "g_source_destroy" : GLibSourceRecord.FFI.non_opt GLibSourceRecord.FFI.p -> unit;
    val getCanRecurse_ = _import "g_source_get_can_recurse" : GLibSourceRecord.FFI.non_opt GLibSourceRecord.FFI.p -> GBool.FFI.val_;
    val getContext_ = _import "g_source_get_context" : GLibSourceRecord.FFI.non_opt GLibSourceRecord.FFI.p -> GLibMainContextRecord.FFI.opt GLibMainContextRecord.FFI.p;
    val getCurrentTime_ = fn x1 & x2 => (_import "g_source_get_current_time" : GLibSourceRecord.FFI.non_opt GLibSourceRecord.FFI.p * GLibTimeValRecord.FFI.non_opt GLibTimeValRecord.FFI.p -> unit;) (x1, x2)
    val getId_ = _import "g_source_get_id" : GLibSourceRecord.FFI.non_opt GLibSourceRecord.FFI.p -> GUInt32.FFI.val_;
    val getName_ = _import "g_source_get_name" : GLibSourceRecord.FFI.non_opt GLibSourceRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getPriority_ = _import "g_source_get_priority" : GLibSourceRecord.FFI.non_opt GLibSourceRecord.FFI.p -> GInt32.FFI.val_;
    val getReadyTime_ = _import "g_source_get_ready_time" : GLibSourceRecord.FFI.non_opt GLibSourceRecord.FFI.p -> GInt64.FFI.val_;
    val getTime_ = _import "g_source_get_time" : GLibSourceRecord.FFI.non_opt GLibSourceRecord.FFI.p -> GInt64.FFI.val_;
    val isDestroyed_ = _import "g_source_is_destroyed" : GLibSourceRecord.FFI.non_opt GLibSourceRecord.FFI.p -> GBool.FFI.val_;
    val removeChildSource_ = fn x1 & x2 => (_import "g_source_remove_child_source" : GLibSourceRecord.FFI.non_opt GLibSourceRecord.FFI.p * GLibSourceRecord.FFI.non_opt GLibSourceRecord.FFI.p -> unit;) (x1, x2)
    val setCanRecurse_ = fn x1 & x2 => (_import "g_source_set_can_recurse" : GLibSourceRecord.FFI.non_opt GLibSourceRecord.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_source_set_name" :
              GLibSourceRecord.FFI.non_opt GLibSourceRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setPriority_ = fn x1 & x2 => (_import "g_source_set_priority" : GLibSourceRecord.FFI.non_opt GLibSourceRecord.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setReadyTime_ = fn x1 & x2 => (_import "g_source_set_ready_time" : GLibSourceRecord.FFI.non_opt GLibSourceRecord.FFI.p * GInt64.FFI.val_ -> unit;) (x1, x2)
    val remove_ = _import "g_source_remove" : GUInt32.FFI.val_ -> GBool.FFI.val_;
    val setNameById_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_source_set_name_by_id" :
              GUInt32.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type t = GLibSourceRecord.t
    type main_context_t = GLibMainContextRecord.t
    type time_val_t = GLibTimeValRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun addChildSource self childSource = (GLibSourceRecord.FFI.withPtr false &&&> GLibSourceRecord.FFI.withPtr false ---> I) addChildSource_ (self & childSource)
    fun attach self context = (GLibSourceRecord.FFI.withPtr false &&&> GLibMainContextRecord.FFI.withOptPtr false ---> GUInt32.FFI.fromVal) attach_ (self & context)
    fun destroy self = (GLibSourceRecord.FFI.withPtr false ---> I) destroy_ self
    fun getCanRecurse self = (GLibSourceRecord.FFI.withPtr false ---> GBool.FFI.fromVal) getCanRecurse_ self
    fun getContext self = (GLibSourceRecord.FFI.withPtr false ---> GLibMainContextRecord.FFI.fromOptPtr false) getContext_ self before GLibSourceRecord.FFI.touchPtr self
    fun getCurrentTime self timeval = (GLibSourceRecord.FFI.withPtr false &&&> GLibTimeValRecord.FFI.withPtr false ---> I) getCurrentTime_ (self & timeval)
    fun getId self = (GLibSourceRecord.FFI.withPtr false ---> GUInt32.FFI.fromVal) getId_ self
    fun getName self = (GLibSourceRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getName_ self before GLibSourceRecord.FFI.touchPtr self
    fun getPriority self = (GLibSourceRecord.FFI.withPtr false ---> GInt32.FFI.fromVal) getPriority_ self
    fun getReadyTime self = (GLibSourceRecord.FFI.withPtr false ---> GInt64.FFI.fromVal) getReadyTime_ self
    fun getTime self = (GLibSourceRecord.FFI.withPtr false ---> GInt64.FFI.fromVal) getTime_ self
    fun isDestroyed self = (GLibSourceRecord.FFI.withPtr false ---> GBool.FFI.fromVal) isDestroyed_ self
    fun removeChildSource self childSource = (GLibSourceRecord.FFI.withPtr false &&&> GLibSourceRecord.FFI.withPtr false ---> I) removeChildSource_ (self & childSource)
    fun setCanRecurse self canRecurse = (GLibSourceRecord.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setCanRecurse_ (self & canRecurse)
    fun setName self name = (GLibSourceRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setName_ (self & name)
    fun setPriority self priority = (GLibSourceRecord.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setPriority_ (self & priority)
    fun setReadyTime self readyTime = (GLibSourceRecord.FFI.withPtr false &&&> GInt64.FFI.withVal ---> I) setReadyTime_ (self & readyTime)
    fun remove tag = (GUInt32.FFI.withVal ---> GBool.FFI.fromVal) remove_ tag
    fun setNameById (tag, name) = (GUInt32.FFI.withVal &&&> Utf8.FFI.withPtr 0 ---> I) setNameById_ (tag & name)
  end
