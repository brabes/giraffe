structure GioRemoteActionGroupClass :>
  GIO_REMOTE_ACTION_GROUP_CLASS
    where type C.opt = GObjectObjectClass.C.opt
    where type C.non_opt = GObjectObjectClass.C.non_opt
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a remote_action_group = unit
    type 'a class = 'a remote_action_group class
  end
