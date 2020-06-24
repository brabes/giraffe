structure AtkHypertext :>
  ATK_HYPERTEXT
    where type 'a class = 'a AtkHypertextClass.class
    where type 'a hyperlink_class = 'a AtkHyperlinkClass.class =
  struct
    val getType_ = _import "atk_hypertext_get_type" : unit -> GObjectType.FFI.val_;
    val getLink_ = fn x1 & x2 => (_import "atk_hypertext_get_link" : AtkHypertextClass.FFI.non_opt AtkHypertextClass.FFI.p * GInt.FFI.val_ -> AtkHyperlinkClass.FFI.non_opt AtkHyperlinkClass.FFI.p;) (x1, x2)
    val getLinkIndex_ = fn x1 & x2 => (_import "atk_hypertext_get_link_index" : AtkHypertextClass.FFI.non_opt AtkHypertextClass.FFI.p * GInt.FFI.val_ -> GInt.FFI.val_;) (x1, x2)
    val getNLinks_ = _import "atk_hypertext_get_n_links" : AtkHypertextClass.FFI.non_opt AtkHypertextClass.FFI.p -> GInt.FFI.val_;
    type 'a class = 'a AtkHypertextClass.class
    type 'a hyperlink_class = 'a AtkHyperlinkClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getLink self linkIndex = (AtkHypertextClass.FFI.withPtr &&&> GInt.FFI.withVal ---> AtkHyperlinkClass.FFI.fromPtr false) getLink_ (self & linkIndex)
    fun getLinkIndex self charIndex = (AtkHypertextClass.FFI.withPtr &&&> GInt.FFI.withVal ---> GInt.FFI.fromVal) getLinkIndex_ (self & charIndex)
    fun getNLinks self = (AtkHypertextClass.FFI.withPtr ---> GInt.FFI.fromVal) getNLinks_ self
    local
      open ClosureMarshal Signal
    in
      fun linkSelectedSig f = signal "link-selected" (get 0w1 int ---> ret_void) f
    end
  end
