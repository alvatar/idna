module xf.platform.osx.NSEvent;

import xf.platform.osx.objc_class;
import xf.platform.osx.objc_runtime;
import xf.platform.osx.NSGeometry;

struct NSEvent {
	id obj;

	int type() {
		return cast(int) send(obj, selType);
	}

	uint modifiers() {
		return cast(uint) send(obj, selModifiers);
	}

	short keyCode() {
		return cast(short) send(obj, selKeyCode);
	}

	int tracker() {
		return cast(int) send(obj, selTracking);
	}

	NSPoint location() {
		NSPoint res;
		sends(cast(void*)&res, obj, selLocation);
		return res;
	}

	id window() {
		return send(obj, selWindow);
	}
}

enum {		/* various types of events */
	NSLeftMouseDown		= 1,
	NSLeftMouseUp		= 2,
	NSRightMouseDown	= 3,
	NSRightMouseUp		= 4,
	NSMouseMoved		= 5,
	NSLeftMouseDragged	= 6,
	NSRightMouseDragged	= 7,
	NSMouseEntered		= 8,
	NSMouseExited		= 9,
	NSKeyDown		= 10,
	NSKeyUp			= 11,
	NSFlagsChanged		= 12,
	NSAppKitDefined		= 13,
	NSSystemDefined		= 14,
	NSApplicationDefined	= 15,
	NSPeriodic		= 16,
	NSCursorUpdate		= 17,
        NSScrollWheel		= 22,
	NSTabletPoint		= 23,
	NSTabletProximity       = 24,
        NSOtherMouseDown	= 25,
        NSOtherMouseUp		= 26,
        NSOtherMouseDragged	= 27
}


enum {
	NSAlphaShiftKeyMask =		1 << 16,
	NSShiftKeyMask =		1 << 17,
	NSControlKeyMask =		1 << 18,
	NSAlternateKeyMask =		1 << 19,
	NSCommandKeyMask =		1 << 20,
	NSNumericPadKeyMask =		1 << 21,
	NSHelpKeyMask =			1 << 22,
	NSFunctionKeyMask =		1 << 23,
	NSDeviceIndependentModifierFlagsMask = 0xffff0000U
}

private {
	SEL selType;
	SEL selLocation;
	SEL selModifiers;
	SEL selKeyCode;
	SEL selWindow;
	SEL selTracking;
}

static this() {
	selType = sel("type");
	selLocation = sel("locationInWindow");
	selModifiers = sel("modifierFlags");
	selKeyCode = sel("keyCode");
	selWindow = sel("window");
	selTracking = sel("trackingNumber");
}
