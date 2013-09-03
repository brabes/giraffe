structure AtkComponent :>
  ATK_COMPONENT
    where type 'a class_t = 'a AtkComponentClass.t
    where type layer_t = AtkLayer.t
    where type 'a objectclass_t = 'a AtkObjectClass.t
    where type coordtype_t = AtkCoordType.t
    where type rectanglerecord_t = AtkRectangleRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_component_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val contains_ =
        call (load_sym libatk "atk_component_contains")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Int32.VAL
             &&> AtkCoordType.PolyML.VAL
             --> FFI.PolyML.Bool.VAL
          )
      val getAlpha_ = call (load_sym libatk "atk_component_get_alpha") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Double.VAL)
      val getLayer_ = call (load_sym libatk "atk_component_get_layer") (GObjectObjectClass.PolyML.PTR --> AtkLayer.PolyML.VAL)
      val getMdiZorder_ = call (load_sym libatk "atk_component_get_mdi_zorder") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val grabFocus_ = call (load_sym libatk "atk_component_grab_focus") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val refAccessibleAtPoint_ =
        call (load_sym libatk "atk_component_ref_accessible_at_point")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Int32.VAL
             &&> AtkCoordType.PolyML.VAL
             --> GObjectObjectClass.PolyML.PTR
          )
      val removeFocusHandler_ = call (load_sym libatk "atk_component_remove_focus_handler") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.UInt32.VAL --> FFI.PolyML.VOID)
      val setExtents_ =
        call (load_sym libatk "atk_component_set_extents")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Int32.VAL
             &&> AtkCoordType.PolyML.VAL
             --> FFI.PolyML.Bool.VAL
          )
      val setPosition_ =
        call (load_sym libatk "atk_component_set_position")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Int32.VAL
             &&> AtkCoordType.PolyML.VAL
             --> FFI.PolyML.Bool.VAL
          )
      val setSize_ =
        call (load_sym libatk "atk_component_set_size")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Int32.VAL
             --> FFI.PolyML.Bool.VAL
          )
    end
    type 'a class_t = 'a AtkComponentClass.t
    type layer_t = AtkLayer.t
    type 'a objectclass_t = 'a AtkObjectClass.t
    type coordtype_t = AtkCoordType.t
    type rectanglerecord_t = AtkRectangleRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun contains self x y coordType =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> AtkCoordType.C.withVal
         ---> FFI.Bool.fromVal
      )
        contains_
        (
          self
           & x
           & y
           & coordType
        )
    fun getAlpha self = (GObjectObjectClass.C.withPtr ---> FFI.Double.fromVal) getAlpha_ self
    fun getLayer self = (GObjectObjectClass.C.withPtr ---> AtkLayer.C.fromVal) getLayer_ self
    fun getMdiZorder self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getMdiZorder_ self
    fun grabFocus self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) grabFocus_ self
    fun refAccessibleAtPoint self x y coordType =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> AtkCoordType.C.withVal
         ---> AtkObjectClass.C.fromPtr true
      )
        refAccessibleAtPoint_
        (
          self
           & x
           & y
           & coordType
        )
    fun removeFocusHandler self handlerId = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.withVal ---> I) removeFocusHandler_ (self & handlerId)
    fun setExtents self x y width height coordType =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> AtkCoordType.C.withVal
         ---> FFI.Bool.fromVal
      )
        setExtents_
        (
          self
           & x
           & y
           & width
           & height
           & coordType
        )
    fun setPosition self x y coordType =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> AtkCoordType.C.withVal
         ---> FFI.Bool.fromVal
      )
        setPosition_
        (
          self
           & x
           & y
           & coordType
        )
    fun setSize self width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         ---> FFI.Bool.fromVal
      )
        setSize_
        (
          self
           & width
           & height
        )
    local
      open ClosureMarshal Signal
    in
      fun boundsChangedSig f = signal "bounds-changed" (get 0w1 AtkRectangleRecord.t ---> ret_void) f
    end
  end
