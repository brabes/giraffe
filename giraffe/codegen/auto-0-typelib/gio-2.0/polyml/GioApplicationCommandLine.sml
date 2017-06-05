structure GioApplicationCommandLine :>
  GIO_APPLICATION_COMMAND_LINE
    where type 'a class = 'a GioApplicationCommandLineClass.class =
  struct
    structure Utf8CVectorType =
      CPointerCVectorType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVector = CVector(Utf8CVectorType)
    structure Utf8CVectorNType =
      CPointerCVectorNType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVectorN = CVectorN(Utf8CVectorNType)
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_application_command_line_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getArguments_ = call (load_sym libgio "g_application_command_line_get_arguments") (GioApplicationCommandLineClass.PolyML.cPtr &&> GInt32.PolyML.cRef --> Utf8CVectorN.PolyML.cOutPtr)
      val getCwd_ = call (load_sym libgio "g_application_command_line_get_cwd") (GioApplicationCommandLineClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getEnviron_ = call (load_sym libgio "g_application_command_line_get_environ") (GioApplicationCommandLineClass.PolyML.cPtr --> Utf8CVector.PolyML.cOutPtr)
      val getExitStatus_ = call (load_sym libgio "g_application_command_line_get_exit_status") (GioApplicationCommandLineClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getIsRemote_ = call (load_sym libgio "g_application_command_line_get_is_remote") (GioApplicationCommandLineClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getPlatformData_ = call (load_sym libgio "g_application_command_line_get_platform_data") (GioApplicationCommandLineClass.PolyML.cPtr --> GLibVariantRecord.PolyML.cPtr)
      val getenv_ = call (load_sym libgio "g_application_command_line_getenv") (GioApplicationCommandLineClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val setExitStatus_ = call (load_sym libgio "g_application_command_line_set_exit_status") (GioApplicationCommandLineClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GioApplicationCommandLineClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getArguments self =
      let
        val argc & retVal = (GioApplicationCommandLineClass.FFI.withPtr &&&> GInt32.FFI.withRefVal ---> GInt32.FFI.fromVal && Utf8CVectorN.FFI.fromPtr 2) getArguments_ (self & GInt32.null)
      in
        retVal (LargeInt.toInt argc)
      end
    fun getCwd self = (GioApplicationCommandLineClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getCwd_ self
    fun getEnviron self = (GioApplicationCommandLineClass.FFI.withPtr ---> Utf8CVector.FFI.fromPtr 0) getEnviron_ self
    fun getExitStatus self = (GioApplicationCommandLineClass.FFI.withPtr ---> GInt32.FFI.fromVal) getExitStatus_ self
    fun getIsRemote self = (GioApplicationCommandLineClass.FFI.withPtr ---> GBool.FFI.fromVal) getIsRemote_ self
    fun getPlatformData self = (GioApplicationCommandLineClass.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr true) getPlatformData_ self
    fun getenv self name = (GioApplicationCommandLineClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getenv_ (self & name)
    fun setExitStatus self exitStatus = (GioApplicationCommandLineClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setExitStatus_ (self & exitStatus)
    local
      open Property
    in
      val argumentsProp = {set = fn x => set "arguments" GLibVariantRecord.tOpt x}
      val isRemoteProp = {get = fn x => get "is-remote" boolean x}
      val platformDataProp = {set = fn x => set "platform-data" GLibVariantRecord.tOpt x}
    end
  end
