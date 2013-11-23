structure GIRepositoryDirection :>
  sig
    include G_I_REPOSITORY_DIRECTION
  end =
  struct
    datatype t =
      IN
    | OUT
    | INOUT
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            IN => f 0
          | OUT => f 1
          | INOUT => f 2
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => IN
          | 1 => OUT
          | 2 => INOUT
          | n => raise Value n
      end
    val null = IN
  end
