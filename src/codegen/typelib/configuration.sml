(* --------------------------------------------------------------------------
 * Configuration
 * -------------------------------------------------------------------------- *)

(* A configuration value whose data relates to particular namespace versions
 * is written as an instance of the type `'a nvs_map`, e.g.
 *
 *     [
 *       (
 *         [("GObject", "2.0")],
 *         ... : 'a
 *       ),
 *       (
 *         [("Vte", "2.90"), ("Vte", "2.91")],
 *         ... : 'a
 *       )
 *     ]
 *      : 'a nvs_map
 *)

type namespace_version = string * string
type 'a nvs_map = (namespace_version list * 'a) list


(* The common instances of `'a nvs_map` are
 *
 *   - (string * 'a) list nvs_map
 *   - string        list nvs_map
 *
 * for which functions are provided to look up a string `s` and check
 * existence of a property `p` as follows, in the namespace version given by
 * `nv`:
 *
 *   nvsLookup (nv, x : 'a)         : ('a * 'b) list nvs_map -> 'b option
 *   nvsExists (nv, p : 'a -> bool) : 'a        list nvs_map -> bool
 *)

fun lookup x xys = Option.map #2 (List.find (fn (x', _) => x = x') xys)

fun nvsLookup (nv, x) nvsMap =
  case List.find (fn (nvs, _) => List.exists (fn nv' => nv = nv') nvs) nvsMap of
    SOME (_, xys) => lookup x xys
  | NONE          => NONE

fun nvsExists (nv, p) nvsMap =
  List.exists (
    fn (nvs, xs) =>
      List.exists (fn nv' => nv = nv') nvs andalso List.exists p xs
  )
    nvsMap


(* Interface types *)

(*   - Excluded names *)
val excludedInterfaceTypes : string list nvs_map ref = ref []

val excludedInterfaceTypeGlobalSuffixes : string list ref = ref []

fun checkInterfaceType repo vers interfaceInfo =
  let
    val name = getName interfaceInfo
    val namespace = BaseInfo.getNamespace interfaceInfo
    val version = Repository.getVersion repo vers namespace
    val nv = (namespace, version)
  in
    if
      nvsExists (nv, fn x => x = name) (!excludedInterfaceTypes)
    then infoExcl "interface type excluded by configuration \
                                                      \(excludedInterfaceTypes)"
    else if
      List.exists (fn x => String.isSuffix x name)
        (!excludedInterfaceTypeGlobalSuffixes)
    then infoExcl "interface type excluded by configuration \
                                         \(excludedInterfaceTypeGlobalSuffixes)"
    else ()
  end


(* Struct types *)

datatype value_record_funcs =
  Deep of {copy : string, clear : string}
| Flat

datatype record_funcs =
  Boxed
| NonBoxed of {dup : string, free : string}

val boxedCopySymbol = "g_boxed_copy"
val boxedFreeSymbol = "g_boxed_free"

datatype struct_type =
  ValueRecord of value_record_funcs
| Record of record_funcs
| DisguisedRecord
| UnionRecord of string * string * string

val structTypes : (string * struct_type) list nvs_map ref = ref []

local
  fun addTypeCPtrFieldNames revPrefix (typeInfo, acc) =
    let
      open TypeTag
    in
      case TypeInfo.getTag typeInfo of
        ERROR        => revPrefix :: acc
      | GTYPE        => acc
      | ARRAY        => revPrefix :: acc
      | GLIST        => revPrefix :: acc
      | GSLIST       => revPrefix :: acc
      | GHASH        => revPrefix :: acc
      | VOID         => revPrefix :: acc  (* only for void * so always a reference *)
      | BOOLEAN      => acc
      | INT8         => acc  
      | UINT8        => acc  
      | INT16        => acc  
      | UINT16       => acc  
      | INT32        => acc  
      | UINT32       => acc  
      | INT64        => acc  
      | UINT64       => acc  
      | FLOAT        => acc  
      | DOUBLE       => acc  
      | FILENAME     => revPrefix :: acc
      | UTF8         => revPrefix :: acc
      | UNICHAR      => acc
      | INTERFACE    =>
          let
            val interfaceInfo = getInterface typeInfo

            open InfoType
            val infoType = getType interfaceInfo
          in
            case infoType of
              FLAGS _           => acc
            | ENUM _            => acc
            | STRUCT structInfo =>
                if TypeInfo.isPointer typeInfo
                then revPrefix :: acc
                else addStructCPtrFieldNames revPrefix (structInfo, acc)
            | _                 => revPrefix :: acc
          end
    end

  and addFieldCPtrFieldNames revPrefix (fieldInfo, acc) =
    addTypeCPtrFieldNames
      (valOf (BaseInfo.getName fieldInfo) :: revPrefix)
      (FieldInfo.getType fieldInfo, acc)

  and addStructCPtrFieldNames revPrefix (structInfo, acc) =
    revFoldInfos
      StructInfo.getNFields
      StructInfo.getField
      (addFieldCPtrFieldNames revPrefix)
      (structInfo, acc)
in
  fun getStructCPtrFieldNames structInfo =
    let
      val cPtrNames =
        addStructCPtrFieldNames [] (StructInfoClass.toBase structInfo, [])
    in
      map (String.concatWith "." o rev) cPtrNames
    end
end

fun getStructType repo vers structInfo =
  let
    val name = getName structInfo
    val namespace = BaseInfo.getNamespace structInfo
    val version = Repository.getVersion repo vers namespace
    val nv = (namespace, version)
  in
    case nvsLookup (nv, name) (!structTypes) of
      SOME structType => structType
    | NONE            =>
        (* A record that is a registered type is a boxed type.  The default
         * behaviour is to treat such a record as a reference-only record to
         * use the boxed type allocation functions.  To enable a record that
         * is a registered type to be treated like a value also, the struct
         * type must be manually configured.
         *)
        case RegisteredTypeInfo.getTypeInit structInfo of
          SOME _ => Record Boxed
        | NONE   =>
            (* A struct can still be copied if it is flat, i.e. none of the
             * fields are references in C except that, if a struct has no
             * fields, we assume that the struct has data and is opaque, and
             * it is not known how to copy the struct.
             *)
            if StructInfo.getNFields structInfo = 0
            then infoExcl "neither duplicate nor copy operation available\
                            \ because struct type is not registered and has\
                            \ no fields"
            else
              case getStructCPtrFieldNames structInfo of
                []             => ValueRecord Flat
              | cPtrFieldNames =>
                  infoExcl (
                    concat [
                      "neither duplicate nor copy operation available\
                        \ because struct type is not registered and has\
                        \ fields that are references via a C pointer",
                      " (",
                      String.concatWith ", " cPtrFieldNames,
                      ")"
                    ]
                  )
  end


(* Union types *)

val includedUnionNames : string list nvs_map ref = ref []

fun checkUnionInterfaceType repo vers unionInfo =
  let
    val name = getName unionInfo
    val namespace = BaseInfo.getNamespace unionInfo
    val version = Repository.getVersion repo vers namespace
    val nv = (namespace, version)
  in
    if nvsExists (nv, fn x => x = name) (!includedUnionNames)
    then ()
    else infoExcl "union interface type not included by configuration \
                                                          \(includedUnionNames)"
  end


(* Function names *)

(*   - Excluded symbols *)
val excludedFunctionSymbols : string list nvs_map ref = ref []
val excludedFunctionSymbolPrefixes : string list nvs_map ref = ref []
val excludedFunctionSymbolSuffixes : string list nvs_map ref = ref []

fun checkFunctionSymbol repo vers functionInfo =
  let
    val symbol = FunctionInfo.getSymbol functionInfo
    val namespace = BaseInfo.getNamespace functionInfo
    val version = Repository.getVersion repo vers namespace
    val nv = (namespace, version)
    fun infoExclFunctionSymbol match =
      infoExcl (concat ["function excluded by configuration (", match, ")"])
  in
    if nvsExists (nv, fn x => x = symbol) (!excludedFunctionSymbols)
    then infoExclFunctionSymbol "excludedFunctionSymbols"
    else if
      nvsExists (nv, fn x => String.isPrefix x symbol)
        (!excludedFunctionSymbolPrefixes)
    then
      infoExclFunctionSymbol "excludedFunctionSymbolPrefixes"
    else if
      nvsExists (nv, fn x => String.isSuffix x symbol)
        (!excludedFunctionSymbolSuffixes)
    then
      infoExclFunctionSymbol "excludedFunctionSymbolSuffixes"
    else ()
  end

(*   - Systematically formed names that do not belong in the user API *)
val nonUserFunctionNames : string list ref = ref []

fun checkFunctionName name =
  if List.exists (fn x => x = name) (!nonUserFunctionNames)
  then
    infoExcl "non-user function excluded by configuration \
                                                        \(nonUserFunctionNames)"
  else ()


(* Constant names *)

(*   - Excluded names *)
val excludedConstantNames : string list nvs_map ref = ref []
val excludedConstantNamePrefixes : string list nvs_map ref = ref []
val excludedConstantNameSuffixes : string list nvs_map ref = ref []

fun checkConstantName repo vers constantInfo =
  let
    val name = getName constantInfo
    val namespace = BaseInfo.getNamespace constantInfo
    val version = Repository.getVersion repo vers namespace
    val nv = (namespace, version)
    fun infoExclConstantName match =
      infoExcl (concat ["constant excluded by configuration (", match, ")"])
  in
    if nvsExists (nv, fn x => x = name) (!excludedConstantNames)
    then infoExclConstantName "excludedConstantNames"
    else if
      nvsExists (nv, fn x => String.isPrefix x name)
        (!excludedConstantNamePrefixes)
    then
      infoExclConstantName "excludedConstantNamePrefixes"
    else if
      nvsExists (nv, fn x => String.isSuffix x name)
        (!excludedConstantNameSuffixes)
    then
      infoExclConstantName "excludedConstantNameSuffixes"
    else ()
  end


(* Flags/enum value names *)

(*   - Transformed names *)
val newFlagsEnumValueNames : (string * string) list ref = ref []

fun fixFlagsEnumValueName name =
  case List.find (fn (x, _) => x = name) (!newFlagsEnumValueNames) of
    SOME (_, name') => name'
  | NONE            => name