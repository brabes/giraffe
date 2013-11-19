structure GtkOrientable :>
  GTK_ORIENTABLE
    where type 'a class_t = 'a GtkOrientableClass.t
    where type orientation_t = GtkOrientation.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_orientable_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getOrientation_ = call (load_sym libgtk "gtk_orientable_get_orientation") (GObjectObjectClass.PolyML.PTR --> GtkOrientation.PolyML.VAL)
      val setOrientation_ = call (load_sym libgtk "gtk_orientable_set_orientation") (GObjectObjectClass.PolyML.PTR &&> GtkOrientation.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkOrientableClass.t
    type orientation_t = GtkOrientation.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getOrientation self = (GObjectObjectClass.C.withPtr ---> GtkOrientation.C.fromVal) getOrientation_ self
    fun setOrientation self orientation = (GObjectObjectClass.C.withPtr &&&> GtkOrientation.C.withVal ---> I) setOrientation_ (self & orientation)
    local
      open Property
    in
      val orientationProp =
        {
          get = fn x => get "orientation" GtkOrientation.t x,
          set = fn x => set "orientation" GtkOrientation.t x
        }
    end
  end