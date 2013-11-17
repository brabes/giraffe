structure GtkSourceMark :>
  GTK_SOURCE_MARK
    where type 'a class_t = 'a GtkSourceMarkClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_mark_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtksourceview "gtk_source_mark_new") (FFI.String.PolyML.INPTR &&> FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val getCategory_ = call (load_sym libgtksourceview "gtk_source_mark_get_category") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val next_ = call (load_sym libgtksourceview "gtk_source_mark_next") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INOPTPTR --> GObjectObjectClass.PolyML.PTR)
      val prev_ = call (load_sym libgtksourceview "gtk_source_mark_prev") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
    end
    type 'a class_t = 'a GtkSourceMarkClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new name category = (FFI.String.C.withConstPtr &&&> FFI.String.C.withConstPtr ---> GtkSourceMarkClass.C.fromPtr true) new_ (name & category)
    fun getCategory self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getCategory_ self
    fun next self category = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstOptPtr ---> GtkSourceMarkClass.C.fromPtr false) next_ (self & category)
    fun prev self category = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GtkSourceMarkClass.C.fromPtr false) prev_ (self & category)
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
