structure GLibMarkupParseContext :>
  G_LIB_MARKUP_PARSE_CONTEXT
    where type t = GLibMarkupParseContextRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_markup_parse_context_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val endParse_ = call (getSymbol "g_markup_parse_context_end_parse") (GLibMarkupParseContextRecord.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GBool.PolyML.cVal)
      val getElement_ = call (getSymbol "g_markup_parse_context_get_element") (GLibMarkupParseContextRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val parse_ =
        call (getSymbol "g_markup_parse_context_parse")
          (
            GLibMarkupParseContextRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt64.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
    end
    type t = GLibMarkupParseContextRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun endParse self = (GLibMarkupParseContextRecord.FFI.withPtr &&&> GLibErrorRecord.handleError ---> ignore) endParse_ (self & [])
    fun getElement self = (GLibMarkupParseContextRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getElement_ self
    fun parse self (text, textLen) =
      (
        GLibMarkupParseContextRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt64.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        parse_
        (
          self
           & text
           & textLen
           & []
        )
  end