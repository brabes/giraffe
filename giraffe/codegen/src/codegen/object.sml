(* --------------------------------------------------------------------------
 * Object - root class stubbed with empty file for now
 * -------------------------------------------------------------------------- *)

datatype program =
  Portable of module list
| Specific of {mlton : module list, polyml : module list}

val isPortable =
  fn
    Portable _ => true
  | Specific _ => false


(* Class signature *)

local
  (*
   *     val toBase : 'a t -> base t
   *)
  val toBaseValSpec = mkValSpec (toBaseId, TyFun (tTy aVarTy, tTy baseTy))

  (*
   *     structure C :
   *       sig
   *         type notnull
   *         type 'a p
   *         val fromPtr : bool -> notnull p -> 'a t
   *         val fromOptPtr : bool -> unit p -> 'a t option
   *       end
   *)
  val structCSpecs = [
    mkTypeSpec (notnullTyName, NONE),
    mkTypeSpec (ptrTyName aTyVar, NONE),
    mkValSpec (
      fromPtrId,
      TyFun (boolTy, TyFun (ptrTy notnullTy, tTy aVarTy))
    ),
    mkValSpec (
      fromOptPtrId,
      TyFun (boolTy, TyFun (ptrTy unitTy, optionTy (tTy aVarTy)))
    )
  ]
  val structCSpec = mkCStructSpec structCSpecs

  val specs'1 = [structCSpec]
in
  fun makeObjectDerivedClassSig
    (repo             : 'a RepositoryClass.t)
    (objectNamespace  : string)
    (parentObjectInfo : 'b ObjectInfoClass.t)
    (objectInfo       : 'c ObjectInfoClass.t)
    : id * program * id list =
    let
      val () = checkDeprecated objectInfo

      val objectName = getName objectInfo
      val objectNameTypeId = toLCU objectName

      val parentObjectNamespace = BaseInfo.getNamespace parentObjectInfo
      val parentObjectName = getName parentObjectInfo
      val parentObjectScope =
        if parentObjectNamespace <> objectNamespace
        then GLOBAL
        else LOCALINTERFACEOTHER
      val parentObjectTy = CLASS

      val parentObjectIRef = {
        namespace = parentObjectNamespace,
        name      = parentObjectName,
        scope     = parentObjectScope,
        ty        = parentObjectTy
      }

      val objectClassStrId = mkClassStrId objectNamespace objectName
      val objectClassSigId = toUCU objectClassStrId

      val specs'2 =
        addAccessorSpecs
          objectNamespace
          objectInfo
          (tTy baseTy, tTy aVarTy)
          true
          specs'1
      val specs'3 = toBaseValSpec :: specs'2

      (*
       *     type 'a <objectname>
       *                                           -.
       *     type 'a <parentobjectname>class_t      | isParentNamespace
       *     type 'a t = 'a <objectname> <parentobjectname>class_t
       *                                           -'
       *                                           -.
       *     type 'a t =                            | not isParentNamespace
       *       'a <objectname>                      |
       *         <ParentObjectNamespace>.<ParentObjectName>Class.t
       *                                           -'
       *)
      val parentClassTypeLId = makeInterfaceRefTyLongId parentObjectIRef
      val tTySpec =
        mkTypeSpec (
          tTyName aTyVar,
          SOME (
            TyRef (
              [TyRef ([aVarTy], toList1 [objectNameTypeId])],
              parentClassTypeLId
            )
          )
        )
      (* parentClassTypeLId is (_, [])
       *  <=> parentObjectNamespace = objectNamespace
       *  <=> isParentNamespace *)
      val specs'4 =
        case parentClassTypeLId of
          (id, []) => mkTypeSpec (([aTyVar], id), NONE) :: tTySpec :: specs'3
        | _        => tTySpec :: specs'3
      val specs'5 = mkTypeSpec (([aTyVar], objectNameTypeId), NONE) :: specs'4

      val sig1 = mkSigSpec specs'5
      val qSig : qsig = (sig1, [])
      val sigDec = toList1 [(objectClassSigId, qSig)]
      val program = [ModuleDecSig sigDec]
      val sigDeps = []
    in
      (objectClassSigId, Portable program, sigDeps)
    end

  fun makeObjectRootClassSig
    (objectNamespace : string)
    (objectInfo      : 'a ObjectInfoClass.t)
    : id * program * id list =
    let
      val () = checkDeprecated objectInfo

      val objectName = getName objectInfo

      val objectClassStrId = mkClassStrId objectNamespace objectName
      val objectClassSigId = toUCU objectClassStrId

      val program = []
      val sigDeps = []
    in
      (objectClassSigId, Portable program, sigDeps)
    end

  fun makeObjectClassSig
    (repo            : 'a RepositoryClass.t)
    (objectNamespace : string)
    (objectInfo      : 'b ObjectInfoClass.t)
    : id * program * id list =
    case ObjectInfo.getParent objectInfo of
      SOME parentObjectInfo =>
        makeObjectDerivedClassSig
          repo
          objectNamespace
          parentObjectInfo
          objectInfo
    | NONE                  =>
        makeObjectRootClassSig objectNamespace objectInfo
end


(* Class structure *)

local
  (*
   *     fun toBase obj = obj
   *)
  val toBaseFunDec =
    DecFun (
      [],
      toList1 [
        toList1 [
          (
            FunHeadPrefix (NameId toBaseId, toList1 [mkIdVarAPat objId]),
            NONE,
            mkIdLNameExp objId
          )
        ]
      ]
    )
in
  fun makeObjectDerivedClassStr
    (repo             : 'a RepositoryClass.t)
    (objectNamespace  : string)
    (parentObjectInfo : 'b ObjectInfoClass.t)
    (objectInfo       : 'c ObjectInfoClass.t)
    : id * (spec list * strdec list) * program * interfaceref list =
    let
      val () = checkDeprecated objectInfo

      val objectName = getName objectInfo
      val objectNameTypeId = toLCU objectName

      val parentObjectNamespace = BaseInfo.getNamespace parentObjectInfo
      val parentObjectName = getName parentObjectInfo
      val parentObjectScope =
        if parentObjectNamespace <> objectNamespace
        then GLOBAL
        else LOCALINTERFACEOTHER
      val parentObjectTy = CLASS

      val parentObjectIRef = {
        namespace = parentObjectNamespace,
        name      = parentObjectName,
        scope     = parentObjectScope,
        ty        = parentObjectTy
      }

      (* <ParentObjectNamespace><ParentObjectName>Class *)
      val parentClassStrId = makeIRefInterfaceOtherStrId parentObjectIRef

      val objectClassStrId = mkClassStrId objectNamespace objectName
      val objectClassSigId = toUCU objectClassStrId

      val objectClassStrNameId = mkClassStrNameId objectName

      val iRefs'1 =
        case parentObjectScope of
          GLOBAL             => []
     (* | LOCALINTERFACESELF => [] *) (* unreachable *)
        | _                  => [parentObjectIRef]

      val isParentNamespace = parentObjectScope <> GLOBAL
      val isGObject = objectNamespace = "GObject"

      (* module *)
      (*
       *     structure C = <ParentObjectNamespace><ParentObjectName>Class.C
       *)
      val cStrDec =
        StrDecStruct (
          toList1 [
            (
              "C",
              NONE,
              StructName (toList1 [parentClassStrId, "C"])
            )
          ]
        )
      val strDecs'1 = [cStrDec]

      (*
       *                                                 -.
       *     type ('a, 'b) value_accessor =               | isGObject
       *       ('a, 'b) GObjectValue.accessor             |
       *                                                 -'
       *     val t = <ParentObjectNamespace><ParentObjectName>Class.t
       *     val tOpt = <ParentObjectNamespace><ParentObjectName>Class.tOpt
       *)
      val tValDec = mkIdValDec (tId, mkLIdLNameExp [parentClassStrId, tId])
      val tOptValDec =
        mkIdValDec (tOptId, mkLIdLNameExp [parentClassStrId, tOptId])
      val revAccessorLocalTypes = makeAccessorLocalTypes isGObject
      val strDecs'2 =
        revMapAppend makeLocalTypeStrDec
          (
            revAccessorLocalTypes,
            StrDecDec tValDec :: StrDecDec tOptValDec :: strDecs'1
          )
      val strDecs'3 = StrDecDec toBaseFunDec :: strDecs'2

      (*
       *     type 'a <objectname> = unit
       *                                           -.
       *     type 'a <parentobjectname>class_t =    | isParentNamespace
       *       'a <ParentObjectNamespace><ParentObjectName>Class.t
       *     type 'a t = 'a <objectname> <parentobjectname>class_t
       *                                           -'
       *                                           -.
       *     type 'a t =                            | not isParentNamespace
       *       'a <objectname> <ParentObjectNamespace><ParentObjectName>Class.t
       *                                           -'
       *)
      val parentClassTypeLId =
        toList1 (
          if isParentNamespace
          then [makeLocalInterfaceOtherId parentObjectIRef]
          else [parentClassStrId, tId]
        )
      val tTyStrDec =
        StrDecDec (
          mkTypeDec (
            tTyName aTyVar,
            I (
              TyRef (
                [TyRef ([aVarTy], toList1 [objectNameTypeId])],
                parentClassTypeLId
              )
            )
          )
        )
      val (strDecs'4, revParentClassLocalTypes) =
        if isParentNamespace
        then
          let
            val localType = makeIRefLocalType parentObjectIRef
          in
            (
              makeLocalTypeStrDec localType :: tTyStrDec :: strDecs'3,
              [localType]
            )
          end
        else (tTyStrDec :: strDecs'3, [])
      val strDecs'5 =
        StrDecDec (mkTypeDec (([aTyVar], objectNameTypeId), unitTy))
         :: strDecs'4

      val struct1 = mkStructBody strDecs'5

      (* sig *)
      val sig1 = SigName objectClassSigId
      (*
       *                                                 -.
       *     where                                        |
       *       type 'a <parentobjectname>class_t =        | isParentNamespace
       *         'a <ParentObjectNamespace><ParentObjectName>Class.t
       *                                                 -'
       *                                                 -.
       *     where type ('a, 'b) value_accessor =         | isGObject
       *       ('a, 'b) GObjectValue.accessor             |
       *                                                 -'
       *     where type C.notnull =
       *       <ParentObjectNamespace><ParentObjectName>Class.C.notnull
       *     where type 'a C.p =
       *       'a <ParentObjectNamespace><ParentObjectName>Class.C.p
       *)
      val cNotnullQual =
        toList1 [
          (([], cNotnullLId), TyRef ([], cons1 (parentClassStrId, cNotnullLId)))
        ]
      val cPtrQual =
        toList1 [
          (
            ([aTyVar], cPtrLId),
            TyRef ([aVarTy], cons1 (parentClassStrId, cPtrLId))
          )
        ]

      val sigQual'1 : qual list = [cNotnullQual, cPtrQual]
      val sigQual'2 =
        revMapAppend makeLocalTypeStrModuleQual (revAccessorLocalTypes, sigQual'1)
      val sigQual'3 =
        revMapAppend makeLocalTypeStrModuleQual
          (revParentClassLocalTypes, sigQual'2)
      val qSig : qsig = (sig1, sigQual'3)

      (* strdec *)
      val structDec =
        toList1 [(objectClassStrId, SOME (true, qSig), struct1)]
      val strDec = StrDecStruct structDec

      val program = [ModuleDecStr strDec]

      (* namespace spec *)
      val objectClassSpec =
        let
          (* sig *)
          val sig1 = SigName objectClassSigId
          val sigQual'1 = revMap makeLocalTypeStrSpecQual revAccessorLocalTypes
          val sigQual'2 =
            revMapAppend makeLocalTypeStrSpecQual
              (revParentClassLocalTypes, sigQual'1)
          val qSig : qsig = (sig1, sigQual'2)
        in
          (* spec *)
          SpecStruct (toList1 [(objectClassStrNameId, qSig)])
        end
      val objectClassSpecs = [objectClassSpec]

      (* namespace strdec *)
      val objectClassStrDec =
        StrDecStruct (
          toList1 [
            (objectClassStrNameId, NONE, StructName (toList1 [objectClassStrId]))
          ]
        )
      val objectClassStrDecs = [objectClassStrDec]
    in
      (
        objectClassStrId,
        (objectClassSpecs, objectClassStrDecs),
        Specific {mlton = program, polyml = program},
        iRefs'1
      )
    end

  fun makeObjectRootClassStr
    (_               : 'a RepositoryClass.t)
    (objectNamespace : string)
    (objectInfo      : 'b ObjectInfoClass.t)
    : id * (spec list * strdec list) * program * interfaceref list =
    let
      val () = checkDeprecated objectInfo

      val objectName = getName objectInfo

      val objectClassStrId = mkClassStrId objectNamespace objectName
      val objectClassSigId = toUCU objectClassStrId

      val objectClassStrNameId = mkClassStrNameId objectName

      val isGObject = objectNamespace = "GObject"

      (* module *)
      val revAccessorLocalTypes = makeAccessorLocalTypes isGObject
      val programMLton = []
      val programPolyML = []

      (* namespace spec *)
      val objectClassSpec =
        let
          (* sig *)
          val sig1 = SigName objectClassSigId
          val sigQual'1 = revMap makeLocalTypeStrSpecQual revAccessorLocalTypes
          val qSig : qsig = (sig1, sigQual'1)
        in
          (* spec *)
          SpecStruct (toList1 [(objectClassStrNameId, qSig)])
        end
      val objectClassSpecs = [objectClassSpec]

      (* namespace strdec *)
      val objectClassStrDec =
        StrDecStruct (
          toList1 [
            (objectClassStrNameId, NONE, StructName (toList1 [objectClassStrId]))
          ]
        )
      val objectClassStrDecs = [objectClassStrDec]
    in
      (
        objectClassStrId,
        (objectClassSpecs, objectClassStrDecs),
        Specific {mlton = programMLton, polyml = programPolyML},
        []
      )
    end

  fun makeObjectClassStr
    (repo            : 'a RepositoryClass.t)
    (objectNamespace : string)
    (objectInfo      : 'b ObjectInfoClass.t)
    : id * (spec list * strdec list) * program * interfaceref list =
    case ObjectInfo.getParent objectInfo of
      SOME parentObjectInfo =>
        makeObjectDerivedClassStr
          repo
          objectNamespace
          parentObjectInfo
          objectInfo
    | NONE                  =>
        makeObjectRootClassStr
          repo
          objectNamespace
          objectInfo
end


(* Object signature *)

fun addObjectInterfaceConvSpecs repo objectIRef =
  revFoldMapInfosWithErrs
    ObjectInfo.getNInterfaces
    ObjectInfo.getInterface
    (makeInterfaceConvSpec repo objectIRef)

fun addObjectConstantSpecs x =
  revFoldMapInfosWithErrs
    ObjectInfo.getNConstants
    ObjectInfo.getConstant
    makeConstantSpec
    x

fun addObjectMethodSpecs repo objectIRef =
  revFoldMapInfosWithErrs
    ObjectInfo.getNMethods
    ObjectInfo.getMethod
    (makeFunctionSpec repo (SOME objectIRef))

fun addObjectSignalSpecs repo objectIRef =
  revFoldMapInfosWithErrs
    ObjectInfo.getNSignals
    ObjectInfo.getSignal
    (makeSignalSpec repo objectIRef)

fun addObjectPropertySpecs repo objectIRef =
  revFoldMapInfosWithErrs
    ObjectInfo.getNProperties
    ObjectInfo.getProperty
    (makePropertySpec repo objectIRef)

fun makeObjectSig
  (repo            : 'a RepositoryClass.t)
  (objectNamespace : string)
  (objectInfo      : 'a ObjectInfoClass.t)
  (errs'0          : infoerrorhier list)
  : id * program * id list * infoerrorhier list =
  let
    val () = checkDeprecated objectInfo

    val objectName = getName objectInfo
    val objectIRef = {
      namespace = objectNamespace,
      name      = objectName,
      scope     = LOCALINTERFACESELF,
      ty        = CLASS
    }

    val objectStrId = mkStrId objectNamespace objectName
    val objectSigId = toUCU objectStrId

    val typeIRef = makeTypeIRef objectNamespace (SOME objectName)

    val acc'0
      : spec list
         * interfaceref list
         * infoerrorhier list =
      ([], [], errs'0)
    val acc'1 = addObjectPropertySpecs repo objectIRef (objectInfo, acc'0)
    val acc'2 = addObjectSignalSpecs repo objectIRef (objectInfo, acc'1)
    val acc'3 = addObjectMethodSpecs repo objectIRef (objectInfo, acc'2)
    val acc'4 = addGetTypeFunctionSpec typeIRef acc'3
    val acc'5 = addObjectConstantSpecs (objectInfo, acc'4)
    val acc'6 = addObjectInterfaceConvSpecs repo objectIRef (objectInfo, acc'5)
    val (specs'6, iRefs'6, errs'6) = acc'6

    val sigIRefs =
      objectIRef :: iRefs'6  (* `objectIRef` for class structure dependence *)

    val numProps = ObjectInfo.getNProperties objectInfo
    val specs'7 = addPropertySpecs objectNamespace numProps specs'6

    (*
     *     type t = base class_t
     *)
    val specs'8 =
      let
        val (ty, _) = makeIRefLocalTypeRef makeRefBaseTy (objectIRef, 0)
      in
        mkTypeSpec (([], tId), SOME ty) :: specs'7
      end

    (*
     *     type 'a class_t
     *
     *     type <varlist[1]> <typename[1]>_t
     *
     *     ...
     *
     *     type <varlist[N]> <typename[N]>_t
     *)
    val specs'9 = revMapAppend makeIRefLocalTypeSpec (rev sigIRefs, specs'8)

    val sig1 = mkSigSpec specs'9
    val qSig : qsig = (sig1, [])
    val sigDec = toList1 [(objectSigId, qSig)]
    val program = [ModuleDecSig sigDec]
    val sigDeps = []
  in
    (objectSigId, Portable program, sigDeps, errs'6)
  end


(* Object structure *)

fun addObjectInterfaceConvStrDecs repo rootObjectIRef objectIRef =
  revFoldMapInfosWithErrs
    ObjectInfo.getNInterfaces
    ObjectInfo.getInterface
    (makeInterfaceConvStrDec repo rootObjectIRef objectIRef)

fun addObjectConstantStrDecs x =
  revFoldMapInfosWithErrs
    ObjectInfo.getNConstants
    ObjectInfo.getConstant
    makeConstantStrDec
    x

fun addObjectMethodStrDecsLowLevel
  isPolyML
  repo
  libId
  addInitStrDecs
  rootObjectIRef
  objectIRef =
  addFunctionStrDecsLowLevel
    (ObjectInfo.getNMethods, ObjectInfo.getMethod)
    isPolyML
    repo
    libId
    addInitStrDecs
    (SOME (rootObjectIRef, objectIRef))

fun addObjectMethodStrDecsHighLevel repo rootObjectIRef objectIRef =
  revFoldMapInfosWithErrs
    ObjectInfo.getNMethods
    ObjectInfo.getMethod
    (makeFunctionStrDecHighLevel repo (SOME (rootObjectIRef, objectIRef)))

fun addObjectSignalStrDecs repo objectIRef =
  fn (objectInfo, (strDecs, iRefs, errs)) =>
    let
      val (localStrDecs, iRefs', errs') =
        revFoldMapInfosWithErrs
          ObjectInfo.getNSignals
          ObjectInfo.getSignal
          (makeSignalStrDec repo objectIRef)
          (objectInfo, ([], iRefs, errs))
    in
      case localStrDecs of
        _ :: _ =>
          let
            val strDec =
              StrDecLocal (
                mkStrDecs [
                  StrDecDec (
                    DecOpen (
                      toList1 [
                        toList1 ["ClosureMarshal"],
                        toList1 ["Signal"]
                      ]
                    )
                  )
                ],
                mkStrDecs localStrDecs
              )
          in
            (strDec :: strDecs, iRefs', errs')
          end
      | _      => (strDecs, iRefs', errs')
    end

fun addObjectPropertyStrDecs repo objectIRef =
  fn (objectInfo, (strDecs, iRefs, errs)) =>
    let
      val (localStrDecs, iRefs', errs') =
        revFoldMapInfosWithErrs
          ObjectInfo.getNProperties
          ObjectInfo.getProperty
          (makePropertyStrDec repo objectIRef)
          (objectInfo, ([], iRefs, errs))
    in
      case localStrDecs of
        _ :: _ =>
          let
            val strDec =
              StrDecLocal (
                mkStrDecs [
                  StrDecDec (
                    DecOpen (
                      toList1 [
                        toList1 ["Property"]
                      ]
                    )
                  )
                ],
                mkStrDecs localStrDecs
              )
          in
            (strDec :: strDecs, iRefs', errs')
          end
      | _      => (strDecs, iRefs', errs')
    end

fun makeObjectStr
  (repo            : 'a RepositoryClass.t)
  (vers            : Repository.typelibvers_t)
  (libId           : id)
  (objectNamespace : string)
  (objectInfo      : 'a ObjectInfoClass.t)
  (errs'0          : infoerrorhier list)
  : id * (spec list * strdec list) * program * interfaceref list * infoerrorhier list =
  let
    val () = checkDeprecated objectInfo

    val getTypeSymbol = ObjectInfo.getTypeInit objectInfo

    val objectName = getName objectInfo
    val objectIRef = {
      namespace = objectNamespace,
      name      = objectName,
      scope     = LOCALINTERFACESELF,
      ty        = CLASS
    }

    val objectStrId = mkStrId objectNamespace objectName
    val objectSigId = toUCU objectStrId

    val objectStrNameId = mkStrNameId objectName

    val typeIRef = makeTypeIRef objectNamespace (SOME objectName)
    val rootObjectIRef =
      getRootObjectIRef repo objectNamespace (SOME objectName)
        (objectInfo, objectIRef)

    val isGObject = objectNamespace = "GObject"

    (* module *)
    val acc'0
      : strdec list
         * interfaceref list
         * infoerrorhier list =
      ([], [], errs'0)
    val acc'1 = addObjectPropertyStrDecs repo objectIRef (objectInfo, acc'0)
    val acc'2 = addObjectSignalStrDecs repo objectIRef (objectInfo, acc'1)
    val acc'3 =
      addObjectMethodStrDecsHighLevel
        repo
        rootObjectIRef
        objectIRef
        (objectInfo, acc'2)
    val acc'4 = addGetTypeFunctionStrDecHighLevel typeIRef acc'3
    val acc'5 = addObjectConstantStrDecs (objectInfo, acc'4)
    val acc'6 =
      addObjectInterfaceConvStrDecs
        repo
        rootObjectIRef
        objectIRef
        (objectInfo, acc'5)
    val (strDecs'6, iRefs'6, errs'6) = acc'6

    val strIRefs =
      objectIRef :: iRefs'6  (* `objectIRef` for class structure dependence *)

    val numProps = ObjectInfo.getNProperties objectInfo
    val revPropLocalTypes = makePropertyLocalTypes isGObject numProps
    val strDecs'7 =
      revMapAppend makeLocalTypeStrDec (revPropLocalTypes, strDecs'6)

    (*
     *     type t = base class_t
     *)
    val strDecs'8 =
      let
        val (ty, _) = makeIRefLocalTypeRef makeRefBaseTy (objectIRef, 0)
      in
        StrDecDec (mkTypeDec (([], tId), ty)) :: strDecs'7
      end

    (*
     *     type 'a class_t = 'a <ObjectNamespace><ObjectName>Class.t
     * 
     *     type <varlist[1]> <typename[1]>_t =
     *       <varlist[1]> <ObjectNamespace><TypeName[1]>.t
     * 
     *     ...
     * 
     *     type <varlist[N]> <typename[N]>_t =
     *       <varlist[N]> <ObjectNamespace><TypeName[N]>.t
     *)
    val revLocalTypes = revMap makeIRefLocalType strIRefs
    val strDecs'9 = revMapAppend makeLocalTypeStrDec (revLocalTypes, strDecs'8)

    fun mkModule isPolyML =
      let
        val (strDecs, _) =
          addObjectMethodStrDecsLowLevel
            isPolyML
            repo
            libId
            (
              addGetTypeFunctionStrDecLowLevel
                repo
                vers
                libId
                objectNamespace
                getTypeSymbol
            )
            rootObjectIRef
            objectIRef
            (objectInfo, (strDecs'9, errs'6))

        val struct1 = mkStructBody strDecs

        (* sig *)
        val sig1 = SigName objectSigId
        val sigQual'1 = revMap makeLocalTypeStrModuleQual revPropLocalTypes
        val sigQual'2 =
          revMapAppend makeLocalTypeStrModuleQual (revLocalTypes, sigQual'1)
        val qSig : qsig = (sig1, sigQual'2)

        (* strdec *)
        val structDec = toList1 [(objectStrId, SOME (true, qSig), struct1)]
        val strDec = StrDecStruct structDec
      in
        [ModuleDecStr strDec]
      end

    val programMLton = mkModule false
    val programPolyML = mkModule true

    (* namespace spec *)
    val objectSpec =
      let
        (* sig *)
        val sig1 = SigName objectSigId
        val sigQual'1 = revMap makeLocalTypeStrSpecQual revPropLocalTypes
        val sigQual'2 =
          revMapAppend makeLocalTypeStrSpecQual (revLocalTypes, sigQual'1)
        val qSig : qsig = (sig1, sigQual'2)
      in
        (* spec *)
        SpecStruct (toList1 [(objectStrNameId, qSig)])
      end

    (* namespace strdec *)
    val objectStrDec =
      StrDecStruct (
        toList1 [
          (objectStrNameId, NONE, StructName (toList1 [objectStrId]))
        ]
      )
  in
    (
      objectStrId,
      ([objectSpec], [objectStrDec]),
      Specific {mlton = programMLton, polyml = programPolyML},
      strIRefs,
      errs'6
    )
  end