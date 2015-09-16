signature GTK_FILE_FILTER_FLAGS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val FILENAME : t
    val URI : t
    val DISPLAY_NAME : t
    val MIME_TYPE : t
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
