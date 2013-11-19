signature GTK_ASSISTANT =
  sig
    type 'a class_t
    type 'a widgetclass_t
    type assistantpagetype_t
    type 'a buildableclass_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val addActionWidget :
      'a class_t
       -> 'b widgetclass_t
       -> unit
    val appendPage :
      'a class_t
       -> 'b widgetclass_t
       -> LargeInt.int
    val commit : 'a class_t -> unit
    val getCurrentPage : 'a class_t -> LargeInt.int
    val getNPages : 'a class_t -> LargeInt.int
    val getNthPage :
      'a class_t
       -> LargeInt.int
       -> base widgetclass_t
    val getPageComplete :
      'a class_t
       -> 'b widgetclass_t
       -> bool
    val getPageTitle :
      'a class_t
       -> 'b widgetclass_t
       -> string
    val getPageType :
      'a class_t
       -> 'b widgetclass_t
       -> assistantpagetype_t
    val insertPage :
      'a class_t
       -> 'b widgetclass_t
       -> LargeInt.int
       -> LargeInt.int
    val nextPage : 'a class_t -> unit
    val prependPage :
      'a class_t
       -> 'b widgetclass_t
       -> LargeInt.int
    val previousPage : 'a class_t -> unit
    val removeActionWidget :
      'a class_t
       -> 'b widgetclass_t
       -> unit
    val removePage :
      'a class_t
       -> LargeInt.int
       -> unit
    val setCurrentPage :
      'a class_t
       -> LargeInt.int
       -> unit
    val setPageComplete :
      'a class_t
       -> 'b widgetclass_t
       -> bool
       -> unit
    val setPageTitle :
      'a class_t
       -> 'b widgetclass_t
       -> string
       -> unit
    val setPageType :
      'a class_t
       -> 'b widgetclass_t
       -> assistantpagetype_t
       -> unit
    val updateButtonsState : 'a class_t -> unit
    val applySig : (unit -> unit) -> 'a class_t Signal.signal
    val cancelSig : (unit -> unit) -> 'a class_t Signal.signal
    val closeSig : (unit -> unit) -> 'a class_t Signal.signal
    val prepareSig : (base widgetclass_t -> unit) -> 'a class_t Signal.signal
  end