signature GIO_ASK_PASSWORD_FLAGS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val NEED_PASSWORD : t
    val NEED_USERNAME : t
    val NEED_DOMAIN : t
    val SAVING_SUPPORTED : t
    val ANONYMOUS_SUPPORTED : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
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
      end
  end
