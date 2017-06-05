structure GtkSourceLanguage :>
  GTK_SOURCE_LANGUAGE
    where type 'a class = 'a GtkSourceLanguageClass.class =
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
      val getType_ = call (load_sym libgtksourceview "gtk_source_language_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getGlobs_ = call (load_sym libgtksourceview "gtk_source_language_get_globs") (GtkSourceLanguageClass.PolyML.cPtr --> Utf8CVector.PolyML.cOutPtr)
      val getHidden_ = call (load_sym libgtksourceview "gtk_source_language_get_hidden") (GtkSourceLanguageClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getId_ = call (load_sym libgtksourceview "gtk_source_language_get_id") (GtkSourceLanguageClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getMetadata_ = call (load_sym libgtksourceview "gtk_source_language_get_metadata") (GtkSourceLanguageClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getMimeTypes_ = call (load_sym libgtksourceview "gtk_source_language_get_mime_types") (GtkSourceLanguageClass.PolyML.cPtr --> Utf8CVector.PolyML.cOutPtr)
      val getName_ = call (load_sym libgtksourceview "gtk_source_language_get_name") (GtkSourceLanguageClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getSection_ = call (load_sym libgtksourceview "gtk_source_language_get_section") (GtkSourceLanguageClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getStyleIds_ = call (load_sym libgtksourceview "gtk_source_language_get_style_ids") (GtkSourceLanguageClass.PolyML.cPtr --> Utf8CVector.PolyML.cOutPtr)
      val getStyleName_ = call (load_sym libgtksourceview "gtk_source_language_get_style_name") (GtkSourceLanguageClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
    end
    type 'a class = 'a GtkSourceLanguageClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getGlobs self = (GtkSourceLanguageClass.FFI.withPtr ---> Utf8CVector.FFI.fromPtr 2) getGlobs_ self
    fun getHidden self = (GtkSourceLanguageClass.FFI.withPtr ---> GBool.FFI.fromVal) getHidden_ self
    fun getId self = (GtkSourceLanguageClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getId_ self
    fun getMetadata self name = (GtkSourceLanguageClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getMetadata_ (self & name)
    fun getMimeTypes self = (GtkSourceLanguageClass.FFI.withPtr ---> Utf8CVector.FFI.fromPtr 2) getMimeTypes_ self
    fun getName self = (GtkSourceLanguageClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getName_ self
    fun getSection self = (GtkSourceLanguageClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getSection_ self
    fun getStyleIds self = (GtkSourceLanguageClass.FFI.withPtr ---> Utf8CVector.FFI.fromPtr 2) getStyleIds_ self
    fun getStyleName self styleId = (GtkSourceLanguageClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getStyleName_ (self & styleId)
    local
      open Property
    in
      val hiddenProp = {get = fn x => get "hidden" boolean x}
      val idProp = {get = fn x => get "id" stringOpt x}
      val nameProp = {get = fn x => get "name" stringOpt x}
      val sectionProp = {get = fn x => get "section" stringOpt x}
    end
  end
