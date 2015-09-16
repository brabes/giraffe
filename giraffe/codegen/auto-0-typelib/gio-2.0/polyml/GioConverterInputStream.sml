structure GioConverterInputStream :>
  GIO_CONVERTER_INPUT_STREAM
    where type 'a class_t = 'a GioConverterInputStreamClass.t
    where type 'a input_stream_class_t = 'a GioInputStreamClass.t
    where type 'a converter_class_t = 'a GioConverterClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_converter_input_stream_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_converter_input_stream_new") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getConverter_ = call (load_sym libgio "g_converter_input_stream_get_converter") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
    end
    type 'a class_t = 'a GioConverterInputStreamClass.t
    type 'a input_stream_class_t = 'a GioInputStreamClass.t
    type 'a converter_class_t = 'a GioConverterClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new baseStream converter = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> GioConverterInputStreamClass.C.fromPtr true) new_ (baseStream & converter)
    fun getConverter self = (GObjectObjectClass.C.withPtr ---> GioConverterClass.C.fromPtr false) getConverter_ self
    local
      open Property
    in
      val converterProp =
        {
          get = fn x => get "converter" GioConverterClass.tOpt x,
          set = fn x => set "converter" GioConverterClass.tOpt x
        }
    end
  end
