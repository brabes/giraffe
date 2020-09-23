use "polyml-types.sml";
use "polyml-gobject.sml";
useExt "GBoolCArrayN.sml";
useExt "GDoubleCArrayN.sml";
useExt "GInt32CArrayN.sml";
useExt "Utf8CPtrArrayN.sml";
useExt "GUInt8CArrayN.sml";
useExt "GUInt8CArray.sml";
useExt "Utf8CPtrArray.sml";
use "G_LIB_QUARK-sig.sml";
use "G_LIB_PID_TYPE-sig.sml";
use "G_LIB_PID-sig.sml";
use "G_LIB_SOURCE_FUNC-sig.sml";
use "G_LIB_CHILD_WATCH_FUNC-sig.sml";
use "G_LIB_SPAWN_CHILD_SETUP_FUNC-sig.sml";
use "G_LIB_I_O_FUNC-sig.sml";
use "G_LIB_BOOKMARK_FILE_ERROR-sig.sml";
use "G_LIB_BYTES_RECORD-sig.sml";
use "G_LIB_BYTES-sig.sml";
use "G_LIB_CHECKSUM_RECORD-sig.sml";
use "G_LIB_CHECKSUM-sig.sml";
use "G_LIB_CHECKSUM_TYPE-sig.sml";
use "G_LIB_CONVERT_ERROR-sig.sml";
use "G_LIB_DATE_RECORD-sig.sml";
use "G_LIB_DATE-sig.sml";
use "G_LIB_DATE_D_M_Y-sig.sml";
use "G_LIB_DATE_MONTH-sig.sml";
use "G_LIB_DATE_TIME_RECORD-sig.sml";
use "G_LIB_DATE_TIME-sig.sml";
use "G_LIB_DATE_WEEKDAY-sig.sml";
use "G_LIB_ERROR_RECORD-sig.sml";
use "G_LIB_ERROR-sig.sml";
use "G_LIB_ERROR_TYPE-sig.sml";
use "G_LIB_FILE_ERROR-sig.sml";
use "G_LIB_FILE_TEST-sig.sml";
use "G_LIB_FORMAT_SIZE_FLAGS-sig.sml";
use "G_LIB_HOOK_FLAG_MASK-sig.sml";
use "G_LIB_I_CONV_RECORD-sig.sml";
use "G_LIB_I_CONV-sig.sml";
use "G_LIB_I_O_CHANNEL_RECORD-sig.sml";
use "G_LIB_I_O_CHANNEL-sig.sml";
use "G_LIB_I_O_CHANNEL_ERROR-sig.sml";
use "G_LIB_I_O_CONDITION-sig.sml";
use "G_LIB_I_O_ERROR-sig.sml";
use "G_LIB_I_O_FLAGS-sig.sml";
use "G_LIB_I_O_STATUS-sig.sml";
use "G_LIB_KEY_FILE_RECORD-sig.sml";
use "G_LIB_KEY_FILE-sig.sml";
use "G_LIB_KEY_FILE_ERROR-sig.sml";
use "G_LIB_KEY_FILE_FLAGS-sig.sml";
use "G_LIB_LOG_LEVEL_FLAGS-sig.sml";
use "G_LIB_LOG_WRITER_OUTPUT-sig.sml";
use "G_LIB_MAIN_CONTEXT_RECORD-sig.sml";
use "G_LIB_MAIN_CONTEXT-sig.sml";
use "G_LIB_MAIN_LOOP_RECORD-sig.sml";
use "G_LIB_MAIN_LOOP-sig.sml";
use "G_LIB_MAPPED_FILE_RECORD-sig.sml";
use "G_LIB_MAPPED_FILE-sig.sml";
use "G_LIB_MARKUP_COLLECT_TYPE-sig.sml";
use "G_LIB_MARKUP_ERROR-sig.sml";
use "G_LIB_MARKUP_PARSE_CONTEXT_RECORD-sig.sml";
use "G_LIB_MARKUP_PARSE_CONTEXT-sig.sml";
use "G_LIB_MARKUP_PARSE_FLAGS-sig.sml";
use "G_LIB_MATCH_INFO_RECORD-sig.sml";
use "G_LIB_MATCH_INFO-sig.sml";
use "G_LIB_NORMALIZE_MODE-sig.sml";
use "G_LIB_ONCE_STATUS-sig.sml";
use "G_LIB_OPTION_ARG-sig.sml";
use "G_LIB_OPTION_ERROR-sig.sml";
use "G_LIB_OPTION_FLAGS-sig.sml";
use "G_LIB_OPTION_GROUP_RECORD-sig.sml";
use "G_LIB_OPTION_GROUP-sig.sml";
use "G_LIB_REGEX_RECORD-sig.sml";
use "G_LIB_REGEX-sig.sml";
use "G_LIB_REGEX_COMPILE_FLAGS-sig.sml";
use "G_LIB_REGEX_ERROR-sig.sml";
use "G_LIB_REGEX_MATCH_FLAGS-sig.sml";
use "G_LIB_SEEK_TYPE-sig.sml";
use "G_LIB_SHELL_ERROR-sig.sml";
use "G_LIB_SLICE_CONFIG-sig.sml";
use "G_LIB_SOURCE_RECORD-sig.sml";
use "G_LIB_SOURCE-sig.sml";
use "G_LIB_SPAWN_ERROR-sig.sml";
use "G_LIB_SPAWN_FLAGS-sig.sml";
use "G_LIB_STRING_RECORD-sig.sml";
use "G_LIB_STRING-sig.sml";
use "G_LIB_TEST_CONFIG_RECORD-sig.sml";
use "G_LIB_TEST_CONFIG-sig.sml";
use "G_LIB_TEST_FILE_TYPE-sig.sml";
use "G_LIB_TEST_LOG_TYPE-sig.sml";
use "G_LIB_TEST_SUBPROCESS_FLAGS-sig.sml";
use "G_LIB_TEST_TRAP_FLAGS-sig.sml";
use "G_LIB_THREAD_RECORD-sig.sml";
use "G_LIB_THREAD-sig.sml";
use "G_LIB_THREAD_ERROR-sig.sml";
use "G_LIB_TIME_TYPE-sig.sml";
use "G_LIB_TIME_VAL_RECORD-sig.sml";
use "G_LIB_TIME_VAL-sig.sml";
use "G_LIB_TIME_ZONE_RECORD-sig.sml";
use "G_LIB_TIME_ZONE-sig.sml";
use "G_LIB_TOKEN_TYPE-sig.sml";
use "G_LIB_TRAVERSE_FLAGS-sig.sml";
use "G_LIB_TRAVERSE_TYPE-sig.sml";
use "G_LIB_UNICODE_TYPE-sig.sml";
use "G_LIB_USER_DIRECTORY-sig.sml";
use "G_LIB_VARIANT_RECORD-sig.sml";
use "G_LIB_VARIANT-sig.sml";
use "G_LIB_VARIANT_BUILDER_RECORD-sig.sml";
use "G_LIB_VARIANT_BUILDER-sig.sml";
use "G_LIB_VARIANT_CLASS-sig.sml";
use "G_LIB_VARIANT_DICT_RECORD-sig.sml";
use "G_LIB_VARIANT_DICT-sig.sml";
use "G_LIB_VARIANT_PARSE_ERROR-sig.sml";
use "G_LIB_VARIANT_TYPE_RECORD-sig.sml";
use "G_LIB_VARIANT_TYPE-sig.sml";
use "G_LIB-sig.sml";
use "polyml/GLibQuark.sml";
use "polyml/GLibPidType.sml";
use "polyml/GLibSourceFunc.sml";
use "polyml/GLibSpawnChildSetupFunc.sml";
use "polyml/GLibBytesRecord.sml";
use "polyml/GLibChecksumRecord.sml";
use "polyml/GLibChecksumType.sml";
use "polyml/GLibDateRecord.sml";
use "polyml/GLibDateDMY.sml";
use "polyml/GLibDateMonth.sml";
use "polyml/GLibDateTimeRecord.sml";
use "polyml/GLibDateWeekday.sml";
use "polyml/GLibErrorType.sml";
use "polyml/GLibFileTest.sml";
use "polyml/GLibFormatSizeFlags.sml";
use "polyml/GLibHookFlagMask.sml";
use "polyml/GLibIConvRecord.sml";
use "polyml/GLibIOChannelRecord.sml";
use "polyml/GLibIOCondition.sml";
use "polyml/GLibIOError.sml";
use "polyml/GLibIOFlags.sml";
use "polyml/GLibIOStatus.sml";
use "polyml/GLibKeyFileRecord.sml";
use "polyml/GLibKeyFileFlags.sml";
use "polyml/GLibLogLevelFlags.sml";
use "polyml/GLibLogWriterOutput.sml";
use "polyml/GLibMainContextRecord.sml";
use "polyml/GLibMainLoopRecord.sml";
use "polyml/GLibMappedFileRecord.sml";
use "polyml/GLibMarkupCollectType.sml";
use "polyml/GLibMarkupParseContextRecord.sml";
use "polyml/GLibMarkupParseFlags.sml";
use "polyml/GLibMatchInfoRecord.sml";
use "polyml/GLibNormalizeMode.sml";
use "polyml/GLibOnceStatus.sml";
use "polyml/GLibOptionArg.sml";
use "polyml/GLibOptionFlags.sml";
use "polyml/GLibOptionGroupRecord.sml";
use "polyml/GLibRegexRecord.sml";
use "polyml/GLibRegexCompileFlags.sml";
use "polyml/GLibRegexMatchFlags.sml";
use "polyml/GLibSeekType.sml";
use "polyml/GLibSliceConfig.sml";
use "polyml/GLibSourceRecord.sml";
use "polyml/GLibSpawnFlags.sml";
use "polyml/GLibStringRecord.sml";
use "polyml/GLibTestConfigRecord.sml";
use "polyml/GLibTestFileType.sml";
use "polyml/GLibTestLogType.sml";
use "polyml/GLibTestSubprocessFlags.sml";
use "polyml/GLibTestTrapFlags.sml";
use "polyml/GLibThreadRecord.sml";
use "polyml/GLibTimeType.sml";
use "polyml/GLibTimeValRecord.sml";
use "polyml/GLibTimeZoneRecord.sml";
use "polyml/GLibTokenType.sml";
use "polyml/GLibTraverseFlags.sml";
use "polyml/GLibTraverseType.sml";
use "polyml/GLibUnicodeType.sml";
use "polyml/GLibUserDirectory.sml";
use "polyml/GLibVariantRecord.sml";
use "polyml/GLibVariantBuilderRecord.sml";
use "polyml/GLibVariantClass.sml";
use "polyml/GLibVariantDictRecord.sml";
use "polyml/GLibVariantTypeRecord.sml";
use "polyml/GLibPid.sml";
use "polyml/GLibIOFunc.sml";
use "polyml/GLibBytes.sml";
use "polyml/GLibChecksum.sml";
use "polyml/GLibDate.sml";
use "polyml/GLibDateTime.sml";
use "polyml/GLibErrorRecord.sml";
use "polyml/GLibIConv.sml";
use "polyml/GLibKeyFile.sml";
use "polyml/GLibMainContext.sml";
use "polyml/GLibMainLoop.sml";
use "polyml/GLibMappedFile.sml";
use "polyml/GLibMarkupParseContext.sml";
use "polyml/GLibMatchInfo.sml";
use "polyml/GLibOptionGroup.sml";
use "polyml/GLibRegex.sml";
use "polyml/GLibSource.sml";
use "polyml/GLibString.sml";
use "polyml/GLibTestConfig.sml";
use "polyml/GLibThread.sml";
use "polyml/GLibTimeVal.sml";
use "polyml/GLibTimeZone.sml";
use "GLibVariantRecordCPtrArrayN.sml";
use "polyml/GLibVariantBuilder.sml";
use "polyml/GLibVariantDict.sml";
use "GLibVariantTypeRecordCPtrArrayN.sml";
use "polyml/GLibChildWatchFunc.sml";
use "polyml/GLibBookmarkFileError.sml";
use "polyml/GLibConvertError.sml";
use "polyml/GLibError.sml";
use "polyml/GLibFileError.sml";
use "polyml/GLibIOChannelError.sml";
use "polyml/GLibKeyFileError.sml";
use "polyml/GLibMarkupError.sml";
use "polyml/GLibOptionError.sml";
use "polyml/GLibRegexError.sml";
use "polyml/GLibShellError.sml";
use "polyml/GLibSpawnError.sml";
use "polyml/GLibThreadError.sml";
use "polyml/GLibVariant.sml";
use "polyml/GLibVariantParseError.sml";
use "polyml/GLibVariantType.sml";
use "polyml/GLibIOChannel.sml";
use "polyml/GLib.sml";
