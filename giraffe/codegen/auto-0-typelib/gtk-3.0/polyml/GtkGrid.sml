structure GtkGrid :>
  GTK_GRID
    where type 'a class = 'a GtkGridClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type position_type_t = GtkPositionType.t
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_grid_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_grid_new") (PolyMLFFI.cVoid --> GtkWidgetClass.PolyML.cPtr)
      val attach_ =
        call (load_sym libgtk "gtk_grid_attach")
          (
            GtkGridClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val attachNextTo_ =
        call (load_sym libgtk "gtk_grid_attach_next_to")
          (
            GtkGridClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GtkPositionType.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val getColumnHomogeneous_ = call (load_sym libgtk "gtk_grid_get_column_homogeneous") (GtkGridClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getColumnSpacing_ = call (load_sym libgtk "gtk_grid_get_column_spacing") (GtkGridClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getRowHomogeneous_ = call (load_sym libgtk "gtk_grid_get_row_homogeneous") (GtkGridClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getRowSpacing_ = call (load_sym libgtk "gtk_grid_get_row_spacing") (GtkGridClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val insertColumn_ = call (load_sym libgtk "gtk_grid_insert_column") (GtkGridClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> PolyMLFFI.cVoid)
      val insertNextTo_ =
        call (load_sym libgtk "gtk_grid_insert_next_to")
          (
            GtkGridClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GtkPositionType.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val insertRow_ = call (load_sym libgtk "gtk_grid_insert_row") (GtkGridClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> PolyMLFFI.cVoid)
      val setColumnHomogeneous_ = call (load_sym libgtk "gtk_grid_set_column_homogeneous") (GtkGridClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setColumnSpacing_ = call (load_sym libgtk "gtk_grid_set_column_spacing") (GtkGridClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> PolyMLFFI.cVoid)
      val setRowHomogeneous_ = call (load_sym libgtk "gtk_grid_set_row_homogeneous") (GtkGridClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setRowSpacing_ = call (load_sym libgtk "gtk_grid_set_row_spacing") (GtkGridClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkGridClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type position_type_t = GtkPositionType.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkGridClass.FFI.fromPtr false) new_ ()
    fun attach self child left top width height =
      (
        GtkGridClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        attach_
        (
          self
           & child
           & left
           & top
           & width
           & height
        )
    fun attachNextTo self child sibling side width height =
      (
        GtkGridClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GtkPositionType.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        attachNextTo_
        (
          self
           & child
           & sibling
           & side
           & width
           & height
        )
    fun getColumnHomogeneous self = (GtkGridClass.FFI.withPtr ---> GBool.FFI.fromVal) getColumnHomogeneous_ self
    fun getColumnSpacing self = (GtkGridClass.FFI.withPtr ---> GUInt32.FFI.fromVal) getColumnSpacing_ self
    fun getRowHomogeneous self = (GtkGridClass.FFI.withPtr ---> GBool.FFI.fromVal) getRowHomogeneous_ self
    fun getRowSpacing self = (GtkGridClass.FFI.withPtr ---> GUInt32.FFI.fromVal) getRowSpacing_ self
    fun insertColumn self position = (GtkGridClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) insertColumn_ (self & position)
    fun insertNextTo self sibling side =
      (
        GtkGridClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GtkPositionType.FFI.withVal
         ---> I
      )
        insertNextTo_
        (
          self
           & sibling
           & side
        )
    fun insertRow self position = (GtkGridClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) insertRow_ (self & position)
    fun setColumnHomogeneous self homogeneous = (GtkGridClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setColumnHomogeneous_ (self & homogeneous)
    fun setColumnSpacing self spacing = (GtkGridClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) setColumnSpacing_ (self & spacing)
    fun setRowHomogeneous self homogeneous = (GtkGridClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setRowHomogeneous_ (self & homogeneous)
    fun setRowSpacing self spacing = (GtkGridClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) setRowSpacing_ (self & spacing)
    local
      open Property
    in
      val columnHomogeneousProp =
        {
          get = fn x => get "column-homogeneous" boolean x,
          set = fn x => set "column-homogeneous" boolean x
        }
      val columnSpacingProp =
        {
          get = fn x => get "column-spacing" int x,
          set = fn x => set "column-spacing" int x
        }
      val rowHomogeneousProp =
        {
          get = fn x => get "row-homogeneous" boolean x,
          set = fn x => set "row-homogeneous" boolean x
        }
      val rowSpacingProp =
        {
          get = fn x => get "row-spacing" int x,
          set = fn x => set "row-spacing" int x
        }
    end
  end
