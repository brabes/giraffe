structure GtkAboutDialog :>
  GTK_ABOUT_DIALOG
    where type 'a class = 'a GtkAboutDialogClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type license_t = GtkLicense.t =
  struct
    val getType_ = _import "gtk_about_dialog_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_about_dialog_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val addCreditSection_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_gtk_about_dialog_add_credit_section" :
              GtkAboutDialogClass.FFI.non_opt GtkAboutDialogClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8CPtrArray.MLton.p1
               * Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getArtists_ = _import "gtk_about_dialog_get_artists" : GtkAboutDialogClass.FFI.non_opt GtkAboutDialogClass.FFI.p -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
    val getAuthors_ = _import "gtk_about_dialog_get_authors" : GtkAboutDialogClass.FFI.non_opt GtkAboutDialogClass.FFI.p -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
    val getComments_ = _import "gtk_about_dialog_get_comments" : GtkAboutDialogClass.FFI.non_opt GtkAboutDialogClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getCopyright_ = _import "gtk_about_dialog_get_copyright" : GtkAboutDialogClass.FFI.non_opt GtkAboutDialogClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getDocumenters_ = _import "gtk_about_dialog_get_documenters" : GtkAboutDialogClass.FFI.non_opt GtkAboutDialogClass.FFI.p -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
    val getLicense_ = _import "gtk_about_dialog_get_license" : GtkAboutDialogClass.FFI.non_opt GtkAboutDialogClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getLicenseType_ = _import "gtk_about_dialog_get_license_type" : GtkAboutDialogClass.FFI.non_opt GtkAboutDialogClass.FFI.p -> GtkLicense.FFI.val_;
    val getLogo_ = _import "gtk_about_dialog_get_logo" : GtkAboutDialogClass.FFI.non_opt GtkAboutDialogClass.FFI.p -> GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p;
    val getLogoIconName_ = _import "gtk_about_dialog_get_logo_icon_name" : GtkAboutDialogClass.FFI.non_opt GtkAboutDialogClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getProgramName_ = _import "gtk_about_dialog_get_program_name" : GtkAboutDialogClass.FFI.non_opt GtkAboutDialogClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getTranslatorCredits_ = _import "gtk_about_dialog_get_translator_credits" : GtkAboutDialogClass.FFI.non_opt GtkAboutDialogClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getVersion_ = _import "gtk_about_dialog_get_version" : GtkAboutDialogClass.FFI.non_opt GtkAboutDialogClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getWebsite_ = _import "gtk_about_dialog_get_website" : GtkAboutDialogClass.FFI.non_opt GtkAboutDialogClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getWebsiteLabel_ = _import "gtk_about_dialog_get_website_label" : GtkAboutDialogClass.FFI.non_opt GtkAboutDialogClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getWrapLicense_ = _import "gtk_about_dialog_get_wrap_license" : GtkAboutDialogClass.FFI.non_opt GtkAboutDialogClass.FFI.p -> GBool.FFI.val_;
    val setArtists_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_about_dialog_set_artists" :
              GtkAboutDialogClass.FFI.non_opt GtkAboutDialogClass.FFI.p
               * Utf8CPtrArray.MLton.p1
               * Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setAuthors_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_about_dialog_set_authors" :
              GtkAboutDialogClass.FFI.non_opt GtkAboutDialogClass.FFI.p
               * Utf8CPtrArray.MLton.p1
               * Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setComments_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_about_dialog_set_comments" :
              GtkAboutDialogClass.FFI.non_opt GtkAboutDialogClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setCopyright_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_about_dialog_set_copyright" :
              GtkAboutDialogClass.FFI.non_opt GtkAboutDialogClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setDocumenters_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_about_dialog_set_documenters" :
              GtkAboutDialogClass.FFI.non_opt GtkAboutDialogClass.FFI.p
               * Utf8CPtrArray.MLton.p1
               * Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setLicense_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_about_dialog_set_license" :
              GtkAboutDialogClass.FFI.non_opt GtkAboutDialogClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setLicenseType_ = fn x1 & x2 => (_import "gtk_about_dialog_set_license_type" : GtkAboutDialogClass.FFI.non_opt GtkAboutDialogClass.FFI.p * GtkLicense.FFI.val_ -> unit;) (x1, x2)
    val setLogo_ = fn x1 & x2 => (_import "gtk_about_dialog_set_logo" : GtkAboutDialogClass.FFI.non_opt GtkAboutDialogClass.FFI.p * GdkPixbufPixbufClass.FFI.opt GdkPixbufPixbufClass.FFI.p -> unit;) (x1, x2)
    val setLogoIconName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_about_dialog_set_logo_icon_name" :
              GtkAboutDialogClass.FFI.non_opt GtkAboutDialogClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setProgramName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_about_dialog_set_program_name" :
              GtkAboutDialogClass.FFI.non_opt GtkAboutDialogClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setTranslatorCredits_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_about_dialog_set_translator_credits" :
              GtkAboutDialogClass.FFI.non_opt GtkAboutDialogClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setVersion_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_about_dialog_set_version" :
              GtkAboutDialogClass.FFI.non_opt GtkAboutDialogClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setWebsite_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_about_dialog_set_website" :
              GtkAboutDialogClass.FFI.non_opt GtkAboutDialogClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setWebsiteLabel_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_about_dialog_set_website_label" :
              GtkAboutDialogClass.FFI.non_opt GtkAboutDialogClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setWrapLicense_ = fn x1 & x2 => (_import "gtk_about_dialog_set_wrap_license" : GtkAboutDialogClass.FFI.non_opt GtkAboutDialogClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkAboutDialogClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type license_t = GtkLicense.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkAboutDialogClass.FFI.fromPtr false) new_ ()
    fun addCreditSection self (sectionName, people) =
      (
        GtkAboutDialogClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8CPtrArray.FFI.withPtr 0
         ---> I
      )
        addCreditSection_
        (
          self
           & sectionName
           & people
        )
    fun getArtists self = (GtkAboutDialogClass.FFI.withPtr false ---> Utf8CPtrArray.FFI.fromPtr 0) getArtists_ self
    fun getAuthors self = (GtkAboutDialogClass.FFI.withPtr false ---> Utf8CPtrArray.FFI.fromPtr 0) getAuthors_ self
    fun getComments self = (GtkAboutDialogClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getComments_ self
    fun getCopyright self = (GtkAboutDialogClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getCopyright_ self
    fun getDocumenters self = (GtkAboutDialogClass.FFI.withPtr false ---> Utf8CPtrArray.FFI.fromPtr 0) getDocumenters_ self
    fun getLicense self = (GtkAboutDialogClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getLicense_ self
    fun getLicenseType self = (GtkAboutDialogClass.FFI.withPtr false ---> GtkLicense.FFI.fromVal) getLicenseType_ self
    fun getLogo self = (GtkAboutDialogClass.FFI.withPtr false ---> GdkPixbufPixbufClass.FFI.fromPtr false) getLogo_ self
    fun getLogoIconName self = (GtkAboutDialogClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getLogoIconName_ self
    fun getProgramName self = (GtkAboutDialogClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getProgramName_ self
    fun getTranslatorCredits self = (GtkAboutDialogClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getTranslatorCredits_ self
    fun getVersion self = (GtkAboutDialogClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getVersion_ self
    fun getWebsite self = (GtkAboutDialogClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getWebsite_ self
    fun getWebsiteLabel self = (GtkAboutDialogClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getWebsiteLabel_ self
    fun getWrapLicense self = (GtkAboutDialogClass.FFI.withPtr false ---> GBool.FFI.fromVal) getWrapLicense_ self
    fun setArtists self artists = (GtkAboutDialogClass.FFI.withPtr false &&&> Utf8CPtrArray.FFI.withPtr 0 ---> I) setArtists_ (self & artists)
    fun setAuthors self authors = (GtkAboutDialogClass.FFI.withPtr false &&&> Utf8CPtrArray.FFI.withPtr 0 ---> I) setAuthors_ (self & authors)
    fun setComments self comments = (GtkAboutDialogClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setComments_ (self & comments)
    fun setCopyright self copyright = (GtkAboutDialogClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setCopyright_ (self & copyright)
    fun setDocumenters self documenters = (GtkAboutDialogClass.FFI.withPtr false &&&> Utf8CPtrArray.FFI.withPtr 0 ---> I) setDocumenters_ (self & documenters)
    fun setLicense self license = (GtkAboutDialogClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setLicense_ (self & license)
    fun setLicenseType self licenseType = (GtkAboutDialogClass.FFI.withPtr false &&&> GtkLicense.FFI.withVal ---> I) setLicenseType_ (self & licenseType)
    fun setLogo self logo = (GtkAboutDialogClass.FFI.withPtr false &&&> GdkPixbufPixbufClass.FFI.withOptPtr false ---> I) setLogo_ (self & logo)
    fun setLogoIconName self iconName = (GtkAboutDialogClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setLogoIconName_ (self & iconName)
    fun setProgramName self name = (GtkAboutDialogClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setProgramName_ (self & name)
    fun setTranslatorCredits self translatorCredits = (GtkAboutDialogClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setTranslatorCredits_ (self & translatorCredits)
    fun setVersion self version = (GtkAboutDialogClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setVersion_ (self & version)
    fun setWebsite self website = (GtkAboutDialogClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setWebsite_ (self & website)
    fun setWebsiteLabel self websiteLabel = (GtkAboutDialogClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setWebsiteLabel_ (self & websiteLabel)
    fun setWrapLicense self wrapLicense = (GtkAboutDialogClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setWrapLicense_ (self & wrapLicense)
    local
      open ClosureMarshal Signal
    in
      fun activateLinkSig f = signal "activate-link" (get 0w1 string ---> ret boolean) f
    end
    local
      open ValueAccessor
    in
      val commentsProp =
        {
          name = "comments",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val copyrightProp =
        {
          name = "copyright",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val licenseProp =
        {
          name = "license",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val licenseTypeProp =
        {
          name = "license-type",
          gtype = fn () => C.gtype GtkLicense.t (),
          get = fn x => fn () => C.get GtkLicense.t x,
          set = fn x => C.set GtkLicense.t x,
          init = fn x => C.set GtkLicense.t x
        }
      val logoProp =
        {
          name = "logo",
          gtype = fn () => C.gtype GdkPixbufPixbufClass.tOpt (),
          get = fn x => fn () => C.get GdkPixbufPixbufClass.tOpt x,
          set = fn x => C.set GdkPixbufPixbufClass.tOpt x,
          init = fn x => C.set GdkPixbufPixbufClass.tOpt x
        }
      val logoIconNameProp =
        {
          name = "logo-icon-name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val programNameProp =
        {
          name = "program-name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val translatorCreditsProp =
        {
          name = "translator-credits",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val versionProp =
        {
          name = "version",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val websiteProp =
        {
          name = "website",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val websiteLabelProp =
        {
          name = "website-label",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val wrapLicenseProp =
        {
          name = "wrap-license",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
