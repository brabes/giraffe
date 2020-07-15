signature PANGO_GRAVITY =
  sig
    datatype enum =
      SOUTH
    | EAST
    | NORTH
    | WEST
    | AUTO
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    type script_t
    type gravity_hint_t
    type matrix_t
    val getType : unit -> GObject.Type.t
    val getForMatrix : matrix_t option -> t
    val getForScript :
      script_t
       * t
       * gravity_hint_t
       -> t
    val getForScriptAndWidth :
      script_t
       * bool
       * t
       * gravity_hint_t
       -> t
    val toRotation : t -> real
  end