module dgl.ext.WGL_EXT_pbuffer;
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



private ushort extensionId__ = 245;
alias extensionId__ WGL_EXT_pbuffer;
import dgl.ext.WGL_EXT_extensions_string;
import dgl.ext.WGL_EXT_pixel_format;

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
			const GLenum WGL_DRAW_TO_PBUFFER_EXT = 0x202D;
			const GLenum WGL_MAX_PBUFFER_PIXELS_EXT = 0x202E;
			const GLenum WGL_MAX_PBUFFER_WIDTH_EXT = 0x202F;
			const GLenum WGL_MAX_PBUFFER_HEIGHT_EXT = 0x2030;
			const GLenum WGL_OPTIMAL_PBUFFER_WIDTH_EXT = 0x2031;
			const GLenum WGL_OPTIMAL_PBUFFER_HEIGHT_EXT = 0x2032;
			const GLenum WGL_PBUFFER_LARGEST_EXT = 0x2033;
			const GLenum WGL_PBUFFER_WIDTH_EXT = 0x2034;
			const GLenum WGL_PBUFFER_HEIGHT_EXT = 0x2035;
			typedef HANDLE HPBUFFEREXT;
	}
	private {
		extern (System) {
			alias HPBUFFEREXT function (HDC hDC, int iPixelFormat, int iWidth, int iHeight,  int* piAttribList)	fp_wglCreatePbufferEXT;
			alias BOOL function (HPBUFFEREXT hPbuffer)	fp_wglDestroyPbufferEXT;
			alias HDC function (HPBUFFEREXT hPbuffer)	fp_wglGetPbufferDCEXT;
			alias BOOL function (HPBUFFEREXT hPbuffer, int iAttribute, int* piValue)	fp_wglQueryPbufferEXT;
			alias int function (HPBUFFEREXT hPbuffer, HDC hDC)	fp_wglReleasePbufferDCEXT;
		}
	}
	public {
HPBUFFEREXT wglCreatePbuffer(GL gl_, ParameterTypeTuple!(fp_wglCreatePbufferEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglCreatePbufferEXT)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "wglCreatePbuffer", funcPtr, params__);
		}
BOOL wglDestroyPbuffer(GL gl_, ParameterTypeTuple!(fp_wglDestroyPbufferEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglDestroyPbufferEXT)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "wglDestroyPbuffer", funcPtr, params__);
		}
HDC wglGetPbufferDC(GL gl_, ParameterTypeTuple!(fp_wglGetPbufferDCEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglGetPbufferDCEXT)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "wglGetPbufferDC", funcPtr, params__);
		}
BOOL wglQueryPbuffer(GL gl_, ParameterTypeTuple!(fp_wglQueryPbufferEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglQueryPbufferEXT)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "wglQueryPbuffer", funcPtr, params__);
		}
int wglReleasePbufferDC(GL gl_, ParameterTypeTuple!(fp_wglReleasePbufferDCEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglReleasePbufferDCEXT)(gl.extFuncs[extensionId__][4]);
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
			if (!extStr.containsPattern("WGL_EXT_pbuffer")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"wglCreatePbufferEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"wglDestroyPbufferEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"wglGetPbufferDCEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"wglQueryPbufferEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"wglReleasePbufferDCEXT"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
