structure GtkSourceStyleScheme :>
  GTK_SOURCE_STYLE_SCHEME
    where type 'a class_t = 'a GtkSourceStyleSchemeClass.t
    where type 'a styleclass_t = 'a GtkSourceStyleClass.t =
  struct
    val getType_ = _import "gtk_source_style_scheme_get_type" : unit -> GObjectType.C.val_;
    val getDescription_ = _import "gtk_source_style_scheme_get_description" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getFilename_ = _import "gtk_source_style_scheme_get_filename" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getId_ = _import "gtk_source_style_scheme_get_id" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getName_ = _import "gtk_source_style_scheme_get_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getStyle_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_style_scheme_get_style" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class_t = 'a GtkSourceStyleSchemeClass.t
    type 'a styleclass_t = 'a GtkSourceStyleClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getDescription self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getDescription_ self
    fun getFilename self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getFilename_ self
    fun getId self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getId_ self
    fun getName self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getName_ self
    fun getStyle self styleId = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GtkSourceStyleClass.C.fromPtr false) getStyle_ (self & styleId)
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