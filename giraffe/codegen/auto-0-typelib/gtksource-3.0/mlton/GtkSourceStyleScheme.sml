structure GtkSourceStyleScheme :>
  GTK_SOURCE_STYLE_SCHEME
    where type 'a class = 'a GtkSourceStyleSchemeClass.class
    where type 'a style_class = 'a GtkSourceStyleClass.class =
  struct
    structure Utf8CVectorType =
      CPointerCVectorType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVector = CVector(Utf8CVectorType)
    val getType_ = _import "gtk_source_style_scheme_get_type" : unit -> GObjectType.FFI.val_;
    val getAuthors_ = _import "gtk_source_style_scheme_get_authors" : GtkSourceStyleSchemeClass.FFI.notnull GtkSourceStyleSchemeClass.FFI.p -> Utf8CVector.FFI.notnull Utf8CVector.FFI.out_p;
    val getDescription_ = _import "gtk_source_style_scheme_get_description" : GtkSourceStyleSchemeClass.FFI.notnull GtkSourceStyleSchemeClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getFilename_ = _import "gtk_source_style_scheme_get_filename" : GtkSourceStyleSchemeClass.FFI.notnull GtkSourceStyleSchemeClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getId_ = _import "gtk_source_style_scheme_get_id" : GtkSourceStyleSchemeClass.FFI.notnull GtkSourceStyleSchemeClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getName_ = _import "gtk_source_style_scheme_get_name" : GtkSourceStyleSchemeClass.FFI.notnull GtkSourceStyleSchemeClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getStyle_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_style_scheme_get_style" :
              GtkSourceStyleSchemeClass.FFI.notnull GtkSourceStyleSchemeClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GtkSourceStyleClass.FFI.notnull GtkSourceStyleClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkSourceStyleSchemeClass.class
    type 'a style_class = 'a GtkSourceStyleClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getAuthors self = (GtkSourceStyleSchemeClass.FFI.withPtr ---> Utf8CVector.FFI.fromPtr 0) getAuthors_ self
    fun getDescription self = (GtkSourceStyleSchemeClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getDescription_ self
    fun getFilename self = (GtkSourceStyleSchemeClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getFilename_ self
    fun getId self = (GtkSourceStyleSchemeClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getId_ self
    fun getName self = (GtkSourceStyleSchemeClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getName_ self
    fun getStyle self styleId = (GtkSourceStyleSchemeClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GtkSourceStyleClass.FFI.fromPtr false) getStyle_ (self & styleId)
    local
      open Property
    in
      val descriptionProp = {get = fn x => get "description" stringOpt x}
      val filenameProp = {get = fn x => get "filename" stringOpt x}
      val idProp =
        {
          get = fn x => get "id" stringOpt x,
          set = fn x => set "id" stringOpt x
        }
      val nameProp = {get = fn x => get "name" stringOpt x}
    end
  end
