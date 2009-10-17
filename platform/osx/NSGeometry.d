module xf.platform.osx.NSGeometry;

struct NSPoint {
    float x;
    float y;
}

struct NSSize {
    float width;
    float height;
}

struct NSRect {
    NSPoint origin;
    NSSize size;
}

extern (C) {
	extern const NSPoint NSZeroPoint;
	extern const NSSize NSZeroSize;
	extern const NSRect NSZeroRect;
}

NSRect NSMakeRect(float x, float y, float w, float h) {
    NSRect r;
    r.origin.x = x;
    r.origin.y = y;
    r.size.width = w;
    r.size.height = h;
    return r;
}

