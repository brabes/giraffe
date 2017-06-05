structure GtkPaperSize :>
  GTK_PAPER_SIZE
    where type t = GtkPaperSizeRecord.t
    where type unit_t = GtkUnit.t =
  struct
    val getType_ = _import "gtk_paper_size_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "mlton_gtk_paper_size_new" : Utf8.MLton.p1 * unit Utf8.MLton.p2 -> GtkPaperSizeRecord.FFI.notnull GtkPaperSizeRecord.FFI.p;
    val newCustom_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5
         & x6
         & x7 =>
          (
            _import "mlton_gtk_paper_size_new_custom" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GtkUnit.FFI.val_
               -> GtkPaperSizeRecord.FFI.notnull GtkPaperSizeRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val newFromKeyFile_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_paper_size_new_from_key_file" :
              GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GtkPaperSizeRecord.FFI.notnull GtkPaperSizeRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val newFromPpd_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5
         & x6 =>
          (
            _import "mlton_gtk_paper_size_new_from_ppd" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               -> GtkPaperSizeRecord.FFI.notnull GtkPaperSizeRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val copy_ = _import "gtk_paper_size_copy" : GtkPaperSizeRecord.FFI.notnull GtkPaperSizeRecord.FFI.p -> GtkPaperSizeRecord.FFI.notnull GtkPaperSizeRecord.FFI.p;
    val getDefaultBottomMargin_ = fn x1 & x2 => (_import "gtk_paper_size_get_default_bottom_margin" : GtkPaperSizeRecord.FFI.notnull GtkPaperSizeRecord.FFI.p * GtkUnit.FFI.val_ -> GDouble.FFI.val_;) (x1, x2)
    val getDefaultLeftMargin_ = fn x1 & x2 => (_import "gtk_paper_size_get_default_left_margin" : GtkPaperSizeRecord.FFI.notnull GtkPaperSizeRecord.FFI.p * GtkUnit.FFI.val_ -> GDouble.FFI.val_;) (x1, x2)
    val getDefaultRightMargin_ = fn x1 & x2 => (_import "gtk_paper_size_get_default_right_margin" : GtkPaperSizeRecord.FFI.notnull GtkPaperSizeRecord.FFI.p * GtkUnit.FFI.val_ -> GDouble.FFI.val_;) (x1, x2)
    val getDefaultTopMargin_ = fn x1 & x2 => (_import "gtk_paper_size_get_default_top_margin" : GtkPaperSizeRecord.FFI.notnull GtkPaperSizeRecord.FFI.p * GtkUnit.FFI.val_ -> GDouble.FFI.val_;) (x1, x2)
    val getDisplayName_ = _import "gtk_paper_size_get_display_name" : GtkPaperSizeRecord.FFI.notnull GtkPaperSizeRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getHeight_ = fn x1 & x2 => (_import "gtk_paper_size_get_height" : GtkPaperSizeRecord.FFI.notnull GtkPaperSizeRecord.FFI.p * GtkUnit.FFI.val_ -> GDouble.FFI.val_;) (x1, x2)
    val getName_ = _import "gtk_paper_size_get_name" : GtkPaperSizeRecord.FFI.notnull GtkPaperSizeRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getPpdName_ = _import "gtk_paper_size_get_ppd_name" : GtkPaperSizeRecord.FFI.notnull GtkPaperSizeRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getWidth_ = fn x1 & x2 => (_import "gtk_paper_size_get_width" : GtkPaperSizeRecord.FFI.notnull GtkPaperSizeRecord.FFI.p * GtkUnit.FFI.val_ -> GDouble.FFI.val_;) (x1, x2)
    val isCustom_ = _import "gtk_paper_size_is_custom" : GtkPaperSizeRecord.FFI.notnull GtkPaperSizeRecord.FFI.p -> GBool.FFI.val_;
    val isEqual_ = fn x1 & x2 => (_import "gtk_paper_size_is_equal" : GtkPaperSizeRecord.FFI.notnull GtkPaperSizeRecord.FFI.p * GtkPaperSizeRecord.FFI.notnull GtkPaperSizeRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val setSize_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_paper_size_set_size" :
              GtkPaperSizeRecord.FFI.notnull GtkPaperSizeRecord.FFI.p
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GtkUnit.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val toKeyFile_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_paper_size_to_key_file" :
              GtkPaperSizeRecord.FFI.notnull GtkPaperSizeRecord.FFI.p
               * GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getDefault_ = _import "gtk_paper_size_get_default" : unit -> Utf8.FFI.notnull Utf8.FFI.out_p;
    type t = GtkPaperSizeRecord.t
    type unit_t = GtkUnit.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new name = (Utf8.FFI.withOptPtr ---> GtkPaperSizeRecord.FFI.fromPtr true) new_ name
    fun newCustom name displayName width height unit =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GtkUnit.FFI.withVal
         ---> GtkPaperSizeRecord.FFI.fromPtr true
      )
        newCustom_
        (
          name
           & displayName
           & width
           & height
           & unit
        )
    fun newFromKeyFile keyFile groupName =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GtkPaperSizeRecord.FFI.fromPtr true
      )
        newFromKeyFile_
        (
          keyFile
           & groupName
           & []
        )
    fun newFromPpd ppdName ppdDisplayName width height =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> GtkPaperSizeRecord.FFI.fromPtr true
      )
        newFromPpd_
        (
          ppdName
           & ppdDisplayName
           & width
           & height
        )
    fun copy self = (GtkPaperSizeRecord.FFI.withPtr ---> GtkPaperSizeRecord.FFI.fromPtr true) copy_ self
    fun getDefaultBottomMargin self unit = (GtkPaperSizeRecord.FFI.withPtr &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getDefaultBottomMargin_ (self & unit)
    fun getDefaultLeftMargin self unit = (GtkPaperSizeRecord.FFI.withPtr &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getDefaultLeftMargin_ (self & unit)
    fun getDefaultRightMargin self unit = (GtkPaperSizeRecord.FFI.withPtr &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getDefaultRightMargin_ (self & unit)
    fun getDefaultTopMargin self unit = (GtkPaperSizeRecord.FFI.withPtr &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getDefaultTopMargin_ (self & unit)
    fun getDisplayName self = (GtkPaperSizeRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getDisplayName_ self
    fun getHeight self unit = (GtkPaperSizeRecord.FFI.withPtr &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getHeight_ (self & unit)
    fun getName self = (GtkPaperSizeRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getName_ self
    fun getPpdName self = (GtkPaperSizeRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getPpdName_ self
    fun getWidth self unit = (GtkPaperSizeRecord.FFI.withPtr &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getWidth_ (self & unit)
    fun isCustom self = (GtkPaperSizeRecord.FFI.withPtr ---> GBool.FFI.fromVal) isCustom_ self
    fun isEqual self size2 = (GtkPaperSizeRecord.FFI.withPtr &&&> GtkPaperSizeRecord.FFI.withPtr ---> GBool.FFI.fromVal) isEqual_ (self & size2)
    fun setSize self width height unit =
      (
        GtkPaperSizeRecord.FFI.withPtr
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GtkUnit.FFI.withVal
         ---> I
      )
        setSize_
        (
          self
           & width
           & height
           & unit
        )
    fun toKeyFile self keyFile groupName =
      (
        GtkPaperSizeRecord.FFI.withPtr
         &&&> GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        toKeyFile_
        (
          self
           & keyFile
           & groupName
        )
    fun getDefault () = (I ---> Utf8.FFI.fromPtr 0) getDefault_ ()
  end
