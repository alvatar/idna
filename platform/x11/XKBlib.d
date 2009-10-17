module platform.x11.XKBlib;

import platform.x11.Xlib;

extern(C) bool XkbSetDetectableAutoRepeat(Display*, int, int*);
