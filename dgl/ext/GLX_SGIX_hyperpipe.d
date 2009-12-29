module dgl.ext.GLX_SGIX_hyperpipe;
import dgl.opengl;
import dgl.glext;

version( D_Version2 ) {
	import std.string : containsPattern = count;
	import std.conv;
} else {
	import tango.text.Util : containsPattern;
	import tango.stdc.stringz : fromStringz;
	alias char[] string;
}



private ushort extensionId__ = 31;
alias extensionId__ GLX_SGIX_hyperpipe;

	version (DglNoExtSupportAsserts) {
	} else {
		version = DglExtSupportAsserts;
	}
	
	static this() {
		if (__extSupportCheckingFuncs.length <= extensionId__) {
			__extSupportCheckingFuncs.length = extensionId__ + 1;
		}
		__extSupportCheckingFuncs[extensionId__] = &__supported;
	}

version (Posix) {
	public {
			const GLenum GLX_HYPERPIPE_ID_SGIX = 0x8030;
			const GLenum GLX_HYPERPIPE_PIPE_NAME_LENGTH_SGIX = 80;
			const GLenum GLX_HYPERPIPE_DISPLAY_PIPE_SGIX = 0x00000001;
			const GLenum GLX_HYPERPIPE_RENDER_PIPE_SGIX = 0x00000002;
			const GLenum GLX_PIPE_RECT_SGIX = 0x00000001;
			const GLenum GLX_PIPE_RECT_LIMITS_SGIX = 0x00000002;
			const GLenum GLX_HYPERPIPE_STEREO_SGIX = 0x00000003;
			const GLenum GLX_HYPERPIPE_PIXEL_AVERAGE_SGIX = 0x00000004;
			const GLenum GLX_BAD_HYPERPIPE_CONFIG_SGIX = 91;
			const GLenum GLX_BAD_HYPERPIPE_SGIX = 92;
			struct GLXHyperpipeNetworkSGIX{  char pipeName[GLX_HYPERPIPE_PIPE_NAME_LENGTH_SGIX];   int  networkId; }
			struct GLXHyperpipeConfigSGIX{  char pipeName[GLX_HYPERPIPE_PIPE_NAME_LENGTH_SGIX];   int channel;   uint participationType;   int timeSlice; }
			struct GLXPipeRect{  char pipeName[GLX_HYPERPIPE_PIPE_NAME_LENGTH_SGIX];   int srcXOrigin;   int srcYOrigin;   int srcWidth;   int srcHeight;   int destXOrigin;   int destYOrigin;   int destWidth;   int destHeight; }
			struct GLXPipeRectLimits{  char pipeName[GLX_HYPERPIPE_PIPE_NAME_LENGTH_SGIX];   int XOrigin;   int YOrigin;   int maxHeight;   int maxWidth; }
	}
	private {
		extern (System) {
			alias GLXHyperpipeNetworkSGIX * function (Display *dpy, int *npipes)	fp_glXQueryHyperpipeNetworkSGIX;
			alias int function (Display *dpy, int networkId, int npipes, GLXHyperpipeConfigSGIX *cfg, int *hpId)	fp_glXHyperpipeConfigSGIX;
			alias GLXHyperpipeConfigSGIX * function (Display *dpy, int hpId, int *npipes)	fp_glXQueryHyperpipeConfigSGIX;
			alias int function (Display *dpy, int hpId)	fp_glXDestroyHyperpipeConfigSGIX;
			alias int function (Display *dpy, int hpId)	fp_glXBindHyperpipeSGIX;
			alias int function (Display *dpy, int timeSlice, int attrib, int size, void *attribList, void *returnAttribList)	fp_glXQueryHyperpipeBestAttribSGIX;
			alias int function (Display *dpy, int timeSlice, int attrib, int size, void *attribList)	fp_glXHyperpipeAttribSGIX;
			alias int function (Display *dpy, int timeSlice, int attrib, int size, void *returnAttribList)	fp_glXQueryHyperpipeAttribSGIX;
		}
	}
	public {
GLXHyperpipeNetworkSGIX * XQueryHyperpipeNetwork(GL gl_, ParameterTypeTuple!(fp_glXQueryHyperpipeNetworkSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXQueryHyperpipeNetworkSGIX)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "XQueryHyperpipeNetwork", funcPtr, params__);
		}
int XHyperpipeConfig(GL gl_, ParameterTypeTuple!(fp_glXHyperpipeConfigSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXHyperpipeConfigSGIX)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "XHyperpipeConfig", funcPtr, params__);
		}
GLXHyperpipeConfigSGIX * XQueryHyperpipeConfig(GL gl_, ParameterTypeTuple!(fp_glXQueryHyperpipeConfigSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXQueryHyperpipeConfigSGIX)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "XQueryHyperpipeConfig", funcPtr, params__);
		}
int XDestroyHyperpipeConfig(GL gl_, ParameterTypeTuple!(fp_glXDestroyHyperpipeConfigSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXDestroyHyperpipeConfigSGIX)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "XDestroyHyperpipeConfig", funcPtr, params__);
		}
int XBindHyperpipe(GL gl_, ParameterTypeTuple!(fp_glXBindHyperpipeSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXBindHyperpipeSGIX)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "XBindHyperpipe", funcPtr, params__);
		}
int XQueryHyperpipeBestAttrib(GL gl_, ParameterTypeTuple!(fp_glXQueryHyperpipeBestAttribSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXQueryHyperpipeBestAttribSGIX)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "XQueryHyperpipeBestAttrib", funcPtr, params__);
		}
int XHyperpipeAttrib(GL gl_, ParameterTypeTuple!(fp_glXHyperpipeAttribSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXHyperpipeAttribSGIX)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "XHyperpipeAttrib", funcPtr, params__);
		}
int XQueryHyperpipeAttrib(GL gl_, ParameterTypeTuple!(fp_glXQueryHyperpipeAttribSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXQueryHyperpipeAttribSGIX)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "XQueryHyperpipeAttrib", funcPtr, params__);
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
				
				version (DglExtSupportAsserts) {
					gl.extEnabled.length = extensionId__ + 1;
				}
			}
			gl.extFuncs[extensionId__] = loadFunctions__(gl_);
			
			return gl.extFuncs[extensionId__][0] !is null;
		}
	}
	private void*[] loadFunctions__(GL gl) {
		void*[] funcAddr = new void*[8];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GLX_SGIX_hyperpipe")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glXQueryHyperpipeNetworkSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glXHyperpipeConfigSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glXQueryHyperpipeConfigSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glXDestroyHyperpipeConfigSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glXBindHyperpipeSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glXQueryHyperpipeBestAttribSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glXHyperpipeAttribSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glXQueryHyperpipeAttribSGIX"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
