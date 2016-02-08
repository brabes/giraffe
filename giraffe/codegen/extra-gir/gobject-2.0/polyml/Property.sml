(* Copyright (C) 2012-2013 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure Property :>
  PROPERTY
    where type ('a, 'b) accessor = ('a, 'b) GObjectValue.accessor
    where type 'a object_class_t = 'a GObjectObjectClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getProperty_ =
        call (load_sym libgobject "g_object_get_property")
          (
            GObjectObjectClass.PolyML.PTR
             &&> Utf8.PolyML.INPTR
             &&> GObjectValueRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )

      val setProperty_ =
        call (load_sym libgobject "g_object_set_property")
          (
            GObjectObjectClass.PolyML.PTR
             &&> Utf8.PolyML.INPTR
             &&> GObjectValueRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
    end

    type ('a, 'b) accessor = ('a, 'b) GObjectValue.accessor
    type 'a object_class_t = 'a GObjectObjectClass.t

    fun getProperty self propertyName value =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withConstPtr
         &&&> GObjectValueRecord.C.withPtr
         ---> I
      )
        getProperty_
        (
          self
           & propertyName
           & value
        )

    fun setProperty self propertyName value =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withConstPtr
         &&&> GObjectValueRecord.C.withPtr
         ---> I
      )
        setProperty_
        (
          self
           & propertyName
           & value
        )

    type ('object_class, 'a) readonly = {get : 'object_class -> 'a}
    type ('object_class, 'a) writeonly = {set : 'a -> 'object_class -> unit}
    type ('object_class, 'a, 'b) readwrite =
      {
        get : 'object_class -> 'a,
        set : 'b -> 'object_class -> unit
      }

    fun get name t object =
      let
        val value = GObjectValue.init (GObjectValue.baseType t)
      in
        getProperty object name value;
        GObjectValue.get t value
      end

    fun set name t x object =
      let
        val value = GObjectValue.init (GObjectValue.baseType t)
      in
        GObjectValue.set t value x;
        setProperty object name value
      end
  end
