module io.input.Joystick;

private {
	version (Windows) {
		import platform.win32.mmsystem;
	}
	else {
		static assert (false);
	}
	
	import tango.stdc.stringz : fromStringz;
}



struct JoyInfo {
	private struct MinMax {
		uint min, max;
	}

	uint id;
	char[] name;
	uint numAxes;
	uint numButtons;
	bool hasPov;
	bool pov4Dir;
	bool povContinuous;

	private {
		MinMax[6] axisLimits;
	}
}


/// Not thread safe
class Joystick {
	public static {
		int opApply(int delegate(ref JoyInfo) dg) {
			initialize();
			foreach (info; sticks) {
				if (auto res = dg(info)) return res;
			}
			return 0;
		}
		
		
		void reinit() {
			initialized = false;
			sticks.length = 0;
		}
	}
	
	
	this(int id) {
		this.id = id;
	}
	
	
	void readState(float[6]* axes, uint* buttons, int* pov) {
		/+{
			JOYCAPS		joyCaps;
			JOYINFOEX	joyInfo;
			
			joyInfo.dwSize = joyInfo.sizeof;
			joyInfo.dwFlags = JOY_RETURNALL;
			
			if (JOYERR_NOERROR == joyGetDevCaps(JOYSTICKID1, &joyCaps, joyCaps.sizeof)) {
			} else {
				assert (false);
			}

			void print(char[] caption, uint cur, uint min, uint max) {
				uint mid = (max + min) / 2;
				float off = cast(float)(cast(int)cur - cast(int)mid) / mid;
				writef("%s:%3.3f ", caption, off);
			}
			
			if (JOYERR_NOERROR == joyGetPosEx(JOYSTICKID1, &joyInfo)) {
				print(`1`, joyInfo.dwXpos, joyCaps.wXmin, joyCaps.wXmax);
				print(`2`, joyInfo.dwYpos, joyCaps.wYmin, joyCaps.wYmax);
				print(`3`, joyInfo.dwZpos, joyCaps.wZmin, joyCaps.wZmax);
				print(`4`, joyInfo.dwRpos, joyCaps.wRmin, joyCaps.wRmax);
				print(`5`, joyInfo.dwUpos, joyCaps.wUmin, joyCaps.wUmax);
				print(`6`, joyInfo.dwVpos, joyCaps.wVmin, joyCaps.wVmax);
				writef("buttons(%x):%x ", joyInfo.dwButtonNumber, joyInfo.dwButtons);
				writef("pov:%d ", joyInfo.dwPOV);
				writef("\r");
				fflush(stdout);
			} else {
				assert (false);
			}
		}+/

		JOYINFOEX joyInfo;
		joyInfo.dwSize = joyInfo.sizeof;
		joyInfo.dwFlags = JOY_RETURNALL;
		
		if (JOYERR_NOERROR == joyGetPosEx(this.id, &joyInfo)) {
			foreach (i, axis; joyInfo.tupleof[2..8]) {
				auto limits = sticks[this.id].axisLimits[i];
				uint mid = (limits.max + limits.min) / 2;
				(*axes)[i] = cast(float)(cast(int)axis - cast(int)mid) / mid;
			}
			
			*buttons = joyInfo.dwButtons;
			
			if (joyInfo.dwPOV <= 35_900) {
				*pov = joyInfo.dwPOV;
			} else {
				*pov = -1;
			}
		} else {
			(*axes)[] = 0.f;
			*buttons = 0;
			*pov = -1;
		}
	}
	
	
	private {
		uint	id;
	}	
		
	private static {
		bool			initialized = false;
		JoyInfo[]	sticks;
		
		
		void initialize() {
			if (initialized) return;
			initialized = true;
			
			version (Windows) {
				JOYINFOEX info;
				info.dwSize = info.sizeof;
				uint res;
				
				for (int id = 0; (res = joyGetPosEx(id, &info)) != JOYERR_PARMS; ++id) {
					if (JOYERR_NOERROR == res) {
						JOYCAPS caps;
						if (JOYERR_NOERROR == joyGetDevCaps(id, &caps, caps.sizeof)) {
							sticks ~= JoyInfo(
								id, fromStringz(cast(char*)caps.szPname),
								caps.wNumAxes,
								caps.wNumButtons,
								(caps.wCaps & JOYCAPS_HASPOV) != 0,
								(caps.wCaps & JOYCAPS_POV4DIR) != 0,
								(caps.wCaps & JOYCAPS_POVCTS) != 0,
								[
									JoyInfo.MinMax(caps.wXmin, caps.wXmax),
									JoyInfo.MinMax(caps.wYmin, caps.wYmax),
									JoyInfo.MinMax(caps.wZmin, caps.wZmax),
									JoyInfo.MinMax(caps.wRmin, caps.wRmax),
									JoyInfo.MinMax(caps.wUmin, caps.wUmax),
									JoyInfo.MinMax(caps.wVmin, caps.wVmax)
								]
							);
						}
					}
				}
			}
			else {
				static assert (false);
			}
		}
	}
}
