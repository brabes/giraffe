structure GtkOrientable :>
  GTK_ORIENTABLE
    where type 'a class_t = 'a GtkOrientableClass.t
    where type orientation_t = GtkOrientation.t =
  struct
    val getType_ = _import "gtk_orientable_get_type" : unit -> GObjectType.C.val_;
    val getOrientation_ = _import "gtk_orientable_get_orientation" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkOrientation.C.val_;
    val setOrientation_ = fn x1 & x2 => (_import "gtk_orientable_set_orientation" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkOrientation.C.val_ -> unit;) (x1, x2)
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