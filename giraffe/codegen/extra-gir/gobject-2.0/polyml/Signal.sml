(* Copyright (C) 2012-2013 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure Signal :>
  SIGNAL
    where type 'a object_class = 'a GObjectObjectClass.class
    where type 'a marshaller = 'a GObjectClosure.marshaller =
  struct
    type 'a object_class = 'a GObjectObjectClass.class
    type 'a marshaller = 'a GObjectClosure.marshaller

    local
      open PolyMLFFI
    in
      val signalConnectClosure_ =
        PolyMLFFI.call
          (
            if GiraffeDebug.isEnabled
            then
              PolyMLFFI.load_sym
                libgiraffegobject
                "giraffe_debug_g_signal_connect_closure"
            else
              PolyMLFFI.load_sym libgobject "g_signal_connect_closure"
          )
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectClosureRecord.PolyML.cPtr
             &&> GBool.PolyML.cVal
             --> GULong.PolyML.cVal
          );

      val signalHandlerDisconnect_ =
        PolyMLFFI.call
          (PolyMLFFI.load_sym libgobject "g_signal_handler_disconnect")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GULong.PolyML.cVal
             --> PolyMLFFI.cVoid
          );

      val signalHandlerIsConnected_ =
        PolyMLFFI.call
          (PolyMLFFI.load_sym libgobject "g_signal_handler_is_connected")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GULong.PolyML.cVal
             --> GBool.PolyML.cVal
          );
    end

    type 'object_class signal = string * GObjectClosureRecord.t

    fun signal detailedSignal marshaller callback =
      (detailedSignal, GObjectClosure.new marshaller callback)

    type signal_id = GULong.FFI.val_

    fun signalConnectClosure instance detailedSignal closure after =
      (
        GObjectObjectClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GObjectClosureRecord.FFI.withPtr
         &&&> GBool.FFI.withVal
         ---> I
      )
        signalConnectClosure_
        (
          instance
           & detailedSignal
           & closure
           & after
        )

    fun signalHandlerDisconnect instance handlerId =
      (
        GObjectObjectClass.FFI.withPtr
         &&&> I
         ---> I
      )
        signalHandlerDisconnect_
        (instance & handlerId)

    fun signalHandlerIsConnected instance handlerId =
      (
        GObjectObjectClass.FFI.withPtr
         &&&> I
         ---> GBool.FFI.fromVal
      )
        signalHandlerIsConnected_
        (instance & handlerId)


    fun connect instance signal f =
      let
        val (detailedSignal, closure) = signal f
      in
        signalConnectClosure instance detailedSignal closure false
      end

    fun connectAfter instance signal f =
      let
        val (detailedSignal, closure) = signal f
      in
        signalConnectClosure instance detailedSignal closure true
      end

    val disconnect = signalHandlerDisconnect

    val isConnected = signalHandlerIsConnected
  end
