signature ENUM =
  sig
    include ENUM

    structure PolyML :
      sig
        val cVal : FFI.val_ PolyMLFFI.conversion
        val cRef : FFI.ref_ PolyMLFFI.conversion
      end
  end