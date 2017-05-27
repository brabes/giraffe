(* Copyright (C) 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GFloatType :> C_VALUE_TYPE where type t = LargeReal.real =
  struct
    type t = LargeReal.real

    type v = C_Float.real
    type p = MLton.Pointer.t

    structure MLtonVector =
      struct
        val e = 0.0
      end

    val isRef = false
    val null = Fn.const 0.0
    val size = Fn.const 0w4

    val toC = C_Float.fromLarge (IEEEReal.getRoundingMode ())
    val updateC = Fn.const Fn.ignore
    val fromC = C_Float.toLarge

    val new = null
    val delete = Fn.ignore
    val clear = Fn.ignore

    fun get p = MLton.Pointer.getReal32 (p, 0)
    fun set (p, v) = MLton.Pointer.setReal32 (p, 0, v)

    val malloc_ = _import "g_malloc" : C_Size.t -> MLton.Pointer.t;
    val free_ = _import "g_free" : MLton.Pointer.t -> unit;
    fun malloc n = malloc_ ((C_Size.fromLarge o Word.toLarge) n)
    val free = free_
  end