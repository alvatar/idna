module dgl.backend.glx;

private {
	version( D_Version2 ) {
		import std.string;
		import std.stdio;
	} else {
		import tango.stdc.stringz;
		import tango.io.Stdout : Stderr;
		alias char[] string;
	}

	import DglWindow = dgl.window;
	import dgl.glcontext;
	import dgl.opengl;
	import dgl.glufunctions;
	
	import sys.x11.x;
	import sys.x11.xlib;
	import sys.x11.randr;
	import sys.x11.xmd;
	import sys.x11.xutil;
	import glx = dgl.platform.glx.glx;
	import dgl.platform.glx.gl;
	import dgl.platform.glx_functionptrs;

	alias sys.x11.x.Window Window;
}

class GLWindow : GLContext, DglWindow.Window {
	public bool delegate(XEvent ev) msgFilter;
	
	~this() {
		destroy();
	}

	
	string title() {
		return _title;
	}

	
	GLWindow title(string t) {
		_title = t;
		if (_created) {
			// TODO: Check if the cast is harmeless
			XStoreName(_disp, _handle, cast(char*)toStringz(_title));
		}
		return this;
	}
	
	
	GLWindow decorations(bool d) {
		_decorations = d;
		if (_created) {
			setXDecorations();
		}
		return this;
	}
	
	
	bool decorations() {
		return _decorations;
	}
	
	
	bool visible() {
		return _visible;
	}


	GLWindow fullscreen(bool f) {
		if(_created) {
			auto conf = XRRGetScreenInfo(_disp, _root);
			if(f && !_fullscreen) {
				ushort dummy;
				_oldRes = XRRConfigCurrentConfiguration(conf, &dummy);
				setRes(_width, _height);

				// Actually fullscreen the window
				XEvent msg;
				msg.xclient.type = ClientMessage;
				msg.xclient.message_type = XInternAtom(_disp, cast(char*)"_NET_WM_STATE", False);
				msg.xclient.display = _disp;
				msg.xclient.window = _handle;
				msg.xclient.format = _colorBits;
				msg.xclient.data.l[0] = 1; // toggle
				msg.xclient.data.l[1] = XInternAtom(_disp, cast(char*)"_NET_WM_STATE_FULLSCREEN", False);;
				msg.xclient.data.l[2] = 0L;
				msg.xclient.data.l[3] = 0L;
				msg.xclient.data.l[4] = 0L;
				XSendEvent(_disp, XRootWindow(_disp, XDefaultScreen(_disp)), False,
						   SubstructureNotifyMask | SubstructureRedirectMask, &msg);
				XFlush(_disp);

			} else if(!f && _fullscreen)
				XRRSetScreenConfig(_disp, conf, _root, _oldRes, RR_Rotate_0, CurrentTime);
			XRRFreeScreenConfigInfo(conf);
		}
				
		_fullscreen = f;
		
		return this;
	}
	
	bool fullscreen() {
		return _fullscreen;
	}


	GLWindow grabInput(bool value) {
		_inputGrabbed = value;
		
		if (_created) {
			if (value) {
				XWarpPointer(_disp, None, _handle, 0, 0, 0, 0, 0, 0);
				XGrabKeyboard(_disp, _handle, true, GrabModeAsync, GrabModeAsync,
							  CurrentTime);
				XGrabPointer(_disp, _handle, true, ButtonPressMask | ButtonReleaseMask | PointerMotionMask, GrabModeAsync,
							 GrabModeAsync, _handle, None, CurrentTime);
			} else {
				XUngrabKeyboard(_disp, CurrentTime);
				XUngrabPointer(_disp, CurrentTime);
			}
		}
		
		return this;
	}


	bool inputGrabbed() {
		return _inputGrabbed;
	}
	
	
	GLWindow position(vec2i xy) {
		_x = xy.x;
		_y = xy.y;
		
		if (_created) {
			XMoveWindow(_disp, _handle, _x, _y);
		}
		
		return this;
	}
	
	
	vec2i position() {
		return vec2i(_x, _y);
	}


	override GLWindow width(size_t w) {
		dimensions(w, _height);
		return this;
	}
	alias GLContext.width width;


	override GLWindow height(size_t h) {
		dimensions(_width, h);
		return this;
	}
	alias GLContext.height height;


	GLWindow dimensions(size_t width, size_t height) {
		if (height == 0) {
			height = 1;
		}
		
		if (width == 0) {
			width = 1;
		}
		
		_width = width;
		_height = height;

		if (_created) {
			if (_fullscreen) {
				setRes(_width, _height);
			} else {
				XResizeWindow(_disp, _handle, _width, _height);
			}

			auto hints = XAllocSizeHints();
			hints.width = hints.min_width = hints.max_width = hints.base_width = _width;
			hints.height = hints.min_height = hints.max_height = hints.base_height = _height;
			hints.flags = PSize|PMinSize|PMaxSize|PBaseSize;
			XSetWMNormalHints(_disp, _handle, hints);
			XFree(hints);
			
			if (_reshapeCallback) {
				_reshapeCallback(_width, _height);
			}
		}
		
		return this;
	}

	override GLWindow colorBits(size_t b) {
		if(_created) {
			throw new Exception("Color bit-depth change after window creation currently unsupported.");
		}
		super.colorBits(b);
		return this;
	}
	alias GLContext.colorBits colorBits;


	override GLWindow depthBits(size_t d) {
		if(_created) {
			throw new Exception("Z buffer bit-depth change after window creation currently unsupported.");
		}
		super.depthBits(d);
		return this;
	}
	alias GLContext.depthBits depthBites;


	protected {
		Window _handle;
		Display* _disp;
		int _screen;
		glx.GLXContext _context;
		int modeNum;
	}

	
	static extern(C) int errorHandler(Display* d, XErrorEvent* e) {
		char[1024] buffer;
		XGetErrorText(d, e.error_code, buffer.ptr, 1024);
		//TODO <----------- TODO
		//Stderr("X Error: ")(buffer).newline; // TODO: Integrate with a logging system?
		//throw new Exception("X Error: " ~ buffer);
		return 0;
	}
	
	override GLWindow create() {
		if (_gl is null) {
			_gl._setGL(new GLHandle);
			findAndLoadLibs();
		}

		if (_created) {
			throw new Exception("Tried to create already created window");
		}
		
		XSetErrorHandler(&errorHandler);

		_disp = XOpenDisplay(null);
		if (_disp is null) {
			throw new Exception("Failed to open X display");
		}
		_root = XRootWindow(_disp, XDefaultScreen(_disp));
		
		int[] attrListDbl = [
			glx.GLX_RGBA,
			glx.GLX_DOUBLEBUFFER,
			glx.GLX_RED_SIZE, 8,
			glx.GLX_GREEN_SIZE, 8,
			glx.GLX_BLUE_SIZE, 8,
			glx.GLX_DEPTH_SIZE, _depthBits,
			None];
							 

		_screen = XDefaultScreen(_disp);
		XVisualInfo* vinfo = glXChooseVisual(null, _disp, _screen, attrListDbl.ptr);
		
		if (vinfo is null) {
			throw new Exception("Unable to create double-buffered visual");
		}

		if (0 == _colorBits) {			// Default to desktop depth
			_colorBits = vinfo.depth;
		}
		
		/+if (!glXIsDirect(null, _disp, _context)) {
			throw new Exception("Accelerated 3D rendering is not available");
		}+/

		XSetWindowAttributes attr;
		attr.colormap = XCreateColormap(_disp, XRootWindow(_disp, _screen), vinfo.visual, AllocNone);
		attr.border_pixel = 0;
		attr.background_pixel = 0;
		attr.override_redirect = _fullscreen;
		attr.event_mask = KeyPressMask | KeyReleaseMask | PointerMotionMask |
			ExposureMask | VisibilityChangeMask | ButtonPressMask |
			ButtonReleaseMask | StructureNotifyMask;
		
		if (_fullscreen) {
			int length;
			auto xrrs = XRRSizes(_disp, 0, &length);
			int targetIdx = -1;
			foreach(idx, size; xrrs[0..length])
				if(size.width == _width && size.height == _height) {
					targetIdx = idx;
					break;
				}
			if(targetIdx < 0)
				throw new Exception("Desired resolution unsupported by system.");
			auto conf = XRRGetScreenInfo(_disp, _root);

			ushort dummy;
			_oldRes = XRRConfigCurrentConfiguration(conf, &dummy);
			
			XRRSetScreenConfig(_disp, conf, _root, targetIdx, RR_Rotate_0, CurrentTime);
			XRRFreeScreenConfigInfo(conf);
		}

		_context = glXCreateContext(null, _disp, vinfo, null, true);
		if (_context is null) {
			throw new Exception("glXCreateContext failed");
		}

		_handle = XCreateWindow(_disp,
								_root,
								_x,
								_y,
								_width,
								_height,
								0,
								vinfo.depth,
								InputOutput,
								vinfo.visual,
								CWColormap | CWBorderPixel | CWEventMask | CWOverrideRedirect,
								&attr);
								
		if (_handle is 0) {
			throw new Exception("XCreateWindow failed");
		}
		
		if (!decorations) {
			setXDecorations();
		}

		if(_fullscreen || _inputGrabbed) {
			grabInput(true);
		}

		// Tell the window manager that we will handle what happens on [x]
		// XSetWMProtocols(_disp, _handle, &deleteWindow, 1);

		// Connect glX context to x window
		glXMakeCurrent(null, _disp, _handle, _context);
		
		// TODO: Check cast is harmless
		XStoreName(_disp, _handle, cast(char*)toStringz(_title));
		//Window winDummy;
		//size_t borderDummy;
		//XGetGeometry(_disp, _handle, &winDummy, &_x, &_y, &_width, &_height, &borderDummy, &_colorBits);
		XMapWindow(_disp, _handle);

		_visible = true;
		_created = true;

		if(!_cursorVisible) {
			// Set back to what is for the moment true
			_cursorVisible = true;
			showCursor(false);
		}

		return this;
	}
	
	
	private void setXDecorations() {
		MWMHints mwmhints;
		Atom prop;
		prop = XInternAtom(_disp, cast(char*)"_MOTIF_WM_HINTS", false);
		mwmhints.flags = MWM_HINTS_DECORATIONS;
		mwmhints.decorations = _decorations ? MWM_DECOR_ALL : 0;
		XChangeProperty(
			_disp, _handle, prop, prop, 32, 
			PropModeReplace, cast(char*)&mwmhints, 
			PROP_MWM_HINTS_ELEMENTS);
	}
	
	
	override GLWindow destroy() {
		_visible = false;

		if(_context) {
			glXMakeCurrent(null, _disp, None, null);
			glXDestroyContext(null, _disp, _context);
			_context = null;
		}
		
		if(_fullscreen) {
			grabInput(false);
			// Switch back to desktop resolution
			auto conf = XRRGetScreenInfo(_disp, _root);
			XRRSetScreenConfig(_disp, conf, _root, _oldRes, RR_Rotate_0, CurrentTime);
			XRRFreeScreenConfigInfo(conf);
		}
		XDestroyWindow(_disp, _handle);
		XCloseDisplay(_disp);

		return this;
	}
	
	
	GLWindow show() {
		if (!_created) {
			throw new Exception("Tried to show uninitialized window");
		}
		
		glXSwapBuffers(null, _disp, _handle);
		
		return this;
	}

	
	GLWindow hide() {
		if(!_created)
			throw new Exception("Tried to hide uninitialized window");
		XUnmapWindow(_disp, _handle);
		_visible = false;
		if(_fullscreen)
			grabInput(false);
		return this;
	}


	GLWindow unhide() {
		if(!_created)
			throw new Exception("Tried to unhide uninitialized window");
		XMapRaised(_disp, _handle);
		_visible = true;
		if(_fullscreen)
			grabInput(true);

		return this;
	}

	
	GLWindow update() {
		XEvent event;
		
		while(XPending(_disp)) {
			XNextEvent(_disp, &event);
			
			if(msgFilter) {
				if(!msgFilter(event)) {
					continue;
				}
			}
			
			switch(event.type) {
			case ConfigureNotify: // Window state changed
				_x = event.xconfigure.x;
				_y = event.xconfigure.y;

				if(_width != event.xconfigure.width ||
				   _height != event.xconfigure.height) {
					_width = event.xconfigure.width;
					_height = event.xconfigure.height;
						
					if (_reshapeCallback) {
						_reshapeCallback(_width, _height);
					}
				}
					
				glXWaitX(null);
					
				break;
			case UnmapNotify:
				_visible = false;
				break;
			case MapNotify:
				_visible = true;
				break;				
			default:
				break;
			}
		}
		return this;
	}


	bool created() {
		return _created;
	}


	override GL begin() {
		assert (_gl !is null);
		return _gl;
	}
	
	
	override void end() {
	}

	/+override void useInHandler(void delegate(GL) dg) {
		assert (_gl !is null);

		synchronized (this) {
			dg(_gl);
			}
	}+/
	
	
	static typeof(this) opCall() {
		return new typeof(this);
	}
	
	
	private {
		GL _gl;
		
		static bool classRegistered = false;
		static const char* className = "DglWindow";

		void setRes(size_t x, size_t y) {
			int length;
			auto xrrs = XRRSizes(_disp, 0, &length);
			int targetIdx = -1;
			foreach(idx, size; xrrs[0..length])
				if(size.width == x && size.height == y) {
					targetIdx = idx;
					break;
				}
			if(targetIdx < 0)
				throw new Exception("Desired resolution unsupported by system.");
				
			auto conf = XRRGetScreenInfo(_disp, _root);
			XRRSetScreenConfig(_disp, conf, _root, targetIdx, RR_Rotate_0, CurrentTime);
			XRRFreeScreenConfigInfo(conf);
		}
	}

	protected {
		string _title = "dgl.GLWindow";
		bool _fullscreen = false;
		bool _inputGrabbed = false;
		bool _cursorVisible = true;
		bool _decorations = true;
		bool _visible = false;
		int _x = 0;
		int _y = 0;

		int _oldRes;
		Window _root;
	}

	override GLWindow showCursor(bool state) {
		static Cursor blankCursor; // TODO?: Use XFreeCursor on this
								   // on exit
		if(!_created) {			// Repurposes _cursorVisible to store
								// desired state pre-init
			_cursorVisible = state;
			return this;
		}

		if(!state && _cursorVisible) {
			if(!blankCursor) {
				// Prepare blank cursor
				// Taken from Mark M Martin's unclutter program
				Pixmap cursormask;
				XGCValues xgc;
				GC gc;
				XColor dummycolour;

				cursormask = XCreatePixmap(_disp, XRootWindow(_disp, _screen), 1, 1, 1/*depth*/);
				xgc.function_ = GXclear;
				gc =  XCreateGC(_disp, cursormask, GCFunction, &xgc);
				XFillRectangle(_disp, cursormask, gc, 0, 0, 1, 1);
				dummycolour.pixel = 0;
				dummycolour.red = 0;
				dummycolour.flags = 04;
				blankCursor = XCreatePixmapCursor(_disp, cursormask, cursormask,
												  &dummycolour,&dummycolour, 0,0);
				XFreePixmap(_disp,cursormask);
				XFreeGC(_disp,gc);
			}
			
			XDefineCursor(_disp, _handle, blankCursor);
			_cursorVisible = false;
		} else if(state && !_cursorVisible) {
			XUndefineCursor(_disp, _handle);
			_cursorVisible = true;
		}
		
		return this;
	}

	bool cursorVisible() {
		return _cursorVisible;
	}

	GLWindow minimize() {
		
		return this;
	}

	GLWindow maximize() {
		return this;
	}
}
