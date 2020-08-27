(* Copyright (C) 2012-2013, 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure ClosureMarshal :>
  sig
    include CLOSURE_MARSHAL
      where type ('a, 'b) accessor = ('a, 'b) ValueAccessor.t
  end =
  struct
    type ('a, 'b) accessor = ('a, 'b) ValueAccessor.t

    structure GObjectValueRecordArray = 
      struct
        structure C =
          struct
            structure Pointer = CTypedPointer(GObjectValueRecord.C.ValueType)
            type opt = Pointer.opt
            type non_opt = Pointer.non_opt
            type 'a p = 'a Pointer.p
            fun get a vs n = ValueAccessor.C.get a (Pointer.get (vs, n))
            fun set a vs n = ValueAccessor.C.set a (Pointer.get (vs, n))
          end
      end

    structure Closure =
      Closure(
        val name = "GObject.Closure"
        type args =
          (
            GObjectValueRecord.C.non_opt GObjectValueRecord.C.p,
            (
              GObjectValueRecordArray.C.non_opt GObjectValueRecordArray.C.p,
              GUInt32.FFI.val_
            ) pair
          ) pair
        type ret = unit
        val exnRetVal = ()
        val noneRetVal = ()
      )

    val () =
      _export "giraffe_closure_dispatch_sml" :
        (Closure.t
          * GObjectValueRecord.C.non_opt GObjectValueRecord.C.p
          * GObjectValueRecordArray.C.non_opt GObjectValueRecordArray.C.p
          * GUInt32.FFI.val_
          -> unit)
         -> unit;
        (fn (closure, v, vs, size) => Closure.call closure (v & vs & size))

    val () =
      _export "giraffe_closure_destroy_sml" : (Closure.t -> unit) -> unit;
        Closure.free

    type 'a get = Closure.args -> 'a
    type 'a set = Closure.args -> 'a -> unit
    type 'a ret = Closure.args -> 'a -> unit

    fun get n a (_ & vs & _) = GObjectValueRecordArray.C.get a vs (Word.toInt n)
    fun set n a (_ & vs & _) = GObjectValueRecordArray.C.set a vs (Word.toInt n)
    fun ret a (v & _ & _) = ValueAccessor.C.set a v

    type 'a marshaller = 'a -> Closure.callback

    fun (f &&&> g) args = f args & g args
    fun (f ---> g) h args = g args (h (f args))
    fun (f && g) args (x & y) = (f args x : unit; g args y : unit)

    fun void _ = ()

    fun ret_void (v & _ & _) () =
      if not (ValueAccessor.C.isValue v)
      then ()
      else raise Fail "GIRAFFE internal error: ret_void used \
                      \for callback that has return value";

    structure FFI =
      struct
        type opt = unit
        type non_opt = unit
        type 'a p = Closure.t

        fun withPtr f (marshaller, func) =
          let
            val closure = Closure.make (marshaller func)
          in
            f closure
              handle
                e => (Closure.free closure; raise e)
          end
      end
  end
