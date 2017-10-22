structure GtkPadController :>
  GTK_PAD_CONTROLLER
    where type 'a class = 'a GtkPadControllerClass.class
    where type 'a window_class = 'a GtkWindowClass.class
    where type pad_action_type_t = GtkPadActionType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_pad_controller_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (getSymbol "gtk_pad_controller_new")
          (
            GtkWindowClass.PolyML.cPtr
             &&> GioActionGroupClass.PolyML.cPtr
             &&> GdkDeviceClass.PolyML.cOptPtr
             --> GtkPadControllerClass.PolyML.cPtr
          )
      val setAction_ =
        call (getSymbol "gtk_pad_controller_set_action")
          (
            GtkPadControllerClass.PolyML.cPtr
             &&> GtkPadActionType.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
    end
    type 'a class = 'a GtkPadControllerClass.class
    type 'a window_class = 'a GtkWindowClass.class
    type pad_action_type_t = GtkPadActionType.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new
      (
        window,
        group,
        pad
      ) =
      (
        GtkWindowClass.FFI.withPtr
         &&&> GioActionGroupClass.FFI.withPtr
         &&&> GdkDeviceClass.FFI.withOptPtr
         ---> GtkPadControllerClass.FFI.fromPtr true
      )
        new_
        (
          window
           & group
           & pad
        )
    fun setAction
      self
      (
        type',
        index,
        mode,
        label,
        actionName
      ) =
      (
        GtkPadControllerClass.FFI.withPtr
         &&&> GtkPadActionType.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        setAction_
        (
          self
           & type'
           & index
           & mode
           & label
           & actionName
        )
    local
      open Property
    in
      val actionGroupProp =
        {
          get = fn x => get "action-group" GioActionGroupClass.tOpt x,
          set = fn x => set "action-group" GioActionGroupClass.tOpt x
        }
      val padProp =
        {
          get = fn x => get "pad" GdkDeviceClass.tOpt x,
          set = fn x => set "pad" GdkDeviceClass.tOpt x
        }
    end
  end