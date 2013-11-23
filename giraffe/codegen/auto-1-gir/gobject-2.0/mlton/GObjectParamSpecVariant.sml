structure GObjectParamSpecVariant :>
  G_OBJECT_PARAM_SPEC_VARIANT
    where type 'a class_t = 'a GObjectParamSpecVariantClass.t
    where type type_t = GObjectType.t =
  struct
    val getType_ = _import "intern" : unit -> GObjectType.C.val_;
    type 'a class_t = 'a GObjectParamSpecVariantClass.t
    type type_t = GObjectType.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
