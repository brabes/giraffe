structure GObjectParamSpecPointer :>
  G_OBJECT_PARAM_SPEC_POINTER
    where type 'a class = 'a GObjectParamSpecPointerClass.class
    where type type_t = GObjectType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "intern") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class = 'a GObjectParamSpecPointerClass.class
    type type_t = GObjectType.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
