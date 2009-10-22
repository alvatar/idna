module io.input.writer.Win32;

private {
	import io.input.Input;
	import io.input.KeySym;
	
	import std.c.ctype;
	/*
	import tango.util.log.Trace;
	*/

	import sys.win32.wingdi;
	import sys.win32.winuser;
	import sys.win32.windef;
	import sys.win32.winbase;
}





private KeyboardInput.Modifiers getModifiers() {
	KeyboardInput.Modifiers mods;
	ubyte keyboard[256];

	if (GetKeyboardState(keyboard.ptr)) {
		if (keyboard[VK_LSHIFT] & 0x80) {
			mods |= mods.LSHIFT;
		}
		if (keyboard[VK_RSHIFT] & 0x80) {
			mods |= mods.RSHIFT;
		}
		if (keyboard[VK_LCONTROL] & 0x80) {
			mods |= mods.LCTRL;
		}
		if (keyboard[VK_RCONTROL] & 0x80) {
			mods |= mods.RCTRL;
		}
		if (keyboard[VK_LMENU] & 0x80) {
			mods |= mods.LALT;
		}
		if (keyboard[VK_RMENU] & 0x80) {
			mods |= mods.RALT;
		}
		if (keyboard[VK_NUMLOCK] & 0x01) {
			mods |= mods.NUM;
		}
		if (keyboard[VK_CAPITAL] & 0x01) {
			mods |= mods.CAPS;
		}
	}
	
	return mods;
}



bool translateKey(ushort wparam, uint lparam, bool keyDown, out KeySym sym) {
	if (keyDown && lparam & (1 << 30)) {		// repeated key
		return false;
	}
	
	bool ret(KeySym s) {
		sym = s;
		return true;
	}
	
	const int extendedMask = 1 << 24;
	
	switch (wparam) {
		case VK_CONTROL: {
			if (lparam & extendedMask) {
				return ret(KeySym.Control_R);
			} else {
				return ret(KeySym.Control_L);
			}
		}
		
		case VK_SHIFT: {
			uint scanCode = MapVirtualKey(VK_RSHIFT, 0);
			if (((lparam & 0x01ff0000) >> 16) == scanCode) {
				return ret(KeySym.Shift_R);
			} else {
				return ret(KeySym.Shift_L);
			}
		}

		case VK_MENU: {
			if (lparam & extendedMask) {
				return ret(KeySym.Alt_R);
			} else {
				return ret(KeySym.Alt_L);
			}
		}

		case VK_RETURN: {
			if (lparam & extendedMask) {
				return ret(KeySym.KP_Enter);
			}
			return ret(KeySym.Return);
		}
		
		case VK_ESCAPE:	return ret(KeySym.Escape);
		case VK_TAB:		return ret(KeySym.Tab);
		case VK_BACK:		return ret(KeySym.BackSpace);
		case VK_HOME:		return ret(KeySym.Home);
		case VK_END:		return ret(KeySym.End);
		case VK_PRIOR:	return ret(KeySym.Page_Up);
		case VK_NEXT:		return ret(KeySym.Page_Down);
		case VK_INSERT:	return ret(KeySym.Insert);
		case VK_DELETE:	return ret(KeySym.Delete);
		case VK_LEFT:		return ret(KeySym.Left);
		case VK_UP:			return ret(KeySym.Up);
		case VK_RIGHT:	return ret(KeySym.Right);
		case VK_DOWN:	return ret(KeySym.Down);
		case VK_F1:			return ret(KeySym.F1);
		case VK_F2:			return ret(KeySym.F2);
		case VK_F3:			return ret(KeySym.F3);
		case VK_F4:			return ret(KeySym.F4);
		case VK_F5:			return ret(KeySym.F5);
		case VK_F6:			return ret(KeySym.F6);
		case VK_F7:			return ret(KeySym.F7);
		case VK_F8:			return ret(KeySym.F8);
		case VK_F9:			return ret(KeySym.F9);
		case VK_F10:		return ret(KeySym.F10);
		case VK_F11:		return ret(KeySym.F11);
		case VK_F12:		return ret(KeySym.F12);
		case VK_F13:		return ret(KeySym.F13);
		case VK_F14:		return ret(KeySym.F14);
		case VK_F15:		return ret(KeySym.F15);
		case VK_SPACE:	return ret(KeySym.space);

		// Numeric keypad
		case VK_NUMPAD0:		return ret(KeySym.KP_0);
		case VK_NUMPAD1:		return ret(KeySym.KP_1);
		case VK_NUMPAD2:		return ret(KeySym.KP_2);
		case VK_NUMPAD3:		return ret(KeySym.KP_3);
		case VK_NUMPAD4:		return ret(KeySym.KP_4);
		case VK_NUMPAD5:		return ret(KeySym.KP_5);
		case VK_NUMPAD6:		return ret(KeySym.KP_6);
		case VK_NUMPAD7:		return ret(KeySym.KP_7);
		case VK_NUMPAD8:		return ret(KeySym.KP_8);
		case VK_NUMPAD9:		return ret(KeySym.KP_9);
		
		case VK_DIVIDE:			return ret(KeySym.KP_Divide);
		case VK_MULTIPLY:		return ret(KeySym.KP_Multiply);
		case VK_SUBTRACT:		return ret(KeySym.KP_Subtract);
		case VK_ADD:				return ret(KeySym.KP_Add);
		case VK_DECIMAL:		return ret(KeySym.KP_Decimal);

		default: {
			uint chr = MapVirtualKeyA(wparam, 2) & 0xffff;
			chr = cast(uint)CharLowerA(cast(char*)chr);

			if (chr >= 32 && chr <= 127) {
				//writefln(cast(char)chr);
				return ret(cast(KeySym)chr);
			} else {
				sym = KeySym.VoidSymbol;
				return true;
			}
		} break;
	}
	
	return false;
}



private {
	void key(InputChannel channel, KeySym sym, bool down, ushort wparam, uint lparam) {
		if (!channel) return;
		
		KeyboardInput kin;
		kin.modifiers = getModifiers();
		
		kin.type = down ? KeyboardInput.Type.Down : KeyboardInput.Type.Up;
		kin.keySym = sym;
		
		{
			uint scancode = (lparam >> 16) & 0xff;
			ubyte[256] keyboardState;
			GetKeyboardState(keyboardState.ptr);
			
			wchar[2] buffer;
			int num = ToUnicodeEx(wparam, scancode, keyboardState.ptr, buffer.ptr, 2, 0, GetKeyboardLayout(0));
			
			if (num >= 1) {
				try {
					foreach (dchar c; buffer[0..num]) {
						kin.unicode = c;
						break;
					}
				} catch {}
			}
		}
		
		
		channel << kin;
	}


	void mouseMove(InputChannel channel, int x, int y, int xrel, int yrel, int gx, int gy) {
		if (!channel) return;

		MouseInput min;
		min.type = MouseInput.Type.Move;
		min.position = vec2i(x, y);
		min.move = vec2i(xrel, yrel);
		min.global = vec2i(gx, gy);
		channel << min;
	}


	void mouseButtonDown(InputChannel channel, MouseInput.Button button) {
		if (!channel) return;

		MouseInput min;
		min.type = MouseInput.Type.ButtonDown;
		min.buttons = button;
		channel << min;
	}


	void mouseButtonUp(InputChannel channel, MouseInput.Button button) {
		if (!channel) return;

		MouseInput min;
		min.type = MouseInput.Type.ButtonUp;
		min.buttons = button;
		channel << min;
	}


	void mouseWheel(InputChannel channel, int amt, MouseInput.Button dec, MouseInput.Button inc) {
		if (!channel) return;

		MouseInput min;
		min.type = MouseInput.Type.ButtonDown;
		
		while (amt >= WHEEL_DELTA) {
			min.buttons = inc;
			channel << min;
			amt -= WHEEL_DELTA;
		}
		
		while (amt <= -WHEEL_DELTA) {
			min.buttons = dec;
			channel << min;
			amt += WHEEL_DELTA;
		}
	}
}


class Win32InputWriter {
	this (InputChannel channel, bool interceptMouse = false) {
		this.channel = channel;
		this.interceptMouse = interceptMouse;
	}
	
	
	bool filter(void* hwnd_, uint umsg, WPARAM wparam, LPARAM lparam, int* retCode) {
		bool keyDown = WM_KEYDOWN == umsg;
		auto hwnd = cast(HWND)hwnd_;

		switch (umsg) {
			case WM_SYSKEYDOWN:
			case WM_KEYDOWN:
			case WM_SYSKEYUP:
			case WM_KEYUP: {
				KeySym keysym;
				if (translateKey(wparam, lparam, keyDown, keysym)) {
					//writefln("key hit. down = ", keyDown);

					key(channel, keysym, keyDown, wparam, lparam);
					return (*retCode = 0, true);
				} else break;
			}


			case WM_LBUTTONDOWN: {
				SetCapture(hwnd);
				mouseButtonDown(channel, MouseInput.Button.Left);
			} return (*retCode = 0, true);
			
			case WM_RBUTTONDOWN: {
				SetCapture(hwnd);
				mouseButtonDown(channel, MouseInput.Button.Right);
			} return (*retCode = 0, true);
			
			case WM_MBUTTONDOWN: {
				SetCapture(hwnd);
				mouseButtonDown(channel, MouseInput.Button.Middle);
			} return (*retCode = 0, true);


			case WM_LBUTTONUP: {
				if (!interceptMouse) ReleaseCapture();
				mouseButtonUp(channel, MouseInput.Button.Left);
			} return (*retCode = 0, true);

			case WM_RBUTTONUP: {
				if (!interceptMouse) ReleaseCapture();
				mouseButtonUp(channel, MouseInput.Button.Right);
			} return (*retCode = 0, true);

			case WM_MBUTTONUP: {
				if (!interceptMouse) ReleaseCapture();
				mouseButtonUp(channel, MouseInput.Button.Middle);
			} return (*retCode = 0, true);


			case WM_MOUSEMOVE: {
				// signed position
				int curX = cast(int)cast(short)LOWORD(lparam);
				int curY = cast(int)cast(short)HIWORD(lparam);
				
				int deltaX, deltaY;

				if (interceptMouse) {
					RECT rect;
					GetClientRect(hwnd, &rect);
					int width = rect.right+1;
					int height = rect.bottom+1;
					
					int warpX = width / 2;
					int warpY = height / 2;

					deltaX = curX - warpX;
					deltaY = curY - warpY;

					if (0 == deltaX && 0 == deltaY) return 0;

					_curMouseX = _prevMouseX + deltaX;
					_curMouseY = _prevMouseY + deltaY;
				} else {
					deltaX = curX - _prevMouseX;
					deltaY = curY - _prevMouseY;

					if (0 == deltaX && 0 == deltaY) return 0;
					
					_curMouseX = curX;
					_curMouseY = curY;
				}

				POINT pt;
				GetCursorPos(&pt);
				mouseMove(channel, _curMouseX, _curMouseY, deltaX, deltaY, pt.x, pt.y);
				
				_prevMouseX = _curMouseX;
				_prevMouseY = _curMouseY;
				
				if (interceptMouse) {
					warpMouseToCenter(hwnd);
				}
			} return (*retCode = 0, true);

			case WM_MOUSEWHEEL: {
				int _delta = GET_WHEEL_DELTA_WPARAM(wparam);
				mouseWheel(channel, _delta, MouseInput.Button.WheelDown, MouseInput.Button.WheelUp);
			} return (*retCode = 0, true);
			
			// WTF, Vista-only? D:
			/+case WM_MOUSEHWHEEL: {
				int _delta = GET_WHEEL_DELTA_WPARAM(wparam);
				mouseHWheel(channel, _delta, MouseInput.Button.WheelLeft, MouseInput.Button.WheelRight);
			} return (*retCode = 0, true);+/

			default: break;
		}
		
		return true;
	}
	
	
	private {
		void warpMouseToCenter(HWND hwnd) {
			RECT rect;
			GetClientRect(hwnd, &rect);
			int width = rect.right+1;
			int height = rect.bottom+1;

			POINT point;
			point.x = width / 2;
			point.y = height / 2;
			ClientToScreen(hwnd, &point);
			SetCursorPos(point.x, point.y);
		}

		InputChannel	channel;
		bool				interceptMouse;

		int				_curMouseX	= 0;
		int				_curMouseY	= 0;
		int				_prevMouseX	= 0;
		int				_prevMouseY	= 0;
	}
}
