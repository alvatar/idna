module sys.x11.xkblib;

import sys.x11.xlib;

extern(C) bool XkbSetDetectableAutoRepeat(Display*, int, int*);
