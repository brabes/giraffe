structure GtkShortcutsWindow :>
  GTK_SHORTCUTS_WINDOW
    where type 'a class = 'a GtkShortcutsWindowClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_shortcuts_window_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GtkShortcutsWindowClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    local
      open ClosureMarshal Signal
    in
      fun closeSig f = signal "close" (void ---> ret_void) f
      fun searchSig f = signal "search" (void ---> ret_void) f
    end
    local
      open Property
    in
      val sectionNameProp =
        {
          get = fn x => get "section-name" stringOpt x,
          set = fn x => set "section-name" stringOpt x
        }
      val viewNameProp =
        {
          get = fn x => get "view-name" stringOpt x,
          set = fn x => set "view-name" stringOpt x
        }
    end
  end