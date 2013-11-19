signature GDK_DRAG_ACTION =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val DEFAULT : t
    val COPY : t
    val MOVE : t
    val LINK : t
    val PRIVATE : t
    val ASK : t
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