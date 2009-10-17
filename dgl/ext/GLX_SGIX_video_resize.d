module dgl.ext.GLX_SGIX_video_resize;
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



private ushort extensionId__ = 313;
alias extensionId__ GLX_SGIX_video_resize;

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
			const GLenum GLX_SYNC_FRAME_SGIX = 0x00000000;
			const GLenum GLX_SYNC_SWAP_SGIX = 0x00000001;
	}
	private {
		extern (System) {
			alias int function (Display* display, int screen, int channel, Window window)	fp_glXBindChannelToWindowSGIX;
			alias int function (Display* display, int screen, int channel, int x, int y, int w, int h)	fp_glXChannelRectSGIX;
			alias int function (Display* display, int screen, int channel, GLenum synctype)	fp_glXChannelRectSyncSGIX;
			alias int function (Display* display, int screen, int channel, int *x, int *y, int *w, int *h)	fp_glXQueryChannelDeltasSGIX;
			alias int function (Display* display, int screen, int channel, int *dx, int *dy, int *dw, int *dh)	fp_glXQueryChannelRectSGIX;
		}
	}
	public {
int XBindChannelToWindow(GL gl_, ParameterTypeTuple!(fp_glXBindChannelToWindowSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXBindChannelToWindowSGIX)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "XBindChannelToWindow", funcPtr, params__);
		}
int XChannelRect(GL gl_, ParameterTypeTuple!(fp_glXChannelRectSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXChannelRectSGIX)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "XChannelRect", funcPtr, params__);
		}
int XChannelRectSync(GL gl_, ParameterTypeTuple!(fp_glXChannelRectSyncSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXChannelRectSyncSGIX)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "XChannelRectSync", funcPtr, params__);
		}
int XQueryChannelDeltas(GL gl_, ParameterTypeTuple!(fp_glXQueryChannelDeltasSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXQueryChannelDeltasSGIX)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "XQueryChannelDeltas", funcPtr, params__);
		}
int XQueryChannelRect(GL gl_, ParameterTypeTuple!(fp_glXQueryChannelRectSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXQueryChannelRectSGIX)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "XQueryChannelRect", funcPtr, params__);
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
			if (!extStr.containsPattern("GLX_SGIX_video_resize")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glXBindChannelToWindowSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glXChannelRectSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glXChannelRectSyncSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glXQueryChannelDeltasSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glXQueryChannelRectSGIX"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
