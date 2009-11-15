module io.input.writers.x;

private {
	import io.input.input;
	import io.input.keysym;

	import sys.x11.x;
	import sys.x11.xlib;
	import sys.x11.xutil;
	import sys.x11.xkblib;
}

import std.stdio;
class XInputWriter {

	protected {
		InputChannel _channel;
		bool _interceptMouse;

		int _prevMouseX = 0, _prevMouseY = 0;
		
		bool _repeatSet = false;
		io.input.keysym.KeySym _lastDownKey = io.input.keysym.KeySym.VoidSymbol;
	}

	this(InputChannel channel) {
		_channel = channel;
	}
	this(InputChannel channel, bool interceptMouse) {
		_channel = channel;
		_interceptMouse = interceptMouse;
	}

	void interceptMouse(bool state) {
		_interceptMouse = state;
	}
	bool interceptMouse() {
		return _interceptMouse;
	}

	bool filter(XEvent ev) {
		if(!_repeatSet) {
			XkbSetDetectableAutoRepeat(ev.xany.display, 1, null);
			_repeatSet = true;
		}

		KeyboardInput.Modifiers getMods(uint state) {
			KeyboardInput.Modifiers ret;

			// Can these be made more specific (lshift, rshift, etc)?
			if(state & ShiftMask)
				ret |= ret.SHIFT;
			//if(state & LockMask) Unsupported
				//ret |= ret.LOCK;
			if(state & ControlMask)
				ret |= ret.CTRL;
			if(state & Mod1Mask)
				ret |= ret.ALT;
			/*if(state & Mod2Mask) TODO: Work out what to map these to
				;
			if(state & Mod3Mask)
				;
			if(state & Mod4Mask)
				;
			if(state & Mod5Mask)
			;*/
			return ret;
		}

		switch(ev.type) {
		case KeyPress:
			KeyboardInput kin;
			kin.type = KeyboardInput.Type.Down;
			kin.modifiers = getMods(ev.xkey.state);
			//char[4] str; // XF IMPLEMENTATION
			dchar str;
			// Our KeySyms are from X and thus should not need conversion
			if( auto len = XLookupString(&ev.xkey, cast(char*)&str, 4, cast(size_t*)&kin.keySym, cast(_XComposeStatus*)null) ) {
				kin.unicode = str;
				/* XF IMPLEMENTATION
				foreach (dchar dc; str[0..len]) {
					kin.unicode = dc;
					break;
				}
				*/
			}
			// Don't pass on low-range non-printable characters (e.g. ESC)
			if(cast(uint)kin.unicode < 32) {
				kin.unicode = dchar.init;
			}
			if(kin.keySym != _lastDownKey) {
				_lastDownKey = kin.keySym;
				_channel << kin;
			}
			break;
		case KeyRelease:
			_lastDownKey = io.input.keysym.KeySym.VoidSymbol;
			KeyboardInput kin;
			kin.type = KeyboardInput.Type.Up;
			kin.modifiers = getMods(ev.xkey.state);
			//char[4] str; // XF IMPLEMENTATION
			dchar str;
			// Our KeySyms are from X and thus should not need conversion
			if (auto len = XLookupString(&ev.xkey, cast(char*)&str, 4, cast(size_t*)&kin.keySym, cast(_XComposeStatus*)null)) {
				kin.unicode = str;
				/* XF IMPLEMENTATION
				foreach (dchar dc; str[0..len]) {
					kin.unicode = dc;
					break;
				}
				*/
			}
			// Don't pass on low-range non-printable characters (e.g. ESC)
			if(cast(uint)kin.unicode < 32) {
				kin.unicode = dchar.init;
			}
			_channel << kin;
			break;
		case ButtonPress:
			MouseInput min;
			min.type = MouseInput.Type.ButtonDown;
			switch(ev.xbutton.button) {
			case 1:
				min.buttons = min.Button.Left;
				break;
			case 2:
				min.buttons = min.Button.Middle;
				break;
			case 3:
				min.buttons = min.Button.Right;
				break;
			case 4:
				min.buttons = min.Button.WheelUp;
				break;
			case 5:
				min.buttons = min.Button.WheelDown;
			default:
				break;
			}
			min.position.x = ev.xbutton.x;
			min.position.y = ev.xbutton.y;
			_channel << min;
			break;
		case ButtonRelease:
			MouseInput min;
			min.type = MouseInput.Type.ButtonUp;
			switch(ev.xbutton.button) {
			case 1:
				min.buttons = min.Button.Left;
				break;
			case 2:
				min.buttons = min.Button.Middle;
				break;
			case 3:
				min.buttons = min.Button.Right;
				break;
			case 4:
				min.buttons = min.Button.WheelUp;
				break;
			case 5:
				min.buttons = min.Button.WheelDown;
			default:
				break;
			}
			min.position.x = ev.xbutton.x;
			min.position.y = ev.xbutton.y;
			_channel << min;
			break;
		case MotionNotify:
			if(ev.xmotion.x == _prevMouseX && ev.xmotion.y == _prevMouseY)
				return true;
			MouseInput min;
			min.type = min.Type.Move;
			if(_interceptMouse) {
				XWindowAttributes attr;
				XGetWindowAttributes(ev.xmotion.display, ev.xmotion.window, &attr);
				uint midX = attr.width / 2;
				uint midY = attr.height / 2;
				
				XWarpPointer(ev.xmotion.display, None, ev.xmotion.window, ev.xmotion.x, ev.xmotion.y, 0, 0, midX, midY);
				min.position.x = midX;
				min.position.y = midY;
			} else {
				min.position.x = ev.xmotion.x;
				min.position.y = ev.xmotion.y;
			}
			min.move.x = ev.xmotion.x - _prevMouseX;
			min.move.y = ev.xmotion.y - _prevMouseY;
			min.global.x = ev.xmotion.x_root;
			min.global.y = ev.xmotion.y_root;
			_prevMouseX = ev.xmotion.x;
			_prevMouseY = ev.xmotion.y;
			_channel << min;
			break;
		default:
			return true;
		}
		return false;
	}
}
