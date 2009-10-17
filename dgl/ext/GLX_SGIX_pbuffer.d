module dgl.ext.GLX_SGIX_pbuffer;
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



private ushort extensionId__ = 344;
alias extensionId__ GLX_SGIX_pbuffer;

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
			const GLenum GLX_FRONT_LEFT_BUFFER_BIT_SGIX = 0x00000001;
			const GLenum GLX_FRONT_RIGHT_BUFFER_BIT_SGIX = 0x00000002;
			const GLenum GLX_PBUFFER_BIT_SGIX = 0x00000004;
			const GLenum GLX_BACK_LEFT_BUFFER_BIT_SGIX = 0x00000004;
			const GLenum GLX_BACK_RIGHT_BUFFER_BIT_SGIX = 0x00000008;
			const GLenum GLX_AUX_BUFFERS_BIT_SGIX = 0x00000010;
			const GLenum GLX_DEPTH_BUFFER_BIT_SGIX = 0x00000020;
			const GLenum GLX_STENCIL_BUFFER_BIT_SGIX = 0x00000040;
			const GLenum GLX_ACCUM_BUFFER_BIT_SGIX = 0x00000080;
			const GLenum GLX_SAMPLE_BUFFERS_BIT_SGIX = 0x00000100;
			const GLenum GLX_MAX_PBUFFER_WIDTH_SGIX = 0x8016;
			const GLenum GLX_MAX_PBUFFER_HEIGHT_SGIX = 0x8017;
			const GLenum GLX_MAX_PBUFFER_PIXELS_SGIX = 0x8018;
			const GLenum GLX_OPTIMAL_PBUFFER_WIDTH_SGIX = 0x8019;
			const GLenum GLX_OPTIMAL_PBUFFER_HEIGHT_SGIX = 0x801A;
			const GLenum GLX_PRESERVED_CONTENTS_SGIX = 0x801B;
			const GLenum GLX_LARGEST_PBUFFER_SGIX = 0x801C;
			const GLenum GLX_WIDTH_SGIX = 0x801D;
			const GLenum GLX_HEIGHT_SGIX = 0x801E;
			const GLenum GLX_EVENT_MASK_SGIX = 0x801F;
			const GLenum GLX_DAMAGED_SGIX = 0x8020;
			const GLenum GLX_SAVED_SGIX = 0x8021;
			const GLenum GLX_WINDOW_SGIX = 0x8022;
			const GLenum GLX_PBUFFER_SGIX = 0x8023;
			const GLenum GLX_BUFFER_CLOBBER_MASK_SGIX = 0x08000000;
			alias XID GLXPbufferSGIX;
			struct GLXBufferClobberEventSGIX{ int type; uint serial; Bool send_event; Display *display; GLXDrawable drawable; int event_type; int draw_type; uint mask; int x, y; int width, height; int count; }
	}
	private {
		extern (System) {
			alias GLXPbuffer function (Display* dpy, GLXFBConfig config, uint width, uint height, int *attrib_list)	fp_glXCreateGLXPbufferSGIX;
			alias void function (Display* dpy, GLXPbuffer pbuf)	fp_glXDestroyGLXPbufferSGIX;
			alias void function (Display* dpy, GLXDrawable drawable, uint *mask)	fp_glXGetSelectedEventSGIX;
			alias void function (Display* dpy, GLXPbuffer pbuf, int attribute, uint *value)	fp_glXQueryGLXPbufferSGIX;
			alias void function (Display* dpy, GLXDrawable drawable, uint mask)	fp_glXSelectEventSGIX;
		}
	}
	public {
GLXPbuffer XCreateGLXPbuffer(GL gl_, ParameterTypeTuple!(fp_glXCreateGLXPbufferSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXCreateGLXPbufferSGIX)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "XCreateGLXPbuffer", funcPtr, params__);
		}
void XDestroyGLXPbuffer(GL gl_, ParameterTypeTuple!(fp_glXDestroyGLXPbufferSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXDestroyGLXPbufferSGIX)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "XDestroyGLXPbuffer", funcPtr, params__);
		}
void XGetSelectedEvent(GL gl_, ParameterTypeTuple!(fp_glXGetSelectedEventSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXGetSelectedEventSGIX)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "XGetSelectedEvent", funcPtr, params__);
		}
void XQueryGLXPbuffer(GL gl_, ParameterTypeTuple!(fp_glXQueryGLXPbufferSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXQueryGLXPbufferSGIX)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "XQueryGLXPbuffer", funcPtr, params__);
		}
void XSelectEvent(GL gl_, ParameterTypeTuple!(fp_glXSelectEventSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXSelectEventSGIX)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "XSelectEvent", funcPtr, params__);
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
		void*[] funcAddr = new void*[5];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GLX_SGIX_pbuffer")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glXCreateGLXPbufferSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glXDestroyGLXPbufferSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glXGetSelectedEventSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glXQueryGLXPbufferSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glXSelectEventSGIX"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
