module dgl.ext.GLX_VERSION_1_3;
import dgl.OpenGL;
import dgl.GLExt;

version( D_Version2 ) {
	import std.string : containsPattern = count;
	import std.conv;
} else {
	import tango.text.Util : containsPattern;
	import tango.stdc.stringz : fromStringz;
	alias char[] string;
}



private ushort extensionId__ = 401;
alias extensionId__ GLX_VERSION_1_3;

	version (DogNoExtSupportAsserts) {
	} else {
		version = DogExtSupportAsserts;
	}
	
	static this() {
		if (__extSupportCheckingFuncs.length <= extensionId__) {
			__extSupportCheckingFuncs.length = extensionId__ + 1;
		}
		__extSupportCheckingFuncs[extensionId__] = &__supported;
	}

version (Posix) {
	public {
			const GLenum GLX_WINDOW_BIT = 0x00000001;
			const GLenum GLX_PIXMAP_BIT = 0x00000002;
			const GLenum GLX_PBUFFER_BIT = 0x00000004;
			const GLenum GLX_RGBA_BIT = 0x00000001;
			const GLenum GLX_COLOR_INDEX_BIT = 0x00000002;
			const GLenum GLX_PBUFFER_CLOBBER_MASK = 0x08000000;
			const GLenum GLX_FRONT_LEFT_BUFFER_BIT = 0x00000001;
			const GLenum GLX_FRONT_RIGHT_BUFFER_BIT = 0x00000002;
			const GLenum GLX_BACK_LEFT_BUFFER_BIT = 0x00000004;
			const GLenum GLX_BACK_RIGHT_BUFFER_BIT = 0x00000008;
			const GLenum GLX_AUX_BUFFERS_BIT = 0x00000010;
			const GLenum GLX_DEPTH_BUFFER_BIT = 0x00000020;
			const GLenum GLX_STENCIL_BUFFER_BIT = 0x00000040;
			const GLenum GLX_ACCUM_BUFFER_BIT = 0x00000080;
			const GLenum GLX_CONFIG_CAVEAT = 0x20;
			const GLenum GLX_X_VISUAL_TYPE = 0x22;
			const GLenum GLX_TRANSPARENT_TYPE = 0x23;
			const GLenum GLX_TRANSPARENT_INDEX_VALUE = 0x24;
			const GLenum GLX_TRANSPARENT_RED_VALUE = 0x25;
			const GLenum GLX_TRANSPARENT_GREEN_VALUE = 0x26;
			const GLenum GLX_TRANSPARENT_BLUE_VALUE = 0x27;
			const GLenum GLX_TRANSPARENT_ALPHA_VALUE = 0x28;
			const GLenum GLX_DONT_CARE = 0xFFFFFFFF;
			const GLenum GLX_NONE = 0x8000;
			const GLenum GLX_SLOW_CONFIG = 0x8001;
			const GLenum GLX_TRUE_COLOR = 0x8002;
			const GLenum GLX_DIRECT_COLOR = 0x8003;
			const GLenum GLX_PSEUDO_COLOR = 0x8004;
			const GLenum GLX_STATIC_COLOR = 0x8005;
			const GLenum GLX_GRAY_SCALE = 0x8006;
			const GLenum GLX_STATIC_GRAY = 0x8007;
			const GLenum GLX_TRANSPARENT_RGB = 0x8008;
			const GLenum GLX_TRANSPARENT_INDEX = 0x8009;
			const GLenum GLX_VISUAL_ID = 0x800B;
			const GLenum GLX_SCREEN = 0x800C;
			const GLenum GLX_NON_CONFORMANT_CONFIG = 0x800D;
			const GLenum GLX_DRAWABLE_TYPE = 0x8010;
			const GLenum GLX_RENDER_TYPE = 0x8011;
			const GLenum GLX_X_RENDERABLE = 0x8012;
			const GLenum GLX_FBCONFIG_ID = 0x8013;
			const GLenum GLX_RGBA_TYPE = 0x8014;
			const GLenum GLX_COLOR_INDEX_TYPE = 0x8015;
			const GLenum GLX_MAX_PBUFFER_WIDTH = 0x8016;
			const GLenum GLX_MAX_PBUFFER_HEIGHT = 0x8017;
			const GLenum GLX_MAX_PBUFFER_PIXELS = 0x8018;
			const GLenum GLX_PRESERVED_CONTENTS = 0x801B;
			const GLenum GLX_LARGEST_PBUFFER = 0x801C;
			const GLenum GLX_WIDTH = 0x801D;
			const GLenum GLX_HEIGHT = 0x801E;
			const GLenum GLX_EVENT_MASK = 0x801F;
			const GLenum GLX_DAMAGED = 0x8020;
			const GLenum GLX_SAVED = 0x8021;
			const GLenum GLX_WINDOW = 0x8022;
			const GLenum GLX_PBUFFER = 0x8023;
			const GLenum GLX_PBUFFER_HEIGHT = 0x8040;
			const GLenum GLX_PBUFFER_WIDTH = 0x8041;
			alias XID GLXWindow;
			alias XID GLXPbuffer;
			alias XID GLXFBConfigID;
			alias void* GLXFBConfig;
			struct GLXPbufferClobberEvent{  int event_type;   int draw_type;   uint serial;   Bool send_event;   Display *display;   GLXDrawable drawable;   uint buffer_mask;   uint aux_buffer;   int x, y;   int width, height;   int count; }
			union __GLXEvent {  GLXPbufferClobberEvent glxpbufferclobber;   int pad[24]; }
			alias __GLXEvent  GLXEvent;;
	}
	private {
		extern (System) {
			alias GLXFBConfig* function (Display *dpy, int screen,  int *attrib_list, int *nelements)	fp_glXChooseFBConfig;
			alias GLXFBConfig* function (Display *dpy, int screen, int *nelements)	fp_glXGetFBConfigs;
			alias XVisualInfo* function (Display *dpy, GLXFBConfig config)	fp_glXGetVisualFromFBConfig;
			alias int function (Display *dpy, GLXFBConfig config, int attribute, int *value)	fp_glXGetFBConfigAttrib;
			alias GLXWindow function (Display *dpy, GLXFBConfig config, Window win_,  int *attrib_list)	fp_glXCreateWindow;
			alias void function (Display *dpy, GLXWindow win_)	fp_glXDestroyWindow;
			alias GLXPixmap function (Display *dpy, GLXFBConfig config, Pixmap pixmap,  int *attrib_list)	fp_glXCreatePixmap;
			alias void function (Display *dpy, GLXPixmap pixmap)	fp_glXDestroyPixmap;
			alias GLXPbuffer function (Display *dpy, GLXFBConfig config,  int *attrib_list)	fp_glXCreatePbuffer;
			alias void function (Display *dpy, GLXPbuffer pbuf)	fp_glXDestroyPbuffer;
			alias void function (Display *dpy, GLXDrawable draw, int attribute, uint *value)	fp_glXQueryDrawable;
			alias GLXContext function (Display *dpy, GLXFBConfig config, int render_type, GLXContext share_list, Bool direct)	fp_glXCreateNewContext;
			alias Bool function (Display *display, GLXDrawable draw, GLXDrawable read, GLXContext ctx)	fp_glXMakeContextCurrent;
			alias GLXDrawable function ()	fp_glXGetCurrentReadDrawable;
			alias int function (Display *dpy, GLXContext ctx, int attribute, int *value)	fp_glXQueryContext;
			alias void function (Display *dpy, GLXDrawable draw, uint event_mask)	fp_glXSelectEvent;
			alias void function (Display *dpy, GLXDrawable draw, uint *event_mask)	fp_glXGetSelectedEvent;
		}
	}
	public {
GLXFBConfig* XChooseFBConfig(GL gl_, ParameterTypeTuple!(fp_glXChooseFBConfig) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXChooseFBConfig)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "XChooseFBConfig", funcPtr, params__);
		}
GLXFBConfig* XGetFBConfigs(GL gl_, ParameterTypeTuple!(fp_glXGetFBConfigs) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXGetFBConfigs)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "XGetFBConfigs", funcPtr, params__);
		}
XVisualInfo* XGetVisualFromFBConfig(GL gl_, ParameterTypeTuple!(fp_glXGetVisualFromFBConfig) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXGetVisualFromFBConfig)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "XGetVisualFromFBConfig", funcPtr, params__);
		}
int XGetFBConfigAttrib(GL gl_, ParameterTypeTuple!(fp_glXGetFBConfigAttrib) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXGetFBConfigAttrib)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "XGetFBConfigAttrib", funcPtr, params__);
		}
GLXWindow XCreateWindow(GL gl_, ParameterTypeTuple!(fp_glXCreateWindow) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXCreateWindow)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "XCreateWindow", funcPtr, params__);
		}
void XDestroyWindow(GL gl_, ParameterTypeTuple!(fp_glXDestroyWindow) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXDestroyWindow)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "XDestroyWindow", funcPtr, params__);
		}
GLXPixmap XCreatePixmap(GL gl_, ParameterTypeTuple!(fp_glXCreatePixmap) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXCreatePixmap)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "XCreatePixmap", funcPtr, params__);
		}
void XDestroyPixmap(GL gl_, ParameterTypeTuple!(fp_glXDestroyPixmap) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXDestroyPixmap)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "XDestroyPixmap", funcPtr, params__);
		}
GLXPbuffer XCreatePbuffer(GL gl_, ParameterTypeTuple!(fp_glXCreatePbuffer) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXCreatePbuffer)(gl.extFuncs[extensionId__][8]);
			return checkedCall(gl_, "XCreatePbuffer", funcPtr, params__);
		}
void XDestroyPbuffer(GL gl_, ParameterTypeTuple!(fp_glXDestroyPbuffer) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXDestroyPbuffer)(gl.extFuncs[extensionId__][9]);
			return checkedCall(gl_, "XDestroyPbuffer", funcPtr, params__);
		}
void XQueryDrawable(GL gl_, ParameterTypeTuple!(fp_glXQueryDrawable) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXQueryDrawable)(gl.extFuncs[extensionId__][10]);
			return checkedCall(gl_, "XQueryDrawable", funcPtr, params__);
		}
GLXContext XCreateNewContext(GL gl_, ParameterTypeTuple!(fp_glXCreateNewContext) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXCreateNewContext)(gl.extFuncs[extensionId__][11]);
			return checkedCall(gl_, "XCreateNewContext", funcPtr, params__);
		}
Bool XMakeContextCurrent(GL gl_, ParameterTypeTuple!(fp_glXMakeContextCurrent) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXMakeContextCurrent)(gl.extFuncs[extensionId__][12]);
			return checkedCall(gl_, "XMakeContextCurrent", funcPtr, params__);
		}
GLXDrawable XGetCurrentReadDrawable(GL gl_, ParameterTypeTuple!(fp_glXGetCurrentReadDrawable) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXGetCurrentReadDrawable)(gl.extFuncs[extensionId__][13]);
			return checkedCall(gl_, "XGetCurrentReadDrawable", funcPtr, params__);
		}
int XQueryContext(GL gl_, ParameterTypeTuple!(fp_glXQueryContext) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXQueryContext)(gl.extFuncs[extensionId__][14]);
			return checkedCall(gl_, "XQueryContext", funcPtr, params__);
		}
void XSelectEvent(GL gl_, ParameterTypeTuple!(fp_glXSelectEvent) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXSelectEvent)(gl.extFuncs[extensionId__][15]);
			return checkedCall(gl_, "XSelectEvent", funcPtr, params__);
		}
void XGetSelectedEvent(GL gl_, ParameterTypeTuple!(fp_glXGetSelectedEvent) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXGetSelectedEvent)(gl.extFuncs[extensionId__][16]);
			return checkedCall(gl_, "XGetSelectedEvent", funcPtr, params__);
		}
	}
	private final bool __supported(GL gl_) {
		auto gl = _getGL(gl_);
	
		if (extensionId__ < cast(int)gl.extFuncs.length && gl.extFuncs[extensionId__] !is null) {
			return gl.extFuncs[extensionId__][0] !is null;
		}
		
		synchronized (gl) {
			if (extensionId__ < cast(int)gl.extFuncs.length && gl.extFuncs[extensionId__] !is null) {
				return gl.extFuncs[extensionId__][0] !is null;
			}

			if (gl.extFuncs.length <= extensionId__) {
				gl.extFuncs.length = extensionId__ + 1;
				
				version (DogExtSupportAsserts) {
					gl.extEnabled.length = extensionId__ + 1;
				}
			}
			gl.extFuncs[extensionId__] = loadFunctions__(gl_);
			
			return gl.extFuncs[extensionId__][0] !is null;
		}
	}
	private void*[] loadFunctions__(GL gl) {
		void*[] funcAddr = new void*[17];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GLX_VERSION_1_3")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glXChooseFBConfig"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glXGetFBConfigs"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glXGetVisualFromFBConfig"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glXGetFBConfigAttrib"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glXCreateWindow"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glXDestroyWindow"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glXCreatePixmap"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glXDestroyPixmap"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[8] = getExtensionFuncPtr(cast(char*)"glXCreatePbuffer"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[9] = getExtensionFuncPtr(cast(char*)"glXDestroyPbuffer"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[10] = getExtensionFuncPtr(cast(char*)"glXQueryDrawable"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[11] = getExtensionFuncPtr(cast(char*)"glXCreateNewContext"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[12] = getExtensionFuncPtr(cast(char*)"glXMakeContextCurrent"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[13] = getExtensionFuncPtr(cast(char*)"glXGetCurrentReadDrawable"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[14] = getExtensionFuncPtr(cast(char*)"glXQueryContext"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[15] = getExtensionFuncPtr(cast(char*)"glXSelectEvent"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[16] = getExtensionFuncPtr(cast(char*)"glXGetSelectedEvent"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
