structure GtkApplication :>
  GTK_APPLICATION
    where type 'a class = 'a GtkApplicationClass.class
    where type application_inhibit_flags_t = GtkApplicationInhibitFlags.t
    where type 'a window_class = 'a GtkWindowClass.class =
  struct
    val getType_ = _import "gtk_application_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_application_new" :
              Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * GioApplicationFlags.FFI.val_
               -> GtkApplicationClass.FFI.non_opt GtkApplicationClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val addAccelerator_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_gtk_application_add_accelerator" :
              GtkApplicationClass.FFI.non_opt GtkApplicationClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GLibVariantRecord.FFI.opt GLibVariantRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val addWindow_ = fn x1 & x2 => (_import "gtk_application_add_window" : GtkApplicationClass.FFI.non_opt GtkApplicationClass.FFI.p * GtkWindowClass.FFI.non_opt GtkWindowClass.FFI.p -> unit;) (x1, x2)
    val getAccelsForAction_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_application_get_accels_for_action" :
              GtkApplicationClass.FFI.non_opt GtkApplicationClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getActionsForAccel_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_application_get_actions_for_accel" :
              GtkApplicationClass.FFI.non_opt GtkApplicationClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getActiveWindow_ = _import "gtk_application_get_active_window" : GtkApplicationClass.FFI.non_opt GtkApplicationClass.FFI.p -> GtkWindowClass.FFI.opt GtkWindowClass.FFI.p;
    val getAppMenu_ = _import "gtk_application_get_app_menu" : GtkApplicationClass.FFI.non_opt GtkApplicationClass.FFI.p -> GioMenuModelClass.FFI.opt GioMenuModelClass.FFI.p;
    val getMenuById_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_application_get_menu_by_id" :
              GtkApplicationClass.FFI.non_opt GtkApplicationClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GioMenuClass.FFI.non_opt GioMenuClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getMenubar_ = _import "gtk_application_get_menubar" : GtkApplicationClass.FFI.non_opt GtkApplicationClass.FFI.p -> GioMenuModelClass.FFI.non_opt GioMenuModelClass.FFI.p;
    val getWindowById_ = fn x1 & x2 => (_import "gtk_application_get_window_by_id" : GtkApplicationClass.FFI.non_opt GtkApplicationClass.FFI.p * GUInt32.FFI.val_ -> GtkWindowClass.FFI.opt GtkWindowClass.FFI.p;) (x1, x2)
    val inhibit_ =
      fn
        x1
         & x2
         & x3
         & (x4, x5) =>
          (
            _import "mlton_gtk_application_inhibit" :
              GtkApplicationClass.FFI.non_opt GtkApplicationClass.FFI.p
               * GtkWindowClass.FFI.opt GtkWindowClass.FFI.p
               * GtkApplicationInhibitFlags.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> GUInt32.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val isInhibited_ = fn x1 & x2 => (_import "gtk_application_is_inhibited" : GtkApplicationClass.FFI.non_opt GtkApplicationClass.FFI.p * GtkApplicationInhibitFlags.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val listActionDescriptions_ = _import "gtk_application_list_action_descriptions" : GtkApplicationClass.FFI.non_opt GtkApplicationClass.FFI.p -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
    val prefersAppMenu_ = _import "gtk_application_prefers_app_menu" : GtkApplicationClass.FFI.non_opt GtkApplicationClass.FFI.p -> GBool.FFI.val_;
    val removeAccelerator_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_application_remove_accelerator" :
              GtkApplicationClass.FFI.non_opt GtkApplicationClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GLibVariantRecord.FFI.opt GLibVariantRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val removeWindow_ = fn x1 & x2 => (_import "gtk_application_remove_window" : GtkApplicationClass.FFI.non_opt GtkApplicationClass.FFI.p * GtkWindowClass.FFI.non_opt GtkWindowClass.FFI.p -> unit;) (x1, x2)
    val setAccelsForAction_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_gtk_application_set_accels_for_action" :
              GtkApplicationClass.FFI.non_opt GtkApplicationClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8CPtrArray.MLton.p1
               * Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val setAppMenu_ = fn x1 & x2 => (_import "gtk_application_set_app_menu" : GtkApplicationClass.FFI.non_opt GtkApplicationClass.FFI.p * GioMenuModelClass.FFI.opt GioMenuModelClass.FFI.p -> unit;) (x1, x2)
    val setMenubar_ = fn x1 & x2 => (_import "gtk_application_set_menubar" : GtkApplicationClass.FFI.non_opt GtkApplicationClass.FFI.p * GioMenuModelClass.FFI.opt GioMenuModelClass.FFI.p -> unit;) (x1, x2)
    val uninhibit_ = fn x1 & x2 => (_import "gtk_application_uninhibit" : GtkApplicationClass.FFI.non_opt GtkApplicationClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkApplicationClass.class
    type application_inhibit_flags_t = GtkApplicationInhibitFlags.t
    type 'a window_class = 'a GtkWindowClass.class
    type t = base class
    fun asActionGroup self = (GObjectObjectClass.FFI.withPtr ---> GioActionGroupClass.FFI.fromPtr false) I self
    fun asActionMap self = (GObjectObjectClass.FFI.withPtr ---> GioActionMapClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (applicationId, flags) = (Utf8.FFI.withOptPtr &&&> GioApplicationFlags.FFI.withVal ---> GtkApplicationClass.FFI.fromPtr true) new_ (applicationId & flags)
    fun addAccelerator
      self
      (
        accelerator,
        actionName,
        parameter
      ) =
      (
        GtkApplicationClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibVariantRecord.FFI.withOptPtr
         ---> I
      )
        addAccelerator_
        (
          self
           & accelerator
           & actionName
           & parameter
        )
    fun addWindow self window = (GtkApplicationClass.FFI.withPtr &&&> GtkWindowClass.FFI.withPtr ---> I) addWindow_ (self & window)
    fun getAccelsForAction self detailedActionName = (GtkApplicationClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8CPtrArray.FFI.fromPtr 2) getAccelsForAction_ (self & detailedActionName)
    fun getActionsForAccel self accel = (GtkApplicationClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8CPtrArray.FFI.fromPtr 2) getActionsForAccel_ (self & accel)
    fun getActiveWindow self = (GtkApplicationClass.FFI.withPtr ---> GtkWindowClass.FFI.fromOptPtr false) getActiveWindow_ self
    fun getAppMenu self = (GtkApplicationClass.FFI.withPtr ---> GioMenuModelClass.FFI.fromOptPtr false) getAppMenu_ self
    fun getMenuById self id = (GtkApplicationClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GioMenuClass.FFI.fromPtr false) getMenuById_ (self & id)
    fun getMenubar self = (GtkApplicationClass.FFI.withPtr ---> GioMenuModelClass.FFI.fromPtr false) getMenubar_ self
    fun getWindowById self id = (GtkApplicationClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> GtkWindowClass.FFI.fromOptPtr false) getWindowById_ (self & id)
    fun inhibit
      self
      (
        window,
        flags,
        reason
      ) =
      (
        GtkApplicationClass.FFI.withPtr
         &&&> GtkWindowClass.FFI.withOptPtr
         &&&> GtkApplicationInhibitFlags.FFI.withVal
         &&&> Utf8.FFI.withOptPtr
         ---> GUInt32.FFI.fromVal
      )
        inhibit_
        (
          self
           & window
           & flags
           & reason
        )
    fun isInhibited self flags = (GtkApplicationClass.FFI.withPtr &&&> GtkApplicationInhibitFlags.FFI.withVal ---> GBool.FFI.fromVal) isInhibited_ (self & flags)
    fun listActionDescriptions self = (GtkApplicationClass.FFI.withPtr ---> Utf8CPtrArray.FFI.fromPtr 2) listActionDescriptions_ self
    fun prefersAppMenu self = (GtkApplicationClass.FFI.withPtr ---> GBool.FFI.fromVal) prefersAppMenu_ self
    fun removeAccelerator self (actionName, parameter) =
      (
        GtkApplicationClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibVariantRecord.FFI.withOptPtr
         ---> I
      )
        removeAccelerator_
        (
          self
           & actionName
           & parameter
        )
    fun removeWindow self window = (GtkApplicationClass.FFI.withPtr &&&> GtkWindowClass.FFI.withPtr ---> I) removeWindow_ (self & window)
    fun setAccelsForAction self (detailedActionName, accels) =
      (
        GtkApplicationClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8CPtrArray.FFI.withPtr
         ---> I
      )
        setAccelsForAction_
        (
          self
           & detailedActionName
           & accels
        )
    fun setAppMenu self appMenu = (GtkApplicationClass.FFI.withPtr &&&> GioMenuModelClass.FFI.withOptPtr ---> I) setAppMenu_ (self & appMenu)
    fun setMenubar self menubar = (GtkApplicationClass.FFI.withPtr &&&> GioMenuModelClass.FFI.withOptPtr ---> I) setMenubar_ (self & menubar)
    fun uninhibit self cookie = (GtkApplicationClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) uninhibit_ (self & cookie)
    local
      open ClosureMarshal Signal
    in
      fun windowAddedSig f = signal "window-added" (get 0w1 GtkWindowClass.t ---> ret_void) f
      fun windowRemovedSig f = signal "window-removed" (get 0w1 GtkWindowClass.t ---> ret_void) f
    end
    local
      open Property
    in
      val activeWindowProp = {get = fn x => get "active-window" GtkWindowClass.tOpt x}
      val appMenuProp =
        {
          get = fn x => get "app-menu" GioMenuModelClass.tOpt x,
          set = fn x => set "app-menu" GioMenuModelClass.tOpt x,
          new = fn x => new "app-menu" GioMenuModelClass.tOpt x
        }
      val menubarProp =
        {
          get = fn x => get "menubar" GioMenuModelClass.tOpt x,
          set = fn x => set "menubar" GioMenuModelClass.tOpt x,
          new = fn x => new "menubar" GioMenuModelClass.tOpt x
        }
      val registerSessionProp =
        {
          get = fn x => get "register-session" boolean x,
          set = fn x => set "register-session" boolean x,
          new = fn x => new "register-session" boolean x
        }
    end
  end
