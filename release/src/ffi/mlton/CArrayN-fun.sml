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
    where type 'a update = unit  (* mutable *)
    where type 'a C.ArrayType.from_p = 'a CArrayType.from_p
    where type C.ArrayType.e = CArrayType.e
    where type 'a C.ArrayType.p = 'a CArrayType.p
    where type C.ArrayType.opt = CArrayType.opt
    where type C.ArrayType.non_opt = CArrayType.non_opt =
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
        type 'a from_p = 'a CArrayType.from_p
        type e = CArrayType.e

        structure PointerType = CArrayType
        structure ArrayType = CArrayType
      end

    (**
     * For MLton, `array`, the representation of a mutable C array, is a
     * pointer to a C array allocated on the C heap.  A finalizable value
     * is used to free an array on the C heap when no longer reachable.
     *
     * Although MLton can pass a pointer to an SML array (that points into
     * the SML heap) to a C function, this feature is not used because its
     * effect is not generally portable to other SML compilers, e.g. Poly/ML.
     *)
    datatype array =
      CArray of C.non_opt C.p Finalizable.t * int

    type t = array * int

    structure FFI =
      struct
        open C.ArrayType

        type 'a tabulator = int * (int -> elem) -> 'a
        (* For any `tabulate : 'a tabulator` we require that
         * `tabulate (n, sub)` applies `sub` to values of `i` that satisfy
         * `0 <= i andalso i < n` *)


        val touchPtr =
          fn
            (CArray (a, _), _) => Finalizable.touch a

        fun touchOptPtr t = Option.app touchPtr t


        (**
         * Return values
         *)
        structure OutPointer = Pointer
        type 'a out_p = 'a OutPointer.p

        local
          fun wrap d p n =
            let
              val a = Finalizable.new p
            in
              Finalizable.addFinalizer (a, free d n);
              (CArray (a, n), n)
            end
        in
          fun fromPtr d =
            if d < 0
            then
              (* If `d < 0`, we own everything so just wrap it. *)
              wrap ~1
            else
              (* If `d = 0`, we own nothing so a full copy is required.
               *
               * If `d > 0`, we own `d` initial levels but need ownership of
               * the deeper levels.  The implementation here is potentially
               * inefficient in this case because it makes a full copy and
               * frees the initial levels that we owned.  This is especially
               * inefficient if the unowned elements are reference counted
               * because the initial level could have been used.
               * If this leads to a performance issue, consideration
               * could be given to improving this case by copying the
               * deeper levels and updating the initial levels that
               * we own. *)
              fn p =>
              fn n =>
                (
                  wrap ~1 (dup ~1 n p) n
                )
                 before free d n p
        end

        fun copyPtr tabulate d p n =
          tabulate (len n p, getElem n p) before free d n p


        fun fromOptPtr d p n =
          Option.map (fn p => fromPtr d p n) (Pointer.toOpt p)
          (* No finalizer added for null pointer.  Although g_free can be
           * called with a null pointer, adding unnecessary finalizers is
           * less efficient. *)

        fun copyOptPtr tabulate d p n =
          Option.map (fn p => copyPtr tabulate d p n) (Pointer.toOpt p)
          (* No finalizer added for null pointer. *)


        (**
         * Support for value and reference parameter encoding
         *
         * There are many possible values that can be used to represent the
         * null pointer across the FFI because many possible values exist for
         * the non-null pointer used in the encoding.  `nonNullPointer` is the
         * representative non-null pointer.
         *)

        val nonNullPointer =
          Pointer.toOptPtr (Pointer.Memory.Pointer.sub (Pointer.null, 0w1))


        (**
         * Value parameters
         *
         * The C interface uses two parameters, sml_str and c_str, with a
         * C-side transformation that derives a single pointer str from
         * sml_str and c_str according to the following table:
         *
         *   CVector.cvector     opt p       |
         *                                   |
         *   gchar *             gchar *     | gchar *
         *   sml_str             c_str       | str
         *   --------------------------------+---------
         *   {_}                 non-NULL    | NULL
         *   {_, _, ...}         non-NULL    | c_str
         *
         *   Note
         *     {_}             is a vector of length 1
         *     {_, _, ...}     is a vector of length 2 or more
         *
         * The local function `fromPointer` constructs the
         * SML-side values for sml_str and c_str.
         *)
        type 'a in_p = CVector.cvector * opt p

        local
          fun fromPointer (p : 'a p) : 'b in_p =
            if Pointer.isNull p
            then (CVector.v1, nonNullPointer)
            else (CVector.v2, Pointer.toOptPtr p)

          fun withPointer free f p =
            f (fromPointer p) handle e => (Pointer.appNonNullPtr free p; raise e)

          fun withDupPointer free f p =
            p & withPointer free f p
        in
          fun withPtr d =
            if d = 0
            then
              fn f =>
              fn
                (CArray (a, _), _) => Finalizable.withValue (a, withPointer ignore f)
            else
              fn f =>
              fn
                (CArray (a, _), n) =>
                  Finalizable.withValue (a, withPointer (free d n) f o dup d n)

          fun withDupPtr d =
            if d = 0
            then
              fn f =>
              fn
                (CArray (a, _), _) => Finalizable.withValue (a, withDupPointer ignore f)
            else
              fn f =>
              fn
                (CArray (a, _), n) =>
                  Finalizable.withValue (a, withDupPointer (free d n) f o dup d n)


          fun withOptPtr d =
            if d = 0
            then
              fn f =>
              fn
                SOME (CArray (a, _), _) =>
                  Finalizable.withValue (a, withPointer ignore f)
              | NONE => withPointer ignore f Pointer.null
            else
              fn f =>
              fn
                SOME (CArray (a, _), n) =>
                  Finalizable.withValue
                    (a, withPointer (free d n) f o Pointer.toOptPtr o dup d n)
              | NONE => withPointer ignore f Pointer.null

          fun withDupOptPtr d =
            if d = 0
            then
              fn f =>
              fn
                SOME (CArray (a, _), _) =>
                  Finalizable.withValue (a, withDupPointer ignore f o Pointer.toOptPtr)
              | NONE => withDupPointer ignore f Pointer.null
            else
              fn f =>
              fn
                SOME (CArray (a, _), n) =>
                  Finalizable.withValue
                    (a, withDupPointer (free d n) f o Pointer.toOptPtr o dup d n)
              | NONE => withDupPointer ignore f Pointer.null


          fun withNewPtr f n =
            withDupPointer (free 1 n) f (new n)
        end


        (**
         * Reference parameters
         *
         * The C interface uses two parameters, sml_str and c_str_ptr, with
         * a C-side transformation that derives a single pointer str_ptr from
         * sml_str and c_str_ptr according to the following table:
         *
         *   CVector.cvector     opt p                |
         *                                            |
         *   gchar *             gchar **             | gchar **
         *   sml_str             c_str_ptr            | str_ptr
         *   -----------------------------------------+---------
         *   {_}                 pointer to non-NULL  | NULL
         *   {_, _}              pointer to non-NULL  | pointer to NULL
         *   {_, _, _, ...}      pointer to non-NULL  | c_str_ptr
         *
         *   Note
         *     {_}             is a vector of length 1
         *     {_, _}          is a vector of length 2
         *     {_, _, _, ...}  is a vector of length 3 or more
         *
         * The local functions `null` and `fromPointer`
         * construct the SML-side values for sml_str and c_str_ptr.
         *)
        type ('a, 'b) r = CVector.cvector * (opt, 'b) Pointer.r

        fun toRef x = Pointer.MLton.toRef x
        fun fromRef x = Pointer.MLton.fromRef x

        local
          (* `null` needs to be a function to work around the value restriction *)
          fun null () : ('a, 'b) r =
                 (CVector.v1, toRef nonNullPointer)

          fun fromPointer (p : 'a p) : ('b, 'c) r =
            if Pointer.isNull p
            then (CVector.v2, toRef nonNullPointer)
            else (CVector.v3, toRef (Pointer.toOptPtr p))

          fun apply f (x as (_, e)) =
            let val y = f x in fromRef e & y end
            (* must evaluate `f x` before `fromRef e` *)

          fun withRefPointer free f p =
            f (fromPointer p) handle e => (free p; raise e)
        in
          fun withNullRef f () = f (null ())


          fun withRefPtr d =
            if d = 0
            then
              fn f =>
              fn
                (CArray (a, _), _) => Finalizable.withValue (a, withRefPointer ignore (apply f))
            else
              fn f =>
              fn
                (CArray (a, _), n) =>
                  Finalizable.withValue
                    (a, withRefPointer (free d n) (apply f) o dup d n)


          fun withRefOptPtr d =
            if d = 0
            then
              fn f =>
              fn
                SOME (CArray (a, _), _) =>
                  Finalizable.withValue (a, withRefPointer ignore (apply f))
              | NONE => withRefPointer ignore (apply f) Pointer.null
            else
              fn f =>
              fn
                SOME (CArray (a, _), n) =>
                  Finalizable.withValue
                    (a, withRefPointer (free d n) (apply f) o dup d n)
              | NONE => withRefPointer ignore (apply f) Pointer.null
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
        (CArray (a, _), n) => Finalizable.withValue (a, C.ArrayType.fromC n)

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
          (CArray (a, _), n) => Finalizable.withValue (a, tabulateFromC n)
      end

    val length =
      fn
        (CArray (a, _), n) => Finalizable.withValue (a, C.ArrayType.len n)

    val get =
      fn
        (CArray (a, _), n) =>
          let
            val get = Finalizable.withValue (a, C.ArrayType.getElem n)
          in
            fn i =>
              if 0 <= i andalso i < n
              then get i
              else raise Subscript
          end

    fun sub (t, i) = get t i

    type 'a update = unit

    val set =
      fn
        (CArray (a, _), n) =>
          let
            fun update p (i, elem) =
              let
                open C.ArrayType
                val () = ElemType.free ~1 (get n p i)
                val () = setElem n p (i, elem)
              in
                ()
              end
            val updateArray = Finalizable.withValue (a, update)
          in
            fn (i, elem) =>
              if 0 <= i andalso i < n
              then updateArray (i, elem)
              else raise Subscript
          end

    fun update (t, i, e) = set t (i, e)

    val full =
      fn
        (array as CArray (_, len), _) => (array, len)

    fun subslice (t as (array, _), len) =
      if 0 <= len andalso len <= length t
      then (array, len)
      else raise Subscript

    structure MLton =
      struct
        type p1 = C.ArrayType.CVector.cvector
        type 'a p2 = FFI.opt C.Pointer.p

        type r1 = C.ArrayType.CVector.cvector
        type ('a, 'b) r2 = (FFI.opt, 'b) C.Pointer.r
      end
  end
