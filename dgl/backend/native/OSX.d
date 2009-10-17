module dgl.backend.native.OSX;

private {
	import dgl.Window;
	import dgl.GLContext;
	import dgl.Common;

	import platform.osx.objc_class;
	import platform.osx.objc_runtime;
	import platform.osx.NSObject;
	import platform.osx.NSEvent;
	import platform.osx.NSGeometry;
	import platform.osx.NSApplication;
	import platform.osx.DogView;

	import tango.io.Stdout: Stdout; //remove later
}

class GLWindow : GLContext, Window {
	public bool delegate(NSEvent) msgFilter;

	static this() {
		registerClass("DogWindow", "NSWindow");
	}

	this() {
		app = Application();
        if (_meta is null) _meta = lookUp("DogWindow");

		dispatchMethod.method_count = 1;
		dispatchMethod.method_list[0].method_name = app.selDispatch;
		dispatchMethod.method_list[0].method_imp = cast(id function(id, SEL, ...))&dispatchEvent;

		class_removeMethods(meta, &dispatchMethod);
		class_addMethods(meta, &dispatchMethod);
	}

	~this() {
		destroy();
	}

	static typeof(this) opCall() {
        return new typeof(this);
    }

//--------------Window methods----------------

	char[] title() {
		return _title;
	}

	GLWindow title(char[] t) {
		if(created) {
			send(obj, sel("setTitle:"), NSString(t));
			send(obj, sel("display"));
		}

		_title = t;
		return this;
	}

	override typeof(this) width(uint w) {
		super.width(w);
		return this;
	}
	alias GLContext.width width;

	override typeof(this) height(uint h) {
		super.height(h);
		return this;
	}
	alias GLContext.height height;

	GLWindow decorations(bool d) {
		_decorations = d;
		return this;
	}

	bool decorations() {
		return _decorations;
	}

	GLWindow fullscreen(bool f) {
		//TODO
		return this;
	}

	bool fullscreen() {
		return _fullscreen;
	}

	GLWindow position(vec2i xy) {
		//TODO
		return this;
	}

	vec2i position() {
		return vec2i(_x, _y);
	}

	bool visible() {
		return _visible;
	}

	GLWindow update() {
		app.update();
		return this;
	}

	void processEvent(NSEvent event) {
		if (msgFilter) {
			if (!msgFilter(event)) {
				return;
			}			
		}

		if (event.type != NSMouseMoved) {
			send(obj, sel("sendEvent:"), event.obj);
			send(obj, sel("display"));
		}
	}

	GLWindow showCursor(bool c) {
		//TODO
		return this;
	}

	protected {
		char[] _title = "dog.GLWindow";
		bool _fullscreen = false;
		bool _decorations = true;
		bool _visible = false;
		bool _cursor = true;
		int _x = 0;
		int _y = 0;
	}

//-----------------GLContext methods-------------------

	override void useInHandler(void delegate(GL) dg) {

		synchronized(this) {
			view(dg, begin());
		}
	}

	override GLWindow create() {
		pool = createPool();

        _obj = createInstance(meta, (&this).sizeof);
		addVariable(obj, "GLWindow", "^v", meta.instance_size);
		object_setInstanceVariable(obj, ("GLWindow" ~ \0).ptr, cast(void*)&this);

		int style;
		if (_decorations) {
        	style = 15;
		} else {
			style = 0;
		}
		NSRect rect = NSMakeRect(cast(float)_x, cast(float)_y, cast(float)_width, cast(float)_height);

		send(obj, 
			sel("initWithContentRect:styleMask:backing:defer:"), 
			rect, style, backing, NO);
		send(obj, sel("setTitle:"), NSString(_title));
		send(obj, sel("setAcceptsMouseMovedEvents:"), YES);
		send(obj, sel("makeKeyAndOrderFront:"), app.obj);

		Class pf = lookUp("NSOpenGLPixelFormat");
		id pfid = createInstance(pf, 0);

		int[] attr = [5, 12, 32, 0];
		autorelease(send(pfid, sel("initWithAttributes:"), attr.ptr));

		view = new DogView(obj, rect, pfid, cast(id function(id, SEL, ...))&draw);

		if (_gl is null) {
			_gl._setGL(new GLHandle);
			loadTestFuncs();
		}

		_created = true;
		_visible = true;

		return this;
	}

	override GLWindow destroy() {
		if (created) {
			view.destroy;
			release(obj);
			_created = false;
			destroyPool(pool);
		}
		return this;
	}

	override GLWindow show() {
		if (created) view.flush;
		return this;
	}

	override GL begin() {
		return _gl;
	}

	override void end() {
	}

	private {
		GL _gl;
		NSApplication app;
		DogView view;
        int backing = 2;
		id pool;
		objc_method_list dispatchMethod;
	}
	mixin NSObject;
}

private void dispatchEvent(id o , SEL s, NSEvent event) {
	void* window;
	assert(object_getInstanceVariable(o, ("GLWindow"~\0).ptr, &window));
	(cast(GLWindow*)window).processEvent(event);
}

private id draw(id o, SEL s, void delegate(GL) dg, GL gl) {
    dg(gl);
    return o;
}

import tango.sys.SharedLib;
import xf.dog.OpenGL;
void loadTestFuncs() {
	auto lib = SharedLib.load("/Library/Frameworks/OpenGL.framework/OpenGL");
    assert(lib !is null);

    *cast(void**)&fp_glLoadIdentity = lib.getSymbol("glLoadIdentity");
    assert(fp_glLoadIdentity !is null);

    *cast(void**)&fp_glBegin = lib.getSymbol("glBegin");
    *cast(void**)&fp_glEnd = lib.getSymbol("glEnd");
    *cast(void**)&fp_glClear = lib.getSymbol("glClear");
    *cast(void**)&fp_glMatrixMode = lib.getSymbol("glMatrixMode");
    *cast(void**)&fp_glVertex2f = lib.getSymbol("glVertex2f");
    *cast(void**)&fp_glColor4f = lib.getSymbol("glColor4f");

	*cast(void**)&fp_glEnable = lib.getSymbol("glEnable");
	*cast(void**)&fp_glDisable = lib.getSymbol("glDisable");
	*cast(void**)&fp_glBlendFunc = lib.getSymbol("glBlendFunc");
	*cast(void**)&fp_glRotatef = lib.getSymbol("glRotatef");
    *cast(void**)&fp_glVertex3f = lib.getSymbol("glVertex3f");
    *cast(void**)&fp_gluPerspective = lib.getSymbol("gluPerspective");

    *cast(void**)&fp_glGetError = lib.getSymbol("glGetError");
}
