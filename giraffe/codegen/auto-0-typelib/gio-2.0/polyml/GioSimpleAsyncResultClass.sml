structure GioSimpleAsyncResultClass :>
  GIO_SIMPLE_ASYNC_RESULT_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    type 'a simple_async_result = unit
    type 'a t = 'a simple_async_result GObjectObjectClass.t
    fun toBase obj = obj
    val t = GObjectObjectClass.t
    val tOpt = GObjectObjectClass.tOpt
    structure C = GObjectObjectClass.C
  end
