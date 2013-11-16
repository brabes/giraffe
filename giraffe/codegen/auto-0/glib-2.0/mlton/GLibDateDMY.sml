structure GLibDateDMY :>
  sig
    include G_LIB_DATE_D_M_Y
  end =
  struct
    datatype t =
      DAY
    | MONTH
    | YEAR
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            DAY => f 0
          | MONTH => f 1
          | YEAR => f 2
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => DAY
          | 1 => MONTH
          | 2 => YEAR
          | n => raise Value n
      end
    val null = DAY
  end
