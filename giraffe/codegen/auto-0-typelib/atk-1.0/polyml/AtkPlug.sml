structure AtkPlug :>
  ATK_PLUG
    where type 'a class_t = 'a AtkPlugClass.t
    where type 'a component_class_t = 'a AtkComponentClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_plug_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libatk "atk_plug_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getId_ = call (load_sym libatk "atk_plug_get_id") (GObjectObjectClass.PolyML.PTR --> Utf8.PolyML.RETPTR)
    end
    type 'a class_t = 'a AtkPlugClass.t
    type 'a component_class_t = 'a AtkComponentClass.t
    type t = base class_t
    fun asComponent self = (GObjectObjectClass.C.withPtr ---> AtkComponentClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> AtkPlugClass.C.fromPtr true) new_ ()
    fun getId self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getId_ self
  end
