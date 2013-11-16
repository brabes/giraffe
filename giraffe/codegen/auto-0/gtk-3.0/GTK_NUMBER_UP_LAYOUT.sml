signature GTK_NUMBER_UP_LAYOUT =
  sig
    datatype t =
      LRTB
    | LRBT
    | RLTB
    | RLBT
    | TBLR
    | TBRL
    | BTLR
    | BTRL
    val null : t
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
        exception Value of FFI.Enum.C.val_
      end
  end
