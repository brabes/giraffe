(* --------------------------------------------------------------------------
 * Function
 * -------------------------------------------------------------------------- *)

(* Function names to be skipped *)

(* Manually specified symbols
 *
 * Notes
 *
 *   1. Parameter selection_data is annotated with (out) but should probably
 *      be (inout).  (out) requires `withNewPtr` which cannot be implemented
 *      because size of GtkSelectionData is not known by C compiler.
 *
 *)
val excludedFunctionSymbols = [
  "pango_break",
  "pango_default_break",
  "pango_get_log_attrs",
  "pango_glyph_item_letter_space",
  "pango_shape",
  "pango_read_line",
  "pango_skip_space",
  "pango_scan_int",
  "pango_scan_string",
  "pango_scan_word",
  "pango_attribute_init",
  "pango_attribute_destroy",
  "g_regex_escape_string",  (* GIR data broken: says param 0 is utf8 array *)
  "g_source_new",
  "g_source_set_callback_indirect",
  "g_source_add_poll",
  "g_source_remove_poll",
  "g_source_set_funcs",
  "g_source_remove_by_funcs_user_data",
  "g_source_remove_by_user_data",
  "g_closure_new_simple",
  "g_closure_new_object",
  "g_param_spec_pool_new",
  "g_param_value_convert",
  "g_param_value_defaults",
  "g_param_value_set_default",
  "g_param_value_validate",
  "g_param_values_cmp",
  "g_signal_accumulator_first_wins",
  "g_signal_accumulator_true_handled",
  "g_signal_chain_from_overridden",
  "g_signal_get_invocation_hint",
  "g_signal_has_handler_pending",
  "g_signal_name",
  "g_signal_query",
  "g_signal_remove_emission_hook",
  "g_signal_stop_emission",
  "g_signal_stop_emission_by_name",
  "g_source_set_closure",
  "g_source_set_dummy_callback",
  "g_strdup_value_contents",
  "g_type_check_instance",
  "g_type_check_value",
  "g_type_class_add_private",
  "g_type_default_interface_unref",
  "g_type_free_instance",
  "g_type_name_from_class",
  "g_type_name_from_instance",
  "g_dbus_error_register_error",
  "g_dbus_error_unregister_error",
  "gdk_pixbuf_error_quark",
  "gdk_add_option_entries_libgtk_only",
  "gtk_accel_map_load_scanner",
  "gtk_binding_entry_add_signal_from_string",
  "gtk_binding_entry_remove",
  "gtk_binding_set_find",
  "gtk_bindings_activate",
  "gtk_bindings_activate_event",
  "gtk_binding_entry_skip",
  "gtk_buildable_custom_tag_start",
  "gtk_distribute_natural_allocation",
  "gtk_rc_parse_color",  (* deprecated anyway? *)
  "gtk_rc_parse_color_full",  (* deprecated anyway? *)
  "gtk_rc_property_parse_color",
  "gtk_rc_property_parse_border",
  "gtk_rc_property_parse_enum",
  "gtk_rc_property_parse_flags",
  "gtk_rc_property_parse_requisition",
  "gtk_tree_drag_source_drag_data_get",  (* see note 1 *)
  "vte_pty_error_quark"
]

val excludedFunctionSymbolPrefixes = [
  "g_cclosure_marshal",
  "g_signal_connect",
  "g_signal_handler"
]

val excludedFunctionSymbolSuffixes = [
]

fun checkFunctionSymbol functionInfo =
  let
    val symbol = FunctionInfo.getSymbol functionInfo
  in
    if
      List.exists (fn x => x = symbol) excludedFunctionSymbols
       orelse
         List.exists (fn x => String.isPrefix x symbol)
           excludedFunctionSymbolPrefixes
       orelse
         List.exists (fn x => String.isSuffix x symbol)
           excludedFunctionSymbolSuffixes
    then infoError "manually excluded"
    else ()
  end

(* Systematically formed names that do not belong in the user API *)
val nonUserFunctionNames = [
  "ref",
  "ref_sink",
  "sink",
  "unref",
  "free",
  "false",
  "true",
  "quark",
  "error_quark"
]

fun checkFunctionName name =
  if List.exists (fn x => x = name) nonUserFunctionNames
  then infoError "non-user function"
  else ()


(* Flags/Enum value names to be transformed *)

val newFlagsEnumValueNames = [
  ("2big", "too_big"),
  ("2button_press", "double_button_press"),
  ("3button_press", "triple_button_press")
]

fun fixFlagsEnumValueName name =
  case List.find (fn (x, _) => x = name) newFlagsEnumValueNames of
    SOME (_, name') => name'
  | NONE            => name


(* Support for parameters and return values *)

fun arrayTypeNotSupported ty =
  concat [
    "array type ",
    case ty of
      ArrayType.C          => "C"
    | ArrayType.ARRAY      => "GArray"
    | ArrayType.PTR_ARRAY  => "GPtrArray"
    | ArrayType.BYTE_ARRAY => "GByteArray",
    " not supported"
  ]

val noArrayTypeForArray = "** ARRAY with no array type not valid **"

val noTypeParamForArray =
  "** ARRAY without type parameter not valid **"

val containerForUtf8 =
  "** ownership transfer CONTAINER for UTF8 not valid **"

val containerForFilename =
  "** ownership transfer CONTAINER for FILENAME not valid **"

val containerForInterface =
  "** ownership transfer CONTAINER for INTERFACE not valid **"

val everythingForNonPtrStruct =
  "** ownership transfer EVERYTHING for non-pointer STRUCT INTERFACE parameter \
  \not valid **"
  (* In fact this is used for a non-pointer GObject.Value out parameter where
   * the caller must call g_value_unset to free resources used by the
   * GObject.Value.  This appears to occur only for get_property functions, so
   * this is all pending property handling...
   *)

val everythingForNonPtrUnion =
  "** ownership transfer EVERYTHING for non-pointer UNION INTERFACE parameter \
  \not valid **"

val containerForIn =
  "ownership transfer CONTAINER for IN parameter not supported"

val everythingForIn =
  "ownership transfer EVERYTHING for IN parameter not supported"

val everythingForInOut =
  "ownership transfer EVERYTHING for INOUT parameter not supported"

val nonPtrForObject =
  "non-pointer for OBJECT INTERFACE not supported"

val nonPtrForInterface =
  "non-pointer for INTERFACE INTERFACE not supported"

val nonPtrForInStruct =
  "non-pointer IN parameter for STRUCT INTERFACE not supported"

val nonPtrForInUnion =
  "non-pointer IN parameter for UNION INTERFACE not supported"

val nonPtrForRetStruct =
  "non-pointer return for STRUCT INTERFACE not supported"

val nonPtrForRetUnion =
  "non-pointer return for UNION INTERFACE not supported"

val ptrForFlags =
  "pointer for FLAGS INTERFACE not supported"

val ptrForEnum =
  "pointer for ENUM INTERFACE not supported"

local
  open InfoType

  val toString =
    fn
      INVALID     => "INVALID"
    | FUNCTION _  => "FUNCTION"
    | CALLBACK _  => "CALLBACK"
    | STRUCT _    => "STRUCT"
    | BOXED _     => "BOXED"
    | ENUM _      => "ENUM"
    | FLAGS _     => "FLAGS"
    | OBJECT _    => "OBJECT"
    | INTERFACE _ => "INTERFACE"
    | CONSTANT _  => "CONSTANT"
    | INVALID_0   => "INVALID_0"
    | UNION _     => "UNION"
    | VALUE _     => "VALUE"
    | SIGNAL _    => "SIGNAL"
    | VFUNC _     => "VFUNC"
    | PROPERTY _  => "PROPERTY"
    | FIELD _     => "FIELD"
    | ARG _       => "ARG"
    | TYPE _      => "TYPE"
    | UNRESOLVED  => "UNRESOLVED"
in
  fun unsupportedInterface infoType =
    concat ["type ", toString infoType, " INTERFACE not supported"]
end

fun ptrForScalar fmt ty =
  concat ["pointer for scalar (", fmt ty, ") not supported"]

val ptrForVoid =
  "pointer for VOID not supported"


datatype scalartype =
  STBOOLEAN
| STINT8
| STUINT8
| STINT16
| STUINT16
| STINT32
| STUINT32
| STINT64
| STUINT64
| STFLOAT
| STDOUBLE
| STUNICHAR

val scalarToString =
  fn
    STBOOLEAN      => "BOOLEAN"
  | STINT8         => "INT8"
  | STUINT8        => "UINT8"
  | STINT16        => "INT16"
  | STUINT16       => "UINT16"
  | STINT32        => "INT32"
  | STUINT32       => "UINT32"
  | STINT64        => "INT64"
  | STUINT64       => "UINT64"
  | STFLOAT        => "FLOAT"
  | STDOUBLE       => "DOUBLE"
  | STUNICHAR      => "UNICHAR"

val scalarStrId =
  fn
    STBOOLEAN      => "Bool"
  | STINT8         => "Int8"
  | STUINT8        => "UInt8"
  | STINT16        => "Int16"
  | STUINT16       => "UInt16"
  | STINT32        => "Int32"
  | STUINT32       => "UInt32"
  | STINT64        => "Int64"
  | STUINT64       => "UInt64"
  | STFLOAT        => "Float"
  | STDOUBLE       => "Double"
  | STUNICHAR      => "Char"

local
  fun noGType s = infoError ("no corresponding GType for " ^ s)
in
  val scalarAccessorId =
    fn
      STBOOLEAN      => "boolean"
    | STINT8         => noGType "INT8"
    | STUINT8        => noGType "UINT8"
    | STINT16        => noGType "INT16"
    | STUINT16       => noGType "UINT16"
    | STINT32        => "int"
    | STUINT32       => "uint"
    | STINT64        => "long"
    | STUINT64       => "ulong"
    | STFLOAT        => "float"
    | STDOUBLE       => "double"
    | STUNICHAR      => "char"
end

local
  val boolTyRef = (0, toList1 ["bool"])
  val charTyRef = (0, toList1 ["char"])
  val word8TyRef = (0, toList1 ["Word8", "word"])
  val largeIntTyRef = (0, toList1 ["LargeInt", "int"])
  val realTyRef = (0, toList1 ["real"])
in
  val scalarTyRef =
    fn
      STBOOLEAN      => boolTyRef
    | STINT8         => largeIntTyRef
    | STUINT8        => word8TyRef
    | STINT16        => largeIntTyRef
    | STUINT16       => largeIntTyRef
    | STINT32        => largeIntTyRef
    | STUINT32       => largeIntTyRef
    | STINT64        => largeIntTyRef
    | STUINT64       => largeIntTyRef
    | STFLOAT        => realTyRef
    | STDOUBLE       => realTyRef
    | STUNICHAR      => charTyRef
end


val utf8TyRef : int * lid = (0, toList1 ["string"])
val stringTyRef : int * lid = (0, toList1 ["string"])
val word8VectorTyRef : int * lid = (0, toList1 ["Word8Vector", vectorId])


type scalar_info =
  {
    ty    : scalartype
  }

type utf8_info =
  {
    isOpt   : bool,
    ownXfer : bool
  }

type interface_info =
  {
    rootIRef   : interfaceref,
    iRef       : interfaceref,
    infoType   : InfoType.t,
    isOpt      : bool,
    ptrOwnXfer : bool option  (* NONE when non-pointer *)
  }

(* The ownership transfer flag is only present for a pointer.  The conditions
 * for a pointer and ownership transfer are combined into a single field
 * `ptrOwnXfer` that takes the following values:
 *
 *   NONE          non-pointer
 *   SOME false    pointer with ownership not transferred
 *   SOME true     pointer with ownership transferred
 *
 * The condition `isSome ptrOwnXfer` tests for a pointer.
 *
 * It is not always true that if a value is optionally null, then it must
 * be a pointer, i.e. `isOpt` does not always imply `isSome ptrOwnXfer`: for
 * a CALLBACK, `ptrOwnXfer` is `NONE` but it is possible that `isOpt` is true.
 * Therefore `isOpt` is not included as part of option type for `ptrOwnXfer`.
 *)

datatype array_length =
  ArrayLengthZeroTerminated
| ArrayLengthFixed of int     (* the fixed length *)
| ArrayLengthParam of string  (* the parameter name *)

datatype info =
  ISCALAR    of scalar_info
| IUTF8      of utf8_info
| IARRAY     of array_info
| IINTERFACE of interface_info

withtype array_info =
  {
    isOpt   : bool,
    ownXfer : bool,
    length  : array_length,
    elem    : info
  }

fun getBaseInfo info =
  case info of
    IARRAY {elem, ...} => getBaseInfo elem
  | _                  => info

fun addIRef (info, iRefs) =
  case info of
    ISCALAR _                              => iRefs
  | IUTF8 _                                => iRefs
  | IARRAY {elem, ...}                     => addIRef (elem, iRefs)
  | IINTERFACE {iRef as {scope, ...}, ...} => (
      case scope of
        GLOBAL             => iRefs
      | LOCALINTERFACESELF => iRefs
      | _                  => insert (iRef, iRefs)
    )

fun mkArrayLenExp length e =
  case length of
    ArrayLengthZeroTerminated => e
  | ArrayLengthFixed n        => ExpApp (e, mkIntConstExp n)
  | ArrayLengthParam lenName  =>
      ExpApp (
        e,
        mkParenExp (
          ExpApp (
            mkLIdLNameExp [largeIntStrId, toIntId],
            mkIdLNameExp lenName
          )
        )
      )

fun cArrayStrId length elem =
  let
    val suffixStrId = String.concat (
      cStrId :: vectorStrId :: (
        case length of
          ArrayLengthZeroTerminated => []
        | _                         => ["N"]
      )
    )

    val elemStrId =
      case elem of
        ISCALAR {ty, ...}                          => (
          gStrId ^ scalarStrId ty
        )
      | IUTF8 {isOpt, ...}                         => (
          if isOpt
          then infoError "optional UTF8 as array element not supported"
          else utf8StrId
        )
      | IARRAY {isOpt, length, elem, ...}          => (
          if isOpt
          then infoError "optional ARRAY as array element not supported"
          else cArrayStrId length elem
        )
      | IINTERFACE {iRef, ...}                     =>
          makeIRefInterfaceOtherStrId iRef

    val elemArrayStrId = elemStrId ^ suffixStrId
  in
    elemArrayStrId
  end

(* `cArrayStrIdStructDeps length elem structDeps` returns
 * `(elemArrayStrId, structDeps')` where
 *
 *   `elemArrayStrId`
 *     is the name of the array type structure for an array whose element is
 *     `elem` and has length convention `length`, as returned by
 *     `cArrayStrId length elem`.
 *
 *   `structDeps'`
 *     is an ordered dictionary of the structure dependencies, indexed by
 *     name, that are required to create the structure `elemArrayStrId` (when
 *     not part of the static library) and contains `structDeps`.
 *
 * Note that `structDeps` and `structDeps'` are in 'reverse' order, that is,
 * `ListDict.toList` will return a list in reverse order.
 *)

val needsStructDeps =
  fn
    ISCALAR _                  => SOME false
  | IUTF8 _                    => SOME true
  | IARRAY _                   => SOME true
  | IINTERFACE {infoType, ...} =>
      case infoType of
        InfoType.FLAGS _ => SOME false
      | InfoType.ENUM _  => SOME false
      | _                => SOME true


fun cArrayStrIdStructDeps length elem structDeps =
  let
    val suffixStrId = String.concat (
      cStrId :: vectorStrId :: (
        case length of
          ArrayLengthZeroTerminated => []
        | _                         => [nStrId]
      )
    )

    val (elemStrId, structDeps'1) =
      case elem of
        ISCALAR {ty, ...}                          => (
          gStrId ^ scalarStrId ty,
          structDeps
        )
      | IUTF8 {isOpt, ...}                         => (
          if isOpt
          then infoError "optional UTF8 as array element not supported"
          else utf8StrId,
          structDeps
        )
      | IARRAY {isOpt, length, elem, ...}          => (
          if isOpt
          then infoError "optional ARRAY as array element not supported"
          else cArrayStrIdStructDeps length elem structDeps
        )
      | IINTERFACE {iRef, ...}                     =>
          (makeIRefInterfaceOtherStrId iRef, structDeps)

    val elemArrayStrId = elemStrId ^ suffixStrId

    val structDeps'2 =
      case needsStructDeps elem of
        SOME isPtr =>
          let
            val funcId = suffixStrId
            val funcTypeId =
              let
                val prefixId = if isPtr then cPointerStrId else cValueStrId
              in
                prefixId ^ suffixStrId ^ typeStrId
              end
            val elemArrayTypeStrId = elemArrayStrId ^ typeStrId

            val arrayStruct = (
              elemArrayStrId,
              mkInstStruct (funcId, mkNameStruct [elemArrayTypeStrId])
            )
            val arrayTypeStruct = (
              elemArrayTypeStrId,
              StructInst (
                funcTypeId,
                if isPtr
                then
                  let
                    val elemStruct =
                      case elem of
                        IUTF8 _  => mkNameStruct [elemStrId, cStrId, arrayTypeStrId]
                      | IARRAY _ => mkNameStruct [elemStrId, cStrId, arrayTypeStrId]
                      | _        => mkNameStruct [elemStrId, cStrId, pointerTypeStrId]

                    val sequenceStruct =
                      case getBaseInfo elem of
                        IUTF8 _  => mkNameStruct ["ListSequence"]
                      | _        => mkNameStruct ["VectorSequence"]

                  in
                    mkStrDecsFunArg [
                      mkStructStrDec ("CElemType", elemStruct),
                      mkStructStrDec ("Sequence", sequenceStruct)
                    ]
                  end
                else
                  let
                    val elemStruct =
                      case elem of
                        ISCALAR {ty, ...} =>
                          mkNameStruct [gStrId ^ scalarStrId ty ^ typeStrId]
                      | _                 =>
                          mkNameStruct [elemStrId, cStrId, valueTypeStrId]

                    val elemSequenceStruct =
                      case elem of
                        ISCALAR {ty = STUINT8, ...}            =>
                          mkInstStruct ("MonoVectorSequence", mkNameStruct ["Word8Vector"])
                      | _                                      =>
                          mkInstStruct ("CValueVectorSequence", elemStruct)
                  in
                    mkStrDecsFunArg [
                      mkStructStrDec ("CElemType", elemStruct),
                      mkStructStrDec ("ElemSequence", elemSequenceStruct)
                    ]
                  end
              )
            )
          in
            foldl (ListDict.insert Fn.id #2) structDeps'1 [arrayTypeStruct, arrayStruct]
          end
      | NONE       => structDeps'1
  in
    (elemArrayStrId, structDeps'2)
  end

fun boolToInt b = if b then 1 else 0

fun getArrayOwnXferDepth ownXferDepth elem =
  case elem of
    ISCALAR _                    => ownXferDepth
  | IUTF8 {ownXfer, ...}         => ownXferDepth + (boolToInt ownXfer)
  | IARRAY {ownXfer, elem, ...}  =>
      if ownXfer
      then getArrayOwnXferDepth (ownXferDepth + 1) elem
      else ownXferDepth
  | IINTERFACE {ptrOwnXfer, ...} =>
      case ptrOwnXfer of
        SOME ownXfer => ownXferDepth + (boolToInt ownXfer)
      | NONE         => ownXferDepth

datatype dir =
  IN
| OUT of bool  (* flag indicates caller-allocated *)
| INOUT

datatype parinfo =
  PIVOID
| PISOME of
    {
      name  : id,
      dir   : dir,
      array : {name : id, info : array_info} option,
      info  : info
    }

(* In the value `PISOME {name = lenName, array, ...}`, `array` has the value
 *   - `SOME {name, info}` if the parameter `lenName` is the length of either
 *       - the array parameter called `name`, if `name <> ""`, or
 *       - the array return value,            if `name = ""`
 *      with array_info `info`;
 *   - `NONE` otherwise.
 *)


datatype retinfo =
  RIVOID
| RISOME of {info : info}


(* 
 * For signals, `getParInfo` and `getRetInfo` must not use TypeInfo.isPointer
 * due to <https://bugzilla.gnome.org/show_bug.cgi?id=646080>.  The parameter
 * `usePtrDefault` indicates whether default pointer use should be assumed
 * rather than using the c:type attribute, which is not present for signals.
 *)

exception Void

fun getParInfo
  usePtrDefault
  repo
  functionNamespace
  optContainerName
  callableInfo
  argInfo =
  let
    val typeInfo = ArgInfo.getType argInfo
    val () =
      case TypeInfo.getTag typeInfo of
        TypeTag.VOID =>
          if
            if usePtrDefault
            then
              true
            else
              TypeInfo.isPointer typeInfo
                handle
                  Fail msg => infoError msg
          then infoError ptrForVoid
          else raise Void
      | _            => ()

    val direction = ArgInfo.getDirection argInfo
    val mayBeNull = ArgInfo.mayBeNull argInfo

    val ownershipTransfer = ArgInfo.getOwnershipTransfer argInfo
    val isCallerAllocates = ArgInfo.isCallerAllocates argInfo

    val argName = getName argInfo
    val argId = mkId (toLCC argName)

    fun getNthArgName n = getName (CallableInfo.getArg callableInfo n)
    fun getNthArgId n = mkId (toLCC (getNthArgName n))

    val dir =
      case direction of
        Direction.IN    => IN
      | Direction.OUT   => OUT isCallerAllocates
      | Direction.INOUT => INOUT

    local
      open Transfer
    in
      fun ptrOwnXferObjectInterface isPtr ownXfer nonPtrForX =
        if isPtr
        then
          case (dir, ownXfer) of
            (_,     NOTHING)    => SOME false
          | (OUT _, EVERYTHING) => SOME true
          | (IN,    EVERYTHING) => infoError everythingForIn
          | (INOUT, EVERYTHING) => infoError everythingForInOut
          | (_,     CONTAINER)  => infoError containerForInterface
        else
          infoError nonPtrForX
      val objectMsg = nonPtrForObject
      val interfaceMsg = nonPtrForInterface

      fun ptrOwnXferStructUnion isPtr ownXfer (nonPtrForInX, everythingForNonPtrX) =
        case (dir, isPtr, ownXfer) of
          (IN,    false, NOTHING)    => infoError nonPtrForInX
        | (_,     false, NOTHING)    => NONE
        | (_,     true,  NOTHING)    => SOME false
        | (OUT _, true,  EVERYTHING) => SOME true
        | (_,     false, EVERYTHING) => infoError everythingForNonPtrX
        | (IN,    true,  EVERYTHING) => infoError everythingForIn
        | (INOUT, true,  EVERYTHING) => infoError everythingForInOut
        | (_,     _,     CONTAINER)  => infoError containerForInterface
      val structMsg = (nonPtrForInStruct, everythingForNonPtrStruct)
      val unionMsg = (nonPtrForInUnion, everythingForNonPtrUnion)

      fun ptrOwnXferFlagsEnum isPtr ptrForX =
        if isPtr
        then infoError ptrForX
        else NONE
      val flagsMsg = ptrForFlags
      val enumMsg = ptrForEnum
    end

    fun notExpected s = infoError ("parameter type " ^ s ^ " not expected")
    fun notSupported s = infoError ("parameter type " ^ s ^ " not supported")

    fun resolveType () () (isOpt, ownXfer) typeInfo =
      let
        open TypeTag

        fun toScalarParInfo ty =
          if
            if usePtrDefault
            then
              false
            else
              TypeInfo.isPointer typeInfo
          then infoError (ptrForScalar scalarToString ty)
          else
            ISCALAR {
              ty    = ty
            }
      in
        case TypeInfo.getTag typeInfo of
          ERROR        => notExpected "ERROR"
        | GTYPE        => notSupported "GTYPE"
        | ARRAY        =>
            let
              open Transfer

              val () =
                if dir = IN
                then
                  case ownXfer of
                    NOTHING    => ()
                  | CONTAINER  => infoError containerForIn
                  | EVERYTHING => infoError everythingForIn
                else ()

              val ownXfer' =
                case ownXfer of
                  CONTAINER => NOTHING
                | _         => ownXfer

              val () =
                case SOME (TypeInfo.getArrayType typeInfo) of
                  SOME ArrayType.C  => ()
                | SOME ty           => infoError (arrayTypeNotSupported ty)
                | NONE              => infoError noArrayTypeForArray

              val length =
                case TypeInfo.getArrayFixedSize typeInfo of
                  ~1 => (
                    case TypeInfo.getArrayLength typeInfo of
                      ~1 => (
                        if TypeInfo.isZeroTerminated typeInfo
                        then ArrayLengthZeroTerminated
                        else infoError "cannot determine array length"
                      )
                    | n  => ArrayLengthParam (getNthArgId n)
                  )
                | n  => ArrayLengthFixed n

              val elemTypeInfo =
                case TypeInfo.getParamType typeInfo 0 of
                  SOME typeInfo => typeInfo
                | NONE          => infoError noTypeParamForArray

              val arrayInfo = {
                isOpt   = isOpt,
                ownXfer = ownXfer <> NOTHING,
                length  = length,
                elem    = resolveType () () (false, ownXfer') elemTypeInfo
              }
            in
              IARRAY arrayInfo
            end
        | GLIST        => notSupported "GLIST"
        | GSLIST       => notSupported "GSLIST"
        | GHASH        => notSupported "GHASH"
        | VOID         => notExpected "VOID"
        | BOOLEAN      => toScalarParInfo STBOOLEAN
        | INT8         => toScalarParInfo STINT8
        | UINT8        => toScalarParInfo STUINT8
        | INT16        => toScalarParInfo STINT16
        | UINT16       => toScalarParInfo STUINT16
        | INT32        => toScalarParInfo STINT32
        | UINT32       => toScalarParInfo STUINT32
        | INT64        => toScalarParInfo STINT64
        | UINT64       => toScalarParInfo STUINT64
        | FLOAT        => toScalarParInfo STFLOAT
        | DOUBLE       => toScalarParInfo STDOUBLE
        | FILENAME     =>
            let
              open Transfer

              val utf8Info = {
                isOpt   = isOpt,
                ownXfer =
                  case ownXfer of
                    NOTHING    => false
                  | EVERYTHING =>
                      if dir = IN
                      then infoError everythingForIn
                      else true
                  | CONTAINER  => infoError containerForFilename
              }
            in
              IUTF8 utf8Info
            end
        | UTF8         =>
            let
              open Transfer

              val utf8Info = {
                isOpt   = isOpt,
                ownXfer =
                  case ownXfer of
                    NOTHING    => false
                  | EVERYTHING =>
                      if dir = IN
                      then infoError everythingForIn
                      else true
                  | CONTAINER  => infoError containerForUtf8
              }
            in
              IUTF8 utf8Info
            end
        | UNICHAR      => toScalarParInfo STUNICHAR
        | INTERFACE    =>
            let
              val interfaceInfo = getInterface typeInfo
              val interfaceTy = getIRefTy interfaceInfo

              val iRef =
                case () of
                  () =>
                    let
                      val interfaceName = getName interfaceInfo
                      val interfaceNamespace =
                        BaseInfo.getNamespace interfaceInfo
                      val interfaceScope =
                        if interfaceNamespace <> functionNamespace
                        then GLOBAL
                        else
                          case optContainerName of
                            NONE               => LOCALNAMESPACE
                          | SOME containerName =>
                              if interfaceName = containerName
                              then LOCALINTERFACESELF
                              else LOCALINTERFACEOTHER
                    in
                      {
                        namespace = interfaceNamespace,
                        name      = interfaceName,
                        scope     = interfaceScope,
                        ty        = interfaceTy
                      }
                    end

              val infoType = InfoType.getType interfaceInfo
              open InfoType
            in
              case infoType of
                _ =>
                  let
                    val isPtr =
                      if usePtrDefault
                      then
                        case infoType of
                          OBJECT _    => true
                        | INTERFACE _ => true
                        | STRUCT _    => true
                        | UNION _     => true
                        | FLAGS _     => false
                        | ENUM _      => false
                        | _           => infoError (unsupportedInterface infoType)
                      else
                        TypeInfo.isPointer typeInfo

                    val (ptrOwnXfer, rootIRef) =
                      case infoType of
                        OBJECT objectInfo
                                    =>
                          (
                            ptrOwnXferObjectInterface isPtr ownXfer objectMsg,
                            getRootObjectIRef repo functionNamespace
                              optContainerName
                              (objectInfo, iRef)
                          )
                      | INTERFACE _ =>
                          (
                            ptrOwnXferObjectInterface isPtr ownXfer interfaceMsg,
                            makeInterfaceRootIRef functionNamespace
                              optContainerName
                          )
                      | STRUCT _    => (ptrOwnXferStructUnion isPtr ownXfer structMsg, iRef)
                      | UNION _     => (ptrOwnXferStructUnion isPtr ownXfer unionMsg, iRef)
                      | FLAGS _     => (ptrOwnXferFlagsEnum isPtr flagsMsg, iRef)
                      | ENUM _      => (ptrOwnXferFlagsEnum isPtr enumMsg, iRef)
                      | _           => infoError (unsupportedInterface infoType)

                    val interfaceInfo = {
                      rootIRef   = rootIRef,
                      iRef       = iRef,
                      infoType   = infoType,
                      isOpt      = isOpt,
                      ptrOwnXfer = ptrOwnXfer
                    }
                  in
                    IINTERFACE interfaceInfo
                  end
            end
      end
  in
    PISOME {
      name  = argId,
      dir   = dir,
      array = NONE,  (* updated by `updateParInfos` *)
      info  = resolveType () () (mayBeNull, ownershipTransfer) typeInfo
    }
  end
    handle Void => PIVOID


fun updateParInfos retInfo parInfos =
  let
    fun addLenArray name (info, lenArrayInfos) =
      case info of
        IARRAY (
          arrayInfo as {
            length = ArrayLengthParam lenName,
            ...
          }
        ) => (lenName, {name = name, info = arrayInfo}) :: lenArrayInfos
      | _ => lenArrayInfos

    fun addParLenArray (parInfo, lenArrayInfos) =
      case parInfo of
        PIVOID                   => lenArrayInfos
      | PISOME {name, info, ...} => addLenArray name (info, lenArrayInfos)

    val initlenArrayInfos =
      case retInfo of
        RIVOID        => []
      | RISOME {info} => addLenArray "" (info, [])

    val lenArrayInfos = foldl addParLenArray initlenArrayInfos parInfos

    fun getArrayInfo lenName =
      case List.find (fn (x, _) => x = lenName) lenArrayInfos of
        SOME (_, y) => SOME y
      | NONE        => NONE

    fun update parInfo =
      case parInfo of
        PIVOID                        => PIVOID
      | PISOME {name, dir, info, ...} =>
          PISOME {
            name  = name,
            dir   = dir,
            array = getArrayInfo name,
            info  = info
          }
  in
    List.map update parInfos
  end


fun getRetInfo
  usePtrDefault
  repo
  functionNamespace
  optContainerName
  callableInfo =
  let
    val typeInfo = CallableInfo.getReturnType callableInfo
    val () =
      case TypeInfo.getTag typeInfo of
        TypeTag.VOID =>
          if
            (* Don't need a c:type attribute to determine pointer depth for
             * VOID tag, so no need to use default when `usePtrDefault`. *)
            TypeInfo.isPointer typeInfo
              handle
                Fail msg => infoError msg
          then infoError ptrForVoid
          else raise Void
      | _            => ()

    val mayReturnNull = CallableInfo.mayReturnNull callableInfo

    val ownershipTransfer = CallableInfo.getCallerOwns callableInfo

    fun getNthArgName n = getName (CallableInfo.getArg callableInfo n)
    fun getNthArgId n = mkId (toLCC (getNthArgName n))

    local
      open Transfer
    in
      fun ptrOwnXferObjectInterface isPtr ownXfer nonPtrForX =
        if isPtr
        then
          case ownXfer of
            NOTHING    => SOME false
          | EVERYTHING => SOME true
          | CONTAINER  => infoError containerForInterface
        else
          infoError nonPtrForX
      val objectMsg = nonPtrForObject
      val interfaceMsg = nonPtrForInterface

      fun ptrOwnXferStructUnion isPtr ownXfer nonPtrForRetX =
        case (isPtr, ownXfer) of
          (false, _)          => infoError nonPtrForRetX
        | (_,     NOTHING)    => SOME false
        | (_,     EVERYTHING) => SOME true
        | (_,     CONTAINER)  => infoError containerForInterface
      val structMsg = nonPtrForRetStruct
      val unionMsg = nonPtrForRetUnion

      fun ptrOwnXferFlagsEnum isPtr ptrForX =
        if isPtr
        then infoError ptrForX
        else NONE
      val flagsMsg = ptrForFlags
      val enumMsg = ptrForEnum
    end

    fun notExpected s = infoError ("return type " ^ s ^ " not expected")
    fun notSupported s = infoError ("return type " ^ s ^ " not supported")

    fun resolveType () () (isOpt, ownXfer) typeInfo =
      let
        open TypeTag

        fun toScalarRetInfo ty =
          if
            if usePtrDefault
            then
              false
            else
              TypeInfo.isPointer typeInfo
          then infoError (ptrForScalar scalarToString ty)
          else
            ISCALAR {
              ty      = ty
            }
      in
        case TypeInfo.getTag typeInfo of
          ERROR        => notExpected "ERROR"
        | GTYPE        => notSupported "GTYPE"
        | ARRAY        =>
            let
              open Transfer

              val ownXfer' =
                case ownXfer of
                  CONTAINER => NOTHING
                | _         => ownXfer

              val () =
                case SOME (TypeInfo.getArrayType typeInfo) of
                  SOME ArrayType.C  => ()
                | SOME ty           => infoError (arrayTypeNotSupported ty)
                | NONE              => infoError noArrayTypeForArray

              val length =
                case TypeInfo.getArrayFixedSize typeInfo of
                  ~1 => (
                    case TypeInfo.getArrayLength typeInfo of
                      ~1 => (
                        if TypeInfo.isZeroTerminated typeInfo
                        then ArrayLengthZeroTerminated
                        else infoError "cannot determine array length"
                      )
                    | n  => ArrayLengthParam (getNthArgId n)
                  )
                | n  => ArrayLengthFixed n

              val elemTypeInfo =
                case TypeInfo.getParamType typeInfo 0 of
                  SOME typeInfo => typeInfo
                | NONE          => infoError noTypeParamForArray

              val arrayInfo = {
                isOpt   = isOpt,
                ownXfer = ownXfer <> NOTHING,
                length  = length,
                elem    = resolveType () () (false, ownXfer') elemTypeInfo
              }
            in
              IARRAY arrayInfo
            end
        | GLIST        => notSupported "GLIST"
        | GSLIST       => notSupported "GSLIST"
        | GHASH        => notSupported "GHASH"
        | VOID         => notExpected "VOID"
        | BOOLEAN      => toScalarRetInfo STBOOLEAN
        | INT8         => toScalarRetInfo STINT8
        | UINT8        => toScalarRetInfo STUINT8
        | INT16        => toScalarRetInfo STINT16
        | UINT16       => toScalarRetInfo STUINT16
        | INT32        => toScalarRetInfo STINT32
        | UINT32       => toScalarRetInfo STUINT32
        | INT64        => toScalarRetInfo STINT64
        | UINT64       => toScalarRetInfo STUINT64
        | FLOAT        => toScalarRetInfo STFLOAT
        | DOUBLE       => toScalarRetInfo STDOUBLE
        | FILENAME     =>
            let
              open Transfer

              val utf8Info = {
                isOpt   = isOpt,
                ownXfer =
                  case ownXfer of
                    NOTHING    => false
                  | EVERYTHING => true
                  | CONTAINER  => infoError containerForFilename
              }
            in
              IUTF8 utf8Info
            end
        | UTF8         =>
            let
              open Transfer

              val utf8Info = {
                isOpt   = isOpt,
                ownXfer =
                  case ownXfer of
                    NOTHING    => false
                  | EVERYTHING => true
                  | CONTAINER  => infoError containerForUtf8
              }
            in
              IUTF8 utf8Info
            end
        | UNICHAR      => toScalarRetInfo STUNICHAR
        | INTERFACE    =>
            let
              val interfaceInfo = getInterface typeInfo
              val interfaceTy = getIRefTy interfaceInfo

              val iRef =
                case () of
                  () =>
                    let
                      val interfaceName = getName interfaceInfo
                      val interfaceNamespace =
                        BaseInfo.getNamespace interfaceInfo
                      val interfaceScope =
                        if interfaceNamespace <> functionNamespace
                        then GLOBAL
                        else
                          case optContainerName of
                            NONE               => LOCALNAMESPACE
                          | SOME containerName =>
                              if interfaceName = containerName
                              then LOCALINTERFACESELF
                              else LOCALINTERFACEOTHER
                    in
                      {
                        namespace = interfaceNamespace,
                        name      = interfaceName,
                        scope     = interfaceScope,
                        ty        = interfaceTy
                      }
                    end

              val infoType = InfoType.getType interfaceInfo
              open InfoType
            in
              case infoType of
                _ =>
                  let
                    val isPtr =
                      if usePtrDefault
                      then
                        case infoType of
                          OBJECT _    => true
                        | INTERFACE _ => true
                        | STRUCT _    => true
                        | UNION _     => true
                        | FLAGS _     => false
                        | ENUM _      => false
                        | _           => infoError (unsupportedInterface infoType)
                      else
                        TypeInfo.isPointer typeInfo

                    val (ptrOwnXfer, rootIRef) =
                      case infoType of
                        OBJECT objectInfo
                                    =>
                          (
                            ptrOwnXferObjectInterface isPtr ownXfer objectMsg,
                            getRootObjectIRef repo functionNamespace
                              optContainerName
                              (objectInfo, iRef)
                          )
                      | INTERFACE _ =>
                          (
                            ptrOwnXferObjectInterface isPtr ownXfer interfaceMsg,
                            makeInterfaceRootIRef functionNamespace
                              optContainerName
                          )
                      | STRUCT _    => (ptrOwnXferStructUnion isPtr ownXfer structMsg, iRef)
                      | UNION _     => (ptrOwnXferStructUnion isPtr ownXfer unionMsg, iRef)
                      | FLAGS _     => (ptrOwnXferFlagsEnum isPtr flagsMsg, iRef)
                      | ENUM _      => (ptrOwnXferFlagsEnum isPtr enumMsg, iRef)
                      | _           => infoError (unsupportedInterface infoType)

                    val interfaceInfo = {
                      rootIRef   = rootIRef,
                      iRef       = iRef,
                      infoType   = infoType,
                      isOpt      = isOpt,
                      ptrOwnXfer = ptrOwnXfer
                    }
                  in
                    IINTERFACE interfaceInfo
                  end
            end
      end
  in
    RISOME {
      info = resolveType () () (mayReturnNull, ownershipTransfer) typeInfo
    }
  end
    handle Void => RIVOID


(* Specification *)

fun addSpecParInfo
  (makeInRefTy, makeOutRefTy)
  (parInfo, acc as (((inTys, outTys), tyVarIdx), iRefs)) =
  let
    fun mkOpt isOpt ty = if isOpt then optionTy ty else ty

    fun addInTy isElem tyMap tyRef =
      let
        val (ty, tyVarIdx') = makeInRefTy isElem (tyRef, tyVarIdx)
      in
        ((tyMap ty :: inTys, outTys), tyVarIdx')
      end

    fun addInOutTy isElem tyMap tyRef =
      let
        val (ty, tyVarIdx') = makeInRefTy isElem (tyRef, tyVarIdx)
        val isRetCondInit = false
        val ty' = tyMap ty
      in
        ((ty' :: inTys, (ty', isRetCondInit) :: outTys), tyVarIdx')
      end

    fun addOutTy isElem tyMap tyRef =
      let
        val (ty, tyVarIdx') = makeOutRefTy isElem (tyRef, tyVarIdx)
        val isRetCondInit = true
      in
        ((inTys, (tyMap ty, isRetCondInit) :: outTys), tyVarIdx')
      end

    fun addTy dir isElem tyMap tyRef =
      case dir of
        IN    => addInTy isElem tyMap tyRef
      | INOUT => addInOutTy isElem tyMap tyRef
      | OUT _ => addOutTy isElem tyMap tyRef

    fun addIRefTy dir isElem tyMap iRef iRefs =
      let
        val {scope, ...} = iRef
        val iRefs' =
          case scope of
            GLOBAL             => iRefs
          | LOCALINTERFACESELF => iRefs
          | _                  => insert (iRef, iRefs)

        val ifTyRef = (
          numInterfaceRefTyVars iRef,
          makeInterfaceRefTyLongId iRef
        )
      in
        (addTy dir isElem tyMap ifTyRef, iRefs')
      end
  in
    case parInfo of
      PIVOID                                => acc
    | PISOME {array = SOME _, ...}          => acc
    | PISOME {dir, array = NONE, info, ...} =>
        let
          val baseInfo = getBaseInfo info
          val arrayTy =
            case baseInfo of
              IUTF8 _ => listTy
            | _       => vectorTy

          fun addInfo isElem tyMap info =
            case info of
              ISCALAR {ty, ...}                  =>
                (addTy dir isElem tyMap (scalarTyRef ty), iRefs)
            | IUTF8 {isOpt, ...}                 =>
                (addTy dir isElem (mkOpt isOpt o tyMap) utf8TyRef, iRefs)
            | IARRAY {isOpt, elem, ...}          => (
                case elem of
                  ISCALAR {
                    ty = STUINT8,
                    ...
                  } => (addTy dir isElem (mkOpt isOpt o tyMap) word8VectorTyRef, iRefs)
                | _ => addInfo true (mkOpt isOpt o arrayTy o tyMap) elem
              )
            | IINTERFACE {iRef, isOpt, ...}      =>
                addIRefTy dir isElem (mkOpt isOpt o tyMap) iRef iRefs
        in
          addInfo false I info
        end
  end


fun addSpecRetInfo
  makeOutRefTy
  (optConstructorIRef)
  (retInfo, (tyVarIdx, iRefs)) =
  let
    fun mkOpt isOpt ty = if isOpt then optionTy ty else ty

    fun mkTy isElem tyMap tyRef =
      let
        val (ty, tyVarIdx') = makeOutRefTy isElem (tyRef, tyVarIdx)
      in
        (tyMap ty, tyVarIdx')
      end

    fun mkIRefTy isElem tyMap iRef iRefs =
      let
        val {scope, ...} = iRef
        val iRefs' =
          case scope of
            GLOBAL             => iRefs
          | LOCALINTERFACESELF => iRefs
          | _                  => insert (iRef, iRefs)

        val ifTyRef = (
          numInterfaceRefTyVars iRef,
          makeInterfaceRefTyLongId iRef
        )
      in
        (mkTy isElem tyMap ifTyRef, iRefs')
      end
  in
    case retInfo of
      RIVOID        => ((unitTy, tyVarIdx), iRefs)
    | RISOME {info} =>
        let
          val baseInfo = getBaseInfo info
          val arrayTy =
            case baseInfo of
              IUTF8 _ => listTy
            | _       => vectorTy

          fun addInfo isElem tyMap info =
            case info of
              ISCALAR {ty, ...}                  => (mkTy isElem tyMap (scalarTyRef ty), iRefs)
            | IUTF8 {isOpt, ...}                 => (mkTy isElem (mkOpt isOpt o tyMap) utf8TyRef, iRefs)
            | IARRAY {isOpt, elem, ...}          => (
                case elem of
                  ISCALAR {
                    ty = STUINT8,
                    ...
                  } => (mkTy isElem (mkOpt isOpt o tyMap) word8VectorTyRef, iRefs)
                | _ => addInfo true (mkOpt isOpt o arrayTy o tyMap) elem
              )
            | IINTERFACE {
                iRef,
                infoType,
                isOpt,
                ptrOwnXfer,
                ...
              }                                  =>
                let
                  val interfaceRetInfo = {
                    iRef       =
                      case (optConstructorIRef, infoType) of
                        (SOME constructorIRef, InfoType.OBJECT _)    => constructorIRef
                      | (SOME constructorIRef, InfoType.INTERFACE _) => constructorIRef
                      | _                                            => iRef,
                    infoType   = infoType,
                    isOpt      = isOpt,
                    ptrOwnXfer = ptrOwnXfer
                  }
                  val {iRef, isOpt, ...} = interfaceRetInfo
                in
                  mkIRefTy isElem (mkOpt isOpt o tyMap) iRef iRefs
                end
        in
          addInfo false I info
        end
  end


fun makeFunctionSpec
  repo
  (optContainerIRef : interfaceref option)
  (functionInfo, (iRefs, errs))
  : spec * (interfaceref list * infoerrorhier list) =
  let
    val () = checkDeprecated functionInfo

    val () = checkFunctionSymbol functionInfo

    val functionName = getName functionInfo
    val () = checkFunctionName functionName

    val functionNameId = mkId (toLCC functionName)
    val functionNamespace = BaseInfo.getNamespace functionInfo
    val functionFlags = FunctionInfo.getFlags functionInfo

    val optContainerName = Option.map #name optContainerIRef

    (* Construct parameter infos and return value info *)
    val parInfos =
      revMapInfos
        CallableInfo.getNArgs
        CallableInfo.getArg
        (getParInfo false repo functionNamespace optContainerName functionInfo)
        (functionInfo, [])

    val retInfo =
      getRetInfo false repo functionNamespace optContainerName
        functionInfo

    val parInfos = updateParInfos retInfo parInfos


    (* For a method function, add an initial argument type for the interface
     * that contains this function. *)
    val tyVarIdx'0 = 0
    val (revInTys'1, tyVarIdx'1) =
      if FunctionInfoFlags.anySet
           (functionFlags, FunctionInfoFlags.IS_METHOD)
      then
        case optContainerIRef of
          SOME containerIRef =>
            let
              val (selfTy, tyVarIdx'1) =
                makeIRefLocalTypeRef (makeRefVarTy false) (containerIRef, tyVarIdx'0)
            in
              ([selfTy], tyVarIdx'1)
            end
        | NONE               =>
            infoError "function outside interface has method flag set"
      else
        ([], tyVarIdx'0)
    val revOutTys'1 = []
    val iRefs'1 = iRefs

    (* Add types for the arguments and the return value. *)
    val (((revInTys'2, revOutTys'2), tyVarIdx'2), iRefs'2) =
      foldl
        (addSpecParInfo (makeRefVarTy, makeRefBaseTy))
        (((revInTys'1, revOutTys'1), tyVarIdx'1), iRefs'1)
        parInfos

    val optConstructorIRef =
      if FunctionInfoFlags.anySet
           (functionFlags, FunctionInfoFlags.IS_CONSTRUCTOR)
      then
        case optContainerIRef of
          SOME _ => optContainerIRef
        | NONE   =>
            infoError "function outside interface has constructor flag set"
      else
        NONE
    val ((retValTy, _), iRefs'3) =
      addSpecRetInfo
        makeRefBaseTy
        optConstructorIRef
        (retInfo, (tyVarIdx'2, iRefs'2))

    (* Handle case L = 0 and ISMETHOD not set in FunctionFlags. *)
    val revInTys'3 =
      case revInTys'2 of
        []     => [unitTy]
      | _ :: _ => revInTys'2

    (* `revOutTys'2` contains out parameter types associated with
     * the caller-allocates flag for each out parameter. *)
    val retTy =
      case revOutTys'2 of
        []     => retValTy
      | _ :: _ =>
          let
            fun getTy (ty, _) = ty
            fun getCondTy (ty, isCond) = if isCond then SOME ty else NONE

            val (outParamTysCond, outParamTysUncond) =
              partitionRevMap (getCondTy, getTy) revOutTys'2

            val retTys =
              case (retInfo, outParamTysCond) of
                (RIVOID,                         [])                       =>
                  outParamTysUncond

              | (_,                              [])                       =>
                  retValTy :: outParamTysUncond

              | (RISOME {info = ISCALAR {ty = STBOOLEAN, ...}}, ty :: tys) =>
                  optionTy (mkProdTy1 (ty, tys)) :: outParamTysUncond

              | (RIVOID,                         _ :: _)                   =>
                  outParamTysCond @ outParamTysUncond

              | (_,                              _ :: _)                   =>
                  retValTy :: (outParamTysCond @ outParamTysUncond)

               (*
                * In future, when conditional outs can be identifed
                * the last two cases will be:
                *
              | (_,                              _ :: _)                   =>
                  infoError "non-BOOLEAN return type with \
                            \conditional out parameters"
                *)
          in
            mkProdTy0 retTys  (* `length retTys > 0` so result not unit type *)
          end

    val functionTy = foldl TyFun retTy revInTys'3
  in
    (mkValSpec (functionNameId, functionTy), (iRefs'3, errs))
  end

(*
 *     val getType : unit -> <typeIRef>
 *)
fun getTypeSpec typeIRef =
  let
    val (typeRefTy, _) = makeIRefLocalTypeRef (makeRefBaseTy false) (typeIRef, 0)
  in
    mkValSpec (getTypeId, TyFun (unitTy, typeRefTy))
  end


(* High-level *)

(* `addParInfo` accumulates high-level function components in the parameter
 *
 *   `(js, ks, ls, ms, ns, iRefs, strDecs)`
 *
 * The lists `js`, `ks`, `ls, `ms` and `ns` accumulate the components of the
 * vectors of sizes J, K, L, N, M and L, respectively, in the codegen for
 * HighLevelFunction.
 *
 * `js`, `ks`, `ls`, `ms` and `ns` are built up in reverse.  After iterating
 * over all `parInfo` values, the final values are as follows:
 *
 *
 *   the j<th> element of `js` contains
 *
 *     (<withFun[j]>, <argVal[j]>)
 *
 *
 *   the k<th> element of `ks` contains
 *
 *     (<outParamExp[k]>, <isCondOut[k]>)
 *
 *
 *   the l<th> element of `ls` contains
 *
 *     <inParamName[l]>
 *
 *
 *   the m<th> element of `ms` contains
 *
 *     (<lenParamName[m]>, <lenParamExp[m]>)
 *
 *
 *   the n<th> element of `ns` contains
 *
 *     (<fromFun[n]>, <outParamName[n]>)
 *
 *
 * `iRefs` accumulates the references to interfaces for generating type
 * declarations as required by the signature and the corresponding where
 * clauses on the signature ascription in the structure.
 *
 * `strDecs` accumulates structure declarations for required array types
 * which are included at the start of the structure.
 *)

local
  datatype xfer =
    XferFlag of bool
  | XferDepth of int
  | XferNone

  fun withFunExp prefixIds {isRef, isDup, isNew, isOpt, isPtr, xfer} =
    let
      val refStr = if isRef then "Ref" else ""
      val dupStr = if isDup then "Dup" else ""
      val newStr = if isNew then "New" else ""
      val optStr = if isOpt then "Opt" else ""
      val ptrStr = if isPtr then "Ptr" else "Val"

      val withFunId =
        concat ["with", refStr, dupStr, newStr, optStr, ptrStr]
      val funExp = mkLIdLNameExp (prefixIds @ [withFunId])
    in
      case xfer of
        XferFlag b  => ExpApp (funExp, mkIdLNameExp (Bool.toString b))
      | XferDepth n => ExpApp (funExp, mkIntConstExp n)
      | XferNone    => funExp
    end

  fun fromFunExp prefixIds {isOpt, xfer} =
    let
      val optStr = if isOpt then "Opt" else ""
      val ptrStr = if xfer <> XferNone then "Ptr" else "Val"

      val fromFunId = concat ["from", optStr, ptrStr]
      val funExp = mkLIdLNameExp (prefixIds @ [fromFunId])
    in
      case xfer of
        XferFlag b  => ExpApp (funExp, mkIdLNameExp (Bool.toString b))
      | XferDepth n => ExpApp (funExp, mkIntConstExp n)
      | XferNone    => funExp
    end

  fun withFunScalar (dir, {ty, ...} : scalar_info) =
    let
      val prefixIds = [gStrId ^ scalarStrId ty, ffiStrId]
    in
      withFunExp prefixIds {
        isRef = dir <> IN,
        isDup = false,
        isNew = false,
        isOpt = false,
        isPtr = false,
        xfer  = XferNone
      }
    end

  fun withFunUtf8 (dir, {ownXfer, isOpt, ...} : utf8_info) =
    let
      val prefixIds = [utf8StrId, ffiStrId]

      val isDup = dir = INOUT andalso ownXfer
    in
      withFunExp prefixIds {
        isRef = dir <> IN,
        isDup = isDup,
        isNew = false,
        isOpt = isOpt orelse case dir of OUT _ => true | _ => false,
        isPtr = true,
        xfer  =
          if isDup
          then XferDepth 1
          else XferNone
      }
    end

  fun withFunArray arrayStrId (dir, {ownXfer, isOpt, elem, ...} : array_info) =
    let
      val prefixIds = [arrayStrId, ffiStrId]

      val isDup = dir = INOUT andalso ownXfer
    in
      withFunExp prefixIds {
        isRef = dir <> IN,
        isDup = isDup,
        isNew = false,
        isOpt = isOpt orelse case dir of OUT _ => true | _ => false,
        isPtr = true,
        xfer  =
          if isDup
          then XferDepth (getArrayOwnXferDepth (boolToInt ownXfer) elem)
          else XferNone
      }
    end

  fun withFunInterface
    (dir, {iRef, infoType, ptrOwnXfer, isOpt, ...} : interface_info) =
    let
(*
      val {isSelf, ...} = iRef

      open InfoType
      val prefixIds =
        case infoType of
          OBJECT _    => prefixInterfaceStrId iRef [ffiStrId]
        | INTERFACE _ => prefixInterfaceStrId iRef [ffiStrId]
        | STRUCT _    => prefixInterfaceStrId iRef [ffiStrId]
        | _           =>
            if isSelf
            then [ffiStrId]
            else prefixInterfaceStrId iRef [ffiStrId]

 * Is above really needed?
 * Doesn't `prefixInterfaceStrId` handle SIMPLE case for LOCALINTERFACESELF?
 * Let's see...
 *)
      val prefixIds = prefixInterfaceStrId iRef [ffiStrId]

      open InfoType
    in
      withFunExp prefixIds {
        isRef =
          dir <> IN andalso (
            case infoType of
              STRUCT _ => isSome ptrOwnXfer
            | _        => true
          ),
        isDup =
          case (infoType, dir) of
            (OBJECT _, INOUT) => true
          | (STRUCT _, INOUT) => true
          | _                 => false,
        isNew =
          case dir of
            OUT isCallerAllocates => isCallerAllocates andalso ptrOwnXfer = NONE
            (* Note that `isCallerAllocates` can be true when `ptrOwnXfer <> NONE`
             * for disguised structs, such as GdkAtom.  For information on disguised
             * structs, see https://bugzilla.gnome.org/show_bug.cgi?id=560248 . *)
          | _                     => false,
        isOpt =
          case dir of
            IN    => isOpt
          | OUT _ => isSome ptrOwnXfer
          | INOUT => false,
        isPtr =
          case infoType of
            STRUCT _ => true
          | _        => isSome ptrOwnXfer,
        xfer  = XferNone
      }
    end

  fun fromFunScalar ({ty, ...} : scalar_info) =
    let
      val prefixIds = [gStrId ^ scalarStrId ty, ffiStrId]
    in
      fromFunExp prefixIds {
        isOpt = false,
        xfer  = XferNone
      }
    end

  fun fromFunUtf8 (_, {ownXfer, isOpt, ...} : utf8_info) =
    let
      val prefixIds = [utf8StrId, ffiStrId]
    in
      fromFunExp prefixIds {
        isOpt = isOpt,
        xfer  = XferDepth (boolToInt ownXfer)
      }
    end

  fun fromFunArray arrayStrId (_, {ownXfer, isOpt, elem, ...} : array_info) =
    let
      val prefixIds = [arrayStrId, ffiStrId]
    in
      fromFunExp prefixIds {
        isOpt = isOpt,
        xfer  = XferDepth (getArrayOwnXferDepth (boolToInt ownXfer) elem)
      }
    end

  fun fromFunInterface
    (isInOut, {iRef, infoType, ptrOwnXfer, isOpt, ...} : interface_info) =
    let
(*
      val {isSelf, ...} = iRef

      open InfoType
      val prefixIds =
        case infoType of
          OBJECT _    => prefixInterfaceStrId iRef [ffiStrId]
        | INTERFACE _ => prefixInterfaceStrId iRef [ffiStrId]
        | STRUCT _    => prefixInterfaceStrId iRef [ffiStrId]
        | _           =>
            if isSelf
            then [ffiStrId]
            else prefixInterfaceStrId iRef [ffiStrId]

 * Is above really needed?
 * Doesn't `prefixInterfaceStrId` handle SIMPLE case for LOCALINTERFACESELF?
 * Let's see...
 *)
      val prefixIds = prefixInterfaceStrId iRef [ffiStrId]

      open InfoType
    in
      fromFunExp prefixIds {
        isOpt = isOpt,
        xfer  =
          case (infoType, isInOut, ptrOwnXfer) of
            (OBJECT _,    true,  _)         => XferFlag true
          | (INTERFACE _, true,  _)         => XferFlag true
          | (STRUCT _,    false, NONE)      => XferFlag true
          | (STRUCT _,    true,  _)         => XferFlag true
          | _                               =>
              case ptrOwnXfer of
                SOME ownXfer => XferFlag ownXfer
              | NONE         => XferNone
      }
    end

  fun argValScalar (name, dir, {ty, ...} : scalar_info) =
    case dir of
      OUT _ => mkLIdLNameExp [gStrId ^ scalarStrId ty, nullId]
    | _     => mkIdLNameExp name

  fun argValUtf8 (name, dir, {...} : utf8_info) =
    case dir of
      OUT _ => noneExp
    | _     => mkIdLNameExp name

  fun argValArray (name, dir, {...} : array_info) =
    case dir of
      OUT _ => noneExp
    | _     => mkIdLNameExp name

  fun argValInterface
    (name, dir, {iRef, infoType, ptrOwnXfer, ...} : interface_info) =
    case dir of
      OUT _ =>
        let
          open InfoType
        in
          case infoType of
            OBJECT _    => noneExp
          | INTERFACE _ => noneExp
          | STRUCT _    =>
              if isSome ptrOwnXfer
              then noneExp
              else ExpConst ConstUnit
          | FLAGS _     =>
              ExpApp (
                mkLIdLNameExp (prefixInterfaceStrId iRef [flagsId]),
                ExpList []
              )
          | ENUM _      => mkLIdLNameExp (prefixInterfaceStrId iRef ["null"])
          | _           =>
              infoError "initVal for unidentified INTERFACE not supported"
        end
    | _     => mkIdLNameExp name

  fun mkLenParamExp ty arrayInfo arrayName =
    let
      val {length, elem, isOpt, ...} = arrayInfo
      val strId = cArrayStrId length elem
      val lenExp =
        ExpApp (
          mkLIdLNameExp [largeIntStrId, fromIntId],
          mkParenExp (
            ExpApp (
              mkLIdLNameExp [strId, lengthId],
              mkIdLNameExp arrayName
            )
          )
        )
    in
      if isOpt
      then
        let
          val somePat = PatPrefix (toList1 [someId], mkIdVarPat arrayName)
          val nonePat = mkConstPat (mkIdLNameConst noneId)
          val noneExp = mkLIdLNameExp [gStrId ^ scalarStrId ty, nullId]
        in
          ExpCase (
            mkIdLNameExp arrayName,
            toList1 [
              (somePat, lenExp),
              (nonePat, noneExp)
            ]
          )
        end
      else
        lenExp
    end
in
  fun addParInfo (parInfo, acc as (js, ks, ls, ms, ns, iRefs, structDeps)) =
    case parInfo of
      PIVOID                          => acc
    | PISOME {name, dir, array, info} =>
        let
          val (withFunExp, argValExp, fromFunExp, outParamExp, structDeps'1) =
            case info of
              ISCALAR scalarParInfo       =>
                let
                  val withFunExp = withFunScalar (dir, scalarParInfo)
                  val argValExp = argValScalar (name, dir, scalarParInfo)
                  fun fromFunExp () = fromFunScalar scalarParInfo
                  fun outParamExp () = mkIdLNameExp name
                in
                  (withFunExp, argValExp, fromFunExp, outParamExp, structDeps)
                end
            | IUTF8 utf8ParInfo           =>
                let
                  val withFunExp = withFunUtf8 (dir, utf8ParInfo)
                  val argValExp = argValUtf8 (name, dir, utf8ParInfo)
                  fun fromFunExp () = fromFunUtf8 (dir = INOUT, utf8ParInfo)
                  fun outParamExp () = mkIdLNameExp name
                in
                  (withFunExp, argValExp, fromFunExp, outParamExp, structDeps)
                end
            | IARRAY arrayParInfo         =>
                let
                  val {length, elem, ...} = arrayParInfo
                  val (strId, structDeps'1) =
                    cArrayStrIdStructDeps length elem structDeps

                  val withFunExp = withFunArray strId (dir, arrayParInfo)
                  val argValExp = argValArray (name, dir, arrayParInfo)
                  fun fromFunExp () =
                    fromFunArray strId (dir = INOUT, arrayParInfo)
                  fun outParamExp () = mkArrayLenExp length (mkIdLNameExp name)
                in
                  (withFunExp, argValExp, fromFunExp, outParamExp, structDeps'1)
                end
            | IINTERFACE interfaceParInfo =>
                let
                  val withFunExp = withFunInterface (dir, interfaceParInfo)
                  val argValExp = argValInterface (name, dir, interfaceParInfo)
                  fun fromFunExp () =
                    fromFunInterface (dir = INOUT, interfaceParInfo)
                  fun outParamExp () = mkIdLNameExp name
                in
                  (withFunExp, argValExp, fromFunExp, outParamExp, structDeps)
                end

          val js' = (withFunExp, argValExp) :: js
          val structDeps' = structDeps'1

          fun addK ks =
            case array of
              SOME _ => ks
            | NONE   => (outParamExp (), dir <> INOUT) :: ks
          fun addL ls =
            case array of
              SOME _ => ls
            | NONE   => mkIdVarAPat name :: ls
          fun addM ms =
            case array of
              SOME {
                name = arrayName,
                info = arrayInfo
              }    => (
                case info of
                  ISCALAR {ty, ...} => (name, mkLenParamExp ty arrayInfo arrayName) :: ms
                | _                 => infoError "non-scalar length parameter"
              )
            | NONE => ms
          fun addN ns = (fromFunExp (), name) :: ns

          val (ks', ls', ms', ns') =
            case dir of
              OUT _ => (addK ks, ls,      ms,      addN ns)
            | INOUT => (addK ks, addL ls, addM ms, addN ns)
            | IN    => (ks,      addL ls, addM ms, ns)

          val iRefs' = addIRef (info, iRefs)
        in
          (js', ks', ls', ms', ns', iRefs', structDeps')
        end

  fun addRetInfo optConstructorIRef (retInfo, acc as (iRefs, structDeps)) =
    case retInfo of
      RIVOID        => (mkIdLNameExp "I", acc)
    | RISOME {info} =>
        let
          (* override type in `info` for interface constructor *)
          val info' =
            case info of
              ISCALAR _ => info
            | IUTF8 _   => info
            | IARRAY _  => info
            | IINTERFACE {
                rootIRef,
                iRef,
                infoType,
                isOpt,
                ptrOwnXfer
              }         =>
                IINTERFACE {
                  rootIRef   = rootIRef,
                  iRef       =
                    case (optConstructorIRef, infoType) of
                      (SOME constructorIRef, InfoType.OBJECT _)    => constructorIRef
                    | (SOME constructorIRef, InfoType.INTERFACE _) => constructorIRef
                    | _                                            => iRef,
                  infoType   = infoType,
                  isOpt      = isOpt,
                  ptrOwnXfer = ptrOwnXfer
                }

          val (fromFunExp, structDeps') =
            case info' of
              ISCALAR scalarParInfo       =>
                let
                  val fromFunExp = fromFunScalar scalarParInfo
                in
                  (fromFunExp, structDeps)
                end
            | IUTF8 utf8ParInfo           =>
                let
                  val fromFunExp = fromFunUtf8 (false, utf8ParInfo)
                in
                  (fromFunExp, structDeps)
                end
            | IARRAY arrayParInfo         =>
                let
                  val {length, elem, ...} = arrayParInfo
                  val (strId, structDeps') =
                    cArrayStrIdStructDeps length elem structDeps

                  val fromFunExp = fromFunArray strId (false, arrayParInfo)
                in
                  (fromFunExp, structDeps')
                end
            | IINTERFACE interfaceParInfo =>
                let
                  val fromFunExp = fromFunInterface (false, interfaceParInfo)
                in
                  (fromFunExp, structDeps)
                end

          val iRefs' = addIRef (info', iRefs)
        in
          (fromFunExp, (iRefs', structDeps'))
        end
end


fun withFunErr namespace optName =
  mkLIdLNameExp (
    prefixInterfaceStrId (makeErrorIRef namespace optName) [handleErrorId]
  )

fun argValErr (_ : lid list) =
  ExpList []


val retValId : id = "retVal"
val retValPat : pat = mkIdVarPat retValId
val retValExp : exp = mkIdLNameExp retValId

val retVal =
  fn
    RIVOID              => (PatA (APatConst ConstUnit), ExpConst ConstUnit)
  | RISOME {info} =>
      case info of
        IARRAY {length, ...} => (retValPat, mkArrayLenExp length retValExp)
      | _                    => (retValPat, retValExp)


val aInfixId = "&"
val aAInfixId = "&&"
val aARInfixId = "&&>"
val aAARInfixId = "&&&>"
val dDRInfixId = "-->"
val dDDRInfixId = "--->"

fun mkAExp (a, b) = ExpInfixApp (a, aInfixId, b)
fun mkAPat (a, b) = PatInfix (a, aInfixId, b)
fun mkAAExp (a, b) = ExpInfixApp (a, aAInfixId, b)
fun mkAARExp (a, b) = ExpInfixApp (a, aARInfixId, b)
fun mkAAARExp (a, b) = ExpInfixApp (a, aAARInfixId, b)
fun mkDDRExp (a, b) = ExpInfixApp (a, dDRInfixId, b)
fun mkDDDRExp (a, b) = ExpInfixApp (a, dDDRInfixId, b)


fun retValCondExp retValExp (es1 : exp list1) : exp =
  ExpCond (retValExp, someExp (mkTupleExp1 es1), noneExp)


fun makeFunctionStrDecHighLevel
  repo
  (optRootContainerIRef : (interfaceref * interfaceref) option)
  (functionInfo, ((iRefs, structDeps), errs))
  : strdec * ((interfaceref list * struct1 ListDict.t) * infoerrorhier list) =
  let
    val () = checkDeprecated functionInfo

    val () = checkFunctionSymbol functionInfo

    val functionName = getName functionInfo
    val () = checkFunctionName functionName

    val functionNameLCC = toLCC functionName
    val functionNameUId = functionNameLCC ^ "_"
    val functionNameId = mkId functionNameLCC
    val functionNamespace = BaseInfo.getNamespace functionInfo
    val functionFlags = FunctionInfo.getFlags functionInfo

    val (_, optContainerIRef) =
      case optRootContainerIRef of
        SOME (rootIRef, containerIRef) => (SOME rootIRef, SOME containerIRef)
      | NONE                           => (NONE, NONE)
    val optContainerName = Option.map #name optContainerIRef

    (* Construct parameter infos and return value info *)
    val parInfos =
      revMapInfos
        CallableInfo.getNArgs
        CallableInfo.getArg
        (getParInfo false repo functionNamespace optContainerName functionInfo)
        (functionInfo, [])

    val retInfo =
      getRetInfo false repo functionNamespace optContainerName
        functionInfo

    val parInfos = updateParInfos retInfo parInfos


    (* For a method function, add an initial argument for the interface
     * that contains this function. *)
    val (revJs'1, revLs'1) =
      if FunctionInfoFlags.anySet
           (functionFlags, FunctionInfoFlags.IS_METHOD)
      then
        case optContainerIRef of
          SOME iRef =>
            let
              val withFun =
                mkLIdLNameExp (
                  prefixInterfaceStrId iRef [ffiStrId, withPtrId]
                )
              val argVal = mkIdLNameExp selfId
              val inParamAPat = mkIdVarAPat selfId
            in
              ([(withFun, argVal)], [inParamAPat])
            end
        | NONE      =>
            infoError "function outside interface has method flag set"
      else
        ([], [])
    val revKs'1 = []
    val revMs'1 = []
    val revNs'1 = []
    val iRefs'1 = iRefs
    val structDeps'1 = structDeps

    (* Construct J, K, L, M, N vectors in forward pass over parameter infos.
     * As for a function spec, `iRefs` should be generated in a forwards
     * pass over the parameter infos so types appear in order of first
     * appearance. *)
    val (revJs'2, revKs'2, revLs'2, revMs'2, revNs'2, iRefs'2, structDeps'2) =
      foldl addParInfo
        (revJs'1, revKs'1, revLs'1, revMs'1, revNs'1, iRefs'1, structDeps'1)
        parInfos

    (* For a function that may raise an exception, add a final argument for
     * the GError out parameter. *)
    val revJs'3 =
      if FunctionInfoFlags.anySet
           (functionFlags, FunctionInfoFlags.THROWS)
      then
        (
          withFunErr functionNamespace optContainerName,
          argValErr []
        ) :: revJs'2
      else
        revJs'2

    val optConstructorIRef =
      if FunctionInfoFlags.anySet
           (functionFlags, FunctionInfoFlags.IS_CONSTRUCTOR)
      then
        case optContainerIRef of
          SOME _ => optContainerIRef
        | NONE   =>
            infoError "function outside interface has constructor flag set"
      else
        NONE
    val (retFromFun, (iRefs'3, structDeps'3)) =
      addRetInfo optConstructorIRef (retInfo, (iRefs'2, structDeps'2))

    (* Derive non-empty lists `revWithFuns1` and `revArgVals1` from `revJs'3`
     * and non-empty list `inParamNames1` from `revLs'2`.  When
     *
     *   J = 0 and not anySet (functionFlags, flags [ISMETHOD, THROWS])
     *
     * `revJs'3` is empty and when L = 0, `revLs'2` is empty.  The cases when
     * `revJs'3` and `revLs'2` are empty are handled as follows:
     *
     * `inParamNames1 : apat list1` is
     *
     *   ()
     *     if revLs'2 = []
     *)
    val inParamNames1 : apat list1 = getList1 (rev revLs'2, APatConst ConstUnit)

    (* `revWithFuns1 : exp list1` is
     *
     *   I
     *     if revJs'3 = []
     *
     * and `revArgVals1 : exp list1` is
     *
     *   ()
     *     if revJs'3 = []
     *)
    val (revWithFuns1 : exp list1, revArgVals1 : exp list1) =
      unzip1 (getList1 (revJs'3, (iExp, ExpConst ConstUnit)))

    (* No need to handle N = 0 here: lists `revFromFuns` and `revOutParams` may
     * be empty.  `revOutParams` contains out parameter names associated with
     * the conditional output flag for each out parameter.
     *)
    val (revFromFuns, revOutParams) = ListPair.unzip revNs'2

    (* Construct
     *
     *   <fromFun[1]> && ... && <fromFun[N]> && <retFromFun>
     *)
    val fromFunsExp = foldl mkAAExp retFromFun revFromFuns

    (*
     *   <withFun[1]> &&&> ... &&&> <withFun[J]>
     *)
    val withFunsExp = foldl1 mkAAARExp revWithFuns1

    (*
     *   <argVal[1]> & ... & <argVal[J]>
     *)
    val argValsExp = foldl1 mkAExp revArgVals1

    (*
     *   (<withFun[1]> &&&> ... &&&> <withFun[J]>
     *     ---> <fromFun[1]> && ... && <fromFun[N]> && <retFromFun>)
     *     <functionName>_
     *     (<argVal[1]> & ... & <argVal[J]>)
     *)
    val functionCoreExp =
      ExpApp (
        ExpApp (
          mkParenExp (mkDDDRExp (withFunsExp, fromFunsExp)),
          mkIdLNameExp functionNameUId
        ),
        case revArgVals1 of
          (_,        _ :: _) => mkParenExp argValsExp
        | (ExpApp _, [])     => mkParenExp argValsExp
        | _                  => argValsExp
      )

    (* Construct the function body with the form:
     *
     *   let
     *     val <lenParamName[1]> = <lenParamExp[1]>
     *     ...
     *     val <lenParamName[M]> = <lenParamExp[M]>
     *
     *     val <outParamName[1]> & ... & <outParamName[N]> & <retVal> =
     *       <functionCoreExp>
     *   in
     *     <retExp>
     *   end
     *     if N + M > 0, i.e. N > 0 or M > 0
     *
     *
     *   <functionCoreExp>
     *     otherwise, i.e. N = 0 and M = 0
     *)
    val functionExp =
      case (revOutParams, revMs'2) of
        ([], []) => functionCoreExp
      | _        =>
          let
            fun getNameExp (exp, _) = exp
            fun getCondNameExp (exp, isCond) =
              if isCond then SOME exp else NONE

            val (outParamExpsCond, outParamExpsUncond) =
              partitionRevMap (getCondNameExp, getNameExp) revKs'2

            val (retValPat, retValExp) = retVal retInfo
            val retExps =
              case (retInfo, outParamExpsCond) of
                (RIVOID,                         [])                     =>
                  outParamExpsUncond

              | (_,                              [])                     =>
                  retValExp :: outParamExpsUncond

              | (RISOME {info = ISCALAR {ty = STBOOLEAN, ...}}, e :: es) =>
                  retValCondExp retValExp (e, es) :: outParamExpsUncond

              | (RIVOID,                         _ :: _)                 =>
                  outParamExpsCond @ outParamExpsUncond

              | (_,                              _ :: _)                 =>
                  retValExp :: (outParamExpsCond @ outParamExpsUncond)
               (*
                * In future, when conditional outs can be identifed
                * the last two cases will be:
                *
                  infoError "non-BOOLEAN return type with \
                            \conditional out parameters"
                *)
            val retExp =
              case retExps of
                []      => ExpConst ConstUnit
              | e :: [] => e
              | e :: es => ExpParen (e, es)

            val revOutParamPats = map mkIdVarPat revOutParams
            val pat = foldl mkAPat retValPat revOutParamPats
            val decs'1 = [DecVal (toList1 [([], false, pat, functionCoreExp)])]
            val decs'2 = revMapAppend mkIdValDec (revMs'2, decs'1)
          in
            ExpLet (mkDecs decs'2, toList1 [retExp])
          end
  in
    (
      StrDecDec (
        DecFun (
          [],
          toList1 [
            toList1 [
              (
                FunHeadPrefix (NameId functionNameId, inParamNames1),
                NONE,
                functionExp
              )
            ]
          ]
        )
      ),
      ((iRefs'3, structDeps'3), errs)
    )
  end

(*
 *     val getType = (I ---> GObjectType.C.fromVal) getType_
 *)
val getTypeStrDecHighLevel =
  StrDecDec (
    mkIdValDec (
      getTypeId,
      ExpApp (
        mkParenExp (
          mkDDDRExp (iExp, mkLIdLNameExp ["GObjectType", ffiStrId, fromValId])
        ),
        mkIdLNameExp getTypeUId
      )
    )
  )



(* Low-level - common *)

datatype dir = In | Out
datatype low_level_spec =
  VAL
| PTR of {optDir : dir option, isOpt : bool}
| REF of {isInOut : bool, isOpt : bool} option



(* Low-level - Poly/ML *)

(* `callPolyMLFFIExp libId functionSymbol (parConvs, retConv)` constructs
 * a Poly/ML low-level function call expression as follows:
 *
 *   call
 *     (load_sym <libId> "<functionSymbol>")
 *     (<parConvs> --> <retConv>)
 *)
fun callPolyMLFFIExp libId functionSymbol (parConvs, retConv) =
  ExpApp (
    ExpApp (
      mkIdLNameExp callId,
      mkParenExp (
        ExpApp (
          ExpApp (
            mkIdLNameExp loadSymId,
            mkIdLNameExp libId
          ),
          ExpConst (ConstString functionSymbol)
        )
      )
    ),
    mkParenExp (mkDDRExp (parConvs, retConv))
  )


local
  (*
   * Value conversions:
   *   <A>.cVal
   *   <A>.cRef
   *
   * Pointer conversions:
   *   <A>.c<Opt>Ptr
   *   <A>.cOut<Opt>Ref
   *   <A>.cInOut<Opt>Ref
   *
   * Array types:
   *   <A>.cIn<Opt>Ptr
   *   <A>.cOut<Opt>Ptr
   *   <A>.cOut<Opt>Ref
   *   <A>.cInOut<Opt>Ref
   *)
  fun convExp prefixIds spec =
    let
      val convId =
        case spec of
          VAL                         => "cVal"
        | PTR {optDir, isOpt}         =>
            let
              val dirStr =
               case optDir of
                  NONE     => ""
                | SOME In  => "In"
                | SOME Out => "Out"
              val optStr = if isOpt then "Opt" else ""
            in
              concat ["c", dirStr, optStr, "Ptr"]
            end
        | REF NONE                    => "cRef"
        | REF (SOME {isInOut, isOpt}) =>
            let
              val inOutStr = if isInOut then "InOut" else "Out"
              val optStr = if isOpt then "Opt" else ""
            in
              concat ["c", inOutStr, optStr, "Ref"]
            end
    in
      mkLIdLNameExp (prefixIds @ [convId])
    end

  val retVoidConv = cVoidConv

  fun parScalarConv (dir, {ty, ...} : scalar_info) =
    let
      val prefixIds = [gStrId ^ scalarStrId ty, PolyMLId]
    in
      convExp prefixIds (
        if dir <> IN
        then
          REF NONE
        else
          VAL
      )
    end

  fun retScalarConv ({ty, ...} : scalar_info) =
    let
      val prefixIds = [gStrId ^ scalarStrId ty, PolyMLId]
    in
      convExp prefixIds VAL
    end

  fun parUtf8Conv (dir, {isOpt, ...} : utf8_info) =
    let
      val prefixIds = [utf8StrId, PolyMLId]
    in
      convExp prefixIds (
        if dir <> IN
        then
          REF (
            SOME {
              isInOut = dir = INOUT,
              isOpt   = false
            }
          )
        else
          PTR {
            optDir = SOME In,
            isOpt  = isOpt
          }
      )
    end

  fun retUtf8Conv ({isOpt, ...} : utf8_info) =
    let
      val prefixIds = [utf8StrId, PolyMLId]
    in
      convExp prefixIds (
        PTR {
          optDir = SOME Out,
          isOpt  = isOpt
        }
      )
    end

  fun parArrayConv (dir, {isOpt, length, elem, ...} : array_info) =
    let
      val prefixIds = [cArrayStrId length elem, PolyMLId]
    in
      convExp prefixIds (
        if dir <> IN
        then
          REF (
            SOME {
              isInOut = dir = INOUT,
              isOpt   = false
            }
          )
        else
          PTR {
            optDir = SOME In,
            isOpt  = isOpt
          }
      )
    end

  fun retArrayConv ({isOpt, length, elem, ...} : array_info) =
    let
      val prefixIds = [cArrayStrId length elem, PolyMLId]
    in
      convExp prefixIds (
        PTR {
          optDir = SOME Out,
          isOpt  = isOpt
        }
      )
    end

  fun parInterfaceConv
    (dir, {iRef, infoType, ptrOwnXfer, isOpt, ...} : interface_info) =
    let
(*
      val {isSelf, ...} = iRef

      open InfoType
      val prefixIds =
        case infoType of
          OBJECT _    => prefixInterfaceStrId iRef [PolyMLId]
        | INTERFACE _ => prefixInterfaceStrId iRef [PolyMLId]
        | STRUCT _    => prefixInterfaceStrId iRef [PolyMLId]
        | _           =>
            if isSelf
            then [PolyMLId]
            else prefixInterfaceStrId iRef [PolyMLId]
 * Is above really needed?
 * Doesn't `prefixInterfaceStrId` handle SIMPLE case for LOCALINTERFACESELF?
 * Let's see...
 *)
      val prefixIds = prefixInterfaceStrId iRef [PolyMLId]

      open InfoType
    in
      convExp prefixIds (
        if dir <> IN andalso isSome ptrOwnXfer
        then
          REF (
            SOME {
              isInOut = dir = INOUT,
              isOpt   = false
            }
          )
        else if
          case infoType of
            FLAGS _ => true
          | ENUM _  => true
          | _       => false
        then
          if dir <> IN
          then
            REF NONE
          else
            VAL
        else
          PTR {
            optDir = NONE,
            isOpt  = isOpt andalso isSome ptrOwnXfer
          }
      )
    end

  fun retInterfaceConv
    ({iRef, infoType, isOpt, ...} : interface_info) =
    let
(*
      val {isSelf, ...} = iRef

      open InfoType
      val prefixIds =
        case infoType of
          OBJECT _    => prefixInterfaceStrId iRef [PolyMLId]
        | INTERFACE _ => prefixInterfaceStrId iRef [PolyMLId]
        | STRUCT _    => prefixInterfaceStrId iRef [PolyMLId]
        | _           =>
            if isSelf
            then [PolyMLId]
            else prefixInterfaceStrId iRef [PolyMLId]

 * Is above really needed?
 * Doesn't `prefixInterfaceStrId` handle SIMPLE case for LOCALINTERFACESELF?
 * Let's see...
 *)
      val prefixIds = prefixInterfaceStrId iRef [PolyMLId]

      open InfoType
    in
      convExp prefixIds (
        if
          case infoType of
            FLAGS _ => true
          | ENUM _  => true
          | _       => false
        then
          VAL
        else
          PTR {
            optDir = NONE,
            isOpt  = isOpt
          }
      )
    end
in
  val makeConv = convExp

  fun addParInfo (parInfo, acc) =
    case parInfo of
      PIVOID                  => acc
    | PISOME {dir, info, ...} =>
        case info of
          ISCALAR scalarParInfo =>
            let
              val convExp = parScalarConv (dir, scalarParInfo)
            in
              convExp :: acc
            end
        | IUTF8 utf8ParInfo =>
            let
              val convExp = parUtf8Conv (dir, utf8ParInfo)
            in
              convExp :: acc
            end
        | IARRAY arrayParInfo =>
            let
              val convExp = parArrayConv (dir, arrayParInfo)
            in
              convExp :: acc
            end
        | IINTERFACE interfaceParInfo =>
            let
              val convExp = parInterfaceConv (dir, interfaceParInfo)
            in
              convExp :: acc
            end

  fun addRetInfo retInfo =
    case retInfo of
      RIVOID        => retVoidConv
    | RISOME {info} =>
        case info of
          ISCALAR scalarRetInfo       => retScalarConv scalarRetInfo
        | IUTF8 utf8RetInfo           => retUtf8Conv utf8RetInfo
        | IARRAY arrayInfo            => retArrayConv arrayInfo
        | IINTERFACE interfaceRetInfo => retInterfaceConv interfaceRetInfo

  fun parSelfConv iRef =
    convExp
      (prefixInterfaceStrId iRef [PolyMLId])
      (
        PTR {
          optDir = NONE,
          isOpt  = false
        }
      )

  fun parErrConv namespace optName =
    convExp
      (prefixInterfaceStrId (makeErrorIRef namespace optName) [PolyMLId])
      (
        REF (
          SOME {
            isInOut = false,
            isOpt   = true
          }
        )
      )
end


fun makeFunctionStrDecLowLevelPolyML
  repo
  libId
  (optRootContainerIRef : (interfaceref * interfaceref) option)
  (functionInfo, errs)
  : strdec * infoerrorhier list =
  let
    val () = checkDeprecated functionInfo

    val () = checkFunctionSymbol functionInfo

    val functionName = getName functionInfo
    val () = checkFunctionName functionName

    val functionNameId = toLCC functionName ^ "_"
    val functionNamespace = BaseInfo.getNamespace functionInfo
    val functionFlags = FunctionInfo.getFlags functionInfo

    val (_, optContainerIRef) =
      case optRootContainerIRef of
        SOME (rootIRef, containerIRef) => (SOME rootIRef, SOME containerIRef)
      | NONE                           => (NONE, NONE)
    val optContainerName = Option.map #name optContainerIRef

    (* Construct parameter infos and return value info *)
    val parInfos =
      revMapInfos
        CallableInfo.getNArgs
        CallableInfo.getArg
        (getParInfo false repo functionNamespace optContainerName functionInfo)
        (functionInfo, [])

    val retInfo =
      getRetInfo false repo functionNamespace optContainerName
        functionInfo

    val functionSymbolStr = FunctionInfo.getSymbol functionInfo

    (* For a method function, add an initial argument for the interface
     * that contains this function. *)
    val revParConvs'1 =
      if FunctionInfoFlags.anySet
           (functionFlags, FunctionInfoFlags.IS_METHOD)
      then
        case optContainerIRef of
          SOME iRef => [parSelfConv iRef]
        | NONE      =>
            infoError "function outside interface has method flag set"
      else
        []

    (* Construct reverse list of J parameter conversions in forward pass over
     * parameter infos. *)
    val revParConvs'2 = foldl addParInfo revParConvs'1 parInfos

    (* For a function that may raise an exception, add a final argument for
     * the GError out parameter. *)
    val revParConvs'3 =
      if FunctionInfoFlags.anySet
           (functionFlags, FunctionInfoFlags.THROWS)
      then
        parErrConv functionNamespace optContainerName :: revParConvs'2
      else
        revParConvs'2

    val retConv = addRetInfo retInfo

    (* `revParConvs1 : exp list1` is
     *
     *   <paramConvErr>, <paramConv[J]>, ..., <paramConv[1]>, <selfConv>
     *     if J > 0 and anySet (FunctionFlags, ISMETHOD)
     *              and anySet (FunctionFlags, THROWS)
     *
     *   <paramConv[J]>, ..., <paramConv[1]>, <selfConv>
     *     if J > 0 and anySet (FunctionFlags, ISMETHOD)
     *              and not anySet (FunctionFlags, THROWS)
     *
     *   <paramConvErr>, <paramConv[J]>, ..., <paramConv[1]>
     *     if J > 0 and not anySet (FunctionFlags, ISMETHOD)
     *              and anySet (FunctionFlags, THROWS)
     *
     *   <paramConv[J]>, ..., <paramConv[1]>
     *     if J > 0 and not anySet (FunctionFlags, ISMETHOD)
     *              and not anySet (FunctionFlags, THROWS)
     *
     *   <paramConvErr>
     *     if J = 0 and anySet (FunctionFlags, THROWS)
     *
     *   PolyMLFFI.cVoid
     *     if J = 0 and not anySet (FunctionFlags, THROWS)
     *)
    val revParConvs1 : exp list1 = getList1 (revParConvs'3, cVoidConv)

    val parConvs = foldl1 mkAARExp revParConvs1

    (* Construct the function body with the form:
     *
     *   call
     *     (load_sym lib<functionnamespace> "<function_symbol>")
     *     (<parConvs> --> <retConv>)
     *)
    val functionExp =
      callPolyMLFFIExp
        libId
        functionSymbolStr
        (parConvs, retConv)
  in
    (
      StrDecDec (mkIdValDec (functionNameId, functionExp)),
      errs
    )
  end

(*
 *     val getType_ =
 *       call
 *         (load_sym <libId> "<getTypeSymbol>")
 *         (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal);
 *)
fun getTypeStrDecLowLevelPolyML libId getTypeSymbol =
  let
    val parConvs = cVoidConv
    val retConv = makeConv ["GObjectType", PolyMLId] VAL
  in
    StrDecDec (
      mkIdValDec (
        getTypeUId,
        callPolyMLFFIExp libId getTypeSymbol (parConvs, retConv)
      )
    )
  end


(* Low-level - MLton *)

(* `callMLtonFFIExp functionSymbol (parProdTys, retTy)` constructs a MLton
 * low-level function call expression as follows:
 *
 *
 *   fn <xProd[1]> & ... & <xProd[N]> =>
 *     (_import "<symbol>" : <parTy[1]> * ... * <parTy[M]> -> <retTy>;)
 *     (x<1>, ..., x<M>)
 *
 *     if N > 1
 *
 *
 *   _import "<symbol>" : <parTy[1]> * ... * <parTy[M]> -> <retTy>;
 *
 *     if N = 1
 *
 *
 *   _import "<symbol>" : unit -> <retTy>;
 *
 *     if N = 0
 *
 *
 * where
 *
 *
 *   N = length parProdTys
 *
 *
 *   xProd[n]
 *     is defined as follows, for some m:
 *
 *       x<m>
 *         if parProdTys[n] is <parTy[m]>
 *
 *       (x<m>, ..., x<m + p>)
 *         if parProdTys[n] is <parTy[m]> * ... * <parTy[m + p]>
 *
 *
 *   symbol
 *     is defined as follows:
 *
 *       mlton_<functionSymbol>
 *         if there exists an i such that parProdTys[i] is a tuple type
 *
 *       <functionSymbol>
 *
 *
 * and
 *
 *
 *   parTy[n], for 1 <= n <= N, is not a tuple type
 *
 *
 *   xProd[1]
 *     has one of the forms
 *
 *       x1
 *
 *       (x1, ...)
 *
 *
 *   xProd[n + 1]
 *     for n >= 1, has one of the forms
 *
 *       x<m + 1>
 *
 *       (x<m + 1>, ...)
 *
 *         where m is such that xProd[n] has one of the forms
 *
 *           x<m>
 *
 *           (..., x<m>)
 *
 *
 *   xProd[N]
 *     has one of the forms
 *
 *       x<M>
 *
 *       (..., x<M>)
 *)

local
  fun addProdTy (prodTy, (acc, revTuplePats, existsProdTy)) =
    let
      val tys = destProdTy0 prodTy

      fun addTy (ty, ((exps, tys, n), pats)) =
        let
          val id = "x" ^ Int.toString n
          val exps' = mkIdLNameExp id :: exps
          val tys' = ty :: tys
          val pats' = mkIdVarPat id :: pats
        in
          ((exps', tys', n + 1), pats')
        end

      val (acc', revPats') = foldl addTy (acc, []) tys

      val tuplePat =
        case rev revPats' of
          []          => PatA (APatConst ConstUnit)
        | op :: pats1 => mkTuplePat1 pats1

      val existsProdTy' =
        case prodTy of
          TyProd _ => true
        | _        => existsProdTy
    in
      (acc', tuplePat :: revTuplePats, existsProdTy')
    end
in
  fun callMLtonFFIExp functionSymbol (parProdTys, retTy) =
    let
      val ((revExps, revTys, _), revTuplePats, existsProdTy) =
        foldl addProdTy (([], [], 1), [], false) parProdTys;

      val symbol =
        if existsProdTy
        then "mlton_" ^ functionSymbol
        else functionSymbol
    in
      case (rev revExps, rev revTys, revTuplePats) of
        (op :: exps1, parTys, op :: (revTuplePats1 as (_, _ :: _))) =>
          (* Wrap with fn ... => ... when `revTuplePats` has two or more
           * elements.  Note that a match `op :: exps1` always occurs when
           * `revTuplePats` has at least one element, so its only purpose
           * is to give `exps1 : list1`.
           *)
          let
            val tupleExp = mkTupleExp1 exps1
            val pat = foldl1 mkAPat revTuplePats1
            val exp =
              ExpApp (
                mkParenExp (mkMLtonImportExp symbol (parTys, retTy)),
                tupleExp
              )
          in
            ExpFn (toList1 [(pat, exp)])
          end
      | (_,           parTys, _)                                    =>
          mkMLtonImportExp symbol (parTys, retTy)

    end
end

(*
val exp = callMLtonFFIExp "testfun" ([], unitTy);
val exp = callMLtonFFIExp "testfun" ([unitTy], unitTy);
val exp = callMLtonFFIExp "testfun" ([boolTy, boolTy], unitTy);
val exp = callMLtonFFIExp "testfun" ([mkProdTy0 [boolTy, boolTy]], unitTy);
val exp = callMLtonFFIExp "testfun" ([mkProdTy0 [boolTy, boolTy], boolTy], unitTy);

HVTextTree.V.app (fn () => print "\n", print) (HVTextTree.toV (PrettyPrint.fmtExp (HTextTree.str "") exp));
*)


local
  (*
   * Value types:
   *   <A>.val_
   *   <A>.ref_
   *
   * Pointer types:
   *   <opt> <A>.p
   *   (<inopt>, <outopt>) <A>.r
   *
   * Array types:
   *   <opt> <A>.in_p
   *   <opt> <A>.out_p
   *   (<inopt>, <outopt>) <A>.r
   *)
  local
    fun mltonStructId prefixIds id =
      case List.rev prefixIds of
        "FFI" :: revIds => List.rev (id :: "MLton" :: revIds)
      | _               => raise Fail "mltonStructId requires struct called \"C\""

    fun mkOptTy prefixIds isOpt =
      if isOpt then unitTy else mkNotnullTy prefixIds
  in
    (* `<A>.MLton.p1 * <opt> <A>.MLton.p2`
     *
     *   where <opt> is
     *     unit
     *       if `isOpt`
     *
     *     <A>.C.notnull
     *       otherwise
     *)
    fun arrayPtrTy prefixIds isOpt =
      mkProdTy0 [
        TyRef ([], toList1 (mltonStructId prefixIds "p1")),
        TyRef ([mkOptTy prefixIds isOpt], toList1 (mltonStructId prefixIds "p2"))
      ]

    (* `<A>.MLton.r1 * (<inopt>, <outopt>) <A>.MLton.r2`
     *
     *   where <inopt> is
     *     unit
     *       if `isOpt orelse not isInOut`
     *
     *     <A>.C.notnull
     *       otherwise
     *
     *   where <outopt> is
     *     unit
     *       if `isOpt`
     *
     *     <A>.C.notnull
     *       otherwise
     *)
    fun arrayRefTy prefixIds isInOut isOpt =
      mkProdTy0 [
        TyRef ([], toList1 (mltonStructId prefixIds "r1")),
        TyRef (
          [
            mkOptTy prefixIds (isOpt orelse not isInOut),
            mkOptTy prefixIds isOpt
          ],
          toList1 (mltonStructId prefixIds "r2")
        )
      ]
  end

  fun typeTy isUtf8 prefixIds spec =
    let
      val ty =
        case spec of
          VAL                         => mkLIdTy (prefixIds @ ["val_"])
        | PTR {optDir, isOpt}         =>
            if isUtf8
            then
              arrayPtrTy prefixIds isOpt
            else
              let
                val dirStr =
                  case optDir of
                    NONE     => ""
                  | SOME In  => "in_"
                  | SOME Out => "out_"
                val ty = if isOpt then unitTy else mkNotnullTy prefixIds
              in
                TyRef ([ty], toList1 (prefixIds @ [concat [dirStr, "p"]]))
              end
        | REF NONE                    => mkLIdTy (prefixIds @ ["ref_"])
        | REF (SOME {isInOut, isOpt}) =>
            if isUtf8
            then
              arrayRefTy prefixIds isInOut isOpt
            else
              let
                val isInOpt = isOpt orelse not isInOut
                val isOutOpt = isOpt

                val tys'0 = []
                val tys'1 =
                  case isOutOpt of
                    false => mkNotnullTy prefixIds :: tys'0
                  | true  => unitTy :: tys'0
                val tys'2 =
                  case isInOpt of
                    false => mkNotnullTy prefixIds :: tys'1
                  | true  => unitTy :: tys'1
              in
                TyRef (tys'2, toList1 (prefixIds @ ["r"]))
              end
    in
      ty
    end

  val retVoidType = unitTy

  fun parScalarType (dir, {ty, ...} : scalar_info) =
    let
      val prefixIds = [gStrId ^ scalarStrId ty, ffiStrId]
    in
      typeTy false prefixIds (
        if dir <> IN
        then
          REF NONE
        else
          VAL
      )
    end

  fun retScalarType ({ty, ...} : scalar_info) =
    let
      val prefixIds = [gStrId ^ scalarStrId ty, ffiStrId]
    in
      typeTy false prefixIds VAL
    end

  fun parUtf8Type (dir, {isOpt, ...} : utf8_info) =
    let
      val prefixIds = [utf8StrId, ffiStrId]
    in
      typeTy true prefixIds (
        if dir <> IN
        then
          REF (
            SOME {
              isInOut = dir = INOUT,
              isOpt   = false
            }
          )
        else
          PTR {
            optDir = SOME In,
            isOpt  = isOpt
          }
      )
    end

  fun retUtf8Type ({isOpt, ...} : utf8_info) =
    let
      val prefixIds = [utf8StrId, ffiStrId]
    in
      typeTy false prefixIds (
        PTR {
          optDir = SOME Out,
          isOpt  = isOpt
        }
      )
    end

  fun parArrayType (dir, {isOpt, length, elem, ...} : array_info) =
    let
      val prefixIds = [cArrayStrId length elem, ffiStrId]
    in
      typeTy true prefixIds (
        if dir <> IN
        then
          REF (
            SOME {
              isInOut = dir = INOUT,
              isOpt   = false
            }
          )
        else
          PTR {
            optDir = SOME In,
            isOpt  = isOpt
          }
      )
    end

  fun retArrayType ({isOpt, length, elem, ...} : array_info) =
    let
      val prefixIds = [cArrayStrId length elem, ffiStrId]
    in
      typeTy false prefixIds (
        PTR {
          optDir = SOME Out,
          isOpt  = isOpt
        }
      )
    end

  fun parInterfaceType
    (dir, {iRef, infoType, ptrOwnXfer, isOpt, ...} : interface_info) =
    let
(*
      val {isSelf, ...} = iRef

      open InfoType
      val prefixIds =
        case infoType of
          OBJECT _    => prefixInterfaceStrId iRef [ffiStrId]
        | INTERFACE _ => prefixInterfaceStrId iRef [ffiStrId]
        | STRUCT _    => prefixInterfaceStrId iRef [ffiStrId]
        | _           =>
            if isSelf
            then [ffiStrId]
            else prefixInterfaceStrId iRef [ffiStrId]
 * Is above really needed?
 * Doesn't `prefixInterfaceStrId` handle SIMPLE case for LOCALINTERFACESELF?
 * Let's see...
 *)
      val prefixIds = prefixInterfaceStrId iRef [ffiStrId]

      open InfoType
    in
      typeTy false prefixIds (
        if dir <> IN andalso isSome ptrOwnXfer
        then
          REF (
            SOME {
              isInOut = dir = INOUT,
              isOpt   = false
            }
          )
        else if
          case infoType of
            FLAGS _ => true
          | ENUM _  => true
          | _       => false
        then
          if dir <> IN
          then
            REF NONE
          else
            VAL
        else
          PTR {
            optDir = NONE,
            isOpt  = isOpt andalso isSome ptrOwnXfer
          }
      )
    end

  fun retInterfaceType
    ({iRef, infoType, isOpt, ...} : interface_info) =
    let
(*
      val {isSelf, ...} = iRef

      open InfoType
      val prefixIds =
        case infoType of
          OBJECT _    => prefixInterfaceStrId iRef [ffiStrId]
        | INTERFACE _ => prefixInterfaceStrId iRef [ffiStrId]
        | STRUCT _    => prefixInterfaceStrId iRef [ffiStrId]
        | _           =>
            if isSelf
            then [ffiStrId]
            else prefixInterfaceStrId iRef [ffiStrId]
 * Is above really needed?
 * Doesn't `prefixInterfaceStrId` handle SIMPLE case for LOCALINTERFACESELF?
 * Let's see...
 *)
      val prefixIds = prefixInterfaceStrId iRef [ffiStrId]

      open InfoType
    in
      typeTy false prefixIds (
        if
          case infoType of
            FLAGS _ => true
          | ENUM _  => true
          | _       => false
        then
          VAL
        else
          PTR {
            optDir = NONE,
            isOpt  = isOpt
          }
      )
    end
in
  val makeLowLevelTy = typeTy

  fun addParInfo (parInfo, acc) =
    case parInfo of
      PIVOID                  => acc
    | PISOME {dir, info, ...} =>
        case info of
          ISCALAR scalarParInfo       =>
            let
              val typeTy = parScalarType (dir, scalarParInfo)
            in
              typeTy :: acc
            end
        | IUTF8 utf8ParInfo           =>
            let
              val typeTy = parUtf8Type (dir, utf8ParInfo)
            in
              typeTy :: acc
            end
        | IARRAY arrayParInfo         =>
            let
              val typeTy = parArrayType (dir, arrayParInfo)
            in
              typeTy :: acc
            end
        | IINTERFACE interfaceParInfo =>
            let
              val typeTy = parInterfaceType (dir, interfaceParInfo)
            in
              typeTy :: acc
            end

  fun addRetInfo retInfo =
    case retInfo of
      RIVOID        => retVoidType
    | RISOME {info} =>
        case info of
          ISCALAR scalarRetInfo       => retScalarType scalarRetInfo
        | IUTF8 utf8RetInfo           => retUtf8Type utf8RetInfo
        | IARRAY arrayRetInfo         => retArrayType arrayRetInfo
        | IINTERFACE interfaceRetInfo => retInterfaceType interfaceRetInfo

  fun parSelfType iRef =
    typeTy
      false
      (prefixInterfaceStrId iRef [ffiStrId])
      (
        PTR {
          optDir = NONE,
          isOpt  = false
        }
      )

  fun parErrType namespace optName =
    typeTy
      false
      (prefixInterfaceStrId (makeErrorIRef namespace optName) [ffiStrId])
      (
        REF (
          SOME {
            isInOut = false,
            isOpt   = true
          }
        )
      )
end


fun makeFunctionStrDecLowLevelMLton
  repo
  (optRootContainerIRef : (interfaceref * interfaceref) option)
  (functionInfo, errs)
  : strdec * infoerrorhier list =
  let
    val () = checkDeprecated functionInfo

    val () = checkFunctionSymbol functionInfo

    val functionName = getName functionInfo
    val () = checkFunctionName functionName

    val functionNameId = toLCC functionName ^ "_"
    val functionNamespace = BaseInfo.getNamespace functionInfo
    val functionFlags = FunctionInfo.getFlags functionInfo

    val (_, optContainerIRef) =
      case optRootContainerIRef of
        SOME (rootIRef, containerIRef) => (SOME rootIRef, SOME containerIRef)
      | NONE                           => (NONE, NONE)
    val optContainerName = Option.map #name optContainerIRef

    (* Construct parameter infos and return value info *)
    val parInfos =
      revMapInfos
        CallableInfo.getNArgs
        CallableInfo.getArg
        (getParInfo false repo functionNamespace optContainerName functionInfo)
        (functionInfo, [])

    val retInfo =
      getRetInfo false repo functionNamespace optContainerName
        functionInfo

    val functionSymbolStr = FunctionInfo.getSymbol functionInfo

    (* For a method function, add an initial argument for the interface
     * that contains this function. *)
    val revParTypes'1 =
      if FunctionInfoFlags.anySet
           (functionFlags, FunctionInfoFlags.IS_METHOD)
      then
        case optContainerIRef of
          SOME iRef => [parSelfType iRef]
        | NONE      =>
            infoError "function outside interface has method flag set"
      else
        []

    (* Construct reverse list of J parameter conversions in forward pass over
     * parameter infos. *)
    val revParTypes'2 = foldl addParInfo revParTypes'1 parInfos

    (* For a function that may raise an exception, add a final argument for
     * the GError out parameter. *)
    val revParTypes'3 =
      if FunctionInfoFlags.anySet
           (functionFlags, FunctionInfoFlags.THROWS)
      then
        parErrType functionNamespace optContainerName :: revParTypes'2
      else
        revParTypes'2

    val retType = addRetInfo retInfo

    (* `revParTypes : exp list` is
     *
     *   [<parTypeErr>, <parType[J]>, ..., <parType[1]>, <selfType>]
     *     if J > 0 and anySet (FunctionFlags, ISMETHOD)
     *              and anySet (FunctionFlags, THROWS)
     *
     *   [<parType[J]>, ..., <parType[1]>, <selfType>]
     *     if J > 0 and anySet (FunctionFlags, ISMETHOD)
     *              and not anySet (FunctionFlags, THROWS)
     *
     *   [<parTypeErr>, <parType[J]>, ..., <parType[1]>]
     *     if J > 0 and not anySet (FunctionFlags, ISMETHOD)
     *              and anySet (FunctionFlags, THROWS)
     *
     *   [<parType[J]>, ..., <parType[1]>]
     *     if J > 0 and not anySet (FunctionFlags, ISMETHOD)
     *              and not anySet (FunctionFlags, THROWS)
     *
     *   [<parTypeErr>]
     *     if J = 0 and anySet (FunctionFlags, THROWS)
     *
     *   []
     *     if J = 0 and not anySet (FunctionFlags, THROWS)
     *)
    val parTypes = rev revParTypes'3

    (* Construct the function body *)
    val functionExp = callMLtonFFIExp functionSymbolStr (parTypes, retType)
  in
    (
      StrDecDec (mkIdValDec (functionNameId, functionExp)),
      errs
    )
  end


(*
 *     val getType_ =
 *       _import "<getTypeSymbol>" : unit -> GObjectType.C.val_;
 *)
fun getTypeStrDecLowLevelMLton getTypeSymbol =
  StrDecDec (
    mkIdValDec (
      getTypeUId,
      callMLtonFFIExp getTypeSymbol ([], mkLIdTy ["GObjectType", ffiStrId, valId])
    )
  )


(* Low-level - common *)

fun mkPolyMLFFILocalStrDec strDecs =
  StrDecLocal (
    mkStrDecs [
      StrDecDec (DecOpen (toList1 [toList1 [PolyMLFFIId]]))
    ],
    mkStrDecs strDecs
  )

fun addFunctionStrDecsLowLevel
  (getNMethods, getMethod)
  isPolyML
  repo
  libId
  addInitStrDecs
  optRootContainerIRef =
  if isPolyML
  then
    fn (containerInfo, (strDecs, errs)) =>
      let
        val acc'1 =
          revMapInfosWithErrs
            getNMethods
            getMethod
            (makeFunctionStrDecLowLevelPolyML repo libId optRootContainerIRef)
            (containerInfo, ([], errs))
        val (localStrDecs'2, errs'2) = addInitStrDecs isPolyML acc'1
      in
        case localStrDecs'2 of
          _ :: _ => (mkPolyMLFFILocalStrDec localStrDecs'2 :: strDecs, errs'2)
        | _      => (strDecs, errs'2)
      end
  else
    addInitStrDecs isPolyML o
      revMapInfosWithErrs
        getNMethods
        getMethod
        (makeFunctionStrDecLowLevelMLton repo optRootContainerIRef)
