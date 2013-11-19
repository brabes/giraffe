signature G_OBJECT_TYPE_MODULE_CLASS =
  sig
    type 'a typemodule
    type 'a objectclass_t
    type 'a t = 'a typemodule objectclass_t
    val toBase : 'a t -> base t
    type ('a, 'b) value_accessor
    val t : (base t, 'a t) value_accessor
    val tOpt : (base t option, 'a t option) value_accessor
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr :
          bool
           -> notnull p
           -> 'a t
        val fromOptPtr :
          bool
           -> unit p
           -> 'a t option
      end
  end