signature G_LIB =
  sig
    structure SourceFunc : G_LIB_SOURCE_FUNC
    structure SpawnChildSetupFunc : G_LIB_SPAWN_CHILD_SETUP_FUNC
    structure DateDay : G_LIB_DATE_DAY
    structure DateYear : G_LIB_DATE_YEAR
    structure Pid : G_LIB_PID
    structure Quark : G_LIB_QUARK
    structure Time : G_LIB_TIME
    structure TimeSpan : G_LIB_TIME_SPAN
    structure AsciiType : G_LIB_ASCII_TYPE
    structure ChecksumType : G_LIB_CHECKSUM_TYPE
    structure DateDMY : G_LIB_DATE_D_M_Y
    structure DateMonth : G_LIB_DATE_MONTH
    structure DateWeekday : G_LIB_DATE_WEEKDAY
    structure ErrorType : G_LIB_ERROR_TYPE
    structure FileTest : G_LIB_FILE_TEST
    structure FormatSizeFlags : G_LIB_FORMAT_SIZE_FLAGS
    structure HookFlagMask : G_LIB_HOOK_FLAG_MASK
    structure IOChannelRecord : G_LIB_I_O_CHANNEL_RECORD
    structure IOCondition : G_LIB_I_O_CONDITION
    structure IOError : G_LIB_I_O_ERROR
    structure IOFlags : G_LIB_I_O_FLAGS
    structure IOStatus : G_LIB_I_O_STATUS
    structure KeyFileRecord : G_LIB_KEY_FILE_RECORD
    structure KeyFileFlags : G_LIB_KEY_FILE_FLAGS
    structure LogLevelFlags : G_LIB_LOG_LEVEL_FLAGS
    structure MainContextRecord : G_LIB_MAIN_CONTEXT_RECORD
    structure MarkupCollectType : G_LIB_MARKUP_COLLECT_TYPE
    structure MarkupParseFlags : G_LIB_MARKUP_PARSE_FLAGS
    structure MatchInfoRecord : G_LIB_MATCH_INFO_RECORD
    structure NormalizeMode : G_LIB_NORMALIZE_MODE
    structure OnceStatus : G_LIB_ONCE_STATUS
    structure OptionArg : G_LIB_OPTION_ARG
    structure OptionFlags : G_LIB_OPTION_FLAGS
    structure RegexRecord : G_LIB_REGEX_RECORD
    structure RegexCompileFlags : G_LIB_REGEX_COMPILE_FLAGS
    structure RegexMatchFlags : G_LIB_REGEX_MATCH_FLAGS
    structure SeekType : G_LIB_SEEK_TYPE
    structure SliceConfig : G_LIB_SLICE_CONFIG
    structure SourceRecord : G_LIB_SOURCE_RECORD
    structure SpawnFlags : G_LIB_SPAWN_FLAGS
    structure TestLogType : G_LIB_TEST_LOG_TYPE
    structure TestTrapFlags : G_LIB_TEST_TRAP_FLAGS
    structure ThreadPriority : G_LIB_THREAD_PRIORITY
    structure TimeType : G_LIB_TIME_TYPE
    structure TimeValRecord : G_LIB_TIME_VAL_RECORD
    structure TokenType : G_LIB_TOKEN_TYPE
    structure TraverseFlags : G_LIB_TRAVERSE_FLAGS
    structure TraverseType : G_LIB_TRAVERSE_TYPE
    structure UnicodeBreakType : G_LIB_UNICODE_BREAK_TYPE
    structure UnicodeScript : G_LIB_UNICODE_SCRIPT
    structure UnicodeType : G_LIB_UNICODE_TYPE
    structure UserDirectory : G_LIB_USER_DIRECTORY
    structure VariantClass : G_LIB_VARIANT_CLASS
    structure VariantParseError : G_LIB_VARIANT_PARSE_ERROR
    structure ChildWatchFunc :
      G_LIB_CHILD_WATCH_FUNC
        where type pid_t = Pid.t
    structure IOFunc :
      G_LIB_I_O_FUNC
        where type i_o_channel_t = IOChannelRecord.t
        where type i_o_condition_t = IOCondition.t
    structure ErrorRecord : G_LIB_ERROR_RECORD
    structure KeyFile :
      G_LIB_KEY_FILE
        where type t = KeyFileRecord.t
        where type key_file_flags_t = KeyFileFlags.t
    structure MatchInfo :
      G_LIB_MATCH_INFO
        where type t = MatchInfoRecord.t
        where type regex_t = RegexRecord.t
    structure Regex :
      G_LIB_REGEX
        where type t = RegexRecord.t
        where type match_info_t = MatchInfoRecord.t
        where type regex_match_flags_t = RegexMatchFlags.t
        where type regex_compile_flags_t = RegexCompileFlags.t
    structure Source :
      G_LIB_SOURCE
        where type t = SourceRecord.t
        where type main_context_t = MainContextRecord.t
    structure TimeVal :
      G_LIB_TIME_VAL
        where type t = TimeValRecord.t
    structure BookmarkFileError :
      G_LIB_BOOKMARK_FILE_ERROR
        where type error_handler = ErrorRecord.handler
    exception BookmarkFileError of BookmarkFileError.t
    structure ConvertError :
      G_LIB_CONVERT_ERROR
        where type error_handler = ErrorRecord.handler
    exception ConvertError of ConvertError.t
    structure Error :
      G_LIB_ERROR
        where type t = ErrorRecord.t
        where type quark_t = Quark.t
    structure FileError :
      G_LIB_FILE_ERROR
        where type error_handler = ErrorRecord.handler
    exception FileError of FileError.t
    structure IOChannelError :
      G_LIB_I_O_CHANNEL_ERROR
        where type error_handler = ErrorRecord.handler
    exception IOChannelError of IOChannelError.t
    structure KeyFileError :
      G_LIB_KEY_FILE_ERROR
        where type error_handler = ErrorRecord.handler
    exception KeyFileError of KeyFileError.t
    structure MarkupError :
      G_LIB_MARKUP_ERROR
        where type error_handler = ErrorRecord.handler
    exception MarkupError of MarkupError.t
    structure OptionError :
      G_LIB_OPTION_ERROR
        where type error_handler = ErrorRecord.handler
    exception OptionError of OptionError.t
    structure RegexError :
      G_LIB_REGEX_ERROR
        where type error_handler = ErrorRecord.handler
    exception RegexError of RegexError.t
    structure ShellError :
      G_LIB_SHELL_ERROR
        where type error_handler = ErrorRecord.handler
    exception ShellError of ShellError.t
    structure SpawnError :
      G_LIB_SPAWN_ERROR
        where type error_handler = ErrorRecord.handler
    exception SpawnError of SpawnError.t
    structure ThreadError :
      G_LIB_THREAD_ERROR
        where type error_handler = ErrorRecord.handler
    exception ThreadError of ThreadError.t
    structure IOChannel :
      G_LIB_I_O_CHANNEL
        where type t = IOChannelRecord.t
        where type i_o_condition_t = IOCondition.t
        where type i_o_error_t = IOError.t
        where type seek_type_t = SeekType.t
        where type i_o_flags_t = IOFlags.t
        where type i_o_status_t = IOStatus.t
        where type i_o_channel_error_t = IOChannelError.t
    val ALLOCATOR_LIST : LargeInt.int
    val ALLOCATOR_NODE : LargeInt.int
    val ALLOCATOR_SLIST : LargeInt.int
    val ALLOC_AND_FREE : LargeInt.int
    val ALLOC_ONLY : LargeInt.int
    val ASCII_DTOSTR_BUF_SIZE : LargeInt.int
    val ATOMIC_OP_USE_GCC_BUILTINS : LargeInt.int
    val BIG_ENDIAN : LargeInt.int
    val CAN_INLINE : LargeInt.int
    val CSET_A_2_Z : string
    val CSET_DIGITS : string
    val CSET_a_2_z : string
    val DATALIST_FLAGS_MASK : LargeInt.int
    val DATE_BAD_DAY : LargeInt.int
    val DATE_BAD_JULIAN : LargeInt.int
    val DATE_BAD_YEAR : LargeInt.int
    val DIR_SEPARATOR : LargeInt.int
    val DIR_SEPARATOR_S : string
    val E : real
    val GINT16_FORMAT : string
    val GINT16_MODIFIER : string
    val GINT32_FORMAT : string
    val GINT32_MODIFIER : string
    val GINT64_FORMAT : string
    val GINT64_MODIFIER : string
    val GINTPTR_FORMAT : string
    val GINTPTR_MODIFIER : string
    val GNUC_FUNCTION : string
    val GNUC_PRETTY_FUNCTION : string
    val GSIZE_FORMAT : string
    val GSIZE_MODIFIER : string
    val GSSIZE_FORMAT : string
    val GUINT16_FORMAT : string
    val GUINT32_FORMAT : string
    val GUINT64_FORMAT : string
    val GUINTPTR_FORMAT : string
    val HAVE_GINT64 : LargeInt.int
    val HAVE_GNUC_VARARGS : LargeInt.int
    val HAVE_GNUC_VISIBILITY : LargeInt.int
    val HAVE_GROWING_STACK : LargeInt.int
    val HAVE_INLINE : LargeInt.int
    val HAVE_ISO_VARARGS : LargeInt.int
    val HAVE___INLINE : LargeInt.int
    val HAVE___INLINE__ : LargeInt.int
    val HOOK_FLAG_USER_SHIFT : LargeInt.int
    val IEEE754_DOUBLE_BIAS : LargeInt.int
    val IEEE754_FLOAT_BIAS : LargeInt.int
    val KEY_FILE_DESKTOP_GROUP : string
    val KEY_FILE_DESKTOP_KEY_CATEGORIES : string
    val KEY_FILE_DESKTOP_KEY_COMMENT : string
    val KEY_FILE_DESKTOP_KEY_EXEC : string
    val KEY_FILE_DESKTOP_KEY_GENERIC_NAME : string
    val KEY_FILE_DESKTOP_KEY_HIDDEN : string
    val KEY_FILE_DESKTOP_KEY_ICON : string
    val KEY_FILE_DESKTOP_KEY_MIME_TYPE : string
    val KEY_FILE_DESKTOP_KEY_NAME : string
    val KEY_FILE_DESKTOP_KEY_NOT_SHOW_IN : string
    val KEY_FILE_DESKTOP_KEY_NO_DISPLAY : string
    val KEY_FILE_DESKTOP_KEY_ONLY_SHOW_IN : string
    val KEY_FILE_DESKTOP_KEY_PATH : string
    val KEY_FILE_DESKTOP_KEY_STARTUP_NOTIFY : string
    val KEY_FILE_DESKTOP_KEY_STARTUP_WM_CLASS : string
    val KEY_FILE_DESKTOP_KEY_TERMINAL : string
    val KEY_FILE_DESKTOP_KEY_TRY_EXEC : string
    val KEY_FILE_DESKTOP_KEY_TYPE : string
    val KEY_FILE_DESKTOP_KEY_URL : string
    val KEY_FILE_DESKTOP_KEY_VERSION : string
    val KEY_FILE_DESKTOP_TYPE_APPLICATION : string
    val KEY_FILE_DESKTOP_TYPE_DIRECTORY : string
    val KEY_FILE_DESKTOP_TYPE_LINK : string
    val LITTLE_ENDIAN : LargeInt.int
    val LN10 : real
    val LN2 : real
    val LOG_2_BASE_10 : real
    val LOG_FATAL_MASK : LargeInt.int
    val LOG_LEVEL_USER_SHIFT : LargeInt.int
    val MAJOR_VERSION : LargeInt.int
    val MICRO_VERSION : LargeInt.int
    val MINOR_VERSION : LargeInt.int
    val MODULE_SUFFIX : string
    val MUTEX_DEBUG_MAGIC : LargeInt.int
    val OPTION_REMAINING : string
    val PDP_ENDIAN : LargeInt.int
    val PI : real
    val PI_2 : real
    val PI_4 : real
    val POLLFD_FORMAT : string
    val PRIORITY_DEFAULT : LargeInt.int
    val PRIORITY_DEFAULT_IDLE : LargeInt.int
    val PRIORITY_HIGH : LargeInt.int
    val PRIORITY_HIGH_IDLE : LargeInt.int
    val PRIORITY_LOW : LargeInt.int
    val SEARCHPATH_SEPARATOR : LargeInt.int
    val SEARCHPATH_SEPARATOR_S : string
    val SIZEOF_LONG : LargeInt.int
    val SIZEOF_SIZE_T : LargeInt.int
    val SIZEOF_VOID_P : LargeInt.int
    val SQRT2 : real
    val STR_DELIMITERS : string
    val SYSDEF_AF_INET : LargeInt.int
    val SYSDEF_AF_INET6 : LargeInt.int
    val SYSDEF_AF_UNIX : LargeInt.int
    val SYSDEF_MSG_DONTROUTE : LargeInt.int
    val SYSDEF_MSG_OOB : LargeInt.int
    val SYSDEF_MSG_PEEK : LargeInt.int
    val URI_RESERVED_CHARS_GENERIC_DELIMITERS : string
    val URI_RESERVED_CHARS_SUBCOMPONENT_DELIMITERS : string
    val USEC_PER_SEC : LargeInt.int
    val VA_COPY_AS_ARRAY : LargeInt.int
    val WIN32_MSG_HANDLE : LargeInt.int
    val access :
      string
       -> LargeInt.int
       -> LargeInt.int
    val asciiDigitValue : char -> LargeInt.int
    val asciiDtostr :
      string
       -> LargeInt.int
       -> real
       -> string
    val asciiFormatd :
      string
       -> LargeInt.int
       -> string
       -> real
       -> string
    val asciiStrcasecmp :
      string
       -> string
       -> LargeInt.int
    val asciiStrdown :
      string
       -> LargeInt.int
       -> string
    val asciiStrncasecmp :
      string
       -> string
       -> LargeInt.int
       -> LargeInt.int
    val asciiStrtod :
      string
       -> string
       -> real
    val asciiStrtoll :
      string
       -> string
       -> LargeInt.int
       -> LargeInt.int
    val asciiStrtoull :
      string
       -> string
       -> LargeInt.int
       -> LargeInt.int
    val asciiStrup :
      string
       -> LargeInt.int
       -> string
    val asciiTolower : char -> char
    val asciiToupper : char -> char
    val asciiXdigitValue : char -> LargeInt.int
    val assertWarning :
      string
       -> string
       -> LargeInt.int
       -> string
       -> string
       -> unit
    val assertionMessage :
      string
       -> string
       -> LargeInt.int
       -> string
       -> string
       -> unit
    val assertionMessageCmpstr :
      string
       -> string
       -> LargeInt.int
       -> string
       -> string
       -> string
       -> string
       -> string
       -> unit
    val assertionMessageExpr :
      string
       -> string
       -> LargeInt.int
       -> string
       -> string
       -> unit
    val base64Decode : string -> Word8Vector.vector
    val base64Encode : Word8Vector.vector -> string
    val basename : string -> string
    val bitNthLsf :
      LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
    val bitNthMsf :
      LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
    val bitStorage : LargeInt.int -> LargeInt.int
    val blowChunks : unit -> unit
    val bookmarkFileErrorQuark : unit -> Quark.t
    val buildFilenamev : string list -> string
    val buildPathv :
      string
       -> string list
       -> string
    val chdir : string -> LargeInt.int
    val checkVersion :
      LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> string
    val checksumTypeGetLength : ChecksumType.t -> LargeInt.int
    val childWatchSourceNew : Pid.t -> SourceRecord.t
    val clearError : unit -> unit
    val computeChecksumForString :
      ChecksumType.t
       -> string
       -> LargeInt.int
       -> string
    val computeHmacForString :
      ChecksumType.t
       -> Word8Vector.vector
       -> string
       -> LargeInt.int
       -> string
    val convert :
      string
       -> LargeInt.int
       -> string
       -> string
       -> string
           * LargeInt.int
           * LargeInt.int
    val convertErrorQuark : unit -> Quark.t
    val datalistClear : DataRecord.t -> unit
    val datalistGetFlags : DataRecord.t -> LargeInt.int
    val datalistInit : DataRecord.t -> unit
    val datalistSetFlags :
      DataRecord.t
       -> LargeInt.int
       -> unit
    val datalistUnsetFlags :
      DataRecord.t
       -> LargeInt.int
       -> unit
    val dateGetDaysInMonth :
      DateMonth.t
       -> DateYear.t
       -> Word8.word
    val dateGetMondayWeeksInYear : DateYear.t -> Word8.word
    val dateGetSundayWeeksInYear : DateYear.t -> Word8.word
    val dateIsLeapYear : DateYear.t -> bool
    val dateStrftime :
      string
       -> LargeInt.int
       -> string
       -> DateRecord.t
       -> LargeInt.int
    val dateValidDay : DateDay.t -> bool
    val dateValidDmy :
      DateDay.t
       -> DateMonth.t
       -> DateYear.t
       -> bool
    val dateValidJulian : LargeInt.int -> bool
    val dateValidMonth : DateMonth.t -> bool
    val dateValidWeekday : DateWeekday.t -> bool
    val dateValidYear : DateYear.t -> bool
    val dcgettext :
      string option
       -> string
       -> LargeInt.int
       -> string
    val dgettext :
      string
       -> string
       -> string
    val dirMakeTmp : string option -> string
    val dngettext :
      string
       -> string
       -> string
       -> LargeInt.int
       -> string
    val dpgettext :
      string
       -> string
       -> LargeInt.int
       -> string
    val dpgettext2 :
      string
       -> string
       -> string
       -> string
    val dummyDecl : unit -> unit
    val fileErrorFromErrno : LargeInt.int -> FileError.t
    val fileErrorQuark : unit -> Quark.t
    val fileOpenTmp : string option -> LargeInt.int * string
    val fileReadLink : string -> string
    val fileSetContents :
      string
       -> Word8Vector.vector
       -> bool
    val fileTest :
      string
       -> FileTest.t
       -> bool
    val filenameDisplayBasename : string -> string
    val filenameDisplayName : string -> string
    val filenameFromUri :
      string
       -> string
       -> string
    val filenameToUri :
      string
       -> string option
       -> string
    val findProgramInPath : string -> string
    val formatSize : LargeInt.int -> string
    val formatSizeForDisplay : LargeInt.int -> string
    val formatSizeFull :
      LargeInt.int
       -> FormatSizeFlags.t
       -> string
    val getApplicationName : unit -> string
    val getCharset : string -> bool
    val getCurrentDir : unit -> string
    val getCurrentTime : TimeValRecord.t -> unit
    val getEnviron : unit -> string list
    val getFilenameCharsets : string -> bool
    val getHomeDir : unit -> string
    val getHostName : unit -> string
    val getLanguageNames : unit -> string list
    val getLocaleVariants : string -> string list
    val getMonotonicTime : unit -> LargeInt.int
    val getPrgname : unit -> string
    val getRealName : unit -> string
    val getRealTime : unit -> LargeInt.int
    val getSystemConfigDirs : unit -> string list
    val getSystemDataDirs : unit -> string list
    val getTmpDir : unit -> string
    val getUserCacheDir : unit -> string
    val getUserConfigDir : unit -> string
    val getUserDataDir : unit -> string
    val getUserName : unit -> string
    val getUserRuntimeDir : unit -> string
    val getUserSpecialDir : UserDirectory.t -> string
    val getenv : string -> string
    val hookDestroy :
      HookListRecord.t
       -> LargeInt.int
       -> bool
    val hookDestroyLink :
      HookListRecord.t
       -> HookRecord.t
       -> unit
    val hookFree :
      HookListRecord.t
       -> HookRecord.t
       -> unit
    val hookInsertBefore :
      HookListRecord.t
       -> HookRecord.t
       -> HookRecord.t
       -> unit
    val hookPrepend :
      HookListRecord.t
       -> HookRecord.t
       -> unit
    val hookUnref :
      HookListRecord.t
       -> HookRecord.t
       -> unit
    val hostnameIsAsciiEncoded : string -> bool
    val hostnameIsIpAddress : string -> bool
    val hostnameIsNonAscii : string -> bool
    val hostnameToAscii : string -> string
    val hostnameToUnicode : string -> string
    val idleSourceNew : unit -> SourceRecord.t
    val internStaticString : string option -> string
    val internString : string option -> string
    val ioChannelErrorFromErrno : LargeInt.int -> IOChannelError.t
    val ioChannelErrorQuark : unit -> Quark.t
    val ioCreateWatch :
      IOChannelRecord.t
       -> IOCondition.t
       -> SourceRecord.t
    val keyFileErrorQuark : unit -> Quark.t
    val listPopAllocator : unit -> unit
    val listenv : unit -> string list
    val logRemoveHandler :
      string
       -> LargeInt.int
       -> unit
    val logSetAlwaysFatal : LogLevelFlags.t -> LogLevelFlags.t
    val logSetFatalMask :
      string
       -> LogLevelFlags.t
       -> LogLevelFlags.t
    val mainContextDefault : unit -> MainContextRecord.t
    val mainContextGetThreadDefault : unit -> MainContextRecord.t
    val mainCurrentSource : unit -> SourceRecord.t
    val mainDepth : unit -> LargeInt.int
    val markupErrorQuark : unit -> Quark.t
    val markupEscapeText :
      string
       -> LargeInt.int
       -> string
    val memChunkInfo : unit -> unit
    val memIsSystemMalloc : unit -> bool
    val memProfile : unit -> unit
    val memSetVtable : MemVTableRecord.t -> unit
    val mkdirWithParents :
      string
       -> LargeInt.int
       -> LargeInt.int
    val mkdtemp : string -> string
    val mkdtempFull :
      string
       -> LargeInt.int
       -> string
    val mkstemp : string -> LargeInt.int
    val mkstempFull :
      string
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
    val nodePopAllocator : unit -> unit
    val onErrorQuery : string -> unit
    val onErrorStackTrace : string -> unit
    val optionErrorQuark : unit -> Quark.t
    val pathGetBasename : string -> string
    val pathGetDirname : string -> string
    val pathIsAbsolute : string -> bool
    val pathSkipRoot : string -> string
    val patternMatch :
      PatternSpecRecord.t
       -> LargeInt.int
       -> string
       -> string
       -> bool
    val patternMatchSimple :
      string
       -> string
       -> bool
    val patternMatchString :
      PatternSpecRecord.t
       -> string
       -> bool
    val poll :
      PollFDRecord.t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
    val quarkFromStaticString : string option -> Quark.t
    val quarkFromString : string option -> Quark.t
    val quarkToString : Quark.t -> string
    val quarkTryString : string option -> Quark.t
    val randomDouble : unit -> real
    val randomDoubleRange :
      real
       -> real
       -> real
    val randomInt : unit -> LargeInt.int
    val randomIntRange :
      LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
    val randomSetSeed : LargeInt.int -> unit
    val regexCheckReplacement : string -> bool option
    val regexErrorQuark : unit -> Quark.t
    val regexEscapeNul :
      string
       -> LargeInt.int
       -> string
    val regexMatchSimple :
      string
       -> string
       -> RegexCompileFlags.t
       -> RegexMatchFlags.t
       -> bool
    val reloadUserSpecialDirsCache : unit -> unit
    val returnIfFailWarning :
      string
       -> string
       -> string
       -> unit
    val rmdir : string -> LargeInt.int
    val sequenceMove :
      SequenceIterRecord.t
       -> SequenceIterRecord.t
       -> unit
    val sequenceMoveRange :
      SequenceIterRecord.t
       -> SequenceIterRecord.t
       -> SequenceIterRecord.t
       -> unit
    val sequenceRemove : SequenceIterRecord.t -> unit
    val sequenceRemoveRange :
      SequenceIterRecord.t
       -> SequenceIterRecord.t
       -> unit
    val sequenceSwap :
      SequenceIterRecord.t
       -> SequenceIterRecord.t
       -> unit
    val setApplicationName : string -> unit
    val setPrgname : string -> unit
    val setenv :
      string
       -> string
       -> bool
       -> bool
    val shellErrorQuark : unit -> Quark.t
    val shellParseArgv : string -> string list option
    val shellQuote : string -> string
    val shellUnquote : string -> string
    val sliceGetConfig : SliceConfig.t -> LargeInt.int
    val sliceSetConfig :
      SliceConfig.t
       -> LargeInt.int
       -> unit
    val sourceRemove : LargeInt.int -> bool
    val sourceSetNameById :
      LargeInt.int
       -> string
       -> unit
    val spacedPrimesClosest : LargeInt.int -> LargeInt.int
    val spawnClosePid : Pid.t -> unit
    val spawnCommandLineAsync : string -> bool
    val spawnErrorQuark : unit -> Quark.t
    val stpcpy :
      string
       -> string
       -> string
    val strHasPrefix :
      string
       -> string
       -> bool
    val strHasSuffix :
      string
       -> string
       -> bool
    val strcanon :
      string
       -> string
       -> char
       -> string
    val strcasecmp :
      string
       -> string
       -> LargeInt.int
    val strchomp : string -> string
    val strchug : string -> string
    val strcmp0 :
      string
       -> string
       -> LargeInt.int
    val strcompress : string -> string
    val strdelimit :
      string
       -> string
       -> char
       -> string
    val strdown : string -> string
    val strdup : string -> string
    val strerror : LargeInt.int -> string
    val strescape :
      string
       -> string
       -> string
    val strfreev : string -> unit
    val stringNew : string -> StringRecord.t
    val stringNewLen :
      string
       -> LargeInt.int
       -> StringRecord.t
    val stringSizedNew : LargeInt.int -> StringRecord.t
    val stripContext :
      string
       -> string
       -> string
    val strjoinv :
      string
       -> string
       -> string
    val strlcat :
      string
       -> string
       -> LargeInt.int
       -> LargeInt.int
    val strlcpy :
      string
       -> string
       -> LargeInt.int
       -> LargeInt.int
    val strncasecmp :
      string
       -> string
       -> LargeInt.int
       -> LargeInt.int
    val strndup :
      string
       -> LargeInt.int
       -> string
    val strnfill :
      LargeInt.int
       -> char
       -> string
    val strreverse : string -> string
    val strrstr :
      string
       -> string
       -> string
    val strrstrLen :
      string
       -> LargeInt.int
       -> string
       -> string
    val strsignal : LargeInt.int -> string
    val strstrLen :
      string
       -> LargeInt.int
       -> string
       -> string
    val strtod :
      string
       -> string
       -> real
    val strup : string -> string
    val strvLength : string -> LargeInt.int
    val testBug : string -> unit
    val testBugBase : string -> unit
    val testFail : unit -> unit
    val testLogTypeName : TestLogType.t -> string
    val testRandDouble : unit -> real
    val testRandDoubleRange :
      real
       -> real
       -> real
    val testRandInt : unit -> LargeInt.int
    val testRandIntRange :
      LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
    val testRun : unit -> LargeInt.int
    val testRunSuite : TestSuiteRecord.t -> LargeInt.int
    val testTimerElapsed : unit -> real
    val testTimerLast : unit -> real
    val testTimerStart : unit -> unit
    val testTrapAssertions :
      string
       -> string
       -> LargeInt.int
       -> string
       -> LargeInt.int
       -> string
       -> unit
    val testTrapFork :
      LargeInt.int
       -> TestTrapFlags.t
       -> bool
    val testTrapHasPassed : unit -> bool
    val testTrapReachedTimeout : unit -> bool
    val threadErrorQuark : unit -> Quark.t
    val threadGetInitialized : unit -> bool
    val threadInit : ThreadFunctionsRecord.t -> unit
    val threadInitWithErrorcheckMutexes : ThreadFunctionsRecord.t -> unit
    val threadPoolGetMaxIdleTime : unit -> LargeInt.int
    val threadPoolGetMaxUnusedThreads : unit -> LargeInt.int
    val threadPoolGetNumUnusedThreads : unit -> LargeInt.int
    val threadPoolSetMaxIdleTime : LargeInt.int -> unit
    val threadPoolSetMaxUnusedThreads : LargeInt.int -> unit
    val threadPoolStopUnusedThreads : unit -> unit
    val timeValFromIso8601 :
      string
       -> TimeValRecord.t
       -> bool
    val timeoutSourceNew : LargeInt.int -> SourceRecord.t
    val timeoutSourceNewSeconds : LargeInt.int -> SourceRecord.t
    val trashStackHeight : TrashStackRecord.t -> LargeInt.int
    val unicharBreakType : char -> UnicodeBreakType.t
    val unicharCombiningClass : char -> LargeInt.int
    val unicharDigitValue : char -> LargeInt.int
    val unicharGetScript : char -> UnicodeScript.t
    val unicharIsalnum : char -> bool
    val unicharIsalpha : char -> bool
    val unicharIscntrl : char -> bool
    val unicharIsdefined : char -> bool
    val unicharIsdigit : char -> bool
    val unicharIsgraph : char -> bool
    val unicharIslower : char -> bool
    val unicharIsmark : char -> bool
    val unicharIsprint : char -> bool
    val unicharIspunct : char -> bool
    val unicharIsspace : char -> bool
    val unicharIstitle : char -> bool
    val unicharIsupper : char -> bool
    val unicharIswide : char -> bool
    val unicharIswideCjk : char -> bool
    val unicharIsxdigit : char -> bool
    val unicharIszerowidth : char -> bool
    val unicharToUtf8 :
      char
       -> string
       -> LargeInt.int
    val unicharTolower : char -> char
    val unicharTotitle : char -> char
    val unicharToupper : char -> char
    val unicharType : char -> UnicodeType.t
    val unicharValidate : char -> bool
    val unicharXdigitValue : char -> LargeInt.int
    val unicodeScriptFromIso15924 : LargeInt.int -> UnicodeScript.t
    val unicodeScriptToIso15924 : UnicodeScript.t -> LargeInt.int
    val unlink : string -> LargeInt.int
    val unsetenv : string -> unit
    val uriEscapeString :
      string
       -> string
       -> bool
       -> string
    val uriParseScheme : string -> string
    val uriUnescapeSegment :
      string
       -> string
       -> string
       -> string
    val uriUnescapeString :
      string
       -> string
       -> string
    val usleep : LargeInt.int -> unit
    val utf8Casefold :
      string
       -> LargeInt.int
       -> string
    val utf8Collate :
      string
       -> string
       -> LargeInt.int
    val utf8CollateKey :
      string
       -> LargeInt.int
       -> string
    val utf8CollateKeyForFilename :
      string
       -> LargeInt.int
       -> string
    val utf8FindNextChar :
      string
       -> string
       -> string
    val utf8FindPrevChar :
      string
       -> string
       -> string
    val utf8GetChar : string -> char
    val utf8GetCharValidated :
      string
       -> LargeInt.int
       -> char
    val utf8Normalize :
      string
       -> LargeInt.int
       -> NormalizeMode.t
       -> string
    val utf8OffsetToPointer :
      string
       -> LargeInt.int
       -> string
    val utf8PointerToOffset :
      string
       -> string
       -> LargeInt.int
    val utf8PrevChar : string -> string
    val utf8Strchr :
      string
       -> LargeInt.int
       -> char
       -> string
    val utf8Strdown :
      string
       -> LargeInt.int
       -> string
    val utf8Strlen :
      string
       -> LargeInt.int
       -> LargeInt.int
    val utf8Strncpy :
      string
       -> string
       -> LargeInt.int
       -> string
    val utf8Strrchr :
      string
       -> LargeInt.int
       -> char
       -> string
    val utf8Strreverse :
      string
       -> LargeInt.int
       -> string
    val utf8Strup :
      string
       -> LargeInt.int
       -> string
    val utf8Substring :
      string
       -> LargeInt.int
       -> LargeInt.int
       -> string
    val utf8Validate :
      string
       -> LargeInt.int
       -> string option
    val variantGetType : VariantRecord.t -> VariantTypeRecord.t
    val variantIsObjectPath : string -> bool
    val variantIsSignature : string -> bool
    val variantParse :
      VariantTypeRecord.t
       -> string
       -> string
       -> string
       -> VariantRecord.t
    val variantParserGetErrorQuark : unit -> Quark.t
    val variantTypeStringIsValid : string -> bool
    val variantTypeStringScan :
      string
       -> string option
       -> string option
    val warnMessage :
      string
       -> string
       -> LargeInt.int
       -> string
       -> string
       -> unit
  end
