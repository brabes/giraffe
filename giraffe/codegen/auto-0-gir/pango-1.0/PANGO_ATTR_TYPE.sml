signature PANGO_ATTR_TYPE =
  sig
    datatype t =
      INVALID
    | LANGUAGE
    | FAMILY
    | STYLE
    | WEIGHT
    | VARIANT
    | STRETCH
    | SIZE
    | FONT_DESC
    | FOREGROUND
    | BACKGROUND
    | UNDERLINE
    | STRIKETHROUGH
    | RISE
    | SHAPE
    | SCALE
    | FALLBACK
    | LETTER_SPACING
    | UNDERLINE_COLOR
    | STRIKETHROUGH_COLOR
    | ABSOLUTE_SIZE
    | GRAVITY
    | GRAVITY_HINT
    val null : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
    val getName : t -> string
    val register : string -> t
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
