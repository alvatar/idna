module dgl.ext.GLX_SGIX_fbconfig;
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



private ushort extensionId__ = 367;
alias extensionId__ GLX_SGIX_fbconfig;

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
			const GLenum GLX_WINDOW_BIT_SGIX = 0x00000001;
			const GLenum GLX_RGBA_BIT_SGIX = 0x00000001;
			const GLenum GLX_PIXMAP_BIT_SGIX = 0x00000002;
			const GLenum GLX_COLOR_INDEX_BIT_SGIX = 0x00000002;
			const GLenum GLX_SCREEN_EXT = 0x800C;
			const GLenum GLX_DRAWABLE_TYPE_SGIX = 0x8010;
			const GLenum GLX_RENDER_TYPE_SGIX = 0x8011;
			const GLenum GLX_X_RENDERABLE_SGIX = 0x8012;
			const GLenum GLX_FBCONFIG_ID_SGIX = 0x8013;
			const GLenum GLX_RGBA_TYPE_SGIX = 0x8014;
			const GLenum GLX_COLOR_INDEX_TYPE_SGIX = 0x8015;
			alias XID GLXFBConfigIDSGIX;
			alias void* GLXFBConfigSGIX;
	}
	private {
		extern (System) {
			alias GLXFBConfigSGIX* function (Display *dpy, int screen,  int *attrib_list, int *nelements)	fp_glXChooseFBConfigSGIX;
			alias GLXContext function (Display* dpy, GLXFBConfig config, int render_type, GLXContext share_list, Bool direct)	fp_glXCreateContextWithConfigSGIX;
			alias GLXPixmap function (Display* dpy, GLXFBConfig config, Pixmap pixmap)	fp_glXCreateGLXPixmapWithConfigSGIX;
			alias int function (Display* dpy, GLXFBConfigSGIX config, int attribute, int *value)	fp_glXGetFBConfigAttribSGIX;
			alias GLXFBConfigSGIX function (Display* dpy, XVisualInfo *vis)	fp_glXGetFBConfigFromVisualSGIX;
			alias XVisualInfo* function (Display *dpy, GLXFBConfig config)	fp_glXGetVisualFromFBConfigSGIX;
		}
	}
	public {
GLXFBConfigSGIX* XChooseFBConfig(GL gl_, ParameterTypeTuple!(fp_glXChooseFBConfigSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXChooseFBConfigSGIX)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "XChooseFBConfig", funcPtr, params__);
		}
GLXContext XCreateContextWithConfig(GL gl_, ParameterTypeTuple!(fp_glXCreateContextWithConfigSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXCreateContextWithConfigSGIX)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "XCreateContextWithConfig", funcPtr, params__);
		}
GLXPixmap XCreateGLXPixmapWithConfig(GL gl_, ParameterTypeTuple!(fp_glXCreateGLXPixmapWithConfigSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXCreateGLXPixmapWithConfigSGIX)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "XCreateGLXPixmapWithConfig", funcPtr, params__);
		}
int XGetFBConfigAttrib(GL gl_, ParameterTypeTuple!(fp_glXGetFBConfigAttribSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXGetFBConfigAttribSGIX)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "XGetFBConfigAttrib", funcPtr, params__);
		}
GLXFBConfigSGIX XGetFBConfigFromVisual(GL gl_, ParameterTypeTuple!(fp_glXGetFBConfigFromVisualSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXGetFBConfigFromVisualSGIX)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "XGetFBConfigFromVisual", funcPtr, params__);
		}
XVisualInfo* XGetVisualFromFBConfig(GL gl_, ParameterTypeTuple!(fp_glXGetVisualFromFBConfigSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXGetVisualFromFBConfigSGIX)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "XGetVisualFromFBConfig", funcPtr, params__);
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
		void*[] funcAddr = new void*[6];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GLX_SGIX_fbconfig")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glXChooseFBConfigSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glXCreateContextWithConfigSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glXCreateGLXPixmapWithConfigSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glXGetFBConfigAttribSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glXGetFBConfigFromVisualSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glXGetVisualFromFBConfigSGIX"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
