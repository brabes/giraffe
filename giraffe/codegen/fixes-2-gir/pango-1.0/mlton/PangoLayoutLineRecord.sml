structure PangoLayoutLineRecord :>
  sig
    include PANGO_LAYOUT_LINE_RECORD
  end =
  struct
    type notnull = CPointer.notnull
    type 'a p = 'a CPointer.t

    val ref_ = _import "pango_layout_line_ref" : notnull p -> notnull p;

    val unref_ = _import "pango_layout_line_unref" : notnull p -> unit;

    type t = notnull p Finalizable.t

    structure C =
      struct
        structure Pointer = CPointer
        type notnull = notnull
        type 'a p = 'a p

        fun withPtr f x = Finalizable.withValue (x, f)

        fun withOptPtr f =
          fn
            SOME ptr => withPtr (f o Pointer.toOptNull) ptr
          | NONE     => f Pointer.null

        fun fromPtr transfer ptr =
          let
            val object =
              Finalizable.new (
                if transfer
                then ptr  (* take the existing reference *)
                else ref_ ptr
              )
          in
            Finalizable.addFinalizer (object, unref_);
            object
          end

        fun fromOptPtr transfer optptr =
          Option.map (fromPtr transfer) (Pointer.toOpt optptr)
      end
  end