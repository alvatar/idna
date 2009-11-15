module dgl.backend.win32;

private {
	import dgl.common;
	import dgl.window;
	import dgl.glcontext;
	import dgl.opengl;
	import dgl.ext.WGL_ARB_pixel_format;
	
	import sys.win32.wingdi;
	import sys.win32.winuser;
	import sys.win32.winnt;
	import sys.win32.windef;
	import sys.win32.winbase;
	
	import tango.stdc.stringz : fromStringz;
	
	import tango.io.Stdout;
	
	alias sys.win32.wingdi.DM_BITSPERPEL DM_BITSPERPEL;
	alias sys.win32.wingdi.DM_PELSWIDTH DM_PELSWIDTH;
	alias sys.win32.wingdi.DM_PELSHEIGHT DM_PELSHEIGHT;
}



private extern (Windows) int windowProc(HWND hwnd, uint umsg, WPARAM wparam, LPARAM lparam) {
	auto window = cast(GLWindow)cast(void*)GetWindowLong(hwnd, GWL_USERDATA);
	
	if (WM_CREATE == umsg && window is null) {
		CREATESTRUCT* creation = cast(CREATESTRUCT*)lparam;
		assert (creation !is null);
		
		window = cast(GLWindow)cast(void*)creation.lpCreateParams;
		SetWindowLong(hwnd, GWL_USERDATA, cast(uint)cast(void*)window);
	}
	
	if (window !is null) {
		return window.windowProc(umsg, wparam, lparam);
	} else {
		return DefWindowProc(hwnd, umsg, wparam, lparam);
	}
}


class GLWindow : GLContext, Window {
	public bool delegate(void* hwnd, uint umsg, WPARAM wparam, LPARAM lparam, int* retCode) msgFilter;
	
	uint _reportedWidth, _reportedHeight;


	~this() {
		if (created) {
			destroy();
		}
	}

	
	char[] title() {
		return _title;
	}


	GLWindow title(char[] t) {
		if (created) {
			SetWindowText(_hwnd, (t ~ \0).ptr);
		}
		
		_title = t;
		return this;
	}
	
	
	GLWindow decorations(bool d) {
		_decorations = d;
		return this;
	}
	
	
	bool decorations() {
		return _decorations;
	}
	
	
	bool visible() {
		return _visible;
	}


	GLWindow fullscreen(bool f) {
		_fullscreen = f;
		return this;
	}
	
	
	bool fullscreen() {
		return _fullscreen;
	}


	override typeof(this) width(uint w) {
		super.width(w);
		moveResizeWindow();
		return this;
	}
	alias GLContext.width width;
	
	
	override typeof(this) height(uint h) {
		super.height(h);
		moveResizeWindow();
		return this;
	}
	alias GLContext.height height;
	
	
	GLWindow position(vec2i xy) {
		_xpos = xy.x;
		_ypos = xy.y;
		moveResizeWindow();
		return this;
	}
	
	
	vec2i position() {
		return vec2i(_xpos, _ypos);
	}


	protected {
		void moveResizeWindow() {
			if (!created) return;
			.MoveWindow(_hwnd, _xpos, _ypos, _width, _height, 1);
		}


		bool changeScreenResolution(uint width, uint height, uint bits) {
			
			DEVMODE dmScreenSettings;
			with (dmScreenSettings) {
				dmSize				= DEVMODE.sizeof;
				dmPelsWidth		= width;
				dmPelsHeight		= height;
				dmBitsPerPel		= bits;
				dmFields			= DM_BITSPERPEL | DM_PELSWIDTH | DM_PELSHEIGHT;
			}
			
			return DISP_CHANGE_SUCCESSFUL == ChangeDisplaySettings (&dmScreenSettings, CDS_FULLSCREEN);
		}
	
		
		static HINSTANCE hinstance() {
			return GetModuleHandle(null);
		}
	
	
		static void registerWindowClass() {
			WNDCLASSEX windowClass;
			with (windowClass) {
				cbSize = windowClass.sizeof;
				style = CS_HREDRAW | CS_VREDRAW | CS_OWNDC;
				lpfnWndProc = cast(typeof(lpfnWndProc))&.windowProc;		// bug in core32 ? it expects lparam, wparam instead of wrapam, lparam
				hInstance = hinstance();
				hbrBackground = cast(HBRUSH)(COLOR_APPWORKSPACE);
				hCursor = LoadCursor(null, IDC_ARROW);
				lpszClassName = className;
			}
			
			assert (windowClass.hInstance !is null);
			assert (windowClass.lpfnWndProc !is null);
			
			if (!RegisterClassEx(&windowClass)) {
				throw new Exception("Could not register window class '" ~ (className is null ? "(null)" : fromStringz(className)) ~ "'");
			} else {
				classRegistered = true;
			}
		}
		
		
		static void unregisterWindowClass() {
			synchronized (win32Mutex) {
				if (classRegistered) {
					UnregisterClass(className, hinstance());
					classRegistered = false;
				}
			}
		}
		

		int windowProc(uint umsg, WPARAM wparam, LPARAM lparam) {
			if (msgFilter) {
				int retCode = void;
				if (!msgFilter(this._hwnd, umsg, wparam, lparam, &retCode)) {
					return retCode;
				}
			}

			switch (umsg) {
				case WM_SYSCOMMAND: {
					switch (wparam) {
						case SC_SCREENSAVE:
						case SC_MONITORPOWER:
							return 0;
							
						default:
							break;
					}
				} break;

				case WM_MOVE: {
					_xpos = cast(short)LOWORD(lparam);
					_ypos = cast(short)HIWORD(lparam);
					return 0;
				} break;

				case WM_SIZE: {
					switch (wparam) {
						case SIZE_MINIMIZED: {
							_visible = false;
						}// return 0;
		
						case SIZE_RESTORED:
						case SIZE_MAXIMIZED: {
							_visible = true;
							_reportedWidth = LOWORD(lparam);
							_reportedHeight = HIWORD(lparam);
							if (_reshapeCallback !is null) {
								_reshapeCallback(_reportedWidth, _reportedHeight);
							}
						}// return 0;
						
						default:
							break;
					}
				} break;
				
				
				case WM_QUIT:
				case WM_CLOSE: {
					if (created) {
						destroy();
					}
					break;
				}

				default: break;
			}
			
			return DefWindowProc(_hwnd, umsg, wparam, lparam);
		}
	}
	

	GLWindow showCursor(bool s) {
		if (_showingCursor != s) {
			ShowCursor(s);
			_showingCursor = s;
		}
		return this;
	}

	
	override GLWindow create() {
		assert (classRegistered);

		void printWinError() {
			DWORD err = GetLastError(); 
			char[512] errorMsg = 0;

			auto len = FormatMessage(
				FORMAT_MESSAGE_FROM_SYSTEM |
				FORMAT_MESSAGE_IGNORE_INSERTS,
				null,
				err,
				MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT),
				errorMsg.ptr,
				512, null);

			Stdout.formatln(`Last winapi error (code={}): {}`, err, errorMsg[0 .. len]);
		}
		
		// Win32-based applications that use Microsoft's implementation of GL to render onto a window must include WS_CLIPCHILDREN and WS_CLIPSIBLINGS window styles for that window.
		// http://support.microsoft.com/kb/q126019/
		uint windowStyle = WS_OVERLAPPED | WS_CAPTION | WS_SYSMENU | WS_MINIMIZEBOX | (WS_CLIPCHILDREN | WS_CLIPSIBLINGS);
		uint windowExtendedStyle = WS_EX_APPWINDOW;
	
		RECT windowRect;
		windowRect.top = 0;
		windowRect.left = 0;
		windowRect.right = _width;
		windowRect.bottom = _height;
	
		if (_fullscreen) {
			if (!changeScreenResolution(_width, _height, _colorBits)) {
				_fullscreen = false;
			}
			else {
				windowExtendedStyle |= WS_EX_TOPMOST;
			}
		}
		
		if (_fullscreen) {
			windowStyle = WS_POPUP | (WS_CLIPCHILDREN | WS_CLIPSIBLINGS);
		}

		//ShowCursor(false);
		
		if (!_fullscreen) {
			AdjustWindowRectEx(&windowRect, windowStyle, 0, windowExtendedStyle);
		}
	
		union CastHack {
			GLWindow thisptr;
			void* ptr;
		}
		CastHack chack;
		chack.thisptr = this;
		
		_hwnd = CreateWindowEx (
				windowExtendedStyle,
				className,
				(_title ~ \0).ptr,
				windowStyle,
				_xpos, _ypos,											// window position
				windowRect.right - windowRect.left,
				windowRect.bottom - windowRect.top,
				HWND_DESKTOP,										// parent
				null,															// menu
				hinstance(),
				chack.ptr);										// user data
				
		if (!decorations) {
			windowStyle = WS_POPUP | (WS_CLIPCHILDREN | WS_CLIPSIBLINGS);

			windowRect.top = 0;
			windowRect.left = 0;
			windowRect.right = _width;
			windowRect.bottom = _height;
			AdjustWindowRectEx(&windowRect, windowStyle, 0, windowExtendedStyle);

			SetWindowLong(_hwnd, GWL_STYLE, windowStyle);
			SetWindowPos(	_hwnd,
									cast(HANDLE)null,
									0, 0,
									windowRect.right - windowRect.left,
									windowRect.bottom - windowRect.top,
									SWP_NOZORDER | SWP_NOMOVE | SWP_NOACTIVATE | SWP_DRAWFRAME);
		}	
		
		if (_hwnd is null) {
			printWinError();
			throw new Exception("could not create a window (CreateWindowEx)");
		}
		
		scope (failure) {
			DestroyWindow(_hwnd);
			_hwnd = null;
		}
	
		_hdc = GetDC(_hwnd);
		if (_hdc is null) {
			printWinError();
			throw new Exception("window hDC is null");
		}
		
		scope (failure) {
			ReleaseDC(_hwnd, _hdc);
			_hdc = null;
		}
		
		if (_gl is null) {
			_gl._setGL(new GLHandle);
			findAndLoadLibs();
		}

		if (0 == _colorBits) {
			_colorBits = GetDeviceCaps(GetDC(HWND_DESKTOP), BITSPIXEL);
		}
		
		PIXELFORMATDESCRIPTOR pfd;
		if (preInitDone) {
			if (!_gl.wglSetPixelFormat(_hdc, overridePixelFormat, &pfd)) {
				throw new Exception("wglSetPixelFormat failed");
			}
		} else {
			with (pfd) {
				nSize = pfd.sizeof;
				nVersion = 1;
				dwFlags = PFD_DRAW_TO_WINDOW |	PFD_SUPPORT_OPENGL | PFD_DOUBLEBUFFER,
				iPixelType = PFD_TYPE_RGBA;
				cColorBits = _colorBits;
				cAlphaBits = _alphaBits;
				cDepthBits = _depthBits;
				cStencilBits = _stencilBits;
			}
			
			uint pixelFormat = ChoosePixelFormat(_hdc, &pfd);
			if (0 == pixelFormat) {
				printWinError();
				throw new Exception("ChoosePixelFormat failed");
			}
			
			if (!SetPixelFormat(_hdc, pixelFormat, &pfd)) {
				printWinError();
				throw new Exception("SetPixelFormat failed");
			}
		}
		
		_hrc = cast(typeof(_hrc))xf.dog.platform.Win32.wglCreateContext(_gl, _hdc);
		if (_hrc is null) {
			printWinError();
			throw new Exception("wglCreateContext failed");
		}
		
		scope (failure) {
			xf.dog.platform.Win32.wglDeleteContext(_gl, _hrc);
			_hrc = null;
		}
	
	
		if (!xf.dog.platform.Win32.wglMakeCurrent(_gl, _hdc, _hrc)) {
			printWinError();
			throw new Exception("wglMakeCurrent failed");
		}
		
		if (!preInitDone) {
			preInitDone = true;
			bool recreate = false;
			if (!(_gl.ext(WGL_ARB_pixel_format) in {
				static float[] fAttributes = [ 0.f, 0.f ];
				int[] formatAttribs; {
					formatAttribs ~= WGL_DRAW_TO_WINDOW_ARB;
					formatAttribs ~= GL_TRUE;
					formatAttribs ~= WGL_ACCELERATION_ARB;
					formatAttribs ~= WGL_FULL_ACCELERATION_ARB;
					formatAttribs ~= WGL_COLOR_BITS_ARB;
					formatAttribs ~= _colorBits;
					formatAttribs ~= WGL_ALPHA_BITS_ARB;
					formatAttribs ~= _alphaBits;
					formatAttribs ~= WGL_DEPTH_BITS_ARB;
					formatAttribs ~= _depthBits;
					formatAttribs ~= WGL_STENCIL_BITS_ARB;
					formatAttribs ~= _stencilBits;
					formatAttribs ~= WGL_DOUBLE_BUFFER_ARB;
					formatAttribs ~= GL_TRUE;
					formatAttribs ~= 0;
					formatAttribs ~= 0;
				}
				
				uint numFormats = 0;
				if (!xf.dog.ext.WGL_ARB_pixel_format.wglChoosePixelFormat(_gl, _hdc, formatAttribs.ptr, fAttributes.ptr, 1, &overridePixelFormat, &numFormats) || 0 == numFormats) {
					// throw new Exception("wglChoosePixelFormat failed");
				} else {
					recreate = true;
				}
			})) {
				Stdout.formatln("[GLWindow] WARNING: WGL_ARB_pixel_format not supported");
			}
			
			if (recreate) {
				destroyWindowOnly();
				return create();
			}
		}
		
		ShowWindow(_hwnd, SW_NORMAL);
		_created = true;
		_visible = true;
		
		return this;
	}


	static this() {
		win32Mutex = new Object;
		registerWindowClass();

		// ------------------------------------------------------------------------------------------------------------------------------------------------
		// I'm not very proud of what follows here, but it seems that without this 'step', creating multiple threads with GL windows fails
		// just at SetPixelFormat. Somehow w32 needs to get warmed up or something before going into threads oO
		// ------------------------------------------------------------------------------------------------------------------------------------------------

		auto _hwnd = CreateWindow(
				className,
				"hackWindow".ptr,
				WS_OVERLAPPED | WS_CLIPCHILDREN | WS_CLIPSIBLINGS,
				0, 0, 16, 16,
				HWND_DESKTOP,						// parent
				null,											// menu
				hinstance(),
				null);										// user data
	
		
		if (_hwnd !is null) {
			scope (exit) DestroyWindow(_hwnd);
			auto _hdc = GetDC(_hwnd);
			
			if (_hdc !is null) {
				scope (exit) ReleaseDC(_hwnd, _hdc);
				PIXELFORMATDESCRIPTOR pfd;
				ChoosePixelFormat(_hdc, &pfd);
			}
		}
	}
	
	
	private void destroyWindowOnly() {
		if (_hwnd !is null) {
			if (_hdc !is null)
			{
				xf.dog.platform.Win32.wglMakeCurrent(_gl, _hdc, null);
				if (_hrc !is null) {
					xf.dog.platform.Win32.wglDeleteContext(_gl, _hrc);
					_hrc = null;
				}

				ReleaseDC(_hwnd, _hdc);
				_hdc = null;
			}

			DestroyWindow(_hwnd);
			_hwnd = null;
		}
		
		_created = false;
		_visible = false;
	}
	
	
	override GLWindow destroy() {
		preInitDone = false;
		
		destroyWindowOnly();
	
		if (_fullscreen) {
			ChangeDisplaySettings(null, 0);		// default
			//ShowCursor(true);
		}
		
		return this;
	}
	
	
	GLWindow show() {
		if (_hdc !is null) {
			/**
				The mirror driver is used in VNC solutions to efficiently
				monitor changes to the display. Unfortunately it doesn't support
				hardware-accelerated rendering. We can force VNC software
				to send updates of the 3d view by faking a rendering of some
				non-hardware stuff to the window. The code below draws an invisible
				line, which is enough to invalidate the whole rectangle.
			*/
			version (WindowsMirrorDriverWorkaround) {
				RECT rc;
				GetClientRect(_hwnd, &rc); 
				SetMapMode(_hdc, MM_ANISOTROPIC); 
				SetWindowExtEx(_hdc, 100, 100, null); 
				SetViewportExtEx(_hdc, rc.right, rc.bottom, null);
				SetROP2(_hdc, R2_NOP);
				static POINT line[2] = [POINT(0,0), POINT(100,100)]; 
				Polyline(_hdc, line.ptr, 2); 
			}

			SwapBuffers(_hdc);
		}
		return this;
	}
	
	
	GLWindow update() {
		MSG msg;
		
		while (PeekMessage(&msg, _hwnd, 0, 0, PM_REMOVE)) {
			DispatchMessage(&msg);
		}
		
		return this;
	}
	

	override GL begin() {
		assert (_gl !is null);
		return _gl;
	}
	
	
	override void end() {
	}
/+	
	
	override void useInHandler(void delegate(GL) dg) {
		assert (_gl !is null);

		synchronized (this) {
			dg(_gl);
		}
	}
	+/
	
	static typeof(this) opCall() {
		return new typeof(this);
	}
	
	
	private {
		HWND		_hwnd;
		HDC			_hdc;
		HGLRC		_hrc;
		
		GL			_gl;
		
		static bool				classRegistered = false;
		static const char* 	className = "DogWindow";
		
		bool			preInitDone = false;
		int			overridePixelFormat = 0;
	}
	
	static private Object win32Mutex;


	protected {
		char[]	_title	= "xf.dog.GLWindow";
		bool		_fullscreen		= false;
		bool		_decorations		= true;
		bool		_visible				= false;
		int		_xpos				= CW_USEDEFAULT;
		int		_ypos				= CW_USEDEFAULT;
		bool		_showingCursor	= true;
	}
}


// DMD/OPTLINK sucks. if this symbol is not declared in a central point, the linker will complain about different symbol definitions and crap
alias use!(GLWindow) use__GLWindow_symbolinstance;
