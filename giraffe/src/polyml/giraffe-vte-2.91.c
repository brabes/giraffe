/* Copyright (C) 2012, 2017-2018 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 */

/*
 * Vte C interface support for Poly/ML
 */

#include <vte/vte.h>

#include "giraffe-common.h"
#include "giraffe-glib-2.0.h"
#include "giraffe-vte-2.91-common.c"


/* VteTerminal */

gboolean
giraffe_vte_terminal_spawn_sync (VteTerminal *terminal,
                                 VtePtyFlags pty_flags,
                                 const char *working_directory,
                                 char **argv,
                                 char **envv,
                                 GSpawnFlags spawn_flags,
                                 SpawnChildSetupCallback child_setup,
                                 GPid *child_pid,
                                 GCancellable *cancellable,
                                 GError **error)
{
  return vte_terminal_spawn_sync (terminal,
                                  pty_flags,
                                  working_directory,
                                  argv,
                                  envv,
                                  spawn_flags,
                                  giraffe_spawn_child_setup_dispatch,
                                  child_setup,
                                  child_pid,
                                  cancellable,
                                  error);
}
