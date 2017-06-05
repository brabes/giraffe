structure GtkHsv :>
  GTK_HSV
    where type 'a class = 'a GtkHsvClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type direction_type_t = GtkDirectionType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_hsv_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_hsv_new") (PolyMLFFI.cVoid --> GtkWidgetClass.PolyML.cPtr)
      val toRgb_ =
        call (load_sym libgtk "gtk_hsv_to_rgb")
          (
            GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val getColor_ =
        call (load_sym libgtk "gtk_hsv_get_color")
          (
            GtkHsvClass.PolyML.cPtr
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val getMetrics_ =
        call (load_sym libgtk "gtk_hsv_get_metrics")
          (
            GtkHsvClass.PolyML.cPtr
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val isAdjusting_ = call (load_sym libgtk "gtk_hsv_is_adjusting") (GtkHsvClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setColor_ =
        call (load_sym libgtk "gtk_hsv_set_color")
          (
            GtkHsvClass.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setMetrics_ =
        call (load_sym libgtk "gtk_hsv_set_metrics")
          (
            GtkHsvClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
    end
    type 'a class = 'a GtkHsvClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type direction_type_t = GtkDirectionType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkHsvClass.FFI.fromPtr false) new_ ()
    fun toRgb h s v =
      let
        val r
         & g
         & b
         & () =
          (
            GDouble.FFI.withVal
             &&&> GDouble.FFI.withVal
             &&&> GDouble.FFI.withVal
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             ---> GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && I
          )
            toRgb_
            (
              h
               & s
               & v
               & GDouble.null
               & GDouble.null
               & GDouble.null
            )
      in
        (
          r,
          g,
          b
        )
      end
    fun getColor self =
      let
        val h
         & s
         & v
         & () =
          (
            GtkHsvClass.FFI.withPtr
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             ---> GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && I
          )
            getColor_
            (
              self
               & GDouble.null
               & GDouble.null
               & GDouble.null
            )
      in
        (
          h,
          s,
          v
        )
      end
    fun getMetrics self =
      let
        val size
         & ringWidth
         & () =
          (
            GtkHsvClass.FFI.withPtr
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getMetrics_
            (
              self
               & GInt32.null
               & GInt32.null
            )
      in
        (size, ringWidth)
      end
    fun isAdjusting self = (GtkHsvClass.FFI.withPtr ---> GBool.FFI.fromVal) isAdjusting_ self
    fun setColor self h s v =
      (
        GtkHsvClass.FFI.withPtr
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        setColor_
        (
          self
           & h
           & s
           & v
        )
    fun setMetrics self size ringWidth =
      (
        GtkHsvClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        setMetrics_
        (
          self
           & size
           & ringWidth
        )
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (void ---> ret_void) f
      fun moveSig f = signal "move" (get 0w1 GtkDirectionType.t ---> ret_void) f
    end
  end
