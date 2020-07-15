signature ATK =
  sig
    structure State : ATK_STATE
    structure ActionClass : ATK_ACTION_CLASS
    structure ComponentClass : ATK_COMPONENT_CLASS
    structure CoordType : ATK_COORD_TYPE
    structure DocumentClass : ATK_DOCUMENT_CLASS
    structure EditableTextClass : ATK_EDITABLE_TEXT_CLASS
    structure HyperlinkClass : ATK_HYPERLINK_CLASS
    structure HyperlinkImplClass : ATK_HYPERLINK_IMPL_CLASS
    structure HyperlinkStateFlags : ATK_HYPERLINK_STATE_FLAGS
    structure HypertextClass : ATK_HYPERTEXT_CLASS
    structure ImageClass : ATK_IMAGE_CLASS
    structure ImplementorIfaceClass : ATK_IMPLEMENTOR_IFACE_CLASS
    structure KeyEventType : ATK_KEY_EVENT_TYPE
    structure Layer : ATK_LAYER
    structure MiscClass : ATK_MISC_CLASS
    structure ObjectClass : ATK_OBJECT_CLASS
    structure ObjectFactoryClass : ATK_OBJECT_FACTORY_CLASS
    structure RangeRecord : ATK_RANGE_RECORD
    structure RectangleRecord : ATK_RECTANGLE_RECORD
    structure RegistryClass : ATK_REGISTRY_CLASS
    structure RelationClass : ATK_RELATION_CLASS
    structure RelationSetClass : ATK_RELATION_SET_CLASS
    structure RelationType : ATK_RELATION_TYPE
    structure Role : ATK_ROLE
    structure SelectionClass : ATK_SELECTION_CLASS
    structure StateSetClass : ATK_STATE_SET_CLASS
    structure StateType : ATK_STATE_TYPE
    structure StreamableContentClass : ATK_STREAMABLE_CONTENT_CLASS
    structure TableClass : ATK_TABLE_CLASS
    structure TableCellClass : ATK_TABLE_CELL_CLASS
    structure TextClass : ATK_TEXT_CLASS
    structure TextAttribute : ATK_TEXT_ATTRIBUTE
    structure TextBoundary : ATK_TEXT_BOUNDARY
    structure TextClipType : ATK_TEXT_CLIP_TYPE
    structure TextGranularity : ATK_TEXT_GRANULARITY
    structure TextRangeRecord : ATK_TEXT_RANGE_RECORD
    structure TextRectangleRecord : ATK_TEXT_RECTANGLE_RECORD
    structure UtilClass : ATK_UTIL_CLASS
    structure ValueClass : ATK_VALUE_CLASS
    structure ValueType : ATK_VALUE_TYPE
    structure WindowClass : ATK_WINDOW_CLASS
    structure Action :
      ATK_ACTION
        where type 'a class = 'a ActionClass.class
    structure Component :
      ATK_COMPONENT
        where type 'a class = 'a ComponentClass.class
        where type layer_t = Layer.t
        where type 'a object_class = 'a ObjectClass.class
        where type coord_type_t = CoordType.t
        where type rectangle_t = RectangleRecord.t
    structure Document :
      ATK_DOCUMENT
        where type 'a class = 'a DocumentClass.class
    structure EditableText :
      ATK_EDITABLE_TEXT
        where type 'a class = 'a EditableTextClass.class
    structure GObjectAccessibleClass :
      ATK_G_OBJECT_ACCESSIBLE_CLASS
        where type 'a object_class = 'a ObjectClass.class
    structure Hyperlink :
      ATK_HYPERLINK
        where type 'a class = 'a HyperlinkClass.class
        where type 'a action_class = 'a ActionClass.class
        where type 'a object_class = 'a ObjectClass.class
    structure HyperlinkImpl :
      ATK_HYPERLINK_IMPL
        where type 'a class = 'a HyperlinkImplClass.class
        where type 'a hyperlink_class = 'a HyperlinkClass.class
    structure Hypertext :
      ATK_HYPERTEXT
        where type 'a class = 'a HypertextClass.class
        where type 'a hyperlink_class = 'a HyperlinkClass.class
    structure Image :
      ATK_IMAGE
        where type 'a class = 'a ImageClass.class
        where type coord_type_t = CoordType.t
    structure ImplementorIface :
      ATK_IMPLEMENTOR_IFACE
        where type 'a class = 'a ImplementorIfaceClass.class
    structure Misc :
      ATK_MISC
        where type 'a class = 'a MiscClass.class
    structure NoOpObjectClass :
      ATK_NO_OP_OBJECT_CLASS
        where type 'a object_class = 'a ObjectClass.class
    structure NoOpObjectFactoryClass :
      ATK_NO_OP_OBJECT_FACTORY_CLASS
        where type 'a object_factory_class = 'a ObjectFactoryClass.class
    structure Object :
      ATK_OBJECT
        where type 'a class = 'a ObjectClass.class
        where type layer_t = Layer.t
        where type state_t = State.t
        where type 'a relation_set_class = 'a RelationSetClass.class
        where type 'a state_set_class = 'a StateSetClass.class
        where type relation_type_t = RelationType.t
        where type role_t = Role.t
    structure ObjectFactory :
      ATK_OBJECT_FACTORY
        where type 'a class = 'a ObjectFactoryClass.class
        where type 'a object_class = 'a ObjectClass.class
    structure PlugClass :
      ATK_PLUG_CLASS
        where type 'a object_class = 'a ObjectClass.class
    structure Range :
      ATK_RANGE
        where type t = RangeRecord.t
    structure Rectangle :
      ATK_RECTANGLE
        where type t = RectangleRecord.t
    structure Registry :
      ATK_REGISTRY
        where type 'a class = 'a RegistryClass.class
        where type 'a object_factory_class = 'a ObjectFactoryClass.class
    structure ObjectClassCPtrArrayN :
      C_ARRAY
        where type elem = base ObjectClass.class
    structure RelationSet :
      ATK_RELATION_SET
        where type 'a class = 'a RelationSetClass.class
        where type 'a object_class = 'a ObjectClass.class
        where type relation_type_t = RelationType.t
        where type 'a relation_class = 'a RelationClass.class
    structure Selection :
      ATK_SELECTION
        where type 'a class = 'a SelectionClass.class
        where type 'a object_class = 'a ObjectClass.class
    structure SocketClass :
      ATK_SOCKET_CLASS
        where type 'a object_class = 'a ObjectClass.class
    structure StateTypeCArrayN :
      C_ARRAY
        where type elem = StateType.t
    structure StreamableContent :
      ATK_STREAMABLE_CONTENT
        where type 'a class = 'a StreamableContentClass.class
    structure Table :
      ATK_TABLE
        where type 'a class = 'a TableClass.class
        where type 'a object_class = 'a ObjectClass.class
    structure TableCell :
      ATK_TABLE_CELL
        where type 'a class = 'a TableCellClass.class
        where type 'a object_class = 'a ObjectClass.class
    structure TextRangeRecordCPtrArray :
      C_ARRAY
        where type elem = TextRangeRecord.t
    structure TextRange :
      ATK_TEXT_RANGE
        where type t = TextRangeRecord.t
    structure TextRectangle :
      ATK_TEXT_RECTANGLE
        where type t = TextRectangleRecord.t
    structure Util :
      ATK_UTIL
        where type 'a class = 'a UtilClass.class
    structure Value :
      ATK_VALUE
        where type 'a class = 'a ValueClass.class
        where type range_t = RangeRecord.t
    structure Window :
      ATK_WINDOW
        where type 'a class = 'a WindowClass.class
    structure GObjectAccessible :
      ATK_G_OBJECT_ACCESSIBLE
        where type 'a class = 'a GObjectAccessibleClass.class
        where type 'a object_class = 'a ObjectClass.class
    structure NoOpObject :
      ATK_NO_OP_OBJECT
        where type 'a class = 'a NoOpObjectClass.class
        where type 'a action_class = 'a ActionClass.class
        where type 'a component_class = 'a ComponentClass.class
        where type 'a document_class = 'a DocumentClass.class
        where type 'a editable_text_class = 'a EditableTextClass.class
        where type 'a hypertext_class = 'a HypertextClass.class
        where type 'a image_class = 'a ImageClass.class
        where type 'a selection_class = 'a SelectionClass.class
        where type 'a table_class = 'a TableClass.class
        where type 'a table_cell_class = 'a TableCellClass.class
        where type 'a text_class = 'a TextClass.class
        where type 'a value_class = 'a ValueClass.class
        where type 'a window_class = 'a WindowClass.class
    structure NoOpObjectFactory :
      ATK_NO_OP_OBJECT_FACTORY
        where type 'a class = 'a NoOpObjectFactoryClass.class
    structure Plug :
      ATK_PLUG
        where type 'a class = 'a PlugClass.class
        where type 'a component_class = 'a ComponentClass.class
    structure Relation :
      ATK_RELATION
        where type 'a class = 'a RelationClass.class
        where type object_class_c_ptr_array_n_t = ObjectClassCPtrArrayN.t
        where type 'a object_class = 'a ObjectClass.class
        where type relation_type_t = RelationType.t
    structure Socket :
      ATK_SOCKET
        where type 'a class = 'a SocketClass.class
        where type 'a component_class = 'a ComponentClass.class
    structure StateSet :
      ATK_STATE_SET
        where type 'a class = 'a StateSetClass.class
        where type state_type_c_array_n_t = StateTypeCArrayN.t
        where type state_type_t = StateType.t
    structure Text :
      ATK_TEXT
        where type 'a class = 'a TextClass.class
        where type text_range_record_c_ptr_array_t = TextRangeRecordCPtrArray.t
        where type text_clip_type_t = TextClipType.t
        where type text_rectangle_t = TextRectangleRecord.t
        where type coord_type_t = CoordType.t
        where type text_granularity_t = TextGranularity.t
        where type text_boundary_t = TextBoundary.t
    val BINARY_AGE : LargeInt.int
    val INTERFACE_AGE : LargeInt.int
    val MAJOR_VERSION : LargeInt.int
    val MICRO_VERSION : LargeInt.int
    val MINOR_VERSION : LargeInt.int
    val VERSION_MIN_REQUIRED : LargeInt.int
    val focusTrackerNotify : 'a ObjectClass.class -> unit
    val getBinaryAge : unit -> LargeInt.int
    val getDefaultRegistry : unit -> base RegistryClass.class
    val getFocusObject : unit -> base ObjectClass.class
    val getInterfaceAge : unit -> LargeInt.int
    val getMajorVersion : unit -> LargeInt.int
    val getMicroVersion : unit -> LargeInt.int
    val getMinorVersion : unit -> LargeInt.int
    val getRoot : unit -> base ObjectClass.class
    val getToolkitName : unit -> string
    val getToolkitVersion : unit -> string
    val getVersion : unit -> string
    val removeFocusTracker : LargeInt.int -> unit
    val removeGlobalEventListener : LargeInt.int -> unit
    val removeKeyEventListener : LargeInt.int -> unit
  end