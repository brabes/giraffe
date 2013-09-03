structure GioCharsetConverter :>
  GIO_CHARSET_CONVERTER
    where type 'a class_t = 'a GioCharsetConverterClass.t
    where type 'a converterclass_t = 'a GioConverterClass.t
    where type 'a initableclass_t = 'a GioInitableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_charset_converter_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ =
        call (load_sym libgio "g_charset_converter_new")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val getNumFallbacks_ = call (load_sym libgio "g_charset_converter_get_num_fallbacks") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.UInt32.VAL)
      val getUseFallback_ = call (load_sym libgio "g_charset_converter_get_use_fallback") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val setUseFallback_ = call (load_sym libgio "g_charset_converter_set_use_fallback") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GioCharsetConverterClass.t
    type 'a converterclass_t = 'a GioConverterClass.t
    type 'a initableclass_t = 'a GioInitableClass.t
    fun asConverter self = (GObjectObjectClass.C.withPtr ---> GioConverterClass.C.fromPtr false) I self
    fun asInitable self = (GObjectObjectClass.C.withPtr ---> GioInitableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new toCharset fromCharset =
      (
        FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> GioCharsetConverterClass.C.fromPtr true
      )
        new_
        (
          toCharset
           & fromCharset
           & []
        )
    fun getNumFallbacks self = (GObjectObjectClass.C.withPtr ---> FFI.UInt32.fromVal) getNumFallbacks_ self
    fun getUseFallback self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getUseFallback_ self
    fun setUseFallback self useFallback = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setUseFallback_ (self & useFallback)
    local
      open Property
    in
      val fromCharsetProp =
        {
          get = fn x => get "from-charset" stringOpt x,
          set = fn x => set "from-charset" stringOpt x
        }
      val toCharsetProp =
        {
          get = fn x => get "to-charset" stringOpt x,
          set = fn x => set "to-charset" stringOpt x
        }
      val useFallbackProp =
        {
          get = fn x => get "use-fallback" boolean x,
          set = fn x => set "use-fallback" boolean x
        }
    end
  end
