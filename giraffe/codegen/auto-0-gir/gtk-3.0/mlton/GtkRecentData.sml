structure GtkRecentData :>
  GTK_RECENT_DATA
    where type record_t = GtkRecentDataRecord.t =
  struct
    type record_t = GtkRecentDataRecord.t
    type t = record_t
  end
