(* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature CHILD_SIGNAL =
  sig
    type 'a widget_class_t

    val connect :
      'a widget_class_t
       -> 'b GObjectObjectClass.t
       -> ('func -> 'b GObjectObjectClass.t Signal.signal)
       -> 'func
       -> unit
    val connectAfter :
      'a widget_class_t
       -> 'b GObjectObjectClass.t
       -> ('func -> 'b GObjectObjectClass.t Signal.signal)
       -> 'func
       -> unit
  end
