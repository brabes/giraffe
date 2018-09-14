/* Copyright (C) 2012, 2017-2018 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 */

/*
 * Gdk C interface support for Poly/ML
 */

#include <string.h>
#include <gdk/gdk.h>

#include "giraffe.c"
#include "gdk-3.0/giraffe.c"


/* GdkWindowAttr */

GdkWindowAttr *
giraffe_gdk_window_attr_dup (const GdkWindowAttr *attributes)
{
  return g_slice_dup (GdkWindowAttr, attributes);
}

void
giraffe_gdk_window_attr_free (GdkWindowAttr *attributes)
{
  g_slice_free (GdkWindowAttr, attributes);
}


/* GdkEvent */

GdkEventType
giraffe_gdk_get_event_type (GdkEvent *event)
{
  return event->type;
}


/* GdkEventAny */

GdkWindow *
giraffe_gdk_event_any_get_window (GdkEventAny *event)
{
  return event->window;
}

gboolean
giraffe_gdk_event_any_get_send_event (GdkEventAny *event)
{
  return event->send_event;
}


/* GdkEventKey */

GdkWindow *
giraffe_gdk_event_key_get_window (GdkEventKey *event)
{
  return event->window;
}

gboolean
giraffe_gdk_event_key_get_send_event (GdkEventKey *event)
{
  return event->send_event;
}

guint32
giraffe_gdk_event_key_get_time (GdkEventKey *event)
{
  return event->time;
}

guint
giraffe_gdk_event_key_get_state (GdkEventKey *event)
{
  return event->state;
}

guint
giraffe_gdk_event_key_get_keyval (GdkEventKey *event)
{
  return event->keyval;
}

guint16
giraffe_gdk_event_key_get_hardware_keycode (GdkEventKey *event)
{
  return event->hardware_keycode;
}

guint8
giraffe_gdk_event_key_get_group (GdkEventKey *event)
{
  return event->group;
}

gboolean
giraffe_gdk_event_key_get_is_modifier (GdkEventKey *event)
{
  return event->is_modifier;
}


/* GdkEventButton */

guint32
giraffe_gdk_event_button_get_time (GdkEventButton *event)
{
  return event->time;
}

gdouble
giraffe_gdk_event_button_get_x (GdkEventButton *event)
{
  return event->x;
}

gdouble
giraffe_gdk_event_button_get_y (GdkEventButton *event)
{
  return event->y;
}


/* GdkEventScroll */

guint32
giraffe_gdk_event_scroll_get_time (GdkEventScroll *event)
{
  return event->time;
}

gdouble
giraffe_gdk_event_scroll_get_x (GdkEventScroll *event)
{
  return event->x;
}

gdouble
giraffe_gdk_event_scroll_get_y (GdkEventScroll *event)
{
  return event->y;
}

guint
giraffe_gdk_event_scroll_get_state (GdkEventScroll *event)
{
  return event->state;
}


/* GdkEventMotion */

guint32
giraffe_gdk_event_motion_get_time (GdkEventMotion *event)
{
  return event->time;
}

gdouble
giraffe_gdk_event_motion_get_x (GdkEventMotion *event)
{
  return event->x;
}

gdouble
giraffe_gdk_event_motion_get_y (GdkEventMotion *event)
{
  return event->y;
}

guint
giraffe_gdk_event_motion_get_state (GdkEventMotion *event)
{
  return event->state;
}


/* GdkEventCrossing */

guint32
giraffe_gdk_event_crossing_get_time (GdkEventCrossing *event)
{
  return event->time;
}

gdouble
giraffe_gdk_event_crossing_get_x (GdkEventCrossing *event)
{
  return event->x;
}

gdouble
giraffe_gdk_event_crossing_get_y (GdkEventCrossing *event)
{
  return event->y;
}

guint
giraffe_gdk_event_crossing_get_state (GdkEventCrossing *event)
{
  return event->state;
}


/* GdkEventConfigure */

gdouble
giraffe_gdk_event_configure_get_x (GdkEventConfigure *event)
{
  return event->x;
}

gdouble
giraffe_gdk_event_configure_get_y (GdkEventConfigure *event)
{
  return event->y;
}

guint
giraffe_gdk_event_configure_get_height (GdkEventConfigure *event)
{
  return event->height;
}

guint
giraffe_gdk_event_configure_get_width (GdkEventConfigure *event)
{
  return event->width;
}


/* GdkEventSelection */

guint32
giraffe_gdk_event_selection_get_time (GdkEventSelection *event)
{
  return event->time;
}


/* GdkEventDND */

guint32
giraffe_gdk_event_dnd_get_time (GdkEventDND *event)
{
  return event->time;
}


/* GdkEventProximity */

guint32
giraffe_gdk_event_proximity_get_time (GdkEventProximity *event)
{
  return event->time;
}
