signature G_LIB_UNICODE_BREAK_TYPE =
  sig
    datatype enum =
      MANDATORY
    | CARRIAGE_RETURN
    | LINE_FEED
    | COMBINING_MARK
    | SURROGATE
    | ZERO_WIDTH_SPACE
    | INSEPARABLE
    | NON_BREAKING_GLUE
    | CONTINGENT
    | SPACE
    | AFTER
    | BEFORE
    | BEFORE_AND_AFTER
    | HYPHEN
    | NON_STARTER
    | OPEN_PUNCTUATION
    | CLOSE_PUNCTUATION
    | QUOTATION
    | EXCLAMATION
    | IDEOGRAPHIC
    | NUMERIC
    | INFIX_SEPARATOR
    | SYMBOL
    | ALPHABETIC
    | PREFIX
    | POSTFIX
    | COMPLEX_CONTEXT
    | AMBIGUOUS
    | UNKNOWN
    | NEXT_LINE
    | WORD_JOINER
    | HANGUL_L_JAMO
    | HANGUL_V_JAMO
    | HANGUL_T_JAMO
    | HANGUL_LV_SYLLABLE
    | HANGUL_LVT_SYLLABLE
    | CLOSE_PARANTHESIS
    include
      ENUM
        where type t = enum
  end
