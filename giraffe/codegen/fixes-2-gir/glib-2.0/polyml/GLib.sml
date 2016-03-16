structure GLib : G_LIB =
  struct
    local
      open PolyMLFFI
    in
      val checkVersion_ =
        call (load_sym libglib "glib_check_version")
          (
            FFI.UInt.PolyML.cVal
             &&> FFI.UInt.PolyML.cVal
             &&> FFI.UInt.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val childWatchAdd_ =
        call (load_sym libgiraffeglib "giraffe_g_child_watch_add")
          (
            FFI.Int.PolyML.cVal
             &&> GLibPid.PolyML.cVal
             &&> GLibChildWatchFunc.PolyML.CALLBACK
             --> FFI.UInt.PolyML.cVal
          )
      val childWatchSourceNew_ = call (load_sym libgiraffeglib "giraffe_g_child_watch_source_new") (GLibPid.PolyML.cVal &&> GLibChildWatchFunc.PolyML.CALLBACK --> GLibSourceRecord.PolyML.cPtr)
      val filenameFromUri_ =
        call (load_sym libglib "g_filename_from_uri")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val filenameToUri_ =
        call (load_sym libglib "g_filename_to_uri")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val idleAdd_ = call (load_sym libgiraffeglib "giraffe_g_idle_add") (FFI.Int.PolyML.cVal &&> GLibSourceFunc.PolyML.CALLBACK --> FFI.UInt.PolyML.cVal)
      val ioAddWatch_ =
        call
          (load_sym libgiraffeglib "giraffe_g_io_add_watch")
          (
            GLibIOChannelRecord.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> GLibIOCondition.PolyML.cVal
             &&> GLibIOFunc.PolyML.CALLBACK
             --> FFI.UInt.PolyML.cVal
          )
      val ioCreateWatch_ = call (load_sym libglib "g_io_create_watch") (GLibIOChannelRecord.PolyML.cPtr &&> GLibIOCondition.PolyML.cVal --> GLibSourceRecord.PolyML.cPtr)
      val logDefaultHandler_ =
        call (load_sym libglib "g_log_default_handler")
          (
            Utf8.PolyML.cInPtr
             &&> GLibLogLevelFlags.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> FFI.PolyML.cVoid
          )
      val logRemoveHandler_ = call (load_sym libglib "g_log_remove_handler") (Utf8.PolyML.cInPtr &&> FFI.UInt.PolyML.cVal --> FFI.PolyML.cVoid)
      val logSetAlwaysFatal_ = call (load_sym libglib "g_log_set_always_fatal") (GLibLogLevelFlags.PolyML.cVal --> GLibLogLevelFlags.PolyML.cVal)
      val logSetFatalMask_ = call (load_sym libglib "g_log_set_fatal_mask") (Utf8.PolyML.cInPtr &&> GLibLogLevelFlags.PolyML.cVal --> GLibLogLevelFlags.PolyML.cVal)
      val mainContextDefault_ = call (load_sym libglib "g_main_context_default") (FFI.PolyML.cVoid --> GLibMainContextRecord.PolyML.cPtr)
      val mainContextGetThreadDefault_ = call (load_sym libglib "g_main_context_get_thread_default") (FFI.PolyML.cVoid --> GLibMainContextRecord.PolyML.cPtr)
      val mainCurrentSource_ = call (load_sym libglib "g_main_current_source") (FFI.PolyML.cVoid --> GLibSourceRecord.PolyML.cPtr)
      val mainDepth_ = call (load_sym libglib "g_main_depth") (FFI.PolyML.cVoid --> FFI.Int.PolyML.cVal)
      val regexMatchSimple_ =
        call (load_sym libglib "g_regex_match_simple")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibRegexCompileFlags.PolyML.cVal
             &&> GLibRegexMatchFlags.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
      val shellParseArgv_ =
        call
          (load_sym libglib "g_shell_parse_argv")
          (
            Utf8.PolyML.cInPtr
             &&> FFI.OptPointer.PolyML.cVal
             &&> Utf8CVector.PolyML.cOutRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val shellQuote_ = call (load_sym libglib "g_shell_quote") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val shellUnquote_ = call (load_sym libglib "g_shell_unquote") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> Utf8.PolyML.cOutPtr)
      val sourceRemove_ = call (load_sym libglib "g_source_remove") (FFI.UInt.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val spawnAsyncWithPipes_ =
        call
          (load_sym libgiraffeglib "giraffe_g_spawn_async_with_pipes")
          (
            Utf8.PolyML.cInOptPtr
             &&> Utf8CVector.PolyML.cInPtr
             &&> Utf8CVector.PolyML.cInOptPtr
             &&> GLibSpawnFlags.PolyML.cVal
             &&> GLibSpawnChildSetupFunc.PolyML.CALLBACK
             &&> GLibPid.PolyML.cRef
             &&> FileDesc.PolyML.cRef
             &&> FileDesc.PolyML.cRef
             &&> FileDesc.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val spawnClosePid_ = call (load_sym libglib "g_spawn_close_pid") (GLibPid.PolyML.cVal --> FFI.PolyML.cVoid)
      val spawnCommandLineAsync_ = call (load_sym libglib "g_spawn_command_line_async") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> FFI.Bool.PolyML.cVal)
      val timeoutAdd_ =
        call
          (load_sym libgiraffeglib "giraffe_g_timeout_add")
          (
            FFI.Int.PolyML.cVal
             &&> FFI.UInt.PolyML.cVal
             &&> GLibSourceFunc.PolyML.CALLBACK
             --> FFI.UInt.PolyML.cVal
          )
      val timeoutAddSeconds_ =
        call
          (load_sym libgiraffeglib "giraffe_g_timeout_add_seconds")
          (
            FFI.Int.PolyML.cVal
             &&> FFI.UInt.PolyML.cVal
             &&> GLibSourceFunc.PolyML.CALLBACK
             --> FFI.UInt.PolyML.cVal
          )
      val uriEscapeString_ =
        call (load_sym libglib "g_uri_escape_string")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Bool.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val uriParseScheme_ = call (load_sym libglib "g_uri_parse_scheme") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val uriUnescapeSegment_ =
        call (load_sym libglib "g_uri_unescape_segment")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> Utf8.PolyML.cOutPtr
          )
      val uriUnescapeString_ = call (load_sym libglib "g_uri_unescape_string") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
    end
    structure SourceFunc = GLibSourceFunc
    structure SpawnChildSetupFunc = GLibSpawnChildSetupFunc
    structure DateDay = GLibDateDay
    structure DateYear = GLibDateYear
    structure Pid = GLibPid
    structure Quark = GLibQuark
    structure Time = GLibTime
    structure TimeSpan = GLibTimeSpan
    structure IOChannelRecord = GLibIOChannelRecord
    structure IOCondition = GLibIOCondition
    structure IOError = GLibIOError
    structure IOFlags = GLibIOFlags
    structure IOStatus = GLibIOStatus
    structure KeyFileRecord = GLibKeyFileRecord
    structure KeyFileFlags = GLibKeyFileFlags
    structure LogLevelFlags = GLibLogLevelFlags
    structure MainContextRecord = GLibMainContextRecord
    structure MatchInfoRecord = GLibMatchInfoRecord
    structure RegexRecord = GLibRegexRecord
    structure RegexCompileFlags = GLibRegexCompileFlags
    structure RegexMatchFlags = GLibRegexMatchFlags
    structure SeekType = GLibSeekType
    structure SourceRecord = GLibSourceRecord
    structure SpawnFlags = GLibSpawnFlags
    structure TimeValRecord = GLibTimeValRecord
    structure ChildWatchFunc = GLibChildWatchFunc
    structure IOFunc = GLibIOFunc
    structure ErrorRecord = GLibErrorRecord
    structure KeyFile = GLibKeyFile
    structure MatchInfo = GLibMatchInfo
    structure Regex = GLibRegex
    structure Source = GLibSource
    structure TimeVal = GLibTimeVal
    structure Error = GLibError
    exception Error = GLibError
    structure IOChannelError = GLibIOChannelError
    exception IOChannelError = GLibIOChannelError
    structure KeyFileError = GLibKeyFileError
    exception KeyFileError = GLibKeyFileError
    structure RegexError = GLibRegexError
    exception RegexError = GLibRegexError
    structure ShellError = GLibShellError
    exception ShellError = GLibShellError
    structure SpawnError = GLibSpawnError
    exception SpawnError = GLibSpawnError
    structure IOChannel = GLibIOChannel
    val KEY_FILE_DESKTOP_GROUP = "Desktop Entry"
    val KEY_FILE_DESKTOP_KEY_CATEGORIES = "Categories"
    val KEY_FILE_DESKTOP_KEY_COMMENT = "Comment"
    val KEY_FILE_DESKTOP_KEY_EXEC = "Exec"
    val KEY_FILE_DESKTOP_KEY_GENERIC_NAME = "GenericName"
    val KEY_FILE_DESKTOP_KEY_HIDDEN = "Hidden"
    val KEY_FILE_DESKTOP_KEY_ICON = "Icon"
    val KEY_FILE_DESKTOP_KEY_MIME_TYPE = "MimeType"
    val KEY_FILE_DESKTOP_KEY_NAME = "Name"
    val KEY_FILE_DESKTOP_KEY_NOT_SHOW_IN = "NotShowIn"
    val KEY_FILE_DESKTOP_KEY_NO_DISPLAY = "NoDisplay"
    val KEY_FILE_DESKTOP_KEY_ONLY_SHOW_IN = "OnlyShowIn"
    val KEY_FILE_DESKTOP_KEY_PATH = "Path"
    val KEY_FILE_DESKTOP_KEY_STARTUP_NOTIFY = "StartupNotify"
    val KEY_FILE_DESKTOP_KEY_STARTUP_WM_CLASS = "StartupWMClass"
    val KEY_FILE_DESKTOP_KEY_TERMINAL = "Terminal"
    val KEY_FILE_DESKTOP_KEY_TRY_EXEC = "TryExec"
    val KEY_FILE_DESKTOP_KEY_TYPE = "Type"
    val KEY_FILE_DESKTOP_KEY_URL = "URL"
    val KEY_FILE_DESKTOP_KEY_VERSION = "Version"
    val KEY_FILE_DESKTOP_TYPE_APPLICATION = "Application"
    val KEY_FILE_DESKTOP_TYPE_DIRECTORY = "Directory"
    val KEY_FILE_DESKTOP_TYPE_LINK = "Link"
    val LOG_LEVEL_USER_SHIFT = 8
    val MAJOR_VERSION = 2
    val MICRO_VERSION = 90
    val MINOR_VERSION = 29
    val PRIORITY_DEFAULT = 0
    val PRIORITY_DEFAULT_IDLE = 200
    val PRIORITY_HIGH = ~100
    val PRIORITY_HIGH_IDLE = 100
    val PRIORITY_LOW = 300
    val URI_RESERVED_CHARS_GENERIC_DELIMITERS = ":/?#[]@"
    val URI_RESERVED_CHARS_SUBCOMPONENT_DELIMITERS = "!$&'()*+,;="
    fun checkVersion requiredMajor requiredMinor requiredMicro =
      (
        FFI.UInt.C.withVal
         &&&> FFI.UInt.C.withVal
         &&&> FFI.UInt.C.withVal
         ---> Utf8.C.fromPtr false
      )
        checkVersion_
        (
          requiredMajor
           & requiredMinor
           & requiredMicro
        )
    fun childWatchAdd priority pid function =
      (
        FFI.Int.C.withVal
         &&&> GLibPid.C.withVal
         &&&> GLibChildWatchFunc.C.withCallback
         ---> FFI.UInt.C.fromVal
      )
        childWatchAdd_
        (
          priority
           & pid
           & function
        )
    fun childWatchSourceNew pid function = (GLibPid.C.withVal &&&> GLibChildWatchFunc.C.withCallback ---> GLibSourceRecord.C.fromPtr true) childWatchSourceNew_ (pid & function)
    fun filenameFromUri uri hostname =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> Utf8.C.fromPtr true
      )
        filenameFromUri_
        (
          uri
           & hostname
           & []
        )
    fun filenameToUri filename hostname =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> Utf8.C.fromPtr true
      )
        filenameToUri_
        (
          filename
           & hostname
           & []
        )
    fun idleAdd priority function = (FFI.Int.C.withVal &&&> GLibSourceFunc.C.withCallback ---> FFI.UInt.C.fromVal) idleAdd_ (priority & function)
    fun ioAddWatch channel priority condition func =
      (
        GLibIOChannelRecord.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> GLibIOCondition.C.withVal
         &&&> GLibIOFunc.C.withCallback
         ---> FFI.UInt.C.fromVal
      )
        ioAddWatch_
        (
          channel
           & priority
           & condition
           & func
        )
    fun ioCreateWatch channel condition = (GLibIOChannelRecord.C.withPtr &&&> GLibIOCondition.C.withVal ---> GLibSourceRecord.C.fromPtr true) ioCreateWatch_ (channel & condition)
    fun logDefaultHandler logDomain logLevel message =
      (
        Utf8.C.withPtr
         &&&> GLibLogLevelFlags.C.withVal
         &&&> Utf8.C.withPtr
         ---> I
      )
        logDefaultHandler_
        (
          logDomain
           & logLevel
           & message
        )
    fun logRemoveHandler logDomain handlerId = (Utf8.C.withPtr &&&> FFI.UInt.C.withVal ---> I) logRemoveHandler_ (logDomain & handlerId)
    fun logSetAlwaysFatal fatalMask = (GLibLogLevelFlags.C.withVal ---> GLibLogLevelFlags.C.fromVal) logSetAlwaysFatal_ fatalMask
    fun logSetFatalMask logDomain fatalMask = (Utf8.C.withPtr &&&> GLibLogLevelFlags.C.withVal ---> GLibLogLevelFlags.C.fromVal) logSetFatalMask_ (logDomain & fatalMask)
    fun mainContextDefault () = (I ---> GLibMainContextRecord.C.fromPtr false) mainContextDefault_ ()
    fun mainContextGetThreadDefault () = (I ---> GLibMainContextRecord.C.fromPtr false) mainContextGetThreadDefault_ ()
    fun mainCurrentSource () = (I ---> GLibSourceRecord.C.fromPtr false) mainCurrentSource_ ()
    fun mainDepth () = (I ---> FFI.Int.C.fromVal) mainDepth_ ()
    fun regexMatchSimple pattern string compileOptions matchOptions =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibRegexCompileFlags.C.withVal
         &&&> GLibRegexMatchFlags.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        regexMatchSimple_
        (
          pattern
           & string
           & compileOptions
           & matchOptions
        )
    fun shellParseArgv commandLine =
      let
        val argvp & _ =
          (
            Utf8.C.withPtr
             &&&> FFI.OptPointer.C.withVal
             &&&> Utf8CVector.C.withRefOptPtr
             &&&> GLibErrorRecord.handleError
             ---> Utf8CVector.C.fromPtr true && I
          )
            shellParseArgv_
            (
              commandLine
               & FFI.OptPointer.null
               & NONE
               & [GLibShellError.handler]
            )
      in
        argvp
      end
    fun shellQuote unquotedString = (Utf8.C.withPtr ---> Utf8.C.fromPtr true) shellQuote_ unquotedString
    fun shellUnquote quotedString = (Utf8.C.withPtr &&&> GLibErrorRecord.handleError ---> Utf8.C.fromPtr true) shellUnquote_ (quotedString & [])
    fun sourceRemove tag = (FFI.UInt.C.withVal ---> FFI.Bool.C.fromVal) sourceRemove_ tag
    fun spawnAsyncWithPipes workingDirectory argv envp flags childSetup =
      let
        val
          childPid
           & standardInput
           & standardOutput
           & standardError
           & _ =
          (
            Utf8.C.withOptPtr
             &&&> Utf8CVector.C.withPtr
             &&&> Utf8CVector.C.withOptPtr
             &&&> GLibSpawnFlags.C.withVal
             &&&> GLibSpawnChildSetupFunc.C.withOptCallback
             &&&> GLibPid.C.withRefVal
             &&&> FileDesc.C.withRefVal
             &&&> FileDesc.C.withRefVal
             &&&> FileDesc.C.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GLibPid.C.fromVal
                   && FileDesc.C.fromVal
                   && FileDesc.C.fromVal
                   && FileDesc.C.fromVal
                   && I
          )
            spawnAsyncWithPipes_
            (
              workingDirectory
               & argv
               & envp
               & flags
               & childSetup
               & GLibPid.null
               & FileDesc.null
               & FileDesc.null
               & FileDesc.null
               & [GLibSpawnError.handler]
            )
      in
        (childPid, standardInput, standardOutput, standardError)
      end
    fun spawnClosePid pid = (GLibPid.C.withVal ---> I) spawnClosePid_ pid
    fun spawnCommandLineAsync commandLine = (Utf8.C.withPtr &&&> GLibErrorRecord.handleError ---> FFI.Bool.C.fromVal) spawnCommandLineAsync_ (commandLine & [])
    fun timeoutAdd priority interval function =
      (
        FFI.Int.C.withVal
         &&&> FFI.UInt.C.withVal
         &&&> GLibSourceFunc.C.withCallback
         ---> FFI.UInt.C.fromVal
      )
        timeoutAdd_
        (
          priority
           & interval
           & function
        )
    fun timeoutAddSeconds priority interval function =
      (
        FFI.Int.C.withVal
         &&&> FFI.UInt.C.withVal
         &&&> GLibSourceFunc.C.withCallback
         ---> FFI.UInt.C.fromVal
      )
        timeoutAddSeconds_
        (
          priority
           & interval
           & function
        )
    fun uriEscapeString unescaped reservedCharsAllowed allowUtf8 =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Bool.C.withVal
         ---> Utf8.C.fromPtr true
      )
        uriEscapeString_
        (
          unescaped
           & reservedCharsAllowed
           & allowUtf8
        )
    fun uriParseScheme uri = (Utf8.C.withPtr ---> Utf8.C.fromPtr true) uriParseScheme_ uri
    fun uriUnescapeSegment escapedString escapedStringEnd illegalCharacters =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         ---> Utf8.C.fromPtr true
      )
        uriUnescapeSegment_
        (
          escapedString
           & escapedStringEnd
           & illegalCharacters
        )
    fun uriUnescapeString escapedString illegalCharacters = (Utf8.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr true) uriUnescapeString_ (escapedString & illegalCharacters)
  end
