structure GIRepositoryAliasInfo :>
  G_I_REPOSITORY_ALIAS_INFO
    where type 'a class_t = 'a GIRepositoryAliasInfoClass.t
    where type 'a typeinfoclass_t = 'a GIRepositoryTypeInfoClass.t =
  struct
    fun fromBase f = (I && f) o GIRepositoryBaseInfoClass.Obj.unpack
    fun fromAlias f = (I && f) o GIRepositoryAliasInfoClass.Obj.unpack

    fun toBase f = GIRepositoryBaseInfoClass.Obj.pack o (I && f)
    fun toType f = GIRepositoryTypeInfoClass.Obj.pack o (I && f)


    type 'a class_t = 'a GIRepositoryAliasInfoClass.t
    type 'a typeinfoclass_t = 'a GIRepositoryTypeInfoClass.t


    fun getType info =
      let
        val _ & {type_, ...} & _ = (fromBase o fromAlias) I info
        val Info.BASE (ref {instance, ...}) = type_
      in
        case instance of
          Info.TYPE x => ((toBase o toType) I (type_ & x))
        | _           => raise Fail "internal error: expected TYPE info"
      end
  end