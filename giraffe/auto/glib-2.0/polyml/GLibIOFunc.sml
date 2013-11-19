structure GLibIOFunc :>
  sig
    include
      G_LIB_I_O_FUNC
        where type iochannelrecord_t = GLibIOChannelRecord.t
        where type iocondition_t = GLibIOCondition.t

    structure PolyML :
      sig
        val CALLBACK : C.callback CInterface.Conversion
      end
  end =
  struct
    type iochannelrecord_t = GLibIOChannelRecord.t
    type iocondition_t = GLibIOCondition.t

    type t = GLibIOChannelRecord.t * GLibIOCondition.t -> bool

    structure C =
      struct
        type callback =
          GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p
           * GLibIOCondition.C.val_
           -> FFI.Bool.C.val_
        fun withCallback f cf =
          f (
            fn (
              source : GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p,
              condition : GLibIOCondition.C.val_
            ) =>
              FFI.Bool.C.withVal I (
                cf (
                  GLibIOChannelRecord.C.fromPtr false source,
                  GLibIOCondition.C.fromVal condition
                )
              )
          )
      end

    structure PolyML =
      struct
        val CALLBACK =
          CInterface.FUNCTION2
            (GLibIOChannelRecord.PolyML.PTR, GLibIOCondition.PolyML.VAL)
            FFI.Bool.PolyML.VAL
      end
  end