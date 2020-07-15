(* Copyright (C) 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor CArrayN(CArrayType : C_ARRAY_TYPE where type 'a from_p = int -> 'a) :>
  C_ARRAY_N
    where type elem = CArrayType.elem
    where type sequence = CArrayType.t
    where type 'a C.ArrayType.from_p = 'a CArrayType.from_p
    where type 'a C.p = 'a CArrayType.p
    where type C.opt = CArrayType.opt
    where type C.non_opt = CArrayType.non_opt =
  struct
    type elem = CArrayType.elem
    type sequence = CArrayType.t

    structure C =
      struct
        structure Pointer = CArrayType.Pointer
        type opt = Pointer.opt
        type non_opt = Pointer.non_opt
        type 'a p = 'a Pointer.p
        type ('a, 'b) r = ('a, 'b) Pointer.r

        structure ArrayType = CArrayType
      end

    (**
     * For Poly/ML, `array`, the representation of an immutable C array, is a
     * pointer to a C array allocated on the C heap and the number of
     * elements for which space was allocated.  A finalizable value
     * is used to free the array on the C heap when no longer reachable.
     *)
    type array = C.non_opt C.p Finalizable.t * int

    type t = array * int

    structure FFI =
      struct
        open C.ArrayType

        type 'a tabulator = int * (int -> elem) -> 'a
        (* For any `tabulate : 'a tabulator` we require that
         * `tabulate (n, sub)` applies `sub` to values of `i` that satisfy
         * `0 <= i andalso i < n` *)


        (**
         * Return values
         *)
        structure OutPointer = Pointer
        type 'a out_p = 'a OutPointer.p

        fun fromPtr d p n =
          let
            val a = Finalizable.new p
          in
            Finalizable.addFinalizer (a, free d n);
            ((a, n), n)
          end

        fun fromDupPtr d p n =
          fromPtr ~1 (dup ~1 n p) n before free d n p

        fun copyPtr tabulate d p n =
          tabulate (len n p, getElem n p) before free d n p


        fun fromOptPtr d p n =
          Option.map (fn p => fromPtr d p n) (Pointer.toOpt p)
          (* No finalizer added for null pointer.  Although g_free can be
           * called with a null pointer, adding unnecessary finalizers is
           * less efficient. *)

        fun fromDupOptPtr d p n =
          Option.map (fn p => fromDupPtr d p n) (Pointer.toOpt p)
          (* No finalizer added for null pointer. *)

        fun copyOptPtr tabulate d p n =
          Option.map (fn p => copyPtr tabulate d p n) (Pointer.toOpt p)
          (* No finalizer added for null pointer. *)


        (**
         * Value parameters
         *)
        type 'a in_p = 'a Pointer.p

        local
          fun withPointer f = Pointer.withVal f

          fun withOptPointer f = Pointer.withOptVal f

          fun withDupPointer free f p =
            p & withPointer f p handle e => (free p; raise e)

          fun withDupOptPointer free f pOpt =
            Pointer.fromOpt pOpt & withOptPointer f pOpt
              handle e => (Option.app free pOpt; raise e)
        in
          fun withPtr f ((a, _), _) = Finalizable.withValue (a, withPointer f)

          fun withDupPtr d f ((a, _), n) =
            Finalizable.withValue (a, withDupPointer (free d n) f o dup d n)


          fun withOptPtr f =
            fn
              SOME ((a, _), _) => Finalizable.withValue (a, withOptPointer f o SOME)
            | NONE => withOptPointer f NONE

          fun withDupOptPtr d f =
            fn
              SOME ((a, _), n) =>
                Finalizable.withValue
                  (a, withDupOptPointer (free d n) f o SOME o dup d n)
            | NONE => withDupOptPointer ignore f NONE
        end


        (**
         * Reference parameters
         *)
        type ('a, 'b) r = ('a, 'b) Pointer.r

        local
          fun withRefPointer f p = Pointer.withRefVal f p

          fun withRefOptPointer f p = Pointer.withRefOptVal f p

          fun withRefDupPointer free f p =
            withRefPointer f p handle e => (Pointer.appNonNullPtr free p; raise e)

          fun withRefDupOptPointer free f pOpt =
            withRefOptPointer f pOpt handle e => (Option.app free pOpt; raise e)
        in
          fun withNullRef f = Pointer.withNullRef f


          fun withRefPtr f ((a, _), _) = Finalizable.withValue (a, withRefPointer f)

          fun withRefDupPtr d f ((a, _), n) =
            Finalizable.withValue (a, withRefDupPointer (free d n) f o dup d n)


          fun withRefOptPtr f =
            fn
              SOME ((a, _), _) => Finalizable.withValue (a, withRefOptPointer f o SOME)
            | NONE => withRefOptPointer f NONE

          fun withRefDupOptPtr d f =
            fn
              SOME ((a, _), n) =>
                Finalizable.withValue
                  (a, withRefDupOptPointer (free d n) f o SOME o dup d n)
            | NONE => withRefDupOptPointer ignore f NONE
        end
      end

    fun fromSequence v =
      let
        val n = C.ArrayType.ElemSequence.length v
      in
        FFI.fromPtr ~1 (C.ArrayType.toC n v) n
      end

    val toSequence =
      fn
        ((a, _), n) => Finalizable.withValue (a, C.ArrayType.fromC n)

    fun tabulate (n, f) =
      FFI.fromPtr ~1 (C.ArrayType.init C.ArrayType.setElem (n, f)) n

    fun fromList es =
      let
        val n = List.length es
        val r = ref es
        fun f _ =
          case ! r of
            e :: es' => (r := es'; e)
          | []       => raise Fail "CArray().fromList: unreachable case"
      in
        tabulate (n, f)
      end

    val toList =
      let
        open C.ArrayType
        fun tabulateFromC n p = List.tabulate (len n p, getElem n p)
      in
        fn
          ((a, _), n) => Finalizable.withValue (a, tabulateFromC n)
      end

    val length =
      fn
        ((a, _), n) => Finalizable.withValue (a, C.ArrayType.len n)

    val get =
      fn
        ((a, _), n) =>
          let
            val get = Finalizable.withValue (a, C.ArrayType.getElem n)
          in
            fn i =>
              if 0 <= i andalso i < n
              then get i
              else raise Subscript
          end

    fun sub (t, i) = get t i

    val set =
      fn
        ((a, _), n) =>
          let
            fun f (i, elem) j =
              if i = j
              then SOME elem
              else NONE

            val get = Finalizable.withValue (a, C.ArrayType.get n)
            fun set n p (i, optElem) =
              case optElem of
                NONE      => C.ArrayType.set n p (i, get i)
              | SOME elem => C.ArrayType.setElem n p (i, elem)
          in
            fn (i, elem) =>
              if 0 <= i andalso i < n
              then FFI.fromPtr ~1 (C.ArrayType.init set (n, f (i, elem))) n
              else raise Subscript
          end

    fun update (t, i, e) = set t (i, e)

    val full =
      fn
        (array as (_, len), _) => (array, len)

    fun subslice (t as (array, _), len) =
      if 0 <= len andalso len <= length t
      then (array, len)
      else raise Subscript

    structure PolyML =
      struct
        val cInPtr = C.Pointer.PolyML.cVal
        val cInOptPtr = C.Pointer.PolyML.cOptVal

        val cOutPtr = C.Pointer.PolyML.cVal
        val cOutOptPtr = C.Pointer.PolyML.cOptVal

        val cOutRef = C.Pointer.PolyML.cRef
        val cOutOptRef = C.Pointer.PolyML.cOptOutRef
        val cInOutRef = C.Pointer.PolyML.cInRef
        val cInOutOptRef = C.Pointer.PolyML.cOptOutRef
      end
  end