signature G_LIB_REGEX_ERROR =
  sig
    datatype t =
      COMPILE
    | OPTIMIZE
    | REPLACE
    | MATCH
    | INTERNAL
    | STRAYBACKSLASH
    | MISSINGCONTROLCHAR
    | UNRECOGNIZEDESCAPE
    | QUANTIFIERSOUTOFORDER
    | QUANTIFIERTOOBIG
    | UNTERMINATEDCHARACTERCLASS
    | INVALIDESCAPEINCHARACTERCLASS
    | RANGEOUTOFORDER
    | NOTHINGTOREPEAT
    | UNRECOGNIZEDCHARACTER
    | POSIXNAMEDCLASSOUTSIDECLASS
    | UNMATCHEDPARENTHESIS
    | INEXISTENTSUBPATTERNREFERENCE
    | UNTERMINATEDCOMMENT
    | EXPRESSIONTOOLARGE
    | MEMORYERROR
    | VARIABLELENGTHLOOKBEHIND
    | MALFORMEDCONDITION
    | TOOMANYCONDITIONALBRANCHES
    | ASSERTIONEXPECTED
    | UNKNOWNPOSIXCLASSNAME
    | POSIXCOLLATINGELEMENTSNOTSUPPORTED
    | HEXCODETOOLARGE
    | INVALIDCONDITION
    | SINGLEBYTEMATCHINLOOKBEHIND
    | INFINITELOOP
    | MISSINGSUBPATTERNNAMETERMINATOR
    | DUPLICATESUBPATTERNNAME
    | MALFORMEDPROPERTY
    | UNKNOWNPROPERTY
    | SUBPATTERNNAMETOOLONG
    | TOOMANYSUBPATTERNS
    | INVALIDOCTALVALUE
    | TOOMANYBRANCHESINDEFINE
    | DEFINEREPETION
    | INCONSISTENTNEWLINEOPTIONS
    | MISSINGBACKREFERENCE
    exception Error of t
    type errorrecord_handler
    val handler : errorrecord_handler
    structure C :
      sig
        type val_
        type ref_
        val withVal :
          (val_ -> 'a)
           -> t
           -> 'a
        val withRefVal :
          (ref_ -> 'a)
           -> t
           -> (val_, 'a) pair
        val fromVal : val_ -> t
        exception Value of FFI.Enum.C.val_
      end
  end
