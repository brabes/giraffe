structure Atk : ATK =
  struct
    local
      open PolyMLFFI
    in
      val focusTrackerNotify_ = call (getSymbol "atk_focus_tracker_notify") (AtkObjectClass.PolyML.cPtr --> cVoid)
      val getDefaultRegistry_ = call (getSymbol "atk_get_default_registry") (cVoid --> AtkRegistryClass.PolyML.cPtr)
      val getFocusObject_ = call (getSymbol "atk_get_focus_object") (cVoid --> AtkObjectClass.PolyML.cPtr)
      val getRoot_ = call (getSymbol "atk_get_root") (cVoid --> AtkObjectClass.PolyML.cPtr)
      val getToolkitName_ = call (getSymbol "atk_get_toolkit_name") (cVoid --> Utf8.PolyML.cOutPtr)
      val getToolkitVersion_ = call (getSymbol "atk_get_toolkit_version") (cVoid --> Utf8.PolyML.cOutPtr)
      val getVersion_ = call (getSymbol "atk_get_version") (cVoid --> Utf8.PolyML.cOutPtr)
      val relationTypeForName_ = call (getSymbol "atk_relation_type_for_name") (Utf8.PolyML.cInPtr --> AtkRelationType.PolyML.cVal)
      val relationTypeGetName_ = call (getSymbol "atk_relation_type_get_name") (AtkRelationType.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val relationTypeRegister_ = call (getSymbol "atk_relation_type_register") (Utf8.PolyML.cInPtr --> AtkRelationType.PolyML.cVal)
      val removeFocusTracker_ = call (getSymbol "atk_remove_focus_tracker") (GUInt32.PolyML.cVal --> cVoid)
      val removeGlobalEventListener_ = call (getSymbol "atk_remove_global_event_listener") (GUInt32.PolyML.cVal --> cVoid)
      val removeKeyEventListener_ = call (getSymbol "atk_remove_key_event_listener") (GUInt32.PolyML.cVal --> cVoid)
      val roleForName_ = call (getSymbol "atk_role_for_name") (Utf8.PolyML.cInPtr --> AtkRole.PolyML.cVal)
      val roleGetLocalizedName_ = call (getSymbol "atk_role_get_localized_name") (AtkRole.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val roleGetName_ = call (getSymbol "atk_role_get_name") (AtkRole.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val roleRegister_ = call (getSymbol "atk_role_register") (Utf8.PolyML.cInPtr --> AtkRole.PolyML.cVal)
      val stateTypeForName_ = call (getSymbol "atk_state_type_for_name") (Utf8.PolyML.cInPtr --> AtkStateType.PolyML.cVal)
      val stateTypeGetName_ = call (getSymbol "atk_state_type_get_name") (AtkStateType.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val stateTypeRegister_ = call (getSymbol "atk_state_type_register") (Utf8.PolyML.cInPtr --> AtkStateType.PolyML.cVal)
      val textAttributeForName_ = call (getSymbol "atk_text_attribute_for_name") (Utf8.PolyML.cInPtr --> AtkTextAttribute.PolyML.cVal)
      val textAttributeGetName_ = call (getSymbol "atk_text_attribute_get_name") (AtkTextAttribute.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val textAttributeGetValue_ = call (getSymbol "atk_text_attribute_get_value") (AtkTextAttribute.PolyML.cVal &&> GInt32.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val textAttributeRegister_ = call (getSymbol "atk_text_attribute_register") (Utf8.PolyML.cInPtr --> AtkTextAttribute.PolyML.cVal)
      val textFreeRanges_ = call (getSymbol "atk_text_free_ranges") (AtkTextRangeRecord.PolyML.cPtr --> cVoid)
    end
    structure ActionClass = AtkActionClass
    structure ComponentClass = AtkComponentClass
    structure CoordType = AtkCoordType
    structure DocumentClass = AtkDocumentClass
    structure EditableTextClass = AtkEditableTextClass
    structure HyperlinkClass = AtkHyperlinkClass
    structure HyperlinkImplClass = AtkHyperlinkImplClass
    structure HyperlinkStateFlags = AtkHyperlinkStateFlags
    structure HypertextClass = AtkHypertextClass
    structure ImageClass = AtkImageClass
    structure ImplementorIfaceClass = AtkImplementorIfaceClass
    structure KeyEventType = AtkKeyEventType
    structure Layer = AtkLayer
    structure MiscClass = AtkMiscClass
    structure ObjectClass = AtkObjectClass
    structure ObjectFactoryClass = AtkObjectFactoryClass
    structure RegistryClass = AtkRegistryClass
    structure RelationClass = AtkRelationClass
    structure RelationSetClass = AtkRelationSetClass
    structure RelationType = AtkRelationType
    structure Role = AtkRole
    structure SelectionClass = AtkSelectionClass
    structure StateSetClass = AtkStateSetClass
    structure StateType = AtkStateType
    structure StreamableContentClass = AtkStreamableContentClass
    structure TableClass = AtkTableClass
    structure TextClass = AtkTextClass
    structure TextAttribute = AtkTextAttribute
    structure TextBoundary = AtkTextBoundary
    structure TextClipType = AtkTextClipType
    structure UtilClass = AtkUtilClass
    structure ValueClass = AtkValueClass
    structure WindowClass = AtkWindowClass
    structure Action = AtkAction
    structure Document = AtkDocument
    structure EditableText = AtkEditableText
    structure GObjectAccessibleClass = AtkGObjectAccessibleClass
    structure Hyperlink = AtkHyperlink
    structure HyperlinkImpl = AtkHyperlinkImpl
    structure Hypertext = AtkHypertext
    structure Image = AtkImage
    structure ImplementorIface = AtkImplementorIface
    structure Misc = AtkMisc
    structure NoOpObjectClass = AtkNoOpObjectClass
    structure NoOpObjectFactoryClass = AtkNoOpObjectFactoryClass
    structure Object = AtkObject
    structure ObjectFactory = AtkObjectFactory
    structure PlugClass = AtkPlugClass
    structure Registry = AtkRegistry
    structure Relation = AtkRelation
    structure RelationSet = AtkRelationSet
    structure Selection = AtkSelection
    structure SocketClass = AtkSocketClass
    structure StateSet = AtkStateSet
    structure StreamableContent = AtkStreamableContent
    structure Table = AtkTable
    structure Util = AtkUtil
    structure Value = AtkValue
    structure Window = AtkWindow
    structure GObjectAccessible = AtkGObjectAccessible
    structure NoOpObject = AtkNoOpObject
    structure NoOpObjectFactory = AtkNoOpObjectFactory
    structure Plug = AtkPlug
    structure Socket = AtkSocket
    fun focusTrackerNotify object = (AtkObjectClass.FFI.withPtr ---> I) focusTrackerNotify_ object
    fun getDefaultRegistry () = (I ---> AtkRegistryClass.FFI.fromPtr true) getDefaultRegistry_ ()
    fun getFocusObject () = (I ---> AtkObjectClass.FFI.fromPtr false) getFocusObject_ ()
    fun getRoot () = (I ---> AtkObjectClass.FFI.fromPtr false) getRoot_ ()
    fun getToolkitName () = (I ---> Utf8.FFI.fromPtr 0) getToolkitName_ ()
    fun getToolkitVersion () = (I ---> Utf8.FFI.fromPtr 0) getToolkitVersion_ ()
    fun getVersion () = (I ---> Utf8.FFI.fromPtr 0) getVersion_ ()
    fun relationTypeForName name = (Utf8.FFI.withPtr ---> AtkRelationType.FFI.fromVal) relationTypeForName_ name
    fun relationTypeGetName type' = (AtkRelationType.FFI.withVal ---> Utf8.FFI.fromPtr 0) relationTypeGetName_ type'
    fun relationTypeRegister name = (Utf8.FFI.withPtr ---> AtkRelationType.FFI.fromVal) relationTypeRegister_ name
    fun removeFocusTracker trackerId = (GUInt32.FFI.withVal ---> I) removeFocusTracker_ trackerId
    fun removeGlobalEventListener listenerId = (GUInt32.FFI.withVal ---> I) removeGlobalEventListener_ listenerId
    fun removeKeyEventListener listenerId = (GUInt32.FFI.withVal ---> I) removeKeyEventListener_ listenerId
    fun roleForName name = (Utf8.FFI.withPtr ---> AtkRole.FFI.fromVal) roleForName_ name
    fun roleGetLocalizedName role = (AtkRole.FFI.withVal ---> Utf8.FFI.fromPtr 0) roleGetLocalizedName_ role
    fun roleGetName role = (AtkRole.FFI.withVal ---> Utf8.FFI.fromPtr 0) roleGetName_ role
    fun roleRegister name = (Utf8.FFI.withPtr ---> AtkRole.FFI.fromVal) roleRegister_ name
    fun stateTypeForName name = (Utf8.FFI.withPtr ---> AtkStateType.FFI.fromVal) stateTypeForName_ name
    fun stateTypeGetName type' = (AtkStateType.FFI.withVal ---> Utf8.FFI.fromPtr 0) stateTypeGetName_ type'
    fun stateTypeRegister name = (Utf8.FFI.withPtr ---> AtkStateType.FFI.fromVal) stateTypeRegister_ name
    fun textAttributeForName name = (Utf8.FFI.withPtr ---> AtkTextAttribute.FFI.fromVal) textAttributeForName_ name
    fun textAttributeGetName attr = (AtkTextAttribute.FFI.withVal ---> Utf8.FFI.fromPtr 0) textAttributeGetName_ attr
    fun textAttributeGetValue attr index = (AtkTextAttribute.FFI.withVal &&&> GInt32.FFI.withVal ---> Utf8.FFI.fromPtr 0) textAttributeGetValue_ (attr & index)
    fun textAttributeRegister name = (Utf8.FFI.withPtr ---> AtkTextAttribute.FFI.fromVal) textAttributeRegister_ name
    fun textFreeRanges ranges = (AtkTextRangeRecord.FFI.withPtr ---> I) textFreeRanges_ ranges
  end
