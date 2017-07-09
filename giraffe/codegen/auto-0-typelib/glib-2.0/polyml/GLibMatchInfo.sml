structure GLibMatchInfo :>
  G_LIB_MATCH_INFO
    where type t = GLibMatchInfoRecord.t
    where type regex_t = GLibRegexRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_match_info_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val expandReferences_ =
        call (getSymbol "g_match_info_expand_references")
          (
            GLibMatchInfoRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val fetch_ = call (getSymbol "g_match_info_fetch") (GLibMatchInfoRecord.PolyML.cPtr &&> GInt32.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val fetchNamed_ = call (getSymbol "g_match_info_fetch_named") (GLibMatchInfoRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val fetchNamedPos_ =
        call (getSymbol "g_match_info_fetch_named_pos")
          (
            GLibMatchInfoRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val fetchPos_ =
        call (getSymbol "g_match_info_fetch_pos")
          (
            GLibMatchInfoRecord.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val getMatchCount_ = call (getSymbol "g_match_info_get_match_count") (GLibMatchInfoRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getRegex_ = call (getSymbol "g_match_info_get_regex") (GLibMatchInfoRecord.PolyML.cPtr --> GLibRegexRecord.PolyML.cPtr)
      val getString_ = call (getSymbol "g_match_info_get_string") (GLibMatchInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val isPartialMatch_ = call (getSymbol "g_match_info_is_partial_match") (GLibMatchInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val matches_ = call (getSymbol "g_match_info_matches") (GLibMatchInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val next_ = call (getSymbol "g_match_info_next") (GLibMatchInfoRecord.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GBool.PolyML.cVal)
    end
    type t = GLibMatchInfoRecord.t
    type regex_t = GLibRegexRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun expandReferences self stringToExpand =
      (
        GLibMatchInfoRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> Utf8.FFI.fromPtr 1
      )
        expandReferences_
        (
          self
           & stringToExpand
           & []
        )
    fun fetch self matchNum = (GLibMatchInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> Utf8.FFI.fromPtr 1) fetch_ (self & matchNum)
    fun fetchNamed self name = (GLibMatchInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) fetchNamed_ (self & name)
    fun fetchNamedPos self name =
      let
        val startPos
         & endPos
         & retVal =
          (
            GLibMatchInfoRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            fetchNamedPos_
            (
              self
               & name
               & GInt32.null
               & GInt32.null
            )
      in
        if retVal then SOME (startPos, endPos) else NONE
      end
    fun fetchPos self matchNum =
      let
        val startPos
         & endPos
         & retVal =
          (
            GLibMatchInfoRecord.FFI.withPtr
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            fetchPos_
            (
              self
               & matchNum
               & GInt32.null
               & GInt32.null
            )
      in
        if retVal then SOME (startPos, endPos) else NONE
      end
    fun getMatchCount self = (GLibMatchInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getMatchCount_ self
    fun getRegex self = (GLibMatchInfoRecord.FFI.withPtr ---> GLibRegexRecord.FFI.fromPtr true) getRegex_ self
    fun getString self = (GLibMatchInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getString_ self
    fun isPartialMatch self = (GLibMatchInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) isPartialMatch_ self
    fun matches self = (GLibMatchInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) matches_ self
    fun next self = (GLibMatchInfoRecord.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GBool.FFI.fromVal) next_ (self & [])
  end
