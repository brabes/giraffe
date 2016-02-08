structure GtkIMMulticontext :>
  GTK_I_M_MULTICONTEXT
    where type 'a class_t = 'a GtkIMMulticontextClass.t
    where type 'a menu_shell_class_t = 'a GtkMenuShellClass.t =
  struct
    val getType_ = _import "gtk_im_multicontext_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_im_multicontext_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val appendMenuitems_ = fn x1 & x2 => (_import "gtk_im_multicontext_append_menuitems" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val getContextId_ = _import "gtk_im_multicontext_get_context_id" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val setContextId_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_im_multicontext_set_context_id" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class_t = 'a GtkIMMulticontextClass.t
    type 'a menu_shell_class_t = 'a GtkMenuShellClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkIMMulticontextClass.C.fromPtr true) new_ ()
    fun appendMenuitems self menushell = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) appendMenuitems_ (self & menushell)
    fun getContextId self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getContextId_ self
    fun setContextId self contextId = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> I) setContextId_ (self & contextId)
  end
