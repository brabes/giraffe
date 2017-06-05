signature PANGO_FONT_MAP =
  sig
    type 'a class
    type 'a font_family_class
    type 'a font_class
    type 'a fontset_class
    type language_t
    type font_description_t
    type 'a context_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val createContext : 'a class -> base context_class
    val listFamilies : 'a class -> base font_family_class vector
    val loadFont :
      'a class
       -> 'b context_class
       -> font_description_t
       -> base font_class
    val loadFontset :
      'a class
       -> 'b context_class
       -> font_description_t
       -> language_t
       -> base fontset_class
  end
