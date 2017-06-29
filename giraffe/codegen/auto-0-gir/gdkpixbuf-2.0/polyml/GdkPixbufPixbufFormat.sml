structure GdkPixbufPixbufFormat :>
  GDK_PIXBUF_PIXBUF_FORMAT
    where type t = GdkPixbufPixbufFormatRecord.t =
  struct
    structure Utf8CVectorType =
      CPointerCVectorType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVector = CVector(Utf8CVectorType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_pixbuf_format_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val copy_ = call (getSymbol "gdk_pixbuf_format_copy") (GdkPixbufPixbufFormatRecord.PolyML.cPtr --> GdkPixbufPixbufFormatRecord.PolyML.cPtr)
      val getDescription_ = call (getSymbol "gdk_pixbuf_format_get_description") (GdkPixbufPixbufFormatRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getExtensions_ = call (getSymbol "gdk_pixbuf_format_get_extensions") (GdkPixbufPixbufFormatRecord.PolyML.cPtr --> Utf8CVector.PolyML.cOutPtr)
      val getLicense_ = call (getSymbol "gdk_pixbuf_format_get_license") (GdkPixbufPixbufFormatRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getMimeTypes_ = call (getSymbol "gdk_pixbuf_format_get_mime_types") (GdkPixbufPixbufFormatRecord.PolyML.cPtr --> Utf8CVector.PolyML.cOutPtr)
      val getName_ = call (getSymbol "gdk_pixbuf_format_get_name") (GdkPixbufPixbufFormatRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val isDisabled_ = call (getSymbol "gdk_pixbuf_format_is_disabled") (GdkPixbufPixbufFormatRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val isScalable_ = call (getSymbol "gdk_pixbuf_format_is_scalable") (GdkPixbufPixbufFormatRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val isWritable_ = call (getSymbol "gdk_pixbuf_format_is_writable") (GdkPixbufPixbufFormatRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val setDisabled_ = call (getSymbol "gdk_pixbuf_format_set_disabled") (GdkPixbufPixbufFormatRecord.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type t = GdkPixbufPixbufFormatRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun copy self = (GdkPixbufPixbufFormatRecord.FFI.withPtr ---> GdkPixbufPixbufFormatRecord.FFI.fromPtr true) copy_ self
    fun getDescription self = (GdkPixbufPixbufFormatRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getDescription_ self
    fun getExtensions self = (GdkPixbufPixbufFormatRecord.FFI.withPtr ---> Utf8CVector.FFI.fromPtr 2) getExtensions_ self
    fun getLicense self = (GdkPixbufPixbufFormatRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getLicense_ self
    fun getMimeTypes self = (GdkPixbufPixbufFormatRecord.FFI.withPtr ---> Utf8CVector.FFI.fromPtr 2) getMimeTypes_ self
    fun getName self = (GdkPixbufPixbufFormatRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getName_ self
    fun isDisabled self = (GdkPixbufPixbufFormatRecord.FFI.withPtr ---> GBool.FFI.fromVal) isDisabled_ self
    fun isScalable self = (GdkPixbufPixbufFormatRecord.FFI.withPtr ---> GBool.FFI.fromVal) isScalable_ self
    fun isWritable self = (GdkPixbufPixbufFormatRecord.FFI.withPtr ---> GBool.FFI.fromVal) isWritable_ self
    fun setDisabled self disabled = (GdkPixbufPixbufFormatRecord.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setDisabled_ (self & disabled)
  end
