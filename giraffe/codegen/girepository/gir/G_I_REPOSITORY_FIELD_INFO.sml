signature G_I_REPOSITORY_FIELD_INFO =
  sig
    type 'a class_t
    type 'a typeinfoclass_t
    type fieldinfoflags_t
    val getFlags : 'a class_t -> fieldinfoflags_t
    val getType : 'a class_t -> base typeinfoclass_t
  end
