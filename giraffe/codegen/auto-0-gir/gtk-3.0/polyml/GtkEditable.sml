structure GtkEditable :>
  GTK_EDITABLE
    where type 'a class = 'a GtkEditableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_editable_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val copyClipboard_ = call (load_sym libgtk "gtk_editable_copy_clipboard") (GtkEditableClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val cutClipboard_ = call (load_sym libgtk "gtk_editable_cut_clipboard") (GtkEditableClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val deleteSelection_ = call (load_sym libgtk "gtk_editable_delete_selection") (GtkEditableClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val deleteText_ =
        call (load_sym libgtk "gtk_editable_delete_text")
          (
            GtkEditableClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val getChars_ =
        call (load_sym libgtk "gtk_editable_get_chars")
          (
            GtkEditableClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val getEditable_ = call (load_sym libgtk "gtk_editable_get_editable") (GtkEditableClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getPosition_ = call (load_sym libgtk "gtk_editable_get_position") (GtkEditableClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getSelectionBounds_ =
        call (load_sym libgtk "gtk_editable_get_selection_bounds")
          (
            GtkEditableClass.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val insertText_ =
        call (load_sym libgtk "gtk_editable_insert_text")
          (
            GtkEditableClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val pasteClipboard_ = call (load_sym libgtk "gtk_editable_paste_clipboard") (GtkEditableClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val selectRegion_ =
        call (load_sym libgtk "gtk_editable_select_region")
          (
            GtkEditableClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setEditable_ = call (load_sym libgtk "gtk_editable_set_editable") (GtkEditableClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setPosition_ = call (load_sym libgtk "gtk_editable_set_position") (GtkEditableClass.PolyML.cPtr &&> GInt.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkEditableClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun copyClipboard self = (GtkEditableClass.FFI.withPtr ---> I) copyClipboard_ self
    fun cutClipboard self = (GtkEditableClass.FFI.withPtr ---> I) cutClipboard_ self
    fun deleteSelection self = (GtkEditableClass.FFI.withPtr ---> I) deleteSelection_ self
    fun deleteText self startPos endPos =
      (
        GtkEditableClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        deleteText_
        (
          self
           & startPos
           & endPos
        )
    fun getChars self startPos endPos =
      (
        GtkEditableClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> Utf8.FFI.fromPtr 1
      )
        getChars_
        (
          self
           & startPos
           & endPos
        )
    fun getEditable self = (GtkEditableClass.FFI.withPtr ---> GBool.FFI.fromVal) getEditable_ self
    fun getPosition self = (GtkEditableClass.FFI.withPtr ---> GInt.FFI.fromVal) getPosition_ self
    fun getSelectionBounds self =
      let
        val startPos
         & endPos
         & retVal =
          (
            GtkEditableClass.FFI.withPtr
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            getSelectionBounds_
            (
              self
               & GInt.null
               & GInt.null
            )
      in
        if retVal then SOME (startPos, endPos) else NONE
      end
    fun insertText self newText newTextLength position =
      let
        val position & () =
          (
            GtkEditableClass.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal && I
          )
            insertText_
            (
              self
               & newText
               & newTextLength
               & position
            )
      in
        position
      end
    fun pasteClipboard self = (GtkEditableClass.FFI.withPtr ---> I) pasteClipboard_ self
    fun selectRegion self startPos endPos =
      (
        GtkEditableClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        selectRegion_
        (
          self
           & startPos
           & endPos
        )
    fun setEditable self isEditable = (GtkEditableClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setEditable_ (self & isEditable)
    fun setPosition self position = (GtkEditableClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setPosition_ (self & position)
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (void ---> ret_void) f
      fun deleteTextSig f = signal "delete-text" (get 0w1 int &&&> get 0w2 int ---> ret_void) (fn startPos & endPos => f startPos endPos)
      fun insertTextSig f =
        signal "insert-text"
          (
            get 0w1 string
             &&&> get 0w2 int
             &&&> get 0w3 int
             ---> set 0w3 int && ret_void
          )
          (
            fn
              newText
               & newTextLength
               & position =>
                let
                  val position = f newText newTextLength position
                in
                  position & ()
                end
          )
    end
  end
