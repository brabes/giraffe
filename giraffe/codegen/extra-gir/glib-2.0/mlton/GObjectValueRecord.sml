(* Copyright (C) 2012, 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GObjectValueRecord :> G_OBJECT_VALUE_RECORD =
  struct
    structure Pointer = CPointerInternal
    type opt = Pointer.opt
    type non_opt = Pointer.non_opt
    type 'a p = 'a Pointer.p
    val size_ = _import "giraffe_g_object_value_size" : unit -> GSize.FFI.val_;
    val copy_ = fn x1 & x2 => (_import "giraffe_g_value_copy" : non_opt p * non_opt p -> unit;) (x1, x2)
    val clear_ = _import "giraffe_g_value_clear" : non_opt p -> unit;
    structure Record =
      BoxedValueRecord(
        structure Pointer = Pointer
        type opt = opt
        type non_opt = non_opt
        type 'a p = 'a p
        val copy_ = copy_
        val clear_ = clear_
        val size_ = size_
      )
    open Record
  end
