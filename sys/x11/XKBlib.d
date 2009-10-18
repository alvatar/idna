module sys.x11.XKBlib;

import sys.x11.Xlib;

extern(C) bool XkbSetDetectableAutoRepeat(Display*, int, int*);
