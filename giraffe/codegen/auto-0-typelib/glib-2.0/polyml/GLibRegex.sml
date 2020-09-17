structure GLibRegex :>
  G_LIB_REGEX
    where type t = GLibRegexRecord.t
    where type match_info_t = GLibMatchInfoRecord.t
    where type regex_match_flags_t = GLibRegexMatchFlags.t
    where type regex_compile_flags_t = GLibRegexCompileFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_regex_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (getSymbol "g_regex_new")
          (
            Utf8.PolyML.cInPtr
             &&> GLibRegexCompileFlags.PolyML.cVal
             &&> GLibRegexMatchFlags.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibRegexRecord.PolyML.cOptPtr
          )
      val getCaptureCount_ = call (getSymbol "g_regex_get_capture_count") (GLibRegexRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getCompileFlags_ = call (getSymbol "g_regex_get_compile_flags") (GLibRegexRecord.PolyML.cPtr --> GLibRegexCompileFlags.PolyML.cVal)
      val getHasCrOrLf_ = call (getSymbol "g_regex_get_has_cr_or_lf") (GLibRegexRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getMatchFlags_ = call (getSymbol "g_regex_get_match_flags") (GLibRegexRecord.PolyML.cPtr --> GLibRegexMatchFlags.PolyML.cVal)
      val getMaxBackref_ = call (getSymbol "g_regex_get_max_backref") (GLibRegexRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getMaxLookbehind_ = call (getSymbol "g_regex_get_max_lookbehind") (GLibRegexRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getPattern_ = call (getSymbol "g_regex_get_pattern") (GLibRegexRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getStringNumber_ = call (getSymbol "g_regex_get_string_number") (GLibRegexRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GInt32.PolyML.cVal)
      val match_ =
        call (getSymbol "g_regex_match")
          (
            GLibRegexRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibRegexMatchFlags.PolyML.cVal
             &&> GLibMatchInfoRecord.PolyML.cOutRef
             --> GBool.PolyML.cVal
          )
      val matchAll_ =
        call (getSymbol "g_regex_match_all")
          (
            GLibRegexRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibRegexMatchFlags.PolyML.cVal
             &&> GLibMatchInfoRecord.PolyML.cOutRef
             --> GBool.PolyML.cVal
          )
      val matchAllFull_ =
        call (getSymbol "g_regex_match_all_full")
          (
            GLibRegexRecord.PolyML.cPtr
             &&> Utf8CPtrArrayN.PolyML.cInPtr
             &&> GInt64.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GLibRegexMatchFlags.PolyML.cVal
             &&> GLibMatchInfoRecord.PolyML.cOutRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val matchFull_ =
        call (getSymbol "g_regex_match_full")
          (
            GLibRegexRecord.PolyML.cPtr
             &&> Utf8CPtrArrayN.PolyML.cInPtr
             &&> GInt64.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GLibRegexMatchFlags.PolyML.cVal
             &&> GLibMatchInfoRecord.PolyML.cOutRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val replace_ =
        call (getSymbol "g_regex_replace")
          (
            GLibRegexRecord.PolyML.cPtr
             &&> Utf8CPtrArrayN.PolyML.cInPtr
             &&> GInt64.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> GLibRegexMatchFlags.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val replaceLiteral_ =
        call (getSymbol "g_regex_replace_literal")
          (
            GLibRegexRecord.PolyML.cPtr
             &&> Utf8CPtrArrayN.PolyML.cInPtr
             &&> GInt64.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> GLibRegexMatchFlags.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val split_ =
        call (getSymbol "g_regex_split")
          (
            GLibRegexRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibRegexMatchFlags.PolyML.cVal
             --> Utf8CPtrArray.PolyML.cOutPtr
          )
      val splitFull_ =
        call (getSymbol "g_regex_split_full")
          (
            GLibRegexRecord.PolyML.cPtr
             &&> Utf8CPtrArrayN.PolyML.cInPtr
             &&> GInt64.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GLibRegexMatchFlags.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8CPtrArray.PolyML.cOutPtr
          )
      val checkReplacement_ =
        call (getSymbol "g_regex_check_replacement")
          (
            Utf8.PolyML.cInPtr
             &&> GBool.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val escapeNul_ = call (getSymbol "g_regex_escape_nul") (Utf8.PolyML.cInPtr &&> GInt32.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val matchSimple_ =
        call (getSymbol "g_regex_match_simple")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibRegexCompileFlags.PolyML.cVal
             &&> GLibRegexMatchFlags.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val splitSimple_ =
        call (getSymbol "g_regex_split_simple")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibRegexCompileFlags.PolyML.cVal
             &&> GLibRegexMatchFlags.PolyML.cVal
             --> Utf8CPtrArray.PolyML.cOutPtr
          )
    end
    type t = GLibRegexRecord.t
    type match_info_t = GLibMatchInfoRecord.t
    type regex_match_flags_t = GLibRegexMatchFlags.t
    type regex_compile_flags_t = GLibRegexCompileFlags.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new
      (
        pattern,
        compileOptions,
        matchOptions
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> GLibRegexCompileFlags.FFI.withVal
         &&&> GLibRegexMatchFlags.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GLibRegexRecord.FFI.fromOptPtr true
      )
        new_
        (
          pattern
           & compileOptions
           & matchOptions
           & []
        )
    fun getCaptureCount self = (GLibRegexRecord.FFI.withPtr false ---> GInt32.FFI.fromVal) getCaptureCount_ self
    fun getCompileFlags self = (GLibRegexRecord.FFI.withPtr false ---> GLibRegexCompileFlags.FFI.fromVal) getCompileFlags_ self
    fun getHasCrOrLf self = (GLibRegexRecord.FFI.withPtr false ---> GBool.FFI.fromVal) getHasCrOrLf_ self
    fun getMatchFlags self = (GLibRegexRecord.FFI.withPtr false ---> GLibRegexMatchFlags.FFI.fromVal) getMatchFlags_ self
    fun getMaxBackref self = (GLibRegexRecord.FFI.withPtr false ---> GInt32.FFI.fromVal) getMaxBackref_ self
    fun getMaxLookbehind self = (GLibRegexRecord.FFI.withPtr false ---> GInt32.FFI.fromVal) getMaxLookbehind_ self
    fun getPattern self = (GLibRegexRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getPattern_ self before GLibRegexRecord.FFI.touchPtr self
    fun getStringNumber self name = (GLibRegexRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GInt32.FFI.fromVal) getStringNumber_ (self & name)
    fun match self (string, matchOptions) =
      let
        val matchInfo & retVal =
          (
            GLibRegexRecord.FFI.withPtr false
             &&&> Utf8.FFI.withPtr 0
             &&&> GLibRegexMatchFlags.FFI.withVal
             &&&> GLibMatchInfoRecord.FFI.withRefOptPtr true
             ---> GLibMatchInfoRecord.FFI.fromPtr true && GBool.FFI.fromVal
          )
            match_
            (
              self
               & string
               & matchOptions
               & NONE
            )
      in
        if retVal then SOME matchInfo else NONE
      end
    fun matchAll self (string, matchOptions) =
      let
        val matchInfo & retVal =
          (
            GLibRegexRecord.FFI.withPtr false
             &&&> Utf8.FFI.withPtr 0
             &&&> GLibRegexMatchFlags.FFI.withVal
             &&&> GLibMatchInfoRecord.FFI.withRefOptPtr true
             ---> GLibMatchInfoRecord.FFI.fromPtr true && GBool.FFI.fromVal
          )
            matchAll_
            (
              self
               & string
               & matchOptions
               & NONE
            )
      in
        if retVal then SOME matchInfo else NONE
      end
    fun matchAllFull
      self
      (
        string,
        startPosition,
        matchOptions
      ) =
      let
        val stringLen = LargeInt.fromInt (Utf8CPtrArrayN.length string)
        val matchInfo & () =
          (
            GLibRegexRecord.FFI.withPtr false
             &&&> Utf8CPtrArrayN.FFI.withPtr 0
             &&&> GInt64.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> GLibRegexMatchFlags.FFI.withVal
             &&&> GLibMatchInfoRecord.FFI.withRefOptPtr true
             &&&> GLibErrorRecord.handleError
             ---> GLibMatchInfoRecord.FFI.fromPtr true && ignore
          )
            matchAllFull_
            (
              self
               & string
               & stringLen
               & startPosition
               & matchOptions
               & NONE
               & []
            )
      in
        matchInfo
      end
    fun matchFull
      self
      (
        string,
        startPosition,
        matchOptions
      ) =
      let
        val stringLen = LargeInt.fromInt (Utf8CPtrArrayN.length string)
        val matchInfo & () =
          (
            GLibRegexRecord.FFI.withPtr false
             &&&> Utf8CPtrArrayN.FFI.withPtr 0
             &&&> GInt64.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> GLibRegexMatchFlags.FFI.withVal
             &&&> GLibMatchInfoRecord.FFI.withRefOptPtr true
             &&&> GLibErrorRecord.handleError
             ---> GLibMatchInfoRecord.FFI.fromPtr true && ignore
          )
            matchFull_
            (
              self
               & string
               & stringLen
               & startPosition
               & matchOptions
               & NONE
               & []
            )
      in
        matchInfo
      end
    fun replace
      self
      (
        string,
        startPosition,
        replacement,
        matchOptions
      ) =
      let
        val stringLen = LargeInt.fromInt (Utf8CPtrArrayN.length string)
        val retVal =
          (
            GLibRegexRecord.FFI.withPtr false
             &&&> Utf8CPtrArrayN.FFI.withPtr 0
             &&&> GInt64.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> Utf8.FFI.withPtr 0
             &&&> GLibRegexMatchFlags.FFI.withVal
             &&&> GLibErrorRecord.handleError
             ---> Utf8.FFI.fromPtr ~1
          )
            replace_
            (
              self
               & string
               & stringLen
               & startPosition
               & replacement
               & matchOptions
               & []
            )
      in
        retVal
      end
    fun replaceLiteral
      self
      (
        string,
        startPosition,
        replacement,
        matchOptions
      ) =
      let
        val stringLen = LargeInt.fromInt (Utf8CPtrArrayN.length string)
        val retVal =
          (
            GLibRegexRecord.FFI.withPtr false
             &&&> Utf8CPtrArrayN.FFI.withPtr 0
             &&&> GInt64.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> Utf8.FFI.withPtr 0
             &&&> GLibRegexMatchFlags.FFI.withVal
             &&&> GLibErrorRecord.handleError
             ---> Utf8.FFI.fromPtr ~1
          )
            replaceLiteral_
            (
              self
               & string
               & stringLen
               & startPosition
               & replacement
               & matchOptions
               & []
            )
      in
        retVal
      end
    fun split self (string, matchOptions) =
      (
        GLibRegexRecord.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibRegexMatchFlags.FFI.withVal
         ---> Utf8CPtrArray.FFI.fromPtr ~1
      )
        split_
        (
          self
           & string
           & matchOptions
        )
    fun splitFull
      self
      (
        string,
        startPosition,
        matchOptions,
        maxTokens
      ) =
      let
        val stringLen = LargeInt.fromInt (Utf8CPtrArrayN.length string)
        val retVal =
          (
            GLibRegexRecord.FFI.withPtr false
             &&&> Utf8CPtrArrayN.FFI.withPtr 0
             &&&> GInt64.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> GLibRegexMatchFlags.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> GLibErrorRecord.handleError
             ---> Utf8CPtrArray.FFI.fromPtr ~1
          )
            splitFull_
            (
              self
               & string
               & stringLen
               & startPosition
               & matchOptions
               & maxTokens
               & []
            )
      in
        retVal
      end
    fun checkReplacement replacement =
      let
        val hasReferences & () =
          (
            Utf8.FFI.withPtr 0
             &&&> GBool.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GBool.FFI.fromVal && ignore
          )
            checkReplacement_
            (
              replacement
               & GBool.null
               & []
            )
      in
        hasReferences
      end
    fun escapeNul (string, length) = (Utf8.FFI.withPtr 0 &&&> GInt32.FFI.withVal ---> Utf8.FFI.fromPtr ~1) escapeNul_ (string & length)
    fun matchSimple
      (
        pattern,
        string,
        compileOptions,
        matchOptions
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibRegexCompileFlags.FFI.withVal
         &&&> GLibRegexMatchFlags.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        matchSimple_
        (
          pattern
           & string
           & compileOptions
           & matchOptions
        )
    fun splitSimple
      (
        pattern,
        string,
        compileOptions,
        matchOptions
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibRegexCompileFlags.FFI.withVal
         &&&> GLibRegexMatchFlags.FFI.withVal
         ---> Utf8CPtrArray.FFI.fromPtr ~1
      )
        splitSimple_
        (
          pattern
           & string
           & compileOptions
           & matchOptions
        )
  end
