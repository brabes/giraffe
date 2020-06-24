structure GioDataInputStream :>
  GIO_DATA_INPUT_STREAM
    where type 'a class = 'a GioDataInputStreamClass.class
    where type 'a seekable_class = 'a GioSeekableClass.class
    where type 'a input_stream_class = 'a GioInputStreamClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class
    where type data_stream_byte_order_t = GioDataStreamByteOrder.t
    where type data_stream_newline_type_t = GioDataStreamNewlineType.t =
  struct
    val getType_ = _import "g_data_input_stream_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_data_input_stream_new" : GioInputStreamClass.FFI.non_opt GioInputStreamClass.FFI.p -> GioDataInputStreamClass.FFI.non_opt GioDataInputStreamClass.FFI.p;
    val getByteOrder_ = _import "g_data_input_stream_get_byte_order" : GioDataInputStreamClass.FFI.non_opt GioDataInputStreamClass.FFI.p -> GioDataStreamByteOrder.FFI.val_;
    val getNewlineType_ = _import "g_data_input_stream_get_newline_type" : GioDataInputStreamClass.FFI.non_opt GioDataInputStreamClass.FFI.p -> GioDataStreamNewlineType.FFI.val_;
    val readByte_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_data_input_stream_read_byte" :
              GioDataInputStreamClass.FFI.non_opt GioDataInputStreamClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GUInt8.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val readInt16_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_data_input_stream_read_int16" :
              GioDataInputStreamClass.FFI.non_opt GioDataInputStreamClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GInt16.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val readInt32_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_data_input_stream_read_int32" :
              GioDataInputStreamClass.FFI.non_opt GioDataInputStreamClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GInt32.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val readInt64_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_data_input_stream_read_int64" :
              GioDataInputStreamClass.FFI.non_opt GioDataInputStreamClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GInt64.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val readLine_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_data_input_stream_read_line" :
              GioDataInputStreamClass.FFI.non_opt GioDataInputStreamClass.FFI.p
               * GSize.FFI.ref_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GUInt8CArray.FFI.opt GUInt8CArray.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val readLineFinish_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_data_input_stream_read_line_finish" :
              GioDataInputStreamClass.FFI.non_opt GioDataInputStreamClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * GSize.FFI.ref_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GUInt8CArray.FFI.opt GUInt8CArray.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val readLineFinishUtf8_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_data_input_stream_read_line_finish_utf8" :
              GioDataInputStreamClass.FFI.non_opt GioDataInputStreamClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * GSize.FFI.ref_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> Utf8.FFI.opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val readLineUtf8_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_data_input_stream_read_line_utf8" :
              GioDataInputStreamClass.FFI.non_opt GioDataInputStreamClass.FFI.p
               * GSize.FFI.ref_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> Utf8.FFI.opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val readUint16_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_data_input_stream_read_uint16" :
              GioDataInputStreamClass.FFI.non_opt GioDataInputStreamClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GUInt16.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val readUint32_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_data_input_stream_read_uint32" :
              GioDataInputStreamClass.FFI.non_opt GioDataInputStreamClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GUInt32.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val readUint64_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_data_input_stream_read_uint64" :
              GioDataInputStreamClass.FFI.non_opt GioDataInputStreamClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GUInt64.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val readUntil_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_g_data_input_stream_read_until" :
              GioDataInputStreamClass.FFI.non_opt GioDataInputStreamClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GSize.FFI.ref_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val readUntilFinish_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_data_input_stream_read_until_finish" :
              GioDataInputStreamClass.FFI.non_opt GioDataInputStreamClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * GSize.FFI.ref_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val readUpto_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "mlton_g_data_input_stream_read_upto" :
              GioDataInputStreamClass.FFI.non_opt GioDataInputStreamClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GSSize.FFI.val_
               * GSize.FFI.ref_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val readUptoFinish_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_data_input_stream_read_upto_finish" :
              GioDataInputStreamClass.FFI.non_opt GioDataInputStreamClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * GSize.FFI.ref_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setByteOrder_ = fn x1 & x2 => (_import "g_data_input_stream_set_byte_order" : GioDataInputStreamClass.FFI.non_opt GioDataInputStreamClass.FFI.p * GioDataStreamByteOrder.FFI.val_ -> unit;) (x1, x2)
    val setNewlineType_ = fn x1 & x2 => (_import "g_data_input_stream_set_newline_type" : GioDataInputStreamClass.FFI.non_opt GioDataInputStreamClass.FFI.p * GioDataStreamNewlineType.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GioDataInputStreamClass.class
    type 'a seekable_class = 'a GioSeekableClass.class
    type 'a input_stream_class = 'a GioInputStreamClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type data_stream_byte_order_t = GioDataStreamByteOrder.t
    type data_stream_newline_type_t = GioDataStreamNewlineType.t
    type t = base class
    fun asSeekable self = (GObjectObjectClass.FFI.withPtr ---> GioSeekableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new baseStream = (GioInputStreamClass.FFI.withPtr ---> GioDataInputStreamClass.FFI.fromPtr true) new_ baseStream
    fun getByteOrder self = (GioDataInputStreamClass.FFI.withPtr ---> GioDataStreamByteOrder.FFI.fromVal) getByteOrder_ self
    fun getNewlineType self = (GioDataInputStreamClass.FFI.withPtr ---> GioDataStreamNewlineType.FFI.fromVal) getNewlineType_ self
    fun readByte self cancellable =
      (
        GioDataInputStreamClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GUInt8.FFI.fromVal
      )
        readByte_
        (
          self
           & cancellable
           & []
        )
    fun readInt16 self cancellable =
      (
        GioDataInputStreamClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GInt16.FFI.fromVal
      )
        readInt16_
        (
          self
           & cancellable
           & []
        )
    fun readInt32 self cancellable =
      (
        GioDataInputStreamClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GInt32.FFI.fromVal
      )
        readInt32_
        (
          self
           & cancellable
           & []
        )
    fun readInt64 self cancellable =
      (
        GioDataInputStreamClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GInt64.FFI.fromVal
      )
        readInt64_
        (
          self
           & cancellable
           & []
        )
    fun readLine self cancellable =
      let
        val length & retVal =
          (
            GioDataInputStreamClass.FFI.withPtr
             &&&> GSize.FFI.withRefVal
             &&&> GioCancellableClass.FFI.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GSize.FFI.fromVal && GUInt8CArray.FFI.fromOptPtr 1
          )
            readLine_
            (
              self
               & GSize.null
               & cancellable
               & []
            )
      in
        (retVal, length)
      end
    fun readLineFinish self result =
      let
        val length & retVal =
          (
            GioDataInputStreamClass.FFI.withPtr
             &&&> GioAsyncResultClass.FFI.withPtr
             &&&> GSize.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GSize.FFI.fromVal && GUInt8CArray.FFI.fromOptPtr 1
          )
            readLineFinish_
            (
              self
               & result
               & GSize.null
               & []
            )
      in
        (retVal, length)
      end
    fun readLineFinishUtf8 self result =
      let
        val length & retVal =
          (
            GioDataInputStreamClass.FFI.withPtr
             &&&> GioAsyncResultClass.FFI.withPtr
             &&&> GSize.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GSize.FFI.fromVal && Utf8.FFI.fromOptPtr 1
          )
            readLineFinishUtf8_
            (
              self
               & result
               & GSize.null
               & []
            )
      in
        (retVal, length)
      end
    fun readLineUtf8 self cancellable =
      let
        val length & retVal =
          (
            GioDataInputStreamClass.FFI.withPtr
             &&&> GSize.FFI.withRefVal
             &&&> GioCancellableClass.FFI.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GSize.FFI.fromVal && Utf8.FFI.fromOptPtr 1
          )
            readLineUtf8_
            (
              self
               & GSize.null
               & cancellable
               & []
            )
      in
        (retVal, length)
      end
    fun readUint16 self cancellable =
      (
        GioDataInputStreamClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GUInt16.FFI.fromVal
      )
        readUint16_
        (
          self
           & cancellable
           & []
        )
    fun readUint32 self cancellable =
      (
        GioDataInputStreamClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GUInt32.FFI.fromVal
      )
        readUint32_
        (
          self
           & cancellable
           & []
        )
    fun readUint64 self cancellable =
      (
        GioDataInputStreamClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GUInt64.FFI.fromVal
      )
        readUint64_
        (
          self
           & cancellable
           & []
        )
    fun readUntil self (stopChars, cancellable) =
      let
        val length & retVal =
          (
            GioDataInputStreamClass.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GSize.FFI.withRefVal
             &&&> GioCancellableClass.FFI.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GSize.FFI.fromVal && Utf8.FFI.fromPtr 1
          )
            readUntil_
            (
              self
               & stopChars
               & GSize.null
               & cancellable
               & []
            )
      in
        (retVal, length)
      end
    fun readUntilFinish self result =
      let
        val length & retVal =
          (
            GioDataInputStreamClass.FFI.withPtr
             &&&> GioAsyncResultClass.FFI.withPtr
             &&&> GSize.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GSize.FFI.fromVal && Utf8.FFI.fromPtr 1
          )
            readUntilFinish_
            (
              self
               & result
               & GSize.null
               & []
            )
      in
        (retVal, length)
      end
    fun readUpto
      self
      (
        stopChars,
        stopCharsLen,
        cancellable
      ) =
      let
        val length & retVal =
          (
            GioDataInputStreamClass.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GSSize.FFI.withVal
             &&&> GSize.FFI.withRefVal
             &&&> GioCancellableClass.FFI.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GSize.FFI.fromVal && Utf8.FFI.fromPtr 1
          )
            readUpto_
            (
              self
               & stopChars
               & stopCharsLen
               & GSize.null
               & cancellable
               & []
            )
      in
        (retVal, length)
      end
    fun readUptoFinish self result =
      let
        val length & retVal =
          (
            GioDataInputStreamClass.FFI.withPtr
             &&&> GioAsyncResultClass.FFI.withPtr
             &&&> GSize.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GSize.FFI.fromVal && Utf8.FFI.fromPtr 1
          )
            readUptoFinish_
            (
              self
               & result
               & GSize.null
               & []
            )
      in
        (retVal, length)
      end
    fun setByteOrder self order = (GioDataInputStreamClass.FFI.withPtr &&&> GioDataStreamByteOrder.FFI.withVal ---> I) setByteOrder_ (self & order)
    fun setNewlineType self type' = (GioDataInputStreamClass.FFI.withPtr &&&> GioDataStreamNewlineType.FFI.withVal ---> I) setNewlineType_ (self & type')
    local
      open Property
    in
      val byteOrderProp =
        {
          get = fn x => get "byte-order" GioDataStreamByteOrder.t x,
          set = fn x => set "byte-order" GioDataStreamByteOrder.t x,
          new = fn x => new "byte-order" GioDataStreamByteOrder.t x
        }
      val newlineTypeProp =
        {
          get = fn x => get "newline-type" GioDataStreamNewlineType.t x,
          set = fn x => set "newline-type" GioDataStreamNewlineType.t x,
          new = fn x => new "newline-type" GioDataStreamNewlineType.t x
        }
    end
  end
