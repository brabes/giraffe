structure GLibRegexError :>
  G_LIB_REGEX_ERROR
    where type error_handler = GLibErrorRecord.handler =
  struct
    datatype enum =
      COMPILE
    | OPTIMIZE
    | REPLACE
    | MATCH
    | INTERNAL
    | STRAY_BACKSLASH
    | MISSING_CONTROL_CHAR
    | UNRECOGNIZED_ESCAPE
    | QUANTIFIERS_OUT_OF_ORDER
    | QUANTIFIER_TOO_BIG
    | UNTERMINATED_CHARACTER_CLASS
    | INVALID_ESCAPE_IN_CHARACTER_CLASS
    | RANGE_OUT_OF_ORDER
    | NOTHING_TO_REPEAT
    | UNRECOGNIZED_CHARACTER
    | POSIX_NAMED_CLASS_OUTSIDE_CLASS
    | UNMATCHED_PARENTHESIS
    | INEXISTENT_SUBPATTERN_REFERENCE
    | UNTERMINATED_COMMENT
    | EXPRESSION_TOO_LARGE
    | MEMORY_ERROR
    | VARIABLE_LENGTH_LOOKBEHIND
    | MALFORMED_CONDITION
    | TOO_MANY_CONDITIONAL_BRANCHES
    | ASSERTION_EXPECTED
    | UNKNOWN_POSIX_CLASS_NAME
    | POSIX_COLLATING_ELEMENTS_NOT_SUPPORTED
    | HEX_CODE_TOO_LARGE
    | INVALID_CONDITION
    | SINGLE_BYTE_MATCH_IN_LOOKBEHIND
    | INFINITE_LOOP
    | MISSING_SUBPATTERN_NAME_TERMINATOR
    | DUPLICATE_SUBPATTERN_NAME
    | MALFORMED_PROPERTY
    | UNKNOWN_PROPERTY
    | SUBPATTERN_NAME_TOO_LONG
    | TOO_MANY_SUBPATTERNS
    | INVALID_OCTAL_VALUE
    | TOO_MANY_BRANCHES_IN_DEFINE
    | DEFINE_REPETION
    | INCONSISTENT_NEWLINE_OPTIONS
    | MISSING_BACK_REFERENCE
    structure Enum =
      Enum(
        type enum = enum
        val null = COMPILE
        val toInt =
          fn
            COMPILE => 0
          | OPTIMIZE => 1
          | REPLACE => 2
          | MATCH => 3
          | INTERNAL => 4
          | STRAY_BACKSLASH => 101
          | MISSING_CONTROL_CHAR => 102
          | UNRECOGNIZED_ESCAPE => 103
          | QUANTIFIERS_OUT_OF_ORDER => 104
          | QUANTIFIER_TOO_BIG => 105
          | UNTERMINATED_CHARACTER_CLASS => 106
          | INVALID_ESCAPE_IN_CHARACTER_CLASS => 107
          | RANGE_OUT_OF_ORDER => 108
          | NOTHING_TO_REPEAT => 109
          | UNRECOGNIZED_CHARACTER => 112
          | POSIX_NAMED_CLASS_OUTSIDE_CLASS => 113
          | UNMATCHED_PARENTHESIS => 114
          | INEXISTENT_SUBPATTERN_REFERENCE => 115
          | UNTERMINATED_COMMENT => 118
          | EXPRESSION_TOO_LARGE => 120
          | MEMORY_ERROR => 121
          | VARIABLE_LENGTH_LOOKBEHIND => 125
          | MALFORMED_CONDITION => 126
          | TOO_MANY_CONDITIONAL_BRANCHES => 127
          | ASSERTION_EXPECTED => 128
          | UNKNOWN_POSIX_CLASS_NAME => 130
          | POSIX_COLLATING_ELEMENTS_NOT_SUPPORTED => 131
          | HEX_CODE_TOO_LARGE => 134
          | INVALID_CONDITION => 135
          | SINGLE_BYTE_MATCH_IN_LOOKBEHIND => 136
          | INFINITE_LOOP => 140
          | MISSING_SUBPATTERN_NAME_TERMINATOR => 142
          | DUPLICATE_SUBPATTERN_NAME => 143
          | MALFORMED_PROPERTY => 146
          | UNKNOWN_PROPERTY => 147
          | SUBPATTERN_NAME_TOO_LONG => 148
          | TOO_MANY_SUBPATTERNS => 149
          | INVALID_OCTAL_VALUE => 151
          | TOO_MANY_BRANCHES_IN_DEFINE => 154
          | DEFINE_REPETION => 155
          | INCONSISTENT_NEWLINE_OPTIONS => 156
          | MISSING_BACK_REFERENCE => 157
        exception Value of GInt.t
        val fromInt =
          fn
            0 => COMPILE
          | 1 => OPTIMIZE
          | 2 => REPLACE
          | 3 => MATCH
          | 4 => INTERNAL
          | 101 => STRAY_BACKSLASH
          | 102 => MISSING_CONTROL_CHAR
          | 103 => UNRECOGNIZED_ESCAPE
          | 104 => QUANTIFIERS_OUT_OF_ORDER
          | 105 => QUANTIFIER_TOO_BIG
          | 106 => UNTERMINATED_CHARACTER_CLASS
          | 107 => INVALID_ESCAPE_IN_CHARACTER_CLASS
          | 108 => RANGE_OUT_OF_ORDER
          | 109 => NOTHING_TO_REPEAT
          | 112 => UNRECOGNIZED_CHARACTER
          | 113 => POSIX_NAMED_CLASS_OUTSIDE_CLASS
          | 114 => UNMATCHED_PARENTHESIS
          | 115 => INEXISTENT_SUBPATTERN_REFERENCE
          | 118 => UNTERMINATED_COMMENT
          | 120 => EXPRESSION_TOO_LARGE
          | 121 => MEMORY_ERROR
          | 125 => VARIABLE_LENGTH_LOOKBEHIND
          | 126 => MALFORMED_CONDITION
          | 127 => TOO_MANY_CONDITIONAL_BRANCHES
          | 128 => ASSERTION_EXPECTED
          | 130 => UNKNOWN_POSIX_CLASS_NAME
          | 131 => POSIX_COLLATING_ELEMENTS_NOT_SUPPORTED
          | 134 => HEX_CODE_TOO_LARGE
          | 135 => INVALID_CONDITION
          | 136 => SINGLE_BYTE_MATCH_IN_LOOKBEHIND
          | 140 => INFINITE_LOOP
          | 142 => MISSING_SUBPATTERN_NAME_TERMINATOR
          | 143 => DUPLICATE_SUBPATTERN_NAME
          | 146 => MALFORMED_PROPERTY
          | 147 => UNKNOWN_PROPERTY
          | 148 => SUBPATTERN_NAME_TOO_LONG
          | 149 => TOO_MANY_SUBPATTERNS
          | 151 => INVALID_OCTAL_VALUE
          | 154 => TOO_MANY_BRANCHES_IN_DEFINE
          | 155 => DEFINE_REPETION
          | 156 => INCONSISTENT_NEWLINE_OPTIONS
          | 157 => MISSING_BACK_REFERENCE
          | n => raise Value n
      )
    open Enum
    exception Error of t
    type error_handler = GLibErrorRecord.handler
    val handler =
      GLibErrorRecord.makeHandler
        (
          "g-regex-error-quark",
          FFI.fromVal,
          Error
        )
  end
exception GLibRegexError = GLibRegexError.Error
