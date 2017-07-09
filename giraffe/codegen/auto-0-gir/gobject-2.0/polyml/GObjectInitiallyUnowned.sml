structure GObjectInitiallyUnowned :>
  G_OBJECT_INITIALLY_UNOWNED
    where type 'a class = 'a GObjectInitiallyUnownedClass.class
    where type type_t = GObjectType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_initially_unowned_get_type") (cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class = 'a GObjectInitiallyUnownedClass.class
    type type_t = GObjectType.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
