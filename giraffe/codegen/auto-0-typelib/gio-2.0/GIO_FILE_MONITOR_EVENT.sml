signature GIO_FILE_MONITOR_EVENT =
  sig
    datatype t =
      CHANGED
    | CHANGES_DONE_HINT
    | DELETED
    | CREATED
    | ATTRIBUTE_CHANGED
    | PRE_UNMOUNT
    | UNMOUNTED
    | MOVED
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
