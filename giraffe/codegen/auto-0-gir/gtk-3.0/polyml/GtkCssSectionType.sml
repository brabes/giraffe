structure GtkCssSectionType :>
  sig
    include GTK_CSS_SECTION_TYPE
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      DOCUMENT
    | IMPORT
    | COLORDEFINITION
    | BINDINGSET
    | RULESET
    | SELECTOR
    | DECLARATION
    | VALUE
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            DOCUMENT => f 0
          | IMPORT => f 1
          | COLORDEFINITION => f 2
          | BINDINGSET => f 3
          | RULESET => f 4
          | SELECTOR => f 5
          | DECLARATION => f 6
          | VALUE => f 7
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => DOCUMENT
          | 1 => IMPORT
          | 2 => COLORDEFINITION
          | 3 => BINDINGSET
          | 4 => RULESET
          | 5 => SELECTOR
          | 6 => DECLARATION
          | 7 => VALUE
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.Enum.PolyML.VAL
        val REF = FFI.Enum.PolyML.REF
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_css_section_type_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.PTR --> PolyML.VAL)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.PTR &&> PolyML.VAL --> FFI.PolyML.VOID)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = DOCUMENT
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
