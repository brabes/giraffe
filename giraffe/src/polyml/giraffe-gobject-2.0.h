/* Copyright (C) 2012, 2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 */

/*
 * GObject C interface support for Poly/ML
 */


/* GClosure */

typedef void (*ClosureMarshal) (GValue *return_value,
                                const GValue *param_values,
                                guint n_param_value);

extern
void
giraffe_closure_dispatch (GClosure *closure,
                          GValue *return_value,
                          guint n_param_values,
                          const GValue *param_values,
                          gpointer invocation_hint,
                          gpointer marshal_data);

extern
void
giraffe_closure_destroy (gpointer data,
                         GClosure *closure);
