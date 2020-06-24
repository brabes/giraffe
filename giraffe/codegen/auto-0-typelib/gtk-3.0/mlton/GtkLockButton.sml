structure GtkLockButton :>
  GTK_LOCK_BUTTON
    where type 'a class = 'a GtkLockButtonClass.class
    where type 'a actionable_class = 'a GtkActionableClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_lock_button_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_lock_button_new" : GioPermissionClass.FFI.opt GioPermissionClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getPermission_ = _import "gtk_lock_button_get_permission" : GtkLockButtonClass.FFI.non_opt GtkLockButtonClass.FFI.p -> GioPermissionClass.FFI.non_opt GioPermissionClass.FFI.p;
    val setPermission_ = fn x1 & x2 => (_import "gtk_lock_button_set_permission" : GtkLockButtonClass.FFI.non_opt GtkLockButtonClass.FFI.p * GioPermissionClass.FFI.opt GioPermissionClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GtkLockButtonClass.class
    type 'a actionable_class = 'a GtkActionableClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActionable self = (GObjectObjectClass.FFI.withPtr ---> GtkActionableClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new permission = (GioPermissionClass.FFI.withOptPtr ---> GtkLockButtonClass.FFI.fromPtr false) new_ permission
    fun getPermission self = (GtkLockButtonClass.FFI.withPtr ---> GioPermissionClass.FFI.fromPtr false) getPermission_ self
    fun setPermission self permission = (GtkLockButtonClass.FFI.withPtr &&&> GioPermissionClass.FFI.withOptPtr ---> I) setPermission_ (self & permission)
    local
      open Property
    in
      val permissionProp =
        {
          get = fn x => get "permission" GioPermissionClass.tOpt x,
          set = fn x => set "permission" GioPermissionClass.tOpt x,
          new = fn x => new "permission" GioPermissionClass.tOpt x
        }
      val textLockProp =
        {
          get = fn x => get "text-lock" stringOpt x,
          set = fn x => set "text-lock" stringOpt x,
          new = fn x => new "text-lock" stringOpt x
        }
      val textUnlockProp =
        {
          get = fn x => get "text-unlock" stringOpt x,
          set = fn x => set "text-unlock" stringOpt x,
          new = fn x => new "text-unlock" stringOpt x
        }
      val tooltipLockProp =
        {
          get = fn x => get "tooltip-lock" stringOpt x,
          set = fn x => set "tooltip-lock" stringOpt x,
          new = fn x => new "tooltip-lock" stringOpt x
        }
      val tooltipNotAuthorizedProp =
        {
          get = fn x => get "tooltip-not-authorized" stringOpt x,
          set = fn x => set "tooltip-not-authorized" stringOpt x,
          new = fn x => new "tooltip-not-authorized" stringOpt x
        }
      val tooltipUnlockProp =
        {
          get = fn x => get "tooltip-unlock" stringOpt x,
          set = fn x => set "tooltip-unlock" stringOpt x,
          new = fn x => new "tooltip-unlock" stringOpt x
        }
    end
  end
