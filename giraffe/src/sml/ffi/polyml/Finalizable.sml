(* Copyright (C) 2015 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

(* The structure Finalizable is based on MLtonFinalizable.
 *
 * https://github.com/MLton/mlton/blob/master/basis-library/mlton/finalizable.sml
 *
 * Copyright (C) 2003-2006 Henry Cejtin, Matthew Fluet, Suresh
 *    Jagannathan, and Stephen Weeks.
 *
 * MLton is released under a BSD-style license.
 * See the file MLton-LICENSE for details.
 *)

structure Finalizable :> FINALIZABLE =
  struct
    datatype 'a t =
      T of {
        value : 'a ref,
        finalizers : ('a -> unit) list ref,
        afters : (unit -> unit) list ref
      }

    (* `touch (T {value, ...})` is an operation that requires `value` but
     * does nothing.  Something has to be done to `value` to require it, so
     * it is assigned to itself. *)
    fun touch (T {value, ...}) = value := !value

    fun withValue (t as T {value, ...}, f) =
      f (!value) handle e => (touch t; raise e)

    fun addFinalizer (T {finalizers, ...}, f) =
      finalizers := f :: !finalizers

    fun finalizeBefore (T {afters, ...}, t) =
      afters := (fn () => touch t) :: !afters


    type pending = {isAlive : unit -> bool, runFinalizers : unit -> unit}

    local
      (* global state for finalizables that have not been finalized. *)
      val pendingList : pending list ref = ref []

      fun update f x =
        let
          val (y, pendingList') = f (x, !pendingList)
        in
          pendingList := pendingList';
          y
        end

      val mutex = Thread.Mutex.mutex ()
    in
      fun updatePendingList f = ThreadLib.protect mutex (update f)
    end


    fun add (p, ps) = ((), p :: ps)

    fun clean ((), ps) =
      foldl
        (
          fn (p as {isAlive, runFinalizers}, (runNowFns, ps)) =>
            if isAlive ()
            then (runNowFns, p :: ps)
            else (runFinalizers :: runNowFns, ps)
        )
        ([], [])
        ps

    fun swap (a, b) = (b, a)


    fun reportExn e = (
      TextIO.output (
        TextIO.stdErr,
        concat["Warning: finalizer raised exception ", exnMessage e, "\n"]
      );
      TextIO.flushOut TextIO.stdErr
    ) handle _ => ()

    fun run f = f () handle e => reportExn e

    fun doGCAndFinalize () =
      let
        fun loop ps =
          let
            val () = PolyML.fullGC ()  (* PolyML.fullGC is synchronous *)
            val (runNowFns, ps') = clean ((), ps)
          in
            app run runNowFns;
            if not (null runNowFns)
            then loop ps'
            else ps'
          end

        open Thread.Thread
        val attrs = getAttributes ()
        val () = setAttributes [InterruptState InterruptDefer]

        (* Empty the pending list so that the cleaning thread does not
         * start running finalizers too. *)
        val ps = updatePendingList swap []
        val ps' = loop ps
      in
        ignore (updatePendingList swap ps');
        setAttributes attrs
      end

    local
      fun threadFn () = (
        Thread.Mutex.lock Weak.weakLock;
        while true do (
          app run (updatePendingList clean ());
          Thread.ConditionVar.wait (Weak.weakSignal, Weak.weakLock)
        )
      )

      fun startUp () = (
        Thread.Thread.fork (threadFn, []);
        OS.Process.atExit doGCAndFinalize
      )
    in
        val () = PolyML.onEntry startUp; (* For future sessions *)
        val () = startUp() (* For this session *)
    end

    fun new (v : 'a) : 'a t =
      let
        val afters = ref []
        val finalizers = ref []
        val value = ref v
        val t =
          T {
            afters = afters,
            finalizers = finalizers,
            value = value
          }
        val weak = Weak.weak (SOME value)
        fun isAlive () = isSome (!weak)
        fun runFinalizers () = (
          List.app (fn f => f v) (!finalizers);
          List.app (fn f => f ()) (!afters)
        )
        val pending = {isAlive = isAlive, runFinalizers = runFinalizers}

        val () = updatePendingList add pending
      in
        t
      end
  end
