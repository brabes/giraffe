structure GtkScrollable :>
  GTK_SCROLLABLE
    where type 'a class_t = 'a GtkScrollableClass.t
    where type 'a adjustmentclass_t = 'a GtkAdjustmentClass.t
    where type scrollablepolicy_t = GtkScrollablePolicy.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_scrollable_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getHadjustment_ = call (load_sym libgtk "gtk_scrollable_get_hadjustment") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getHscrollPolicy_ = call (load_sym libgtk "gtk_scrollable_get_hscroll_policy") (GObjectObjectClass.PolyML.PTR --> GtkScrollablePolicy.PolyML.VAL)
      val getVadjustment_ = call (load_sym libgtk "gtk_scrollable_get_vadjustment") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getVscrollPolicy_ = call (load_sym libgtk "gtk_scrollable_get_vscroll_policy") (GObjectObjectClass.PolyML.PTR --> GtkScrollablePolicy.PolyML.VAL)
      val setHadjustment_ = call (load_sym libgtk "gtk_scrollable_set_hadjustment") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setHscrollPolicy_ = call (load_sym libgtk "gtk_scrollable_set_hscroll_policy") (GObjectObjectClass.PolyML.PTR &&> GtkScrollablePolicy.PolyML.VAL --> FFI.PolyML.VOID)
      val setVadjustment_ = call (load_sym libgtk "gtk_scrollable_set_vadjustment") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setVscrollPolicy_ = call (load_sym libgtk "gtk_scrollable_set_vscroll_policy") (GObjectObjectClass.PolyML.PTR &&> GtkScrollablePolicy.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkScrollableClass.t
    type 'a adjustmentclass_t = 'a GtkAdjustmentClass.t
    type scrollablepolicy_t = GtkScrollablePolicy.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getHadjustment self = (GObjectObjectClass.C.withPtr ---> GtkAdjustmentClass.C.fromPtr false) getHadjustment_ self
    fun getHscrollPolicy self = (GObjectObjectClass.C.withPtr ---> GtkScrollablePolicy.C.fromVal) getHscrollPolicy_ self
    fun getVadjustment self = (GObjectObjectClass.C.withPtr ---> GtkAdjustmentClass.C.fromPtr false) getVadjustment_ self
    fun getVscrollPolicy self = (GObjectObjectClass.C.withPtr ---> GtkScrollablePolicy.C.fromVal) getVscrollPolicy_ self
    fun setHadjustment self hadjustment = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setHadjustment_ (self & hadjustment)
    fun setHscrollPolicy self policy = (GObjectObjectClass.C.withPtr &&&> GtkScrollablePolicy.C.withVal ---> I) setHscrollPolicy_ (self & policy)
    fun setVadjustment self vadjustment = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setVadjustment_ (self & vadjustment)
    fun setVscrollPolicy self policy = (GObjectObjectClass.C.withPtr &&&> GtkScrollablePolicy.C.withVal ---> I) setVscrollPolicy_ (self & policy)
    local
      open Property
    in
      val hadjustmentProp =
        {
          get = fn x => get "hadjustment" GtkAdjustmentClass.tOpt x,
          set = fn x => set "hadjustment" GtkAdjustmentClass.tOpt x
        }
      val hscrollPolicyProp =
        {
          get = fn x => get "hscroll-policy" GtkScrollablePolicy.t x,
          set = fn x => set "hscroll-policy" GtkScrollablePolicy.t x
        }
      val vadjustmentProp =
        {
          get = fn x => get "vadjustment" GtkAdjustmentClass.tOpt x,
          set = fn x => set "vadjustment" GtkAdjustmentClass.tOpt x
        }
      val vscrollPolicyProp =
        {
          get = fn x => get "vscroll-policy" GtkScrollablePolicy.t x,
          set = fn x => set "vscroll-policy" GtkScrollablePolicy.t x
        }
    end
  end