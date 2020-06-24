structure GLibVariant :>
  G_LIB_VARIANT
    where type t = GLibVariantRecord.t
    where type variant_record_c_ptr_array_n_t = GLibVariantRecordCPtrArrayN.t
    where type variant_class_t = GLibVariantClass.t
    where type bytes_t = GLibBytesRecord.t
    where type variant_type_t = GLibVariantTypeRecord.t =
  struct
    val newArray_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_variant_new_array" :
              GLibVariantTypeRecord.FFI.opt GLibVariantTypeRecord.FFI.p
               * GLibVariantRecordCPtrArrayN.MLton.p1
               * GLibVariantRecordCPtrArrayN.FFI.opt GLibVariantRecordCPtrArrayN.MLton.p2
               * GUInt64.FFI.val_
               -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val newBoolean_ = _import "g_variant_new_boolean" : GBool.FFI.val_ -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
    val newByte_ = _import "g_variant_new_byte" : GUInt8.FFI.val_ -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
    val newBytestring_ = _import "mlton_g_variant_new_bytestring" : GUInt8CArray.MLton.p1 * GUInt8CArray.FFI.non_opt GUInt8CArray.MLton.p2 -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
    val newBytestringArray_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_variant_new_bytestring_array" :
              Utf8CPtrArrayN.MLton.p1
               * Utf8CPtrArrayN.FFI.non_opt Utf8CPtrArrayN.MLton.p2
               * GInt64.FFI.val_
               -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newDictEntry_ = fn x1 & x2 => (_import "g_variant_new_dict_entry" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p * GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;) (x1, x2)
    val newDouble_ = _import "g_variant_new_double" : GDouble.FFI.val_ -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
    val newFromBytes_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_variant_new_from_bytes" :
              GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p
               * GLibBytesRecord.FFI.non_opt GLibBytesRecord.FFI.p
               * GBool.FFI.val_
               -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newHandle_ = _import "g_variant_new_handle" : GInt32.FFI.val_ -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
    val newInt16_ = _import "g_variant_new_int16" : GInt16.FFI.val_ -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
    val newInt32_ = _import "g_variant_new_int32" : GInt32.FFI.val_ -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
    val newInt64_ = _import "g_variant_new_int64" : GInt64.FFI.val_ -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
    val newMaybe_ = fn x1 & x2 => (_import "g_variant_new_maybe" : GLibVariantTypeRecord.FFI.opt GLibVariantTypeRecord.FFI.p * GLibVariantRecord.FFI.opt GLibVariantRecord.FFI.p -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;) (x1, x2)
    val newObjectPath_ = _import "mlton_g_variant_new_object_path" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
    val newObjv_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_variant_new_objv" :
              Utf8CPtrArrayN.MLton.p1
               * Utf8CPtrArrayN.FFI.non_opt Utf8CPtrArrayN.MLton.p2
               * GInt64.FFI.val_
               -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newSignature_ = _import "mlton_g_variant_new_signature" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
    val newString_ = _import "mlton_g_variant_new_string" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
    val newStrv_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_variant_new_strv" :
              Utf8CPtrArrayN.MLton.p1
               * Utf8CPtrArrayN.FFI.non_opt Utf8CPtrArrayN.MLton.p2
               * GInt64.FFI.val_
               -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newTuple_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_variant_new_tuple" :
              GLibVariantRecordCPtrArrayN.MLton.p1
               * GLibVariantRecordCPtrArrayN.FFI.non_opt GLibVariantRecordCPtrArrayN.MLton.p2
               * GUInt64.FFI.val_
               -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newUint16_ = _import "g_variant_new_uint16" : GUInt16.FFI.val_ -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
    val newUint32_ = _import "g_variant_new_uint32" : GUInt32.FFI.val_ -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
    val newUint64_ = _import "g_variant_new_uint64" : GUInt64.FFI.val_ -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
    val newVariant_ = _import "g_variant_new_variant" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
    val byteswap_ = _import "g_variant_byteswap" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
    val checkFormatString_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_variant_check_format_string" :
              GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GBool.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val classify_ = _import "g_variant_classify" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p -> GLibVariantClass.FFI.val_;
    val compare_ = fn x1 & x2 => (_import "g_variant_compare" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p * GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p -> GInt32.FFI.val_;) (x1, x2)
    val dupBytestring_ = fn x1 & x2 => (_import "g_variant_dup_bytestring" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p * GUInt64.FFI.ref_ -> GUInt8CArrayN.FFI.non_opt GUInt8CArrayN.FFI.out_p;) (x1, x2)
    val dupBytestringArray_ = fn x1 & x2 => (_import "g_variant_dup_bytestring_array" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p * GUInt64.FFI.ref_ -> Utf8CPtrArrayN.FFI.non_opt Utf8CPtrArrayN.FFI.out_p;) (x1, x2)
    val dupObjv_ = fn x1 & x2 => (_import "g_variant_dup_objv" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p * GUInt64.FFI.ref_ -> Utf8CPtrArrayN.FFI.non_opt Utf8CPtrArrayN.FFI.out_p;) (x1, x2)
    val dupString_ = fn x1 & x2 => (_import "g_variant_dup_string" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p * GUInt64.FFI.ref_ -> Utf8.FFI.non_opt Utf8.FFI.out_p;) (x1, x2)
    val dupStrv_ = fn x1 & x2 => (_import "g_variant_dup_strv" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p * GUInt64.FFI.ref_ -> Utf8CPtrArrayN.FFI.non_opt Utf8CPtrArrayN.FFI.out_p;) (x1, x2)
    val equal_ = fn x1 & x2 => (_import "g_variant_equal" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p * GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getBoolean_ = _import "g_variant_get_boolean" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p -> GBool.FFI.val_;
    val getByte_ = _import "g_variant_get_byte" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p -> GUInt8.FFI.val_;
    val getBytestring_ = _import "g_variant_get_bytestring" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p -> GUInt8CArray.FFI.non_opt GUInt8CArray.FFI.out_p;
    val getBytestringArray_ = fn x1 & x2 => (_import "g_variant_get_bytestring_array" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p * GUInt64.FFI.ref_ -> Utf8CPtrArrayN.FFI.non_opt Utf8CPtrArrayN.FFI.out_p;) (x1, x2)
    val getChildValue_ = fn x1 & x2 => (_import "g_variant_get_child_value" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p * GUInt64.FFI.val_ -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;) (x1, x2)
    val getDataAsBytes_ = _import "g_variant_get_data_as_bytes" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p -> GLibBytesRecord.FFI.non_opt GLibBytesRecord.FFI.p;
    val getDouble_ = _import "g_variant_get_double" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p -> GDouble.FFI.val_;
    val getHandle_ = _import "g_variant_get_handle" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p -> GInt32.FFI.val_;
    val getInt16_ = _import "g_variant_get_int16" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p -> GInt16.FFI.val_;
    val getInt32_ = _import "g_variant_get_int32" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p -> GInt32.FFI.val_;
    val getInt64_ = _import "g_variant_get_int64" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p -> GInt64.FFI.val_;
    val getMaybe_ = _import "g_variant_get_maybe" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p -> GLibVariantRecord.FFI.opt GLibVariantRecord.FFI.p;
    val getNormalForm_ = _import "g_variant_get_normal_form" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
    val getObjv_ = fn x1 & x2 => (_import "g_variant_get_objv" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p * GUInt64.FFI.ref_ -> Utf8CPtrArrayN.FFI.non_opt Utf8CPtrArrayN.FFI.out_p;) (x1, x2)
    val getSize_ = _import "g_variant_get_size" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p -> GUInt64.FFI.val_;
    val getString_ = fn x1 & x2 => (_import "g_variant_get_string" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p * GUInt64.FFI.ref_ -> Utf8.FFI.non_opt Utf8.FFI.out_p;) (x1, x2)
    val getStrv_ = fn x1 & x2 => (_import "g_variant_get_strv" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p * GUInt64.FFI.ref_ -> Utf8CPtrArrayN.FFI.non_opt Utf8CPtrArrayN.FFI.out_p;) (x1, x2)
    val getType_ = _import "g_variant_get_type" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p -> GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p;
    val getTypeString_ = _import "g_variant_get_type_string" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getUint16_ = _import "g_variant_get_uint16" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p -> GUInt16.FFI.val_;
    val getUint32_ = _import "g_variant_get_uint32" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p -> GUInt32.FFI.val_;
    val getUint64_ = _import "g_variant_get_uint64" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p -> GUInt64.FFI.val_;
    val getVariant_ = _import "g_variant_get_variant" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
    val hash_ = _import "g_variant_hash" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p -> GUInt32.FFI.val_;
    val isContainer_ = _import "g_variant_is_container" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p -> GBool.FFI.val_;
    val isFloating_ = _import "g_variant_is_floating" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p -> GBool.FFI.val_;
    val isNormalForm_ = _import "g_variant_is_normal_form" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p -> GBool.FFI.val_;
    val isOfType_ = fn x1 & x2 => (_import "g_variant_is_of_type" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p * GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val lookupValue_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_variant_lookup_value" :
              GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GLibVariantTypeRecord.FFI.opt GLibVariantTypeRecord.FFI.p
               -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val nChildren_ = _import "g_variant_n_children" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p -> GUInt64.FFI.val_;
    val print_ = fn x1 & x2 => (_import "g_variant_print" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p * GBool.FFI.val_ -> Utf8.FFI.non_opt Utf8.FFI.out_p;) (x1, x2)
    val takeRef_ = _import "g_variant_take_ref" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
    val isObjectPath_ = _import "mlton_g_variant_is_object_path" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GBool.FFI.val_;
    val isSignature_ = _import "mlton_g_variant_is_signature" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GBool.FFI.val_;
    val parse_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & (x6, x7)
         & x8 =>
          (
            _import "mlton_g_variant_parse" :
              GLibVariantTypeRecord.FFI.opt GLibVariantTypeRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    type t = GLibVariantRecord.t
    type variant_record_c_ptr_array_n_t = GLibVariantRecordCPtrArrayN.t
    type variant_class_t = GLibVariantClass.t
    type bytes_t = GLibBytesRecord.t
    type variant_type_t = GLibVariantTypeRecord.t
    fun newArray (childType, children) =
      let
        val nChildren =
          case children of
            SOME children => LargeInt.fromInt (GLibVariantRecordCPtrArrayN.length children)
          | NONE => GUInt64.null
        val retVal =
          (
            GLibVariantTypeRecord.FFI.withOptPtr
             &&&> GLibVariantRecordCPtrArrayN.FFI.withOptPtr
             &&&> GUInt64.FFI.withVal
             ---> GLibVariantRecord.FFI.fromPtr false
          )
            newArray_
            (
              childType
               & children
               & nChildren
            )
      in
        retVal
      end
    fun newBoolean value = (GBool.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newBoolean_ value
    fun newByte value = (GUInt8.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newByte_ value
    fun newBytestring string = (GUInt8CArray.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr false) newBytestring_ string
    fun newBytestringArray strv =
      let
        val length = LargeInt.fromInt (Utf8CPtrArrayN.length strv)
        val retVal = (Utf8CPtrArrayN.FFI.withPtr &&&> GInt64.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newBytestringArray_ (strv & length)
      in
        retVal
      end
    fun newDictEntry (key, value) = (GLibVariantRecord.FFI.withPtr &&&> GLibVariantRecord.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr false) newDictEntry_ (key & value)
    fun newDouble value = (GDouble.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newDouble_ value
    fun newFromBytes
      (
        type',
        bytes,
        trusted
      ) =
      (
        GLibVariantTypeRecord.FFI.withPtr
         &&&> GLibBytesRecord.FFI.withPtr
         &&&> GBool.FFI.withVal
         ---> GLibVariantRecord.FFI.fromPtr false
      )
        newFromBytes_
        (
          type'
           & bytes
           & trusted
        )
    fun newHandle value = (GInt32.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newHandle_ value
    fun newInt16 value = (GInt16.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newInt16_ value
    fun newInt32 value = (GInt32.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newInt32_ value
    fun newInt64 value = (GInt64.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newInt64_ value
    fun newMaybe (childType, child) = (GLibVariantTypeRecord.FFI.withOptPtr &&&> GLibVariantRecord.FFI.withOptPtr ---> GLibVariantRecord.FFI.fromPtr false) newMaybe_ (childType & child)
    fun newObjectPath objectPath = (Utf8.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr false) newObjectPath_ objectPath
    fun newObjv strv =
      let
        val length = LargeInt.fromInt (Utf8CPtrArrayN.length strv)
        val retVal = (Utf8CPtrArrayN.FFI.withPtr &&&> GInt64.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newObjv_ (strv & length)
      in
        retVal
      end
    fun newSignature signature' = (Utf8.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr false) newSignature_ signature'
    fun newString string = (Utf8.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr false) newString_ string
    fun newStrv strv =
      let
        val length = LargeInt.fromInt (Utf8CPtrArrayN.length strv)
        val retVal = (Utf8CPtrArrayN.FFI.withPtr &&&> GInt64.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newStrv_ (strv & length)
      in
        retVal
      end
    fun newTuple children =
      let
        val nChildren = LargeInt.fromInt (GLibVariantRecordCPtrArrayN.length children)
        val retVal = (GLibVariantRecordCPtrArrayN.FFI.withPtr &&&> GUInt64.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newTuple_ (children & nChildren)
      in
        retVal
      end
    fun newUint16 value = (GUInt16.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newUint16_ value
    fun newUint32 value = (GUInt32.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newUint32_ value
    fun newUint64 value = (GUInt64.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr false) newUint64_ value
    fun newVariant value = (GLibVariantRecord.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr false) newVariant_ value
    fun byteswap self = (GLibVariantRecord.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr true) byteswap_ self
    fun checkFormatString self (formatString, copyOnly) =
      (
        GLibVariantRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GBool.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        checkFormatString_
        (
          self
           & formatString
           & copyOnly
        )
    fun classify self = (GLibVariantRecord.FFI.withPtr ---> GLibVariantClass.FFI.fromVal) classify_ self
    fun compare self two = (GLibVariantRecord.FFI.withPtr &&&> GLibVariantRecord.FFI.withPtr ---> GInt32.FFI.fromVal) compare_ (self & two)
    fun dupBytestring self =
      let
        val length & retVal = (GLibVariantRecord.FFI.withPtr &&&> GUInt64.FFI.withRefVal ---> GUInt64.FFI.fromVal && GUInt8CArrayN.FFI.fromPtr 1) dupBytestring_ (self & GUInt64.null)
      in
        retVal (LargeInt.toInt length)
      end
    fun dupBytestringArray self =
      let
        val length & retVal = (GLibVariantRecord.FFI.withPtr &&&> GUInt64.FFI.withRefVal ---> GUInt64.FFI.fromVal && Utf8CPtrArrayN.FFI.fromPtr 2) dupBytestringArray_ (self & GUInt64.null)
      in
        retVal (LargeInt.toInt length)
      end
    fun dupObjv self =
      let
        val length & retVal = (GLibVariantRecord.FFI.withPtr &&&> GUInt64.FFI.withRefVal ---> GUInt64.FFI.fromVal && Utf8CPtrArrayN.FFI.fromPtr 2) dupObjv_ (self & GUInt64.null)
      in
        retVal (LargeInt.toInt length)
      end
    fun dupString self =
      let
        val length & retVal = (GLibVariantRecord.FFI.withPtr &&&> GUInt64.FFI.withRefVal ---> GUInt64.FFI.fromVal && Utf8.FFI.fromPtr 1) dupString_ (self & GUInt64.null)
      in
        (retVal, length)
      end
    fun dupStrv self =
      let
        val length & retVal = (GLibVariantRecord.FFI.withPtr &&&> GUInt64.FFI.withRefVal ---> GUInt64.FFI.fromVal && Utf8CPtrArrayN.FFI.fromPtr 2) dupStrv_ (self & GUInt64.null)
      in
        retVal (LargeInt.toInt length)
      end
    fun equal self two = (GLibVariantRecord.FFI.withPtr &&&> GLibVariantRecord.FFI.withPtr ---> GBool.FFI.fromVal) equal_ (self & two)
    fun getBoolean self = (GLibVariantRecord.FFI.withPtr ---> GBool.FFI.fromVal) getBoolean_ self
    fun getByte self = (GLibVariantRecord.FFI.withPtr ---> GUInt8.FFI.fromVal) getByte_ self
    fun getBytestring self = (GLibVariantRecord.FFI.withPtr ---> GUInt8CArray.FFI.fromPtr 0) getBytestring_ self
    fun getBytestringArray self =
      let
        val length & retVal = (GLibVariantRecord.FFI.withPtr &&&> GUInt64.FFI.withRefVal ---> GUInt64.FFI.fromVal && Utf8CPtrArrayN.FFI.fromPtr 1) getBytestringArray_ (self & GUInt64.null)
      in
        retVal (LargeInt.toInt length)
      end
    fun getChildValue self index = (GLibVariantRecord.FFI.withPtr &&&> GUInt64.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr true) getChildValue_ (self & index)
    fun getDataAsBytes self = (GLibVariantRecord.FFI.withPtr ---> GLibBytesRecord.FFI.fromPtr true) getDataAsBytes_ self
    fun getDouble self = (GLibVariantRecord.FFI.withPtr ---> GDouble.FFI.fromVal) getDouble_ self
    fun getHandle self = (GLibVariantRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getHandle_ self
    fun getInt16 self = (GLibVariantRecord.FFI.withPtr ---> GInt16.FFI.fromVal) getInt16_ self
    fun getInt32 self = (GLibVariantRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getInt32_ self
    fun getInt64 self = (GLibVariantRecord.FFI.withPtr ---> GInt64.FFI.fromVal) getInt64_ self
    fun getMaybe self = (GLibVariantRecord.FFI.withPtr ---> GLibVariantRecord.FFI.fromOptPtr true) getMaybe_ self
    fun getNormalForm self = (GLibVariantRecord.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr true) getNormalForm_ self
    fun getObjv self =
      let
        val length & retVal = (GLibVariantRecord.FFI.withPtr &&&> GUInt64.FFI.withRefVal ---> GUInt64.FFI.fromVal && Utf8CPtrArrayN.FFI.fromPtr 1) getObjv_ (self & GUInt64.null)
      in
        retVal (LargeInt.toInt length)
      end
    fun getSize self = (GLibVariantRecord.FFI.withPtr ---> GUInt64.FFI.fromVal) getSize_ self
    fun getString self =
      let
        val length & retVal = (GLibVariantRecord.FFI.withPtr &&&> GUInt64.FFI.withRefVal ---> GUInt64.FFI.fromVal && Utf8.FFI.fromPtr 0) getString_ (self & GUInt64.null)
      in
        (retVal, length)
      end
    fun getStrv self =
      let
        val length & retVal = (GLibVariantRecord.FFI.withPtr &&&> GUInt64.FFI.withRefVal ---> GUInt64.FFI.fromVal && Utf8CPtrArrayN.FFI.fromPtr 1) getStrv_ (self & GUInt64.null)
      in
        retVal (LargeInt.toInt length)
      end
    fun getType self = (GLibVariantRecord.FFI.withPtr ---> GLibVariantTypeRecord.FFI.fromPtr false) getType_ self
    fun getTypeString self = (GLibVariantRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getTypeString_ self
    fun getUint16 self = (GLibVariantRecord.FFI.withPtr ---> GUInt16.FFI.fromVal) getUint16_ self
    fun getUint32 self = (GLibVariantRecord.FFI.withPtr ---> GUInt32.FFI.fromVal) getUint32_ self
    fun getUint64 self = (GLibVariantRecord.FFI.withPtr ---> GUInt64.FFI.fromVal) getUint64_ self
    fun getVariant self = (GLibVariantRecord.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr true) getVariant_ self
    fun hash self = (GLibVariantRecord.FFI.withPtr ---> GUInt32.FFI.fromVal) hash_ self
    fun isContainer self = (GLibVariantRecord.FFI.withPtr ---> GBool.FFI.fromVal) isContainer_ self
    fun isFloating self = (GLibVariantRecord.FFI.withPtr ---> GBool.FFI.fromVal) isFloating_ self
    fun isNormalForm self = (GLibVariantRecord.FFI.withPtr ---> GBool.FFI.fromVal) isNormalForm_ self
    fun isOfType self type' = (GLibVariantRecord.FFI.withPtr &&&> GLibVariantTypeRecord.FFI.withPtr ---> GBool.FFI.fromVal) isOfType_ (self & type')
    fun lookupValue self (key, expectedType) =
      (
        GLibVariantRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibVariantTypeRecord.FFI.withOptPtr
         ---> GLibVariantRecord.FFI.fromPtr true
      )
        lookupValue_
        (
          self
           & key
           & expectedType
        )
    fun nChildren self = (GLibVariantRecord.FFI.withPtr ---> GUInt64.FFI.fromVal) nChildren_ self
    fun print self typeAnnotate = (GLibVariantRecord.FFI.withPtr &&&> GBool.FFI.withVal ---> Utf8.FFI.fromPtr 1) print_ (self & typeAnnotate)
    fun takeRef self = (GLibVariantRecord.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr true) takeRef_ self
    fun isObjectPath string = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) isObjectPath_ string
    fun isSignature string = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) isSignature_ string
    fun parse
      (
        type',
        text,
        limit,
        endptr
      ) =
      (
        GLibVariantTypeRecord.FFI.withOptPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GLibVariantRecord.FFI.fromPtr true
      )
        parse_
        (
          type'
           & text
           & limit
           & endptr
           & []
        )
  end
