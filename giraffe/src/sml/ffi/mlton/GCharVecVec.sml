(* Copyright (C) 2012, 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GCharVecVec :>
  sig
    structure MLton :
      sig
        type p1 and p2 and 'a p3
        type r1 and r2 and ('a, 'b) r3
      end

    include
      C_ARRAY
        where type elem = string
        where type vector = string Vector.vector

        (* It is necessary to expose the following type representations because
         * the tuple elements must occur as individual elements in the tuple
         * argument of the imported C function. *)
        where type 'a C.in_p = MLton.p1 * MLton.p2 * 'a MLton.p3
        where type ('a, 'b) C.r = MLton.r1 * MLton.r2 * ('a, 'b) MLton.r3
  end =
  struct
    (**
     * For `SMLArray (v, a)`, `v` is a vector of `cstring` values, i.e.
     * null-terminated SML string values.  It is not possible to create an
     * SML value that makes `v` null-terminated on the C side.  Therefore, it
     * it is necessary to construct a null-terminated string array on the
     * C side.  Note that this can reference the `cstring` values so requires
     * only the array of C string pointers to be copied.  To avoid memory
     * allocation on each call, a mutable SML array of C pointers, `a`, is
     * created for each `v` that provides a temporary area to copy the elements
     * of `v` to on the C side.  Although `v` must be copied to `a` for each
     * foreign function call, the overhead is very low, requiring only a
     * single call to  the C function memcpy.  `a` contains one more element
     * than `v` for the null terminator.  The last element of `a` is always
     * null, so the C side does not need to write to it (and must not write
     * any other value to it).  Note that `a` must be a mutable array because
     * MLton allows foreign functions to write to the elements but does not
     * for a non-mutable vector.
     *
     * For `CArray arr`, `arr` is a finalizable pointer to memory allocated
     * from C whose finalizer frees the memory.
     *
     * explain CArray issues
     *   - array of strings allocated/freed at once; although separation of the
     *     memory management of the array and individual strings could have
     *     benefits (for example, this would allow a C string to be returned
     *     when subscripting a C string array) it is not possible because
     *     C functions that manipulate C string arrays (necessarily) allocate
     *     and free strings within the array.
     *     For example, a C function that removes strings from a string array
     *     must free them because, in C, there would be no reference to the
     *     removed strings that allows them to be freed at a later point.
     *)
    structure ElemType = GCharVec.C.OutPointer.OptNullType
    structure Pointer = CTypedPointer (ElemType)
    datatype t =
      SMLArray of cstring vector * unit GCharVec.C.out_p array
    | CArray   of Pointer.t Finalizable.t


    fun makeSMLArray (v : string Vector.vector) : t =
      SMLArray (
        Vector.map CString.fromString v,
        Array.array (Vector.length v + 1, GCharVec.C.OutPointer.null)
      )

    type vector = string Vector.vector
    type elem = string

    structure C =
      struct
        type 'a p = 'a Pointer.p
        type notnull = Pointer.notnull

        val dupSMLValue_ =
          _import "g_string_vector_sml_dup"
            : cstring Vector.vector * unit GCharVec.C.out_p array -> notnull p;
        val dupPointer_ = _import "g_strdupv" : notnull p -> notnull p;
        val free_ = _import "g_strfreev" : notnull p -> unit;
        val len_ = _import "g_strv_length" : notnull p -> int;

        val free = free_
        val len = len_
        fun sub p i =
          GCharVec.C.OutPointer.toNotNull (Pointer.get (p, i))
            handle GCharVec.C.OutPointer.Null => raise Subscript
        (* For `sub p i` we must ensure `0 <= i andalso i < len p` *)

        type 'a tabulator = int * (int -> elem) -> 'a


        (**
         * Conversion functions from C arrays
         *)
        fun toSMLValue (tabulate : 'a tabulator) (p : notnull p) : 'a =
          tabulate (len p, GCharVec.C.copyPtrToVector o sub p)


        (**
         * Return values
         *)

        structure OutPointer = Pointer
        type 'a out_p = 'a OutPointer.p

        fun fromPtr (p : notnull out_p) : t =
          CArray (Finalizable.new p)

        fun fromNewPtr (p : notnull out_p) : t =
          let
            val arr = Finalizable.new p
          in
            Finalizable.addFinalizer (arr, free);
            CArray arr
          end

        fun copyPtr (p : notnull out_p) : t =
          makeSMLArray (toSMLValue Vector.tabulate p)

        fun copyNewPtr (p : notnull out_p) : t =
          copyPtr p before free p

        fun copyPtrToTabulated
          (tabulate : 'a tabulator) (p : notnull out_p) : 'a =
          toSMLValue tabulate p

        fun copyNewPtrToTabulated
          (tabulate : 'a tabulator) (p : notnull out_p) : 'a =
          copyPtrToTabulated tabulate p before free p

        fun copyPtrToVector (p : notnull out_p) : vector =
          copyPtrToTabulated Vector.tabulate p

        fun copyNewPtrToVector (p : notnull out_p) : vector =
          copyPtrToVector p before free p


        fun fromOptPtr (p : 'a out_p) : t option =
          Option.map fromPtr (Pointer.toOpt p)

        fun fromNewOptPtr (p : 'a out_p) : t option =
          Option.map fromNewPtr (Pointer.toOpt p)
          (* No finalizer added for null pointer.  Although g_free can be
           * called with a null pointer, adding unnecessary finalizers is
           * less efficient. *)

        fun copyOptPtr (p : 'a out_p) : t option =
          Option.map copyPtr (Pointer.toOpt p)

        fun copyNewOptPtr (p : 'a out_p) : t option =
          Option.map copyNewPtr (Pointer.toOpt p)

        fun copyOptPtrToTabulated
          (tabulate : 'b tabulator) (p : 'a out_p) : 'b option =
          Option.map (copyPtrToTabulated tabulate) (Pointer.toOpt p)

        fun copyNewOptPtrToTabulated
          (tabulate : 'b tabulator) (p : 'a out_p) : 'b option =
          Option.map (copyNewPtrToTabulated tabulate) (Pointer.toOpt p)

        fun copyOptPtrToVector (p : 'a out_p) : vector option =
          Option.map copyPtrToVector (Pointer.toOpt p)

        fun copyNewOptPtrToVector (p : 'a out_p) : vector option =
          Option.map copyNewPtrToVector (Pointer.toOpt p)


        fun fromVector v =
          case makeSMLArray v of
            SMLArray x => dupSMLValue_ x
          | CArray t   => Finalizable.withValue (t, dupPointer_)


        (**
         * Support for value and reference parameter encoding
         *
         * There are many possible values that can be used to represent the
         * null pointer across the FFI because many possible values exist for
         * the non-null pointers used in the encoding.  `nonNullElem` and
         * `nonNull` are the representative non-null pointers.
         *)

        val nullElem = GCharVec.C.OutPointer.null
        val nonNullElem = GCharVec.C.OutPointer.sub (nullElem, 0w1)

        val nonNull = Pointer.sub (Pointer.null, 0w1)

        val toCStringVector = Vector.fromList o map CString.fromString
        val toArray = Array.fromList


        (**
         * Value parameters
         *
         * The C interface uses three parameters, sml_vec, sml_arr and c_arr,
         * with a C-side transformation that derives a single pointer arr from
         * sml_vec, sml_arr and c_arr according to the following table:
         *
         *               unit                            |
         *   cstring      GCharVec.C.out_p   unit p      |
         *    vector      array                          |
         *                                               |
         *   gchar **    gchar **            gchar **    | gchar **
         *   sml_vec     sml_arr             c_arr       | arr
         *   --------------------------------------------+---------
         *   {...}       {...}               NULL        | sml_arr [1]
         *   {...}       {NULL}              non-NULL    | NULL
         *   {...}       {non-NULL, ...}     non-NULL    | c_arr
         *
         *   [1] sml_arr[i] := sml_vec[i] for 0 <= i < length sml_vec
         *
         *   Note
         *     {...}           is any array
         *     {NULL}          is the empty array
         *     {non-NULL, ...} is an array of length 1 or more
         *
         * The local functions `fromPointer` and `fromSMLValue` construct the
         * SML-side values for sml_vec, sml_arr and c_arr.
         *)
        type 'a in_p = cstring Vector.vector * unit GCharVec.C.out_p array * unit p

        local
          fun fromPointer (p : 'a p) : 'b in_p =
            if Pointer.isNull p
            then (toCStringVector [], toArray [nullElem],    nonNull)
            else (toCStringVector [], toArray [nullElem,
                                               nonNullElem], Pointer.toOptNull p)

          fun fromSMLValue
            (v : cstring Vector.vector, a : unit GCharVec.C.out_p array) : 'a in_p =
            (v, a, Pointer.null)

          fun withPointer f p = f (fromPointer p)

          fun withDupPointer f p =
            p & withPointer f p handle e => (Pointer.appOpt free p; raise e)
        in
          fun withPtr _ = raise Fail "mutable arguments are not supported"

          fun withConstPtr f =
            fn
              SMLArray x => f (fromSMLValue x)
            | CArray arr => Finalizable.withValue (arr, withPointer f)

          fun withDupPtr f =
            fn
              SMLArray x => withDupPointer f (dupSMLValue_ x) 
            | CArray arr =>
                Finalizable.withValue (arr, withDupPointer f o dupPointer_)


          fun withOptPtr _ = raise Fail "mutable arguments are not supported"

          fun withConstOptPtr f =
            fn
              SOME (SMLArray x) => f (fromSMLValue x)
            | SOME (CArray arr) => Finalizable.withValue (arr, withPointer f)
            | NONE              => withPointer f Pointer.null

          fun withDupOptPtr f =
            fn
              SOME (SMLArray x) =>
                withDupPointer f (Pointer.toOptNull (dupSMLValue_ x) )
            | SOME (CArray arr) =>
                Finalizable.withValue
                  (arr, withDupPointer f o Pointer.toOptNull o dupPointer_)
            | NONE              => withDupPointer f Pointer.null
        end


        (**
         * Reference parameters
         *
         * The C interface uses three parameters, sml_vec, sml_arr and
         * c_arr_ptr, with a C-side transformation that derives a single
         * pointer arr_ptr from sml_vec, sml_arr and c_arr_ptr according to
         * the following table:
         *
         *               unit                                    |
         *   cstring      GCharVec.C.out_p   unit p ref          |
         *    vector      array                                  |
         *                                                       |
         *   gchar **    gchar **            gchar ***           | gchar **
         *   sml_vec     sml_arr             c_arr_ptr           | arr_ptr
         *   ----------------------------------------------------+---------
         *   {...}       {...}               pointer to NULL     | c_arr_ptr [1, 2]
         *   {...}       {NULL}              pointer to non-NULL | NULL
         *   {...}       {non-NULL, NULL}    pointer to non-NULL | pointer to NULL
         *   {...}       {non-NULL,          pointer to non-NULL | c_arr_ptr
         *                non-NULL, ...}
         *
         *   [1] sml_arr[i] := sml_vec[i] for 0 <= i < length sml_vec
         *   [2] *c_arr_ptr := sml_arr
         *
         *   Note
         *     {...}                     is any array
         *     {NULL}                    is the empty array
         *     {non-NULL, NULL}          is an array of length 1
         *     {non-NULL, non-NULL, ...} is an array of length 2 or more
         *
         * The local functions `null`, `fromPointer` and `fromSMLValue`
         * construct the SML-side values for sml_vec, sml_arr and c_arr_ptr.
         *)
        type ('a, 'b) r =
          cstring Vector.vector * unit GCharVec.C.out_p array * (unit, 'b) Pointer.r

        fun toRef x = Pointer.MLton.toRef x
        fun fromRef x = Pointer.MLton.fromRef x

        local
          (* `null` needs to be a function to work around the value restriction *)
          fun null () : ('a, 'b) r =
                 (toCStringVector [], toArray [nullElem],    toRef nonNull)

          fun fromPointer (p : 'a p) : ('b, 'c) r =
            if Pointer.isNull p
            then (toCStringVector [], toArray [nullElem,
                                               nonNullElem], toRef nonNull)
            else (toCStringVector [], toArray [nullElem,
                                               nullElem,
                                               nonNullElem], toRef (Pointer.toOptNull p))

          fun fromSMLValue
            (v : cstring Vector.vector, a : unit GCharVec.C.out_p array) :
              ('a, 'b) r =
                 (v,                  a,                     toRef Pointer.null)

          fun apply f (x as (_, _, e)) =
            let val y = f x in fromRef e & y end
            (* must evaluate `f x` before `fromRef e` *)

          fun withRefPointer f p = f (fromPointer p)

          fun withRefDupPointer f p =
            withRefPointer f p handle e => (Pointer.appOpt free p; raise e)
        in
          fun withNullRef f () = f (null ())


          fun withRefPtr _ = raise Fail "mutable arguments are not supported"

          fun withRefConstPtr f =
            fn
              SMLArray x => apply f (fromSMLValue x)
            | CArray arr => Finalizable.withValue (arr, withRefPointer (apply f))

          fun withRefDupPtr f =
            fn
              SMLArray x => withRefDupPointer (apply f) (dupSMLValue_ x)
            | CArray arr =>
                Finalizable.withValue
                  (arr, withRefDupPointer (apply f) o dupPointer_)


          fun withRefOptPtr _ = raise Fail "mutable arguments are not supported"

          fun withRefConstOptPtr f =
            fn
              SOME (SMLArray x) => apply f (fromSMLValue x)
            | SOME (CArray arr) =>
                Finalizable.withValue (arr, withRefPointer (apply f))
            | NONE              => withRefPointer (apply f) Pointer.null

          fun withRefDupOptPtr f =
            fn
              SOME (SMLArray x) => withRefDupPointer (apply f) (dupSMLValue_ x)
            | SOME (CArray arr) =>
                Finalizable.withValue
                  (arr, withRefDupPointer (apply f) o dupPointer_)
            | NONE              => withRefDupPointer (apply f) Pointer.null
        end
      end


    fun fromVector v = makeSMLArray v

    val toVector =
      fn
        SMLArray (v, _) => Vector.map CString.toString v
      | CArray arr      => Finalizable.withValue (arr, C.copyPtrToVector)

    val length =
      fn
        SMLArray (v, _) => Vector.length v
      | CArray arr      => Finalizable.withValue (arr, C.len)

    val sub =
      fn
        SMLArray (v, _) => (
          fn i => CString.toString (Vector.sub (v, i))
        )
      | CArray arr      =>
          let
            val len = length (CArray arr)
            val sub = Finalizable.withValue (arr, C.sub)
          in
            fn i =>
              if 0 <= i andalso i < len
              then GCharVec.C.copyPtrToVector (sub i)
              else raise Subscript
          end


    structure MLton =
      struct
        type p1 = cstring Vector.vector
        type p2 = unit GCharVec.C.out_p array
        type 'a p3 = unit Pointer.p

        type r1 = cstring Vector.vector
        type r2 = unit GCharVec.C.out_p array
        type ('a, 'b) r3 = (unit, 'b) Pointer.r
      end
  end
