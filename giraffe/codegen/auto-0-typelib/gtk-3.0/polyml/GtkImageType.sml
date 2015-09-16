structure GtkImageType :>
  sig
    include GTK_IMAGE_TYPE
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      EMPTY
    | PIXBUF
    | STOCK
    | ICON_SET
    | ANIMATION
    | ICON_NAME
    | GICON
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            EMPTY => f 0
          | PIXBUF => f 1
          | STOCK => f 2
          | ICON_SET => f 3
          | ANIMATION => f 4
          | ICON_NAME => f 5
          | GICON => f 6
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => EMPTY
          | 1 => PIXBUF
          | 2 => STOCK
          | 3 => ICON_SET
          | 4 => ANIMATION
          | 5 => ICON_NAME
          | 6 => GICON
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
      val getType_ = call (load_sym libgtk "gtk_image_type_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
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
    val null = EMPTY
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
