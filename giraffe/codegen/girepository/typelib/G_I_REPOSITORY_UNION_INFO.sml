signature G_I_REPOSITORY_UNION_INFO =
  sig
    type 'a class_t
    type 'a fieldinfoclass_t
    type 'a functioninfoclass_t
    type 'a typeinfoclass_t
    type 'a constantinfoclass_t
    val getNFields : 'a class_t -> LargeInt.int
    val getField : 'a class_t -> LargeInt.int -> base fieldinfoclass_t
    val getNMethods : 'a class_t -> LargeInt.int
    val getMethod : 'a class_t -> LargeInt.int -> base functioninfoclass_t
    val isDiscriminated : 'a class_t -> bool
    val getDiscriminatorOffset : 'a class_t -> LargeInt.int
    val getDiscriminatorType : 'a class_t -> base typeinfoclass_t
    val getDiscriminator : 'a class_t -> LargeInt.int -> base constantinfoclass_t
    val findMethod : 'a class_t -> string -> base functioninfoclass_t
    val getSize : 'a class_t -> LargeInt.int
    val getAlignment : 'a class_t -> LargeInt.int
  end
