structure GLibRegex :>
  G_LIB_REGEX
    where type t = GLibRegexRecord.t
    where type match_info_t = GLibMatchInfoRecord.t
    where type regex_match_flags_t = GLibRegexMatchFlags.t
    where type regex_compile_flags_t = GLibRegexCompileFlags.t =
  struct
    structure Utf8CVectorNType =
      CPointerCVectorNType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVectorN = CVectorN(Utf8CVectorNType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_regex_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (getSymbol "g_regex_new")
          (
            Utf8.PolyML.cInPtr
             &&> GLibRegexCompileFlags.PolyML.cVal
             &&> GLibRegexMatchFlags.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibRegexRecord.PolyML.cPtr
          )
      val getCaptureCount_ = call (getSymbol "g_regex_get_capture_count") (GLibRegexRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getCompileFlags_ = call (getSymbol "g_regex_get_compile_flags") (GLibRegexRecord.PolyML.cPtr --> GLibRegexCompileFlags.PolyML.cVal)
      val getMatchFlags_ = call (getSymbol "g_regex_get_match_flags") (GLibRegexRecord.PolyML.cPtr --> GLibRegexMatchFlags.PolyML.cVal)
      val getMaxBackref_ = call (getSymbol "g_regex_get_max_backref") (GLibRegexRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getPattern_ = call (getSymbol "g_regex_get_pattern") (GLibRegexRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getStringNumber_ = call (getSymbol "g_regex_get_string_number") (GLibRegexRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GInt.PolyML.cVal)
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
             &&> Utf8CVectorN.PolyML.cInPtr
             &&> GSSize.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GLibRegexMatchFlags.PolyML.cVal
             &&> GLibMatchInfoRecord.PolyML.cOutRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val matchFull_ =
        call (getSymbol "g_regex_match_full")
          (
            GLibRegexRecord.PolyML.cPtr
             &&> Utf8CVectorN.PolyML.cInPtr
             &&> GSSize.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GLibRegexMatchFlags.PolyML.cVal
             &&> GLibMatchInfoRecord.PolyML.cOutRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val replace_ =
        call (getSymbol "g_regex_replace")
          (
            GLibRegexRecord.PolyML.cPtr
             &&> Utf8CVectorN.PolyML.cInPtr
             &&> GSSize.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> GLibRegexMatchFlags.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val replaceLiteral_ =
        call (getSymbol "g_regex_replace_literal")
          (
            GLibRegexRecord.PolyML.cPtr
             &&> Utf8CVectorN.PolyML.cInPtr
             &&> GSSize.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> GLibRegexMatchFlags.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val checkReplacement_ =
        call (getSymbol "g_regex_check_replacement")
          (
            Utf8.PolyML.cInPtr
             &&> GBool.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val escapeNul_ = call (getSymbol "g_regex_escape_nul") (Utf8.PolyML.cInPtr &&> GInt.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val matchSimple_ =
        call (getSymbol "g_regex_match_simple")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibRegexCompileFlags.PolyML.cVal
             &&> GLibRegexMatchFlags.PolyML.cVal
             --> GBool.PolyML.cVal
          )
    end
    type t = GLibRegexRecord.t
    type match_info_t = GLibMatchInfoRecord.t
    type regex_match_flags_t = GLibRegexMatchFlags.t
    type regex_compile_flags_t = GLibRegexCompileFlags.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new pattern compileOptions matchOptions =
      (
        Utf8.FFI.withPtr
         &&&> GLibRegexCompileFlags.FFI.withVal
         &&&> GLibRegexMatchFlags.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GLibRegexRecord.FFI.fromPtr true
      )
        new_
        (
          pattern
           & compileOptions
           & matchOptions
           & []
        )
    fun getCaptureCount self = (GLibRegexRecord.FFI.withPtr ---> GInt.FFI.fromVal) getCaptureCount_ self
    fun getCompileFlags self = (GLibRegexRecord.FFI.withPtr ---> GLibRegexCompileFlags.FFI.fromVal) getCompileFlags_ self
    fun getMatchFlags self = (GLibRegexRecord.FFI.withPtr ---> GLibRegexMatchFlags.FFI.fromVal) getMatchFlags_ self
    fun getMaxBackref self = (GLibRegexRecord.FFI.withPtr ---> GInt.FFI.fromVal) getMaxBackref_ self
    fun getPattern self = (GLibRegexRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getPattern_ self
    fun getStringNumber self name = (GLibRegexRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GInt.FFI.fromVal) getStringNumber_ (self & name)
    fun match self string matchOptions =
      let
        val matchInfo & retVal =
          (
            GLibRegexRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GLibRegexMatchFlags.FFI.withVal
             &&&> GLibMatchInfoRecord.FFI.withRefOptPtr
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
    fun matchAll self string matchOptions =
      let
        val matchInfo & retVal =
          (
            GLibRegexRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GLibRegexMatchFlags.FFI.withVal
             &&&> GLibMatchInfoRecord.FFI.withRefOptPtr
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
    fun matchAllFull self string startPosition matchOptions =
      let
        val stringLen = LargeInt.fromInt (Utf8CVectorN.length string)
        val matchInfo & retVal =
          (
            GLibRegexRecord.FFI.withPtr
             &&&> Utf8CVectorN.FFI.withPtr
             &&&> GSSize.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> GLibRegexMatchFlags.FFI.withVal
             &&&> GLibMatchInfoRecord.FFI.withRefOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GLibMatchInfoRecord.FFI.fromPtr true && GBool.FFI.fromVal
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
        if retVal then SOME matchInfo else NONE
      end
    fun matchFull self string startPosition matchOptions =
      let
        val stringLen = LargeInt.fromInt (Utf8CVectorN.length string)
        val matchInfo & retVal =
          (
            GLibRegexRecord.FFI.withPtr
             &&&> Utf8CVectorN.FFI.withPtr
             &&&> GSSize.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> GLibRegexMatchFlags.FFI.withVal
             &&&> GLibMatchInfoRecord.FFI.withRefOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GLibMatchInfoRecord.FFI.fromPtr true && GBool.FFI.fromVal
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
        if retVal then SOME matchInfo else NONE
      end
    fun replace self string startPosition replacement matchOptions =
      let
        val stringLen = LargeInt.fromInt (Utf8CVectorN.length string)
        val retVal =
          (
            GLibRegexRecord.FFI.withPtr
             &&&> Utf8CVectorN.FFI.withPtr
             &&&> GSSize.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> Utf8.FFI.withPtr
             &&&> GLibRegexMatchFlags.FFI.withVal
             &&&> GLibErrorRecord.handleError
             ---> Utf8.FFI.fromPtr 1
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
    fun replaceLiteral self string startPosition replacement matchOptions =
      let
        val stringLen = LargeInt.fromInt (Utf8CVectorN.length string)
        val retVal =
          (
            GLibRegexRecord.FFI.withPtr
             &&&> Utf8CVectorN.FFI.withPtr
             &&&> GSSize.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> Utf8.FFI.withPtr
             &&&> GLibRegexMatchFlags.FFI.withVal
             &&&> GLibErrorRecord.handleError
             ---> Utf8.FFI.fromPtr 1
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
    fun checkReplacement replacement =
      let
        val hasReferences & retVal =
          (
            Utf8.FFI.withPtr
             &&&> GBool.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GBool.FFI.fromVal && GBool.FFI.fromVal
          )
            checkReplacement_
            (
              replacement
               & GBool.null
               & []
            )
      in
        if retVal then SOME hasReferences else NONE
      end
    fun escapeNul string length = (Utf8.FFI.withPtr &&&> GInt.FFI.withVal ---> Utf8.FFI.fromPtr 1) escapeNul_ (string & length)
    fun matchSimple pattern string compileOptions matchOptions =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
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
  end
