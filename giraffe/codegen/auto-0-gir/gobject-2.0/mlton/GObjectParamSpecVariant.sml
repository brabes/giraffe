structure GObjectParamSpecVariant :>
  G_OBJECT_PARAM_SPEC_VARIANT
    where type 'a class = 'a GObjectParamSpecVariantClass.class
    where type type_t = GObjectType.t =
  struct
    val getType_ = _import "intern" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GObjectParamSpecVariantClass.class
    type type_t = GObjectType.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
