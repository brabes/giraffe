structure GObjectObject :>
  G_OBJECT_OBJECT
    where type 'a class = 'a GObjectObjectClass.class
    where type type_t = GObjectType.t
    where type 'a binding_class = 'a GObjectBindingClass.class
    where type binding_flags_t = GObjectBindingFlags.t
    where type value_t = GObjectValueRecord.t
    where type closure_t = GObjectClosureRecord.t
    where type 'a param_spec_class = 'a GObjectParamSpecClass.class
    where type ('a, 'b) value_accessor_t = ('a, 'b) ValueAccessor.t
    where type 'object_class property_t = 'object_class Property.t
    where type 'a signal_t = 'a Signal.t =
  struct
    structure Utf8CVectorNType =
      CPointerCVectorNType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVectorN = CVectorN(Utf8CVectorNType)
    structure GObjectValueRecordCVectorNType =
      CValueCVectorNType(
        structure CElemType = GObjectValueRecord.C.ValueType
        structure ElemSequence = CValueVectorSequence(GObjectValueRecord.C.ValueType)
      )
    structure GObjectValueRecordCVectorN = CVectorN(GObjectValueRecordCVectorNType)
    val getType_ = _import "g_object_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        x1
         & x2
         & (x3, x4)
         & (x5, x6) =>
          (
            _import "mlton_g_object_new_with_properties" :
              GObjectType.FFI.val_
               * GUInt.FFI.val_
               * Utf8CVectorN.MLton.p1
               * Utf8CVectorN.FFI.notnull Utf8CVectorN.MLton.p2
               * GObjectValueRecordCVectorN.MLton.p1
               * GObjectValueRecordCVectorN.FFI.notnull GObjectValueRecordCVectorN.MLton.p2
               -> GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val bindProperty_ =
      fn
        x1
         & (x2, x3)
         & x4
         & (x5, x6)
         & x7 =>
          (
            _import "mlton_g_object_bind_property" :
              GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GObjectBindingFlags.FFI.val_
               -> GObjectBindingClass.FFI.notnull GObjectBindingClass.FFI.p;
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
    val bindPropertyFull_ =
      fn
        x1
         & (x2, x3)
         & x4
         & (x5, x6)
         & x7
         & x8
         & x9 =>
          (
            _import "mlton_g_object_bind_property_with_closures" :
              GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GObjectBindingFlags.FFI.val_
               * GObjectClosureRecord.FFI.notnull GObjectClosureRecord.FFI.p
               * GObjectClosureRecord.FFI.notnull GObjectClosureRecord.FFI.p
               -> GObjectBindingClass.FFI.notnull GObjectBindingClass.FFI.p;
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
              x9
            )
    val freezeNotify_ = _import "g_object_freeze_notify" : GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p -> unit;
    val getProperty_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_object_get_property" :
              GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val notify_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_object_notify" :
              GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val notifyByPspec_ = fn x1 & x2 => (_import "g_object_notify_by_pspec" : GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p * GObjectParamSpecClass.FFI.notnull GObjectParamSpecClass.FFI.p -> unit;) (x1, x2)
    val runDispose_ = _import "g_object_run_dispose" : GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p -> unit;
    val setProperty_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_object_set_property" :
              GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val thawNotify_ = _import "g_object_thaw_notify" : GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p -> unit;
    val watchClosure_ = fn x1 & x2 => (_import "g_object_watch_closure" : GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p * GObjectClosureRecord.FFI.notnull GObjectClosureRecord.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GObjectObjectClass.class
    type type_t = GObjectType.t
    type 'a binding_class = 'a GObjectBindingClass.class
    type binding_flags_t = GObjectBindingFlags.t
    type value_t = GObjectValueRecord.t
    type closure_t = GObjectClosureRecord.t
    type 'a param_spec_class = 'a GObjectParamSpecClass.class
    type ('a, 'b) value_accessor_t = ('a, 'b) ValueAccessor.t
    type 'object_class property_t = 'object_class Property.t
    type 'a signal_t = 'a Signal.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (class, parameters) =
      let
        val objectType = ValueAccessor.gtype class
        val nProperties = LargeInt.fromInt (List.length parameters)
        val names = List.map Property.name parameters
        val values = Vector.fromList (List.map Property.value parameters)
        val retVal =
          (
            GObjectType.FFI.withVal
             &&&> GUInt.FFI.withVal
             &&&> Utf8CVectorN.FFI.withPtr
             &&&> GObjectValueRecordCVectorN.FFI.withPtr
             ---> GObjectObjectClass.FFI.fromPtr true
          )
            new_
            (
              objectType
               & nProperties
               & names
               & values
            )
      in
        GObjectObjectClass.toDerived class retVal
      end
    fun bindProperty
      self
      (
        sourceProperty,
        target,
        targetProperty,
        flags
      ) =
      (
        GObjectObjectClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GObjectObjectClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GObjectBindingFlags.FFI.withVal
         ---> GObjectBindingClass.FFI.fromPtr false
      )
        bindProperty_
        (
          self
           & sourceProperty
           & target
           & targetProperty
           & flags
        )
    fun bindPropertyFull
      self
      (
        sourceProperty,
        target,
        targetProperty,
        flags,
        transformTo,
        transformFrom
      ) =
      (
        GObjectObjectClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GObjectObjectClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GObjectBindingFlags.FFI.withVal
         &&&> GObjectClosureRecord.FFI.withPtr
         &&&> GObjectClosureRecord.FFI.withPtr
         ---> GObjectBindingClass.FFI.fromPtr false
      )
        bindPropertyFull_
        (
          self
           & sourceProperty
           & target
           & targetProperty
           & flags
           & transformTo
           & transformFrom
        )
    fun freezeNotify self = (GObjectObjectClass.FFI.withPtr ---> I) freezeNotify_ self
    fun getProperty self (propertyName, value) =
      (
        GObjectObjectClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GObjectValueRecord.FFI.withPtr
         ---> I
      )
        getProperty_
        (
          self
           & propertyName
           & value
        )
    fun notify self propertyName = (GObjectObjectClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) notify_ (self & propertyName)
    fun notifyByPspec self pspec = (GObjectObjectClass.FFI.withPtr &&&> GObjectParamSpecClass.FFI.withPtr ---> I) notifyByPspec_ (self & pspec)
    fun runDispose self = (GObjectObjectClass.FFI.withPtr ---> I) runDispose_ self
    fun setProperty self (propertyName, value) =
      (
        GObjectObjectClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GObjectValueRecord.FFI.withPtr
         ---> I
      )
        setProperty_
        (
          self
           & propertyName
           & value
        )
    fun thawNotify self = (GObjectObjectClass.FFI.withPtr ---> I) thawNotify_ self
    fun watchClosure self closure = (GObjectObjectClass.FFI.withPtr &&&> GObjectClosureRecord.FFI.withPtr ---> I) watchClosure_ (self & closure)
    local
      open ClosureMarshal Signal
    in
      fun notifySig f = signal "notify" (get 0w1 GObjectParamSpecClass.t ---> ret_void) f
    end
  end