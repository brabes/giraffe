structure GtkSourceMark :>
  GTK_SOURCE_MARK
    where type 'a class = 'a GtkSourceMarkClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_source_mark_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_source_mark_new") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> GtkSourceMarkClass.PolyML.cPtr)
      val getCategory_ = call (getSymbol "gtk_source_mark_get_category") (GtkSourceMarkClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val next_ = call (getSymbol "gtk_source_mark_next") (GtkSourceMarkClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> GtkSourceMarkClass.PolyML.cPtr)
      val prev_ = call (getSymbol "gtk_source_mark_prev") (GtkSourceMarkClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GtkSourceMarkClass.PolyML.cPtr)
    end
    type 'a class = 'a GtkSourceMarkClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new name category = (Utf8.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GtkSourceMarkClass.FFI.fromPtr true) new_ (name & category)
    fun getCategory self = (GtkSourceMarkClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getCategory_ self
    fun next self category = (GtkSourceMarkClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> GtkSourceMarkClass.FFI.fromPtr false) next_ (self & category)
    fun prev self category = (GtkSourceMarkClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GtkSourceMarkClass.FFI.fromPtr false) prev_ (self & category)
    local
      open Property
    in
      val categoryProp =
        {
          get = fn x => get "category" stringOpt x,
          set = fn x => set "category" stringOpt x
        }
    end
  end
