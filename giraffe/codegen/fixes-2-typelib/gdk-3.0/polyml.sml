val libgdk = PolyMLFFI.load_lib "";
val libgiraffegdk = PolyMLFFI.load_lib "";
use "GDK_EVENT_ANY_RECORD.sml";
use "GDK_EVENT_BUTTON_RECORD.sml";
use "GDK_EVENT_CONFIGURE_RECORD.sml";
use "GDK_EVENT_CROSSING_RECORD.sml";
use "GDK_EVENT_D_N_D_RECORD.sml";
use "GDK_EVENT_EXPOSE_RECORD.sml";
use "GDK_EVENT_FOCUS_RECORD.sml";
use "GDK_EVENT_GRAB_BROKEN_RECORD.sml";
use "GDK_EVENT_KEY_RECORD.sml";
use "GDK_EVENT_MOTION_RECORD.sml";
use "GDK_EVENT_OWNER_CHANGE_RECORD.sml";
use "GDK_EVENT_PROPERTY_RECORD.sml";
use "GDK_EVENT_PROXIMITY_RECORD.sml";
use "GDK_EVENT_SCROLL_RECORD.sml";
use "GDK_EVENT_SELECTION_RECORD.sml";
use "GDK_EVENT_SETTING_RECORD.sml";
use "GDK_EVENT_VISIBILITY_RECORD.sml";
use "GDK_EVENT_WINDOW_STATE_RECORD.sml";
use "CLASSIFY_EVENT.sml";
use "GDK_APP_LAUNCH_CONTEXT_CLASS.sml";
use "GDK_APP_LAUNCH_CONTEXT.sml";
use "GDK_ATOM_RECORD.sml";
use "GDK_ATOM.sml";
use "GDK_AXIS_USE.sml";
use "GDK_BYTE_ORDER.sml";
use "GDK_COLOR_RECORD.sml";
use "GDK_COLOR.sml";
use "GDK_CROSSING_MODE.sml";
use "GDK_CURSOR_CLASS.sml";
use "GDK_CURSOR.sml";
use "GDK_CURSOR_TYPE.sml";
use "GDK_DEVICE_CLASS.sml";
use "GDK_DEVICE.sml";
use "GDK_DEVICE_MANAGER_CLASS.sml";
use "GDK_DEVICE_MANAGER.sml";
use "GDK_DEVICE_TYPE.sml";
use "GDK_DISPLAY_CLASS.sml";
use "GDK_DISPLAY.sml";
use "GDK_DISPLAY_MANAGER_CLASS.sml";
use "GDK_DISPLAY_MANAGER.sml";
use "GDK_DRAG_ACTION.sml";
use "GDK_DRAG_CONTEXT_CLASS.sml";
use "GDK_DRAG_CONTEXT.sml";
use "GDK_DRAG_PROTOCOL.sml";
use "GDK_EVENT.sml";
use "GDK_EVENT_MASK.sml";
use "GDK_EVENT_TYPE.sml";
use "GDK_EXTENSION_MODE.sml";
use "GDK_FILTER_RETURN.sml";
use "GDK_GEOMETRY_RECORD.sml";
use "GDK_GEOMETRY.sml";
use "GDK_GRAB_OWNERSHIP.sml";
use "GDK_GRAB_STATUS.sml";
use "GDK_GRAVITY.sml";
use "GDK_INPUT_MODE.sml";
use "GDK_INPUT_SOURCE.sml";
use "GDK_KEYMAP_CLASS.sml";
use "GDK_KEYMAP.sml";
use "GDK_KEYMAP_KEY_RECORD.sml";
use "GDK_KEYMAP_KEY.sml";
use "GDK_MODIFIER_TYPE.sml";
use "GDK_NOTIFY_TYPE.sml";
use "GDK_OWNER_CHANGE.sml";
use "GDK_PROP_MODE.sml";
use "GDK_PROPERTY_STATE.sml";
use "GDK_RGBA_RECORD.sml";
use "GDK_RGBA.sml";
use "GDK_SCREEN_CLASS.sml";
use "GDK_SCREEN.sml";
use "GDK_SCROLL_DIRECTION.sml";
use "GDK_SETTING_ACTION.sml";
use "GDK_STATUS.sml";
use "GDK_VISIBILITY_STATE.sml";
use "GDK_VISUAL_CLASS.sml";
use "GDK_VISUAL.sml";
use "GDK_VISUAL_TYPE.sml";
use "GDK_W_M_DECORATION.sml";
use "GDK_W_M_FUNCTION.sml";
use "GDK_WINDOW_CLASS.sml";
use "GDK_WINDOW.sml";
use "GDK_WINDOW_ATTR_RECORD.sml";
use "GDK_WINDOW_ATTR.sml";
use "GDK_WINDOW_ATTRIBUTES_TYPE.sml";
use "GDK_WINDOW_EDGE.sml";
use "GDK_WINDOW_HINTS.sml";
use "GDK_WINDOW_STATE.sml";
use "GDK_WINDOW_TYPE.sml";
use "GDK_WINDOW_TYPE_HINT.sml";
use "GDK_WINDOW_WINDOW_CLASS.sml";
use "GDK.sml";
use "polyml/GdkAppLaunchContextClass.sml";
use "polyml/GdkAtomRecord.sml";
use "polyml/GdkAxisUse.sml";
use "polyml/GdkByteOrder.sml";
use "polyml/GdkColorRecord.sml";
use "polyml/GdkCrossingMode.sml";
use "polyml/GdkCursorClass.sml";
use "polyml/GdkCursorType.sml";
use "polyml/GdkDeviceClass.sml";
use "polyml/GdkDeviceManagerClass.sml";
use "polyml/GdkDeviceType.sml";
use "polyml/GdkDisplayClass.sml";
use "polyml/GdkDisplayManagerClass.sml";
use "polyml/GdkDragAction.sml";
use "polyml/GdkDragContextClass.sml";
use "polyml/GdkDragProtocol.sml";
use "polyml/GdkEvent.sml";
use "polyml/GdkEventMask.sml";
use "polyml/GdkEventType.sml";
use "polyml/GdkExtensionMode.sml";
use "polyml/GdkFilterReturn.sml";
use "polyml/GdkGeometryRecord.sml";
use "polyml/GdkGrabOwnership.sml";
use "polyml/GdkGrabStatus.sml";
use "polyml/GdkGravity.sml";
use "polyml/GdkInputMode.sml";
use "polyml/GdkInputSource.sml";
use "polyml/GdkKeymapClass.sml";
use "polyml/GdkKeymapKeyRecord.sml";
use "polyml/GdkModifierType.sml";
use "polyml/GdkNotifyType.sml";
use "polyml/GdkOwnerChange.sml";
use "polyml/GdkPropMode.sml";
use "polyml/GdkPropertyState.sml";
use "polyml/GdkRgbaRecord.sml";
use "polyml/GdkScreenClass.sml";
use "polyml/GdkScrollDirection.sml";
use "polyml/GdkSettingAction.sml";
use "polyml/GdkStatus.sml";
use "polyml/GdkVisibilityState.sml";
use "polyml/GdkVisualClass.sml";
use "polyml/GdkVisualType.sml";
use "polyml/GdkWMDecoration.sml";
use "polyml/GdkWMFunction.sml";
use "polyml/GdkWindowClass.sml";
use "polyml/GdkWindowAttrRecord.sml";
use "polyml/GdkWindowAttributesType.sml";
use "polyml/GdkWindowEdge.sml";
use "polyml/GdkWindowHints.sml";
use "polyml/GdkWindowState.sml";
use "polyml/GdkWindowType.sml";
use "polyml/GdkWindowTypeHint.sml";
use "polyml/GdkWindowWindowClass.sml";
use "polyml/GdkEventAnyRecord.sml";
use "polyml/GdkEventButtonRecord.sml";
use "polyml/GdkEventConfigureRecord.sml";
use "polyml/GdkEventCrossingRecord.sml";
use "polyml/GdkEventDNDRecord.sml";
use "polyml/GdkEventExposeRecord.sml";
use "polyml/GdkEventFocusRecord.sml";
use "polyml/GdkEventGrabBrokenRecord.sml";
use "polyml/GdkEventKeyRecord.sml";
use "polyml/GdkEventMotionRecord.sml";
use "polyml/GdkEventOwnerChangeRecord.sml";
use "polyml/GdkEventPropertyRecord.sml";
use "polyml/GdkEventProximityRecord.sml";
use "polyml/GdkEventScrollRecord.sml";
use "polyml/GdkEventSelectionRecord.sml";
use "polyml/GdkEventSettingRecord.sml";
use "polyml/GdkEventVisibilityRecord.sml";
use "polyml/GdkEventWindowStateRecord.sml";
use "polyml/GdkAppLaunchContext.sml";
use "polyml/GdkAtom.sml";
use "polyml/GdkColor.sml";
use "polyml/GdkCursor.sml";
use "polyml/GdkDevice.sml";
use "polyml/GdkDeviceManager.sml";
use "polyml/GdkDisplay.sml";
use "polyml/GdkDisplayManager.sml";
use "polyml/GdkDragContext.sml";
use "polyml/GdkGeometry.sml";
use "polyml/GdkKeymap.sml";
use "polyml/GdkKeymapKey.sml";
use "polyml/GdkRgba.sml";
use "polyml/GdkScreen.sml";
use "polyml/GdkVisual.sml";
use "polyml/GdkWindow.sml";
use "polyml/GdkWindowAttr.sml";
use "polyml/ClassifyEvent.sml";
use "polyml/Gdk.sml";
