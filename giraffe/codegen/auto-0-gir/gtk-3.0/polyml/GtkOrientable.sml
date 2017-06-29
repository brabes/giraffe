structure GtkOrientable :>
  GTK_ORIENTABLE
    where type 'a class = 'a GtkOrientableClass.class
    where type orientation_t = GtkOrientation.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_orientable_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getOrientation_ = call (getSymbol "gtk_orientable_get_orientation") (GtkOrientableClass.PolyML.cPtr --> GtkOrientation.PolyML.cVal)
      val setOrientation_ = call (getSymbol "gtk_orientable_set_orientation") (GtkOrientableClass.PolyML.cPtr &&> GtkOrientation.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkOrientableClass.class
    type orientation_t = GtkOrientation.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getOrientation self = (GtkOrientableClass.FFI.withPtr ---> GtkOrientation.FFI.fromVal) getOrientation_ self
    fun setOrientation self orientation = (GtkOrientableClass.FFI.withPtr &&&> GtkOrientation.FFI.withVal ---> I) setOrientation_ (self & orientation)
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
