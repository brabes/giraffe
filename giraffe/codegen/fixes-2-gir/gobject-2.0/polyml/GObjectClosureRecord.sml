structure GObjectClosureRecord :>
  sig
    include G_OBJECT_CLOSURE_RECORD
      where type ('a, 'b) value_accessor = ('a, 'b) GObjectValue.accessor

    structure PolyML :
      sig
        val PTR : C.notnull C.p PolyMLFFI.conversion
        val OPTPTR : unit C.p PolyMLFFI.conversion
      end
  end =
  struct
    type notnull = CPointer.notnull
    type 'a p = 'a CPointer.p

    val PTR = CPointer.PolyML.cVal : notnull p PolyMLFFI.conversion
    val OPTPTR = CPointer.PolyML.cOptVal : unit p PolyMLFFI.conversion

    local
      open PolyMLFFI
    in
      val take_ =
        if GiraffeDebug.isEnabled
        then
          call
            (load_sym libgiraffegobject "giraffe_debug_closure_take")
            (PTR --> FFI.PolyML.VOID)
        else
          ignore

      val ref_ =
        call
          (load_sym libgobject "g_closure_ref")
          (PTR --> PTR)

      val sink_ =
        call
          (load_sym libgobject "g_closure_sink")
          (PTR --> FFI.PolyML.VOID)

      val refSink_ =
        if GiraffeDebug.isEnabled
        then 
          call
            (load_sym libgiraffegobject "giraffe_debug_closure_ref_sink")
            (PTR --> PTR)
        else
          fn ptr => ref_ ptr before sink_ ptr  (* must do ref before sink *)

      val unref_ =
        if GiraffeDebug.isEnabled
        then
          call
            (load_sym libgiraffegobject "giraffe_debug_g_closure_unref")
            (PTR --> FFI.PolyML.VOID)
        else
          call
            (load_sym libgobject "g_closure_unref")
            (PTR --> FFI.PolyML.VOID)
    end

    type t = notnull p Finalizable.t

    structure C =
      struct
        structure Pointer = CPointer
        type notnull = notnull
        type 'a p = 'a p

        fun withPtr f ptr = Finalizable.withValue (ptr, Pointer.withVal f)

        fun withOptPtr f =
          fn
            SOME ptr => Finalizable.withValue (ptr, Pointer.withOptVal f o SOME)
          | NONE     => Pointer.withOptVal f NONE

        fun fromPtr transfer ptr =
          let
            val object =
              Finalizable.new (
                if transfer
                then (take_ ptr; ptr)  (* take the existing reference *)
                else refSink_ ptr
              )
          in
            Finalizable.addFinalizer (object, unref_);
            object
          end

        fun fromOptPtr transfer optptr =
          Option.map (fromPtr transfer) (Pointer.fromOptVal optptr)
      end

    structure PolyML =
      struct
        val PTR = PTR
        val OPTPTR = OPTPTR
      end

    local
      open PolyMLFFI
    in
      val getType_ =
        call
          (load_sym libgobject "g_closure_get_type")
          (FFI.PolyML.VOID --> GObjectType.PolyML.VAL);

      val getValue_ =
        call
          (load_sym libgobject "g_value_get_boxed")
          (GObjectValueRecord.PolyML.PTR --> PTR);

      val getOptValue_ =
        call
          (load_sym libgobject "g_value_get_boxed")
          (GObjectValueRecord.PolyML.PTR --> PolyML.OPTPTR);

      val setValue_ =
        call
          (load_sym libgobject "g_value_set_boxed")
          (GObjectValueRecord.PolyML.PTR &&> PTR --> FFI.PolyML.VOID);

      val setOptValue_ =
        call
          (load_sym libgobject "g_value_set_boxed")
          (GObjectValueRecord.PolyML.PTR &&> PolyML.OPTPTR --> FFI.PolyML.VOID);
    end

    type ('a, 'b) value_accessor = ('a, 'b) GObjectValue.accessor

    val t =
      GObjectValue.C.createAccessor {
        getType  = (I ---> GObjectType.C.fromVal) getType_,
        getValue = (I ---> C.fromPtr false) getValue_,
        setValue = (I &&&> C.withPtr ---> I) setValue_
      }

    val tOpt =
      GObjectValue.C.createAccessor {
        getType  = (I ---> GObjectType.C.fromVal) getType_,
        getValue = (I ---> C.fromOptPtr false) getOptValue_,
        setValue = (I &&&> C.withOptPtr ---> I) setOptValue_
      }
  end
