(* Copyright (C) 2013-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GLibIOFunc :>
  G_LIB_I_O_FUNC
    where type i_o_channel_t = GLibIOChannelRecord.t
    where type i_o_condition_t = GLibIOCondition.t =
  struct
    type i_o_channel_t = GLibIOChannelRecord.t
    type i_o_condition_t = GLibIOCondition.t
    type func = i_o_channel_t * i_o_condition_t -> bool
    structure Pointer = CPointer(GMemory)
    structure Closure =
      Closure(
        val name = "GLib.IOFunc"
        type args =
          (
            GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p,
            GLibIOCondition.FFI.val_
          ) pair
        type ret = GBool.FFI.val_
        val exnRetVal =
          GBool.FFI.withVal I false (* return false to remove the source *)
        val noneRetVal =
          GBool.FFI.withVal I true  (* return true to prevent an attempt
                                     * to remove a non-existent source *)
      )
    structure Callback =
      Callback(
        type t = func
        structure Pointer = Pointer
        structure Closure = Closure
        fun marshaller func =
          fn source & condition =>
            GBool.FFI.withVal I (
              func (
                GLibIOChannelRecord.FFI.fromPtr false source,
                GLibIOCondition.FFI.fromVal condition
              )
            )
        fun dispatchPtr () = _address "giraffe_g_i_o_func_dispatch" : Pointer.t;
        fun dispatchAsyncPtr () = _address "giraffe_g_i_o_func_dispatch_async" : Pointer.t;
        fun destroyNotifyPtr () = _address "giraffe_g_i_o_func_destroy" : Pointer.t;
      )
    open Callback
    val () =
      _export "giraffe_g_i_o_func_dispatch_sml"
        : (GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p
            * GLibIOCondition.FFI.val_
            * Closure.t
            -> GBool.FFI.val_)
           -> unit;
        (fn (source, condition, closure) => Closure.call closure (source & condition))
    val () =
      _export "giraffe_g_i_o_func_dispatch_async_sml"
        : (GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p
            * GLibIOCondition.FFI.val_
            * Closure.t
            -> GBool.FFI.val_)
           -> unit;
        (fn (source, condition, closure) => Closure.call closure (source & condition) before Closure.free closure)
    val () =
      _export "giraffe_g_i_o_func_destroy_sml" : (Closure.t -> unit) -> unit;
        Closure.free
  end
