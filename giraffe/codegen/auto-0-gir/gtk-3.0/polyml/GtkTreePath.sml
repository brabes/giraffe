structure GtkTreePath :>
  GTK_TREE_PATH
    where type t = GtkTreePathRecord.t =
  struct
    structure GIntCVectorNType =
      CValueCVectorNType(
        structure CElemType = GIntType
        structure ElemSequence = CValueVectorSequence(GIntType)
      )
    structure GIntCVectorN = CVectorN(GIntCVectorNType)
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_tree_path_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_tree_path_new") (PolyMLFFI.cVoid --> GtkTreePathRecord.PolyML.cPtr)
      val newFirst_ = call (load_sym libgtk "gtk_tree_path_new_first") (PolyMLFFI.cVoid --> GtkTreePathRecord.PolyML.cPtr)
      val newFromString_ = call (load_sym libgtk "gtk_tree_path_new_from_string") (Utf8.PolyML.cInPtr --> GtkTreePathRecord.PolyML.cPtr)
      val appendIndex_ = call (load_sym libgtk "gtk_tree_path_append_index") (GtkTreePathRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> PolyMLFFI.cVoid)
      val compare_ = call (load_sym libgtk "gtk_tree_path_compare") (GtkTreePathRecord.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val copy_ = call (load_sym libgtk "gtk_tree_path_copy") (GtkTreePathRecord.PolyML.cPtr --> GtkTreePathRecord.PolyML.cPtr)
      val down_ = call (load_sym libgtk "gtk_tree_path_down") (GtkTreePathRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val getDepth_ = call (load_sym libgtk "gtk_tree_path_get_depth") (GtkTreePathRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getIndicesWithDepth_ = call (load_sym libgtk "gtk_tree_path_get_indices_with_depth") (GtkTreePathRecord.PolyML.cPtr &&> GInt.PolyML.cRef --> GIntCVectorN.PolyML.cOutPtr)
      val isAncestor_ = call (load_sym libgtk "gtk_tree_path_is_ancestor") (GtkTreePathRecord.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val isDescendant_ = call (load_sym libgtk "gtk_tree_path_is_descendant") (GtkTreePathRecord.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val next_ = call (load_sym libgtk "gtk_tree_path_next") (GtkTreePathRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val prependIndex_ = call (load_sym libgtk "gtk_tree_path_prepend_index") (GtkTreePathRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> PolyMLFFI.cVoid)
      val prev_ = call (load_sym libgtk "gtk_tree_path_prev") (GtkTreePathRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val toString_ = call (load_sym libgtk "gtk_tree_path_to_string") (GtkTreePathRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val up_ = call (load_sym libgtk "gtk_tree_path_up") (GtkTreePathRecord.PolyML.cPtr --> GBool.PolyML.cVal)
    end
    type t = GtkTreePathRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkTreePathRecord.FFI.fromPtr true) new_ ()
    fun newFirst () = (I ---> GtkTreePathRecord.FFI.fromPtr true) newFirst_ ()
    fun newFromString path = (Utf8.FFI.withPtr ---> GtkTreePathRecord.FFI.fromPtr true) newFromString_ path
    fun appendIndex self index = (GtkTreePathRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> I) appendIndex_ (self & index)
    fun compare self b = (GtkTreePathRecord.FFI.withPtr &&&> GtkTreePathRecord.FFI.withPtr ---> GInt.FFI.fromVal) compare_ (self & b)
    fun copy self = (GtkTreePathRecord.FFI.withPtr ---> GtkTreePathRecord.FFI.fromPtr true) copy_ self
    fun down self = (GtkTreePathRecord.FFI.withPtr ---> I) down_ self
    fun getDepth self = (GtkTreePathRecord.FFI.withPtr ---> GInt.FFI.fromVal) getDepth_ self
    fun getIndicesWithDepth self =
      let
        val depth & retVal = (GtkTreePathRecord.FFI.withPtr &&&> GInt.FFI.withRefVal ---> GInt.FFI.fromVal && GIntCVectorN.FFI.fromPtr 0) getIndicesWithDepth_ (self & GInt.null)
      in
        retVal (LargeInt.toInt depth)
      end
    fun isAncestor self descendant = (GtkTreePathRecord.FFI.withPtr &&&> GtkTreePathRecord.FFI.withPtr ---> GBool.FFI.fromVal) isAncestor_ (self & descendant)
    fun isDescendant self ancestor = (GtkTreePathRecord.FFI.withPtr &&&> GtkTreePathRecord.FFI.withPtr ---> GBool.FFI.fromVal) isDescendant_ (self & ancestor)
    fun next self = (GtkTreePathRecord.FFI.withPtr ---> I) next_ self
    fun prependIndex self index = (GtkTreePathRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> I) prependIndex_ (self & index)
    fun prev self = (GtkTreePathRecord.FFI.withPtr ---> GBool.FFI.fromVal) prev_ self
    fun toString self = (GtkTreePathRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) toString_ self
    fun up self = (GtkTreePathRecord.FFI.withPtr ---> GBool.FFI.fromVal) up_ self
  end
