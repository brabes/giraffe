structure GLibSpawnChildSetupFunc :>
  sig
    include G_LIB_SPAWN_CHILD_SETUP_FUNC

    structure PolyML :
      sig
        val CALLBACK : FFI.callback PolyMLFFI.conversion
      end
  end =
  struct
    type t = unit -> unit

    structure FFI =
      struct
        type callback = (unit -> unit) PolyMLFFI.closure
        local
          open PolyMLFFI
        in
          val makeClosure = closure (cVoid --> cVoid)
        end
        fun withCallback f callback = f (makeClosure callback)
        fun withOptCallback f optCallback =
          withCallback f (
            case optCallback of
              SOME callback => callback
            | NONE          => fn () => ()
          )
      end

    structure PolyML =
      struct
        val CALLBACK = PolyMLFFI.cFunction
      end
  end
