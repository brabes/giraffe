structure GdkAtom :>
  GDK_ATOM
    where type t = GdkAtomRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val name_ = call (getSymbol "gdk_atom_name") (GdkAtomRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val intern_ = call (getSymbol "gdk_atom_intern") (Utf8.PolyML.cInPtr &&> GBool.PolyML.cVal --> GdkAtomRecord.PolyML.cPtr)
      val internStaticString_ = call (getSymbol "gdk_atom_intern_static_string") (Utf8.PolyML.cInPtr --> GdkAtomRecord.PolyML.cPtr)
    end
    type t = GdkAtomRecord.t
    fun name self = (GdkAtomRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) name_ self
    fun intern (atomName, onlyIfExists) = (Utf8.FFI.withPtr 0 &&&> GBool.FFI.withVal ---> GdkAtomRecord.FFI.fromPtr false) intern_ (atomName & onlyIfExists) before Utf8.FFI.touchPtr atomName
    fun internStaticString atomName = (Utf8.FFI.withPtr 0 ---> GdkAtomRecord.FFI.fromPtr false) internStaticString_ atomName before Utf8.FFI.touchPtr atomName
  end
