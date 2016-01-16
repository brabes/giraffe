(* Copyright (C) 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

infixr 0 &&> -->

structure PolyMLFFI :> POLYML_F_F_I =
  struct
    open Foreign

    val load_lib = loadLibrary
    val load_sym = getSymbol

    structure Memory =
      struct
        open Memory

        structure Pointer =
          struct
            type t = voidStar
            val {size, ...} = LowLevel.cTypePointer
            val toSysWord = voidStar2Sysword
            val fromSysWord = sysWord2VoidStar
            val null = null
            val add = ++
            val sub = --
          end

        val getWord8 = get8
        val getWord16 = get16
        val getWord32 = get32
        val getWord64 = get64
        val setWord8 = set8
        val setWord16 = set16
        val setWord32 = set32
        val setWord64 = set64

        val getPointer = getAddress
        val setPointer = setAddress
      end


    (* `alignUp` copied from Foreign.sml *)
    fun alignUp (s, align) = Word.andb (s + align - 0w1, ~ align)

    fun getArgOffsets (argTypes, optRetType) =
      let
        val init = {
          revArgOffsets = [],
          memSize       =
            case optRetType of
              SOME retType => #size retType
            | NONE         => 0w0
        }
        fun next (argType, {revArgOffsets, memSize}) =
          let
            val argOffset = alignUp (memSize, #align argType)
          in
            {
              revArgOffsets = argOffset :: revArgOffsets,
              memSize       = argOffset + #size argType
            }
          end
        val {revArgOffsets, memSize} = List.foldl next init argTypes
      in
        {argOffsets = rev revArgOffsets, memSize = memSize}
      end

    fun isTypeVoid cType = #ffiType cType () = #ffiType LowLevel.cTypeVoid ()
    fun checkArgType argType =
      if isTypeVoid argType
      then raise Foreign "argument has type void"
      else ()

    structure LowLevel =
      struct
        type ctype = LowLevel.ctype

        fun cFunctionWithAbi abi argTypes retType =
          let
            val () = List.app checkArgType argTypes
            val makeCallback = LowLevel.cFunctionWithAbi abi argTypes retType
            fun getArgAddr (args, ret) = (
              fn i => Memory.getAddress (args, Word.fromInt i),
              ret
            )
          in
            fn f => makeCallback (f o getArgAddr)
          end

        val cFunction = cFunctionWithAbi LibFFI.abiDefault

        fun callWithAbi abi fnAddr argTypes retType =
          let
            val () = List.app checkArgType argTypes
            val callFunc = LowLevel.callwithAbi abi argTypes retType fnAddr
            val {argOffsets, memSize} = getArgOffsets (argTypes, SOME retType)
          in
            fn argStores =>
            fn retLoad =>
              let
                open Memory
                infix ++
                val rMem = malloc memSize
                val argAddrs = List.map (fn offset => rMem ++ offset) argOffsets
                val argFrees = ListPair.mapEq (fn (f, x) => f x) (argStores, argAddrs)
                fun freeAll () = (List.app (fn f => f ()) argFrees; free rMem)
              in
                let
                  val () = callFunc (argAddrs, rMem)
                  val ret = retLoad rMem
                  val () = freeAll ()
                in
                  ret
                end
                  handle e => (freeAll (); raise e)
              end
          end

        fun call fnAddr = callWithAbi LibFFI.abiDefault fnAddr
      end


    fun makeConversion {load, store, ctype} =
      Foreign.makeConversion {
        load = load,
        store = fn (addr, x) => store x addr,
        ctype = ctype
      }

    fun breakConversion conv =
      let
        val {load, store, ctype} = Foreign.breakConversion conv
      in
        {
          load  = load,
          store = fn x => fn addr => store (addr, x),
          ctype = ctype
        }
      end


    type ('as, 'r) func = {
      argTypes   : LowLevel.ctype list,
      retType    : LowLevel.ctype,
      argsStore  : 'as -> (Memory.voidStar -> unit -> unit) list,
      argsLoad   : (int -> Memory.voidStar) -> 'as,
      retStore   : 'r -> Memory.voidStar -> unit,
      retLoad    : Memory.voidStar -> 'r
    }

    fun argConv --> retConv =
      let
        val {ctype = argType, store = argStore, load = argLoad} = breakConversion argConv
        val {ctype = retType, store = retStore, load = retLoad} = breakConversion retConv
        val {argTypes, argsStore, argsLoad} =
          if not (isTypeVoid argType)
          then
            {
              argTypes  = argType :: [],
              argsStore = fn x => argStore x :: [],
              argsLoad  = fn get => argLoad (get 0)
            }
          else
            {
              argTypes  = [],
              argsStore = fn _ => [],
              argsLoad  = fn _ => argLoad Memory.null
            }
      in
        {
          argTypes  = argTypes,
          argsStore = argsStore,
          argsLoad  = argsLoad,
          retType   = retType,
          retStore  = fn x => fn addr => ignore (retStore x addr),
          retLoad   = retLoad
        }
      end

    fun argConv &&> {argTypes, retType, argsStore, argsLoad, retStore, retLoad} =
      let
        val {ctype = argType, store = argStore, load = argLoad} = breakConversion argConv
        fun succ n = n + 1
        val {argTypes, argsStore, argsLoad} =
          if not (isTypeVoid argType)
          then
            {
              argTypes  = argType :: argTypes,
              argsStore = fn x & xs => argStore x :: argsStore xs,
              argsLoad  = fn get => argLoad (get 0) & argsLoad (get o succ)
            }
          else
            {
              argTypes  = argTypes,
              argsStore = fn _ & xs => argsStore xs,
              argsLoad  = fn get => argLoad Memory.null & argsLoad get
            }
      in
        {
          argTypes  = argTypes,
          argsStore = argsStore,
          argsLoad  = argsLoad,
          retType   = retType,
          retStore  = retStore,
          retLoad   = retLoad
        }
      end


    fun cStruct func =
      let
        val {argTypes, argsStore, argsLoad, ...} = func
        val {argOffsets, ...} = getArgOffsets (argTypes, NONE)
        val argOffsetTable = Vector.fromList argOffsets
        val ++ = Memory.++
        infix ++
        fun load addr = argsLoad (fn i => addr ++ Vector.sub (argOffsetTable, i))
        fun store args addr =
          let
            val argStores = argsStore args
            val argAddrs = List.map (fn offset => addr ++ offset) argOffsets
            val argFrees = ListPair.mapEq (fn (f, x) => f x) (argStores, argAddrs)
          in
            fn () => List.app (fn f => f ()) argFrees
          end
      in
        makeConversion {
          load  = load,
          store = store,
          ctype = Foreign.LowLevel.cStruct argTypes
        }
      end


    (* Type `'a closure` copied from Foreign.sml because it is abstract
     * in Foreign, so we can't create our own values.  Therefore function
     * `cFunction` is also copied. *)
    type 'a closure = unit -> Memory.voidStar
    local
      fun load _ = raise Foreign "Cannot return a closure"
      fun store closure addr =
        (Memory.setAddress (addr, 0w0, closure ()); fn () => ())
    in
      val cFunction : ('a -> 'b) closure conversion =
        makeConversion {
          load  = load,
          store = store,
          ctype = Foreign.LowLevel.cTypePointer
        }
    end

    fun closureWithAbi abi (func : ('as, 'r) func) =
      let
        val {argTypes, retType, argsLoad, retStore, ...} = func
        val makeCallback = LowLevel.cFunctionWithAbi abi argTypes retType
        fun callback f (args, ret) = (retStore o f o argsLoad) args ret
      in
        fn f => Memory.memoise (fn () => makeCallback (callback f)) ()
      end

    fun closure func = closureWithAbi LibFFI.abiDefault func


    fun callWithAbi abi fnAddr func =
      let
        val {argTypes, retType, argsStore, retLoad, ...} = func
        val callFunc = LowLevel.callWithAbi abi fnAddr argTypes retType
      in
        fn args => callFunc (argsStore args) retLoad
      end

    fun call fnAddr = callWithAbi LibFFI.abiDefault fnAddr
  end
