signature G_LIB_FILE_ERROR =
  sig
    datatype t =
      EXIST
    | ISDIR
    | ACCES
    | NAMETOOLONG
    | NOENT
    | NOTDIR
    | NXIO
    | NODEV
    | ROFS
    | TXTBSY
    | FAULT
    | LOOP
    | NOSPC
    | NOMEM
    | MFILE
    | NFILE
    | BADF
    | INVAL
    | PIPE
    | AGAIN
    | INTR
    | IO
    | PERM
    | NOSYS
    | FAILED
    exception Error of t
    type error_record_handler
    val handler : error_record_handler
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
