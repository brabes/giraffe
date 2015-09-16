structure GioUnixOutputStream :>
  GIO_UNIX_OUTPUT_STREAM
    where type 'a class_t = 'a GioUnixOutputStreamClass.t
    where type 'a pollable_output_stream_class_t = 'a GioPollableOutputStreamClass.t =
  struct
    val getType_ = _import "g_unix_output_stream_get_type" : unit -> GObjectType.C.val_;
    val new_ = fn x1 & x2 => (_import "g_unix_output_stream_new" : FFI.Int32.C.val_ * FFI.Bool.C.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getCloseFd_ = _import "g_unix_output_stream_get_close_fd" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getFd_ = _import "g_unix_output_stream_get_fd" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.C.val_;
    val setCloseFd_ = fn x1 & x2 => (_import "g_unix_output_stream_set_close_fd" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    type 'a class_t = 'a GioUnixOutputStreamClass.t
    type 'a pollable_output_stream_class_t = 'a GioPollableOutputStreamClass.t
    type t = base class_t
    fun asPollableOutputStream self = (GObjectObjectClass.C.withPtr ---> GioPollableOutputStreamClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new fd closeFd = (FFI.Int32.C.withVal &&&> FFI.Bool.C.withVal ---> GioUnixOutputStreamClass.C.fromPtr true) new_ (fd & closeFd)
    fun getCloseFd self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getCloseFd_ self
    fun getFd self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getFd_ self
    fun setCloseFd self closeFd = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setCloseFd_ (self & closeFd)
    local
      open Property
    in
      val closeFdProp =
        {
          get = fn x => get "close-fd" boolean x,
          set = fn x => set "close-fd" boolean x
        }
      val fdProp =
        {
          get = fn x => get "fd" int x,
          set = fn x => set "fd" int x
        }
    end
  end
