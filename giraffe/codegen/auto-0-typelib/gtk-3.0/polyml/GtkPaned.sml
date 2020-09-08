structure GtkPaned :>
  GTK_PANED
    where type 'a class = 'a GtkPanedClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type orientation_t = GtkOrientation.t
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type scroll_type_t = GtkScrollType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_paned_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_paned_new") (GtkOrientation.PolyML.cVal --> GtkWidgetClass.PolyML.cPtr)
      val add1_ = call (getSymbol "gtk_paned_add1") (GtkPanedClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> cVoid)
      val add2_ = call (getSymbol "gtk_paned_add2") (GtkPanedClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> cVoid)
      val getChild1_ = call (getSymbol "gtk_paned_get_child1") (GtkPanedClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cOptPtr)
      val getChild2_ = call (getSymbol "gtk_paned_get_child2") (GtkPanedClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cOptPtr)
      val getHandleWindow_ = call (getSymbol "gtk_paned_get_handle_window") (GtkPanedClass.PolyML.cPtr --> GdkWindowClass.PolyML.cPtr)
      val getPosition_ = call (getSymbol "gtk_paned_get_position") (GtkPanedClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getWideHandle_ = call (getSymbol "gtk_paned_get_wide_handle") (GtkPanedClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val pack1_ =
        call (getSymbol "gtk_paned_pack1")
          (
            GtkPanedClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val pack2_ =
        call (getSymbol "gtk_paned_pack2")
          (
            GtkPanedClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val setPosition_ = call (getSymbol "gtk_paned_set_position") (GtkPanedClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setWideHandle_ = call (getSymbol "gtk_paned_set_wide_handle") (GtkPanedClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkPanedClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type orientation_t = GtkOrientation.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type scroll_type_t = GtkScrollType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr false ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new orientation = (GtkOrientation.FFI.withVal ---> GtkPanedClass.FFI.fromPtr false) new_ orientation
    fun add1 self child = (GtkPanedClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> I) add1_ (self & child)
    fun add2 self child = (GtkPanedClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> I) add2_ (self & child)
    fun getChild1 self = (GtkPanedClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getChild1_ self
    fun getChild2 self = (GtkPanedClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getChild2_ self
    fun getHandleWindow self = (GtkPanedClass.FFI.withPtr false ---> GdkWindowClass.FFI.fromPtr false) getHandleWindow_ self
    fun getPosition self = (GtkPanedClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getPosition_ self
    fun getWideHandle self = (GtkPanedClass.FFI.withPtr false ---> GBool.FFI.fromVal) getWideHandle_ self
    fun pack1
      self
      (
        child,
        resize,
        shrink
      ) =
      (
        GtkPanedClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GBool.FFI.withVal
         &&&> GBool.FFI.withVal
         ---> I
      )
        pack1_
        (
          self
           & child
           & resize
           & shrink
        )
    fun pack2
      self
      (
        child,
        resize,
        shrink
      ) =
      (
        GtkPanedClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GBool.FFI.withVal
         &&&> GBool.FFI.withVal
         ---> I
      )
        pack2_
        (
          self
           & child
           & resize
           & shrink
        )
    fun setPosition self position = (GtkPanedClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setPosition_ (self & position)
    fun setWideHandle self wide = (GtkPanedClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setWideHandle_ (self & wide)
    local
      open ClosureMarshal Signal
    in
      fun acceptPositionSig f = signal "accept-position" (void ---> ret boolean) f
      fun cancelPositionSig f = signal "cancel-position" (void ---> ret boolean) f
      fun cycleChildFocusSig f = signal "cycle-child-focus" (get 0w1 boolean ---> ret boolean) f
      fun cycleHandleFocusSig f = signal "cycle-handle-focus" (get 0w1 boolean ---> ret boolean) f
      fun moveHandleSig f = signal "move-handle" (get 0w1 GtkScrollType.t ---> ret boolean) f
      fun toggleHandleFocusSig f = signal "toggle-handle-focus" (void ---> ret boolean) f
    end
    local
      open ValueAccessor
    in
      val maxPositionProp =
        {
          name = "max-position",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = ignore,
          init = ignore
        }
      val minPositionProp =
        {
          name = "min-position",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = ignore,
          init = ignore
        }
      val positionProp =
        {
          name = "position",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val positionSetProp =
        {
          name = "position-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val wideHandleProp =
        {
          name = "wide-handle",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
