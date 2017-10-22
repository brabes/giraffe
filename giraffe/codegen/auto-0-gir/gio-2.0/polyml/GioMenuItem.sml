structure GioMenuItem :>
  GIO_MENU_ITEM
    where type 'a class = 'a GioMenuItemClass.class
    where type 'a icon_class = 'a GioIconClass.class
    where type 'a menu_model_class = 'a GioMenuModelClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_menu_item_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_menu_item_new") (Utf8.PolyML.cInOptPtr &&> Utf8.PolyML.cInOptPtr --> GioMenuItemClass.PolyML.cPtr)
      val newFromModel_ = call (getSymbol "g_menu_item_new_from_model") (GioMenuModelClass.PolyML.cPtr &&> GInt.PolyML.cVal --> GioMenuItemClass.PolyML.cPtr)
      val newSection_ = call (getSymbol "g_menu_item_new_section") (Utf8.PolyML.cInOptPtr &&> GioMenuModelClass.PolyML.cPtr --> GioMenuItemClass.PolyML.cPtr)
      val newSubmenu_ = call (getSymbol "g_menu_item_new_submenu") (Utf8.PolyML.cInOptPtr &&> GioMenuModelClass.PolyML.cPtr --> GioMenuItemClass.PolyML.cPtr)
      val getAttributeValue_ =
        call (getSymbol "g_menu_item_get_attribute_value")
          (
            GioMenuItemClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibVariantTypeRecord.PolyML.cOptPtr
             --> GLibVariantRecord.PolyML.cPtr
          )
      val getLink_ = call (getSymbol "g_menu_item_get_link") (GioMenuItemClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioMenuModelClass.PolyML.cPtr)
      val setActionAndTargetValue_ =
        call (getSymbol "g_menu_item_set_action_and_target_value")
          (
            GioMenuItemClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GLibVariantRecord.PolyML.cOptPtr
             --> cVoid
          )
      val setAttributeValue_ =
        call (getSymbol "g_menu_item_set_attribute_value")
          (
            GioMenuItemClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibVariantRecord.PolyML.cOptPtr
             --> cVoid
          )
      val setDetailedAction_ = call (getSymbol "g_menu_item_set_detailed_action") (GioMenuItemClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setIcon_ = call (getSymbol "g_menu_item_set_icon") (GioMenuItemClass.PolyML.cPtr &&> GioIconClass.PolyML.cPtr --> cVoid)
      val setLabel_ = call (getSymbol "g_menu_item_set_label") (GioMenuItemClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setLink_ =
        call (getSymbol "g_menu_item_set_link")
          (
            GioMenuItemClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioMenuModelClass.PolyML.cOptPtr
             --> cVoid
          )
      val setSection_ = call (getSymbol "g_menu_item_set_section") (GioMenuItemClass.PolyML.cPtr &&> GioMenuModelClass.PolyML.cOptPtr --> cVoid)
      val setSubmenu_ = call (getSymbol "g_menu_item_set_submenu") (GioMenuItemClass.PolyML.cPtr &&> GioMenuModelClass.PolyML.cOptPtr --> cVoid)
    end
    type 'a class = 'a GioMenuItemClass.class
    type 'a icon_class = 'a GioIconClass.class
    type 'a menu_model_class = 'a GioMenuModelClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (label, detailedAction) = (Utf8.FFI.withOptPtr &&&> Utf8.FFI.withOptPtr ---> GioMenuItemClass.FFI.fromPtr true) new_ (label & detailedAction)
    fun newFromModel (model, itemIndex) = (GioMenuModelClass.FFI.withPtr &&&> GInt.FFI.withVal ---> GioMenuItemClass.FFI.fromPtr true) newFromModel_ (model & itemIndex)
    fun newSection (label, section) = (Utf8.FFI.withOptPtr &&&> GioMenuModelClass.FFI.withPtr ---> GioMenuItemClass.FFI.fromPtr true) newSection_ (label & section)
    fun newSubmenu (label, submenu) = (Utf8.FFI.withOptPtr &&&> GioMenuModelClass.FFI.withPtr ---> GioMenuItemClass.FFI.fromPtr true) newSubmenu_ (label & submenu)
    fun getAttributeValue self (attribute, expectedType) =
      (
        GioMenuItemClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibVariantTypeRecord.FFI.withOptPtr
         ---> GLibVariantRecord.FFI.fromPtr true
      )
        getAttributeValue_
        (
          self
           & attribute
           & expectedType
        )
    fun getLink self link = (GioMenuItemClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GioMenuModelClass.FFI.fromPtr true) getLink_ (self & link)
    fun setActionAndTargetValue self (action, targetValue) =
      (
        GioMenuItemClass.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GLibVariantRecord.FFI.withOptPtr
         ---> I
      )
        setActionAndTargetValue_
        (
          self
           & action
           & targetValue
        )
    fun setAttributeValue self (attribute, value) =
      (
        GioMenuItemClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibVariantRecord.FFI.withOptPtr
         ---> I
      )
        setAttributeValue_
        (
          self
           & attribute
           & value
        )
    fun setDetailedAction self detailedAction = (GioMenuItemClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setDetailedAction_ (self & detailedAction)
    fun setIcon self icon = (GioMenuItemClass.FFI.withPtr &&&> GioIconClass.FFI.withPtr ---> I) setIcon_ (self & icon)
    fun setLabel self label = (GioMenuItemClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setLabel_ (self & label)
    fun setLink self (link, model) =
      (
        GioMenuItemClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GioMenuModelClass.FFI.withOptPtr
         ---> I
      )
        setLink_
        (
          self
           & link
           & model
        )
    fun setSection self section = (GioMenuItemClass.FFI.withPtr &&&> GioMenuModelClass.FFI.withOptPtr ---> I) setSection_ (self & section)
    fun setSubmenu self submenu = (GioMenuItemClass.FFI.withPtr &&&> GioMenuModelClass.FFI.withOptPtr ---> I) setSubmenu_ (self & submenu)
  end