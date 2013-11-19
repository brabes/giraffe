structure GObjectParamSpecValueArray :>
  G_OBJECT_PARAM_SPEC_VALUE_ARRAY
    where type 'a class_t = 'a GObjectParamSpecValueArrayClass.t
    where type type_t = GObjectType.t =
  struct
    val getType_ = _import "intern" : unit -> GObjectType.C.val_;
    type 'a class_t = 'a GObjectParamSpecValueArrayClass.t
    type type_t = GObjectType.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end