structure GdkVisual :>
  GDK_VISUAL
    where type 'a class_t = 'a GdkVisualClass.t
    where type byte_order_t = GdkByteOrder.t
    where type 'a screen_class_t = 'a GdkScreenClass.t
    where type visual_type_t = GdkVisualType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_visual_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getBest_ = call (load_sym libgdk "gdk_visual_get_best") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getBestDepth_ = call (load_sym libgdk "gdk_visual_get_best_depth") (FFI.PolyML.VOID --> FFI.Int.PolyML.VAL)
      val getBestType_ = call (load_sym libgdk "gdk_visual_get_best_type") (FFI.PolyML.VOID --> GdkVisualType.PolyML.VAL)
      val getBestWithBoth_ = call (load_sym libgdk "gdk_visual_get_best_with_both") (FFI.Int.PolyML.VAL &&> GdkVisualType.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val getBestWithDepth_ = call (load_sym libgdk "gdk_visual_get_best_with_depth") (FFI.Int.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val getBestWithType_ = call (load_sym libgdk "gdk_visual_get_best_with_type") (GdkVisualType.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val getSystem_ = call (load_sym libgdk "gdk_visual_get_system") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getBitsPerRgb_ = call (load_sym libgdk "gdk_visual_get_bits_per_rgb") (GObjectObjectClass.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val getBluePixelDetails_ =
        call (load_sym libgdk "gdk_visual_get_blue_pixel_details")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.UInt32.PolyML.REF
             &&> FFI.Int.PolyML.REF
             &&> FFI.Int.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val getByteOrder_ = call (load_sym libgdk "gdk_visual_get_byte_order") (GObjectObjectClass.PolyML.PTR --> GdkByteOrder.PolyML.VAL)
      val getColormapSize_ = call (load_sym libgdk "gdk_visual_get_colormap_size") (GObjectObjectClass.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val getDepth_ = call (load_sym libgdk "gdk_visual_get_depth") (GObjectObjectClass.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val getGreenPixelDetails_ =
        call (load_sym libgdk "gdk_visual_get_green_pixel_details")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.UInt32.PolyML.REF
             &&> FFI.Int.PolyML.REF
             &&> FFI.Int.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val getRedPixelDetails_ =
        call (load_sym libgdk "gdk_visual_get_red_pixel_details")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.UInt32.PolyML.REF
             &&> FFI.Int.PolyML.REF
             &&> FFI.Int.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val getScreen_ = call (load_sym libgdk "gdk_visual_get_screen") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getVisualType_ = call (load_sym libgdk "gdk_visual_get_visual_type") (GObjectObjectClass.PolyML.PTR --> GdkVisualType.PolyML.VAL)
    end
    type 'a class_t = 'a GdkVisualClass.t
    type byte_order_t = GdkByteOrder.t
    type 'a screen_class_t = 'a GdkScreenClass.t
    type visual_type_t = GdkVisualType.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getBest () = (I ---> GdkVisualClass.C.fromPtr false) getBest_ ()
    fun getBestDepth () = (I ---> FFI.Int.C.fromVal) getBestDepth_ ()
    fun getBestType () = (I ---> GdkVisualType.C.fromVal) getBestType_ ()
    fun getBestWithBoth depth visualType = (FFI.Int.C.withVal &&&> GdkVisualType.C.withVal ---> GdkVisualClass.C.fromPtr false) getBestWithBoth_ (depth & visualType)
    fun getBestWithDepth depth = (FFI.Int.C.withVal ---> GdkVisualClass.C.fromPtr false) getBestWithDepth_ depth
    fun getBestWithType visualType = (GdkVisualType.C.withVal ---> GdkVisualClass.C.fromPtr false) getBestWithType_ visualType
    fun getSystem () = (I ---> GdkVisualClass.C.fromPtr false) getSystem_ ()
    fun getBitsPerRgb self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getBitsPerRgb_ self
    fun getBluePixelDetails self =
      let
        val mask
         & shift
         & precision
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.UInt32.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.UInt32.C.fromVal
                   && FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            getBluePixelDetails_
            (
              self
               & FFI.UInt32.null
               & FFI.Int.null
               & FFI.Int.null
            )
      in
        (
          mask,
          shift,
          precision
        )
      end
    fun getByteOrder self = (GObjectObjectClass.C.withPtr ---> GdkByteOrder.C.fromVal) getByteOrder_ self
    fun getColormapSize self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getColormapSize_ self
    fun getDepth self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getDepth_ self
    fun getGreenPixelDetails self =
      let
        val mask
         & shift
         & precision
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.UInt32.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.UInt32.C.fromVal
                   && FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            getGreenPixelDetails_
            (
              self
               & FFI.UInt32.null
               & FFI.Int.null
               & FFI.Int.null
            )
      in
        (
          mask,
          shift,
          precision
        )
      end
    fun getRedPixelDetails self =
      let
        val mask
         & shift
         & precision
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.UInt32.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.UInt32.C.fromVal
                   && FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            getRedPixelDetails_
            (
              self
               & FFI.UInt32.null
               & FFI.Int.null
               & FFI.Int.null
            )
      in
        (
          mask,
          shift,
          precision
        )
      end
    fun getScreen self = (GObjectObjectClass.C.withPtr ---> GdkScreenClass.C.fromPtr false) getScreen_ self
    fun getVisualType self = (GObjectObjectClass.C.withPtr ---> GdkVisualType.C.fromVal) getVisualType_ self
  end
