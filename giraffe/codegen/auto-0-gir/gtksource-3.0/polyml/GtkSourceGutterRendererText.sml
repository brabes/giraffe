structure GtkSourceGutterRendererText :>
  GTK_SOURCE_GUTTER_RENDERER_TEXT
    where type 'a class = 'a GtkSourceGutterRendererTextClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_text_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtksourceview "gtk_source_gutter_renderer_text_new") (PolyMLFFI.cVoid --> GtkSourceGutterRendererClass.PolyML.cPtr)
      val setMarkup_ =
        call (load_sym libgtksourceview "gtk_source_gutter_renderer_text_set_markup")
          (
            GtkSourceGutterRendererTextClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setText_ =
        call (load_sym libgtksourceview "gtk_source_gutter_renderer_text_set_text")
          (
            GtkSourceGutterRendererTextClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
    end
    type 'a class = 'a GtkSourceGutterRendererTextClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkSourceGutterRendererTextClass.FFI.fromPtr true) new_ ()
    fun setMarkup self markup length =
      (
        GtkSourceGutterRendererTextClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
         ---> I
      )
        setMarkup_
        (
          self
           & markup
           & length
        )
    fun setText self text length =
      (
        GtkSourceGutterRendererTextClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
         ---> I
      )
        setText_
        (
          self
           & text
           & length
        )
    local
      open Property
    in
      val markupProp =
        {
          get = fn x => get "markup" stringOpt x,
          set = fn x => set "markup" stringOpt x
        }
      val textProp =
        {
          get = fn x => get "text" stringOpt x,
          set = fn x => set "text" stringOpt x
        }
    end
  end
