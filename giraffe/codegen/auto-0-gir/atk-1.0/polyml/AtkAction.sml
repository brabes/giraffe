structure AtkAction :>
  ATK_ACTION
    where type 'a class = 'a AtkActionClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "atk_action_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val doAction_ = call (getSymbol "atk_action_do_action") (AtkActionClass.PolyML.cPtr &&> GInt.PolyML.cVal --> GBool.PolyML.cVal)
      val getDescription_ = call (getSymbol "atk_action_get_description") (AtkActionClass.PolyML.cPtr &&> GInt.PolyML.cVal --> Utf8.PolyML.cOutOptPtr)
      val getKeybinding_ = call (getSymbol "atk_action_get_keybinding") (AtkActionClass.PolyML.cPtr &&> GInt.PolyML.cVal --> Utf8.PolyML.cOutOptPtr)
      val getLocalizedName_ = call (getSymbol "atk_action_get_localized_name") (AtkActionClass.PolyML.cPtr &&> GInt.PolyML.cVal --> Utf8.PolyML.cOutOptPtr)
      val getNActions_ = call (getSymbol "atk_action_get_n_actions") (AtkActionClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getName_ = call (getSymbol "atk_action_get_name") (AtkActionClass.PolyML.cPtr &&> GInt.PolyML.cVal --> Utf8.PolyML.cOutOptPtr)
      val setDescription_ =
        call (getSymbol "atk_action_set_description")
          (
            AtkActionClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> GBool.PolyML.cVal
          )
    end
    type 'a class = 'a AtkActionClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun doAction self i = (AtkActionClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> GBool.FFI.fromVal) doAction_ (self & i)
    fun getDescription self i = (AtkActionClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> Utf8.FFI.fromOptPtr 0) getDescription_ (self & i) before AtkActionClass.FFI.touchPtr self
    fun getKeybinding self i = (AtkActionClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> Utf8.FFI.fromOptPtr 0) getKeybinding_ (self & i) before AtkActionClass.FFI.touchPtr self
    fun getLocalizedName self i = (AtkActionClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> Utf8.FFI.fromOptPtr 0) getLocalizedName_ (self & i) before AtkActionClass.FFI.touchPtr self
    fun getNActions self = (AtkActionClass.FFI.withPtr false ---> GInt.FFI.fromVal) getNActions_ self
    fun getName self i = (AtkActionClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> Utf8.FFI.fromOptPtr 0) getName_ (self & i) before AtkActionClass.FFI.touchPtr self
    fun setDescription self (i, desc) =
      (
        AtkActionClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         ---> GBool.FFI.fromVal
      )
        setDescription_
        (
          self
           & i
           & desc
        )
  end
