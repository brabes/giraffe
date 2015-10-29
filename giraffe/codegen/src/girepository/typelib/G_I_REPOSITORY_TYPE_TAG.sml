signature G_I_REPOSITORY_TYPE_TAG =
  sig
    datatype t =
      VOID
    | BOOLEAN
    | INT8
    | UINT8
    | INT16
    | UINT16
    | INT32
    | UINT32
    | INT64
    | UINT64
    | FLOAT
    | DOUBLE
    | GTYPE
    | UTF8
    | FILENAME
    | ARRAY
    | INTERFACE
    | GLIST
    | GSLIST
    | GHASH
    | ERROR
    | UNICHAR
    val toString : t -> string
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