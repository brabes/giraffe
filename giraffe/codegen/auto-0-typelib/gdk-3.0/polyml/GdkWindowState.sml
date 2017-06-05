structure GdkWindowState :> GDK_WINDOW_STATE =
  struct
    val WITHDRAWN = 0w1
    val ICONIFIED = 0w2
    val MAXIMIZED = 0w4
    val STICKY = 0w8
    val FULLSCREEN = 0w16
    val ABOVE = 0w32
    val BELOW = 0w64
    val allFlags =
      [
        WITHDRAWN,
        ICONIFIED,
        MAXIMIZED,
        STICKY,
        FULLSCREEN,
        ABOVE,
        BELOW
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_window_state_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (load_sym libgobject "g_value_get_flags") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (load_sym libgobject "g_value_set_flags") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
