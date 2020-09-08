structure GtkSourceRegion :>
  GTK_SOURCE_REGION
    where type 'a class = 'a GtkSourceRegionClass.class
    where type region_iter_t = GtkSourceRegionIterRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_source_region_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_source_region_new") (GtkTextBufferClass.PolyML.cPtr --> GtkSourceRegionClass.PolyML.cPtr)
      val addRegion_ = call (getSymbol "gtk_source_region_add_region") (GtkSourceRegionClass.PolyML.cPtr &&> GtkSourceRegionClass.PolyML.cOptPtr --> cVoid)
      val addSubregion_ =
        call (getSymbol "gtk_source_region_add_subregion")
          (
            GtkSourceRegionClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> cVoid
          )
      val getBounds_ =
        call (getSymbol "gtk_source_region_get_bounds")
          (
            GtkSourceRegionClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val getBuffer_ = call (getSymbol "gtk_source_region_get_buffer") (GtkSourceRegionClass.PolyML.cPtr --> GtkTextBufferClass.PolyML.cOptPtr)
      val getStartRegionIter_ = call (getSymbol "gtk_source_region_get_start_region_iter") (GtkSourceRegionClass.PolyML.cPtr &&> GtkSourceRegionIterRecord.PolyML.cPtr --> cVoid)
      val intersectRegion_ = call (getSymbol "gtk_source_region_intersect_region") (GtkSourceRegionClass.PolyML.cPtr &&> GtkSourceRegionClass.PolyML.cOptPtr --> GtkSourceRegionClass.PolyML.cOptPtr)
      val intersectSubregion_ =
        call (getSymbol "gtk_source_region_intersect_subregion")
          (
            GtkSourceRegionClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> GtkSourceRegionClass.PolyML.cOptPtr
          )
      val isEmpty_ = call (getSymbol "gtk_source_region_is_empty") (GtkSourceRegionClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val subtractRegion_ = call (getSymbol "gtk_source_region_subtract_region") (GtkSourceRegionClass.PolyML.cPtr &&> GtkSourceRegionClass.PolyML.cOptPtr --> cVoid)
      val subtractSubregion_ =
        call (getSymbol "gtk_source_region_subtract_subregion")
          (
            GtkSourceRegionClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> cVoid
          )
      val toString_ = call (getSymbol "gtk_source_region_to_string") (GtkSourceRegionClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
    end
    type 'a class = 'a GtkSourceRegionClass.class
    type region_iter_t = GtkSourceRegionIterRecord.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new buffer = (GtkTextBufferClass.FFI.withPtr false ---> GtkSourceRegionClass.FFI.fromPtr true) new_ buffer
    fun addRegion self regionToAdd = (GtkSourceRegionClass.FFI.withPtr false &&&> GtkSourceRegionClass.FFI.withOptPtr false ---> I) addRegion_ (self & regionToAdd)
    fun addSubregion self (start, end') =
      (
        GtkSourceRegionClass.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
         ---> I
      )
        addSubregion_
        (
          self
           & start
           & end'
        )
    fun getBounds self =
      let
        val start
         & end'
         & retVal =
          (
            GtkSourceRegionClass.FFI.withPtr false
             &&&> GtkTextIterRecord.FFI.withNewPtr
             &&&> GtkTextIterRecord.FFI.withNewPtr
             ---> GtkTextIterRecord.FFI.fromPtr true
                   && GtkTextIterRecord.FFI.fromPtr true
                   && GBool.FFI.fromVal
          )
            getBounds_
            (
              self
               & ()
               & ()
            )
      in
        if retVal then SOME (start, end') else NONE
      end
    fun getBuffer self = (GtkSourceRegionClass.FFI.withPtr false ---> GtkTextBufferClass.FFI.fromOptPtr false) getBuffer_ self
    fun getStartRegionIter self =
      let
        val iter & () = (GtkSourceRegionClass.FFI.withPtr false &&&> GtkSourceRegionIterRecord.FFI.withNewPtr ---> GtkSourceRegionIterRecord.FFI.fromPtr true && I) getStartRegionIter_ (self & ())
      in
        iter
      end
    fun intersectRegion self region2 = (GtkSourceRegionClass.FFI.withPtr false &&&> GtkSourceRegionClass.FFI.withOptPtr false ---> GtkSourceRegionClass.FFI.fromOptPtr true) intersectRegion_ (self & region2)
    fun intersectSubregion self (start, end') =
      (
        GtkSourceRegionClass.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
         ---> GtkSourceRegionClass.FFI.fromOptPtr true
      )
        intersectSubregion_
        (
          self
           & start
           & end'
        )
    fun isEmpty self = (GtkSourceRegionClass.FFI.withPtr false ---> GBool.FFI.fromVal) isEmpty_ self
    fun subtractRegion self regionToSubtract = (GtkSourceRegionClass.FFI.withPtr false &&&> GtkSourceRegionClass.FFI.withOptPtr false ---> I) subtractRegion_ (self & regionToSubtract)
    fun subtractSubregion self (start, end') =
      (
        GtkSourceRegionClass.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
         ---> I
      )
        subtractSubregion_
        (
          self
           & start
           & end'
        )
    fun toString self = (GtkSourceRegionClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr ~1) toString_ self
    local
      open ValueAccessor
    in
      val bufferProp =
        {
          name = "buffer",
          gtype = fn () => C.gtype GtkTextBufferClass.tOpt (),
          get = fn x => fn () => C.get GtkTextBufferClass.tOpt x,
          set = ignore,
          init = fn x => C.set GtkTextBufferClass.tOpt x
        }
    end
  end
