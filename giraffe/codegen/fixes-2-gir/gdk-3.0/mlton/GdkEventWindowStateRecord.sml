structure GdkEventWindowStateRecord :>
  sig
    include GDK_EVENT_WINDOW_STATE_RECORD
      where type 'a event_t = 'a GdkEvent.t
      where type C.notnull = GdkEvent.C.notnull
      where type 'a C.p = 'a GdkEvent.C.p
  end =
  struct
    type window_state = unit
    type 'a event_t = 'a GdkEvent.t
    type t = window_state event_t


    datatype event =
      WINDOW_STATE


    structure C = GdkEvent.C


    val t = GdkEvent.t
  end
