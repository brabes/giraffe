structure GObjectParamSpecULong :>
  G_OBJECT_PARAM_SPEC_U_LONG
    where type 'a class_t = 'a GObjectParamSpecULongClass.t
    where type type_t = GObjectType.t =
  struct
    val getType_ = _import "intern" : unit -> GObjectType.C.val_;
    type 'a class_t = 'a GObjectParamSpecULongClass.t
    type type_t = GObjectType.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
