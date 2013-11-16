structure GtkIconSize :>
  sig
    include
      GTK_ICON_SIZE
        where type 'a settingsclass_t = 'a GtkSettingsClass.t
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      INVALID
    | MENU
    | SMALLTOOLBAR
    | LARGETOOLBAR
    | BUTTON
    | DND
    | DIALOG
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            INVALID => f 0
          | MENU => f 1
          | SMALLTOOLBAR => f 2
          | LARGETOOLBAR => f 3
          | BUTTON => f 4
          | DND => f 5
          | DIALOG => f 6
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => INVALID
          | 1 => MENU
          | 2 => SMALLTOOLBAR
          | 3 => LARGETOOLBAR
          | 4 => BUTTON
          | 5 => DND
          | 6 => DIALOG
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
      val getType_ = call (load_sym libgtk "gtk_icon_size_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
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
    val null = INVALID
    local
      open PolyMLFFI
    in
      val fromName_ = call (load_sym libgtk "gtk_icon_size_from_name") (FFI.String.PolyML.INPTR --> FFI.Int32.PolyML.VAL)
      val getName_ = call (load_sym libgtk "gtk_icon_size_get_name") (FFI.Int32.PolyML.VAL --> FFI.String.PolyML.RETPTR)
      val lookup_ =
        call (load_sym libgtk "gtk_icon_size_lookup")
          (
            FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.Bool.PolyML.VAL
          )
      val lookupForSettings_ =
        call (load_sym libgtk "gtk_icon_size_lookup_for_settings")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.Bool.PolyML.VAL
          )
      val register_ =
        call (load_sym libgtk "gtk_icon_size_register")
          (
            FFI.String.PolyML.INPTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.Int32.PolyML.VAL
          )
      val registerAlias_ = call (load_sym libgtk "gtk_icon_size_register_alias") (FFI.String.PolyML.INPTR &&> FFI.Int32.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a settingsclass_t = 'a GtkSettingsClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun fromName name = (FFI.String.C.withConstPtr ---> FFI.Int32.C.fromVal) fromName_ name
    fun getName size = (FFI.Int32.C.withVal ---> FFI.String.C.fromPtr false) getName_ size
    fun lookup size =
      let
        val width
         & height
         & retVal =
          (
            FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            lookup_
            (
              size
               & 0
               & 0
            )
      in
        if retVal then SOME (width, height) else NONE
      end
    fun lookupForSettings settings size =
      let
        val width
         & height
         & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            lookupForSettings_
            (
              settings
               & size
               & 0
               & 0
            )
      in
        if retVal then SOME (width, height) else NONE
      end
    fun register name width height =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> FFI.Int32.C.fromVal
      )
        register_
        (
          name
           & width
           & height
        )
    fun registerAlias alias target = (FFI.String.C.withConstPtr &&&> FFI.Int32.C.withVal ---> I) registerAlias_ (alias & target)
  end
