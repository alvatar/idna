module dgl.ext.WGL_ARB_pbuffer;
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



private ushort extensionId__ = 150;
alias extensionId__ WGL_ARB_pbuffer;
import dgl.ext.WGL_ARB_extensions_string;
import dgl.ext.WGL_ARB_pixel_format;

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

version (Windows) {
	public {
			const GLenum WGL_DRAW_TO_PBUFFER_ARB = 0x202D;
			const GLenum WGL_MAX_PBUFFER_PIXELS_ARB = 0x202E;
			const GLenum WGL_MAX_PBUFFER_WIDTH_ARB = 0x202F;
			const GLenum WGL_MAX_PBUFFER_HEIGHT_ARB = 0x2030;
			const GLenum WGL_PBUFFER_LARGEST_ARB = 0x2033;
			const GLenum WGL_PBUFFER_WIDTH_ARB = 0x2034;
			const GLenum WGL_PBUFFER_HEIGHT_ARB = 0x2035;
			const GLenum WGL_PBUFFER_LOST_ARB = 0x2036;
			typedef HANDLE HPBUFFERARB;
	}
	private {
		extern (System) {
			alias HPBUFFERARB function (HDC hDC, int iPixelFormat, int iWidth, int iHeight,  int* piAttribList)	fp_wglCreatePbufferARB;
			alias BOOL function (HPBUFFERARB hPbuffer)	fp_wglDestroyPbufferARB;
			alias HDC function (HPBUFFERARB hPbuffer)	fp_wglGetPbufferDCARB;
			alias BOOL function (HPBUFFERARB hPbuffer, int iAttribute, int* piValue)	fp_wglQueryPbufferARB;
			alias int function (HPBUFFERARB hPbuffer, HDC hDC)	fp_wglReleasePbufferDCARB;
		}
	}
	public {
HPBUFFERARB wglCreatePbuffer(GL gl_, ParameterTypeTuple!(fp_wglCreatePbufferARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglCreatePbufferARB)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "wglCreatePbuffer", funcPtr, params__);
		}
BOOL wglDestroyPbuffer(GL gl_, ParameterTypeTuple!(fp_wglDestroyPbufferARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglDestroyPbufferARB)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "wglDestroyPbuffer", funcPtr, params__);
		}
HDC wglGetPbufferDC(GL gl_, ParameterTypeTuple!(fp_wglGetPbufferDCARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglGetPbufferDCARB)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "wglGetPbufferDC", funcPtr, params__);
		}
BOOL wglQueryPbuffer(GL gl_, ParameterTypeTuple!(fp_wglQueryPbufferARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglQueryPbufferARB)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "wglQueryPbuffer", funcPtr, params__);
		}
int wglReleasePbufferDC(GL gl_, ParameterTypeTuple!(fp_wglReleasePbufferDCARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglReleasePbufferDCARB)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "wglReleasePbufferDC", funcPtr, params__);
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
import dgl.ext.WGL_EXT_extensions_string : wglGetExtensionsString, WGL_EXT_extensions_string;
	private void*[] loadFunctions__(GL gl) {
		void*[] funcAddr = new void*[5];
		{
			string extStr;
			gl.ext(WGL_EXT_extensions_string) in {
				char* extP = wglGetExtensionsString(gl);
				version( D_Version2 ) {
					if (extP !is null) extStr = to!(string)(extP);
				} else {
					if (extP !is null) extStr = fromStringz(extP);
				}
			};
			if (!extStr.containsPattern("WGL_ARB_pbuffer")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"wglCreatePbufferARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"wglDestroyPbufferARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"wglGetPbufferDCARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"wglQueryPbufferARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"wglReleasePbufferDCARB"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
