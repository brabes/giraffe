structure GObjectParamSpecUInt :>
  G_OBJECT_PARAM_SPEC_U_INT
    where type 'a class = 'a GObjectParamSpecUIntClass.class
    where type type_t = GObjectType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "intern") (cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class = 'a GObjectParamSpecUIntClass.class
    type type_t = GObjectType.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
