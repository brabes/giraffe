structure GtkWidgetPath :>
  GTK_WIDGET_PATH
    where type t = GtkWidgetPathRecord.t
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type region_flags_t = GtkRegionFlags.t
    where type state_flags_t = GtkStateFlags.t =
  struct
    val getType_ = _import "gtk_widget_path_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_widget_path_new" : unit -> GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p;
    val appendForWidget_ = fn x1 & x2 => (_import "gtk_widget_path_append_for_widget" : GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GInt.FFI.val_;) (x1, x2)
    val appendType_ = fn x1 & x2 => (_import "gtk_widget_path_append_type" : GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p * GObjectType.FFI.val_ -> GInt.FFI.val_;) (x1, x2)
    val appendWithSiblings_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_widget_path_append_with_siblings" :
              GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p
               * GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p
               * GUInt.FFI.val_
               -> GInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val copy_ = _import "gtk_widget_path_copy" : GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p -> GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p;
    val getObjectType_ = _import "gtk_widget_path_get_object_type" : GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p -> GObjectType.FFI.val_;
    val hasParent_ = fn x1 & x2 => (_import "gtk_widget_path_has_parent" : GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p * GObjectType.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val isType_ = fn x1 & x2 => (_import "gtk_widget_path_is_type" : GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p * GObjectType.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val iterAddClass_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_widget_path_iter_add_class" :
              GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val iterAddRegion_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_gtk_widget_path_iter_add_region" :
              GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GtkRegionFlags.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val iterClearClasses_ = fn x1 & x2 => (_import "gtk_widget_path_iter_clear_classes" : GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val iterClearRegions_ = fn x1 & x2 => (_import "gtk_widget_path_iter_clear_regions" : GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val iterGetName_ = fn x1 & x2 => (_import "gtk_widget_path_iter_get_name" : GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p * GInt.FFI.val_ -> Utf8.FFI.opt Utf8.FFI.out_p;) (x1, x2)
    val iterGetObjectName_ = fn x1 & x2 => (_import "gtk_widget_path_iter_get_object_name" : GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p * GInt.FFI.val_ -> Utf8.FFI.opt Utf8.FFI.out_p;) (x1, x2)
    val iterGetObjectType_ = fn x1 & x2 => (_import "gtk_widget_path_iter_get_object_type" : GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p * GInt.FFI.val_ -> GObjectType.FFI.val_;) (x1, x2)
    val iterGetSiblingIndex_ = fn x1 & x2 => (_import "gtk_widget_path_iter_get_sibling_index" : GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p * GInt.FFI.val_ -> GUInt.FFI.val_;) (x1, x2)
    val iterGetSiblings_ = fn x1 & x2 => (_import "gtk_widget_path_iter_get_siblings" : GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p * GInt.FFI.val_ -> GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p;) (x1, x2)
    val iterGetState_ = fn x1 & x2 => (_import "gtk_widget_path_iter_get_state" : GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p * GInt.FFI.val_ -> GtkStateFlags.FFI.val_;) (x1, x2)
    val iterHasClass_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_widget_path_iter_has_class" :
              GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val iterHasName_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_widget_path_iter_has_name" :
              GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val iterHasQclass_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_widget_path_iter_has_qclass" :
              GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p
               * GInt.FFI.val_
               * GLibQuark.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val iterHasQname_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_widget_path_iter_has_qname" :
              GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p
               * GInt.FFI.val_
               * GLibQuark.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val iterHasQregion_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_widget_path_iter_has_qregion" :
              GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p
               * GInt.FFI.val_
               * GLibQuark.FFI.val_
               * GtkRegionFlags.FFI.ref_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val iterHasRegion_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_gtk_widget_path_iter_has_region" :
              GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GtkRegionFlags.FFI.ref_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val iterRemoveClass_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_widget_path_iter_remove_class" :
              GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val iterRemoveRegion_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_widget_path_iter_remove_region" :
              GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val iterSetName_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_widget_path_iter_set_name" :
              GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val iterSetObjectName_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_widget_path_iter_set_object_name" :
              GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val iterSetObjectType_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_widget_path_iter_set_object_type" :
              GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p
               * GInt.FFI.val_
               * GObjectType.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val iterSetState_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_widget_path_iter_set_state" :
              GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p
               * GInt.FFI.val_
               * GtkStateFlags.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val length_ = _import "gtk_widget_path_length" : GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p -> GInt.FFI.val_;
    val prependType_ = fn x1 & x2 => (_import "gtk_widget_path_prepend_type" : GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p * GObjectType.FFI.val_ -> unit;) (x1, x2)
    val toString_ = _import "gtk_widget_path_to_string" : GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    type t = GtkWidgetPathRecord.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type region_flags_t = GtkRegionFlags.t
    type state_flags_t = GtkStateFlags.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkWidgetPathRecord.FFI.fromPtr true) new_ ()
    fun appendForWidget self widget = (GtkWidgetPathRecord.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> GInt.FFI.fromVal) appendForWidget_ (self & widget)
    fun appendType self type' = (GtkWidgetPathRecord.FFI.withPtr false &&&> GObjectType.FFI.withVal ---> GInt.FFI.fromVal) appendType_ (self & type')
    fun appendWithSiblings self (siblings, siblingIndex) =
      (
        GtkWidgetPathRecord.FFI.withPtr false
         &&&> GtkWidgetPathRecord.FFI.withPtr false
         &&&> GUInt.FFI.withVal
         ---> GInt.FFI.fromVal
      )
        appendWithSiblings_
        (
          self
           & siblings
           & siblingIndex
        )
    fun copy self = (GtkWidgetPathRecord.FFI.withPtr false ---> GtkWidgetPathRecord.FFI.fromPtr true) copy_ self
    fun getObjectType self = (GtkWidgetPathRecord.FFI.withPtr false ---> GObjectType.FFI.fromVal) getObjectType_ self
    fun hasParent self type' = (GtkWidgetPathRecord.FFI.withPtr false &&&> GObjectType.FFI.withVal ---> GBool.FFI.fromVal) hasParent_ (self & type')
    fun isType self type' = (GtkWidgetPathRecord.FFI.withPtr false &&&> GObjectType.FFI.withVal ---> GBool.FFI.fromVal) isType_ (self & type')
    fun iterAddClass self (pos, name) =
      (
        GtkWidgetPathRecord.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         ---> I
      )
        iterAddClass_
        (
          self
           & pos
           & name
        )
    fun iterAddRegion
      self
      (
        pos,
        name,
        flags
      ) =
      (
        GtkWidgetPathRecord.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         &&&> GtkRegionFlags.FFI.withVal
         ---> I
      )
        iterAddRegion_
        (
          self
           & pos
           & name
           & flags
        )
    fun iterClearClasses self pos = (GtkWidgetPathRecord.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) iterClearClasses_ (self & pos)
    fun iterClearRegions self pos = (GtkWidgetPathRecord.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) iterClearRegions_ (self & pos)
    fun iterGetName self pos = (GtkWidgetPathRecord.FFI.withPtr false &&&> GInt.FFI.withVal ---> Utf8.FFI.fromOptPtr 0) iterGetName_ (self & pos) before GtkWidgetPathRecord.FFI.touchPtr self
    fun iterGetObjectName self pos = (GtkWidgetPathRecord.FFI.withPtr false &&&> GInt.FFI.withVal ---> Utf8.FFI.fromOptPtr 0) iterGetObjectName_ (self & pos) before GtkWidgetPathRecord.FFI.touchPtr self
    fun iterGetObjectType self pos = (GtkWidgetPathRecord.FFI.withPtr false &&&> GInt.FFI.withVal ---> GObjectType.FFI.fromVal) iterGetObjectType_ (self & pos)
    fun iterGetSiblingIndex self pos = (GtkWidgetPathRecord.FFI.withPtr false &&&> GInt.FFI.withVal ---> GUInt.FFI.fromVal) iterGetSiblingIndex_ (self & pos)
    fun iterGetSiblings self pos = (GtkWidgetPathRecord.FFI.withPtr false &&&> GInt.FFI.withVal ---> GtkWidgetPathRecord.FFI.fromPtr false) iterGetSiblings_ (self & pos) before GtkWidgetPathRecord.FFI.touchPtr self
    fun iterGetState self pos = (GtkWidgetPathRecord.FFI.withPtr false &&&> GInt.FFI.withVal ---> GtkStateFlags.FFI.fromVal) iterGetState_ (self & pos)
    fun iterHasClass self (pos, name) =
      (
        GtkWidgetPathRecord.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         ---> GBool.FFI.fromVal
      )
        iterHasClass_
        (
          self
           & pos
           & name
        )
    fun iterHasName self (pos, name) =
      (
        GtkWidgetPathRecord.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         ---> GBool.FFI.fromVal
      )
        iterHasName_
        (
          self
           & pos
           & name
        )
    fun iterHasQclass self (pos, qname) =
      (
        GtkWidgetPathRecord.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GLibQuark.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        iterHasQclass_
        (
          self
           & pos
           & qname
        )
    fun iterHasQname self (pos, qname) =
      (
        GtkWidgetPathRecord.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GLibQuark.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        iterHasQname_
        (
          self
           & pos
           & qname
        )
    fun iterHasQregion self (pos, qname) =
      let
        val flags & retVal =
          (
            GtkWidgetPathRecord.FFI.withPtr false
             &&&> GInt.FFI.withVal
             &&&> GLibQuark.FFI.withVal
             &&&> GtkRegionFlags.FFI.withRefVal
             ---> GtkRegionFlags.FFI.fromVal && GBool.FFI.fromVal
          )
            iterHasQregion_
            (
              self
               & pos
               & qname
               & GtkRegionFlags.flags []
            )
      in
        if retVal then SOME flags else NONE
      end
    fun iterHasRegion self (pos, name) =
      let
        val flags & retVal =
          (
            GtkWidgetPathRecord.FFI.withPtr false
             &&&> GInt.FFI.withVal
             &&&> Utf8.FFI.withPtr 0
             &&&> GtkRegionFlags.FFI.withRefVal
             ---> GtkRegionFlags.FFI.fromVal && GBool.FFI.fromVal
          )
            iterHasRegion_
            (
              self
               & pos
               & name
               & GtkRegionFlags.flags []
            )
      in
        if retVal then SOME flags else NONE
      end
    fun iterRemoveClass self (pos, name) =
      (
        GtkWidgetPathRecord.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         ---> I
      )
        iterRemoveClass_
        (
          self
           & pos
           & name
        )
    fun iterRemoveRegion self (pos, name) =
      (
        GtkWidgetPathRecord.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         ---> I
      )
        iterRemoveRegion_
        (
          self
           & pos
           & name
        )
    fun iterSetName self (pos, name) =
      (
        GtkWidgetPathRecord.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         ---> I
      )
        iterSetName_
        (
          self
           & pos
           & name
        )
    fun iterSetObjectName self (pos, name) =
      (
        GtkWidgetPathRecord.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withOptPtr 0
         ---> I
      )
        iterSetObjectName_
        (
          self
           & pos
           & name
        )
    fun iterSetObjectType self (pos, type') =
      (
        GtkWidgetPathRecord.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GObjectType.FFI.withVal
         ---> I
      )
        iterSetObjectType_
        (
          self
           & pos
           & type'
        )
    fun iterSetState self (pos, state) =
      (
        GtkWidgetPathRecord.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GtkStateFlags.FFI.withVal
         ---> I
      )
        iterSetState_
        (
          self
           & pos
           & state
        )
    fun length self = (GtkWidgetPathRecord.FFI.withPtr false ---> GInt.FFI.fromVal) length_ self
    fun prependType self type' = (GtkWidgetPathRecord.FFI.withPtr false &&&> GObjectType.FFI.withVal ---> I) prependType_ (self & type')
    fun toString self = (GtkWidgetPathRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) toString_ self
  end
