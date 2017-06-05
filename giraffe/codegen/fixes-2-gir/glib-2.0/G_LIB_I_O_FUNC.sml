signature G_LIB_I_O_FUNC =
  sig
    type i_o_channel_t
    type i_o_condition_t

    type t = i_o_channel_t * i_o_condition_t -> bool

    structure FFI :
      sig
        type callback
        val withCallback : (callback -> 'a) -> t -> 'a
      end
  end
