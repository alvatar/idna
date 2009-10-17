module dgl.ext.WGL_I3D_gamma;
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



private ushort extensionId__ = 102;
alias extensionId__ WGL_I3D_gamma;
import dgl.ext.WGL_EXT_extensions_string;

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
			const GLenum WGL_GAMMA_TABLE_SIZE_I3D = 0x204E;
			const GLenum WGL_GAMMA_EXCLUDE_DESKTOP_I3D = 0x204F;
	}
	private {
		extern (System) {
			alias BOOL function (HDC hDC, int iEntries, USHORT* puRed, USHORT *puGreen, USHORT *puBlue)	fp_wglGetGammaTableI3D;
			alias BOOL function (HDC hDC, int iAttribute, int* piValue)	fp_wglGetGammaTableParametersI3D;
			alias BOOL function (HDC hDC, int iEntries,  USHORT* puRed,  USHORT *puGreen,  USHORT *puBlue)	fp_wglSetGammaTableI3D;
			alias BOOL function (HDC hDC, int iAttribute,  int* piValue)	fp_wglSetGammaTableParametersI3D;
		}
	}
	public {
BOOL wglGetGammaTable(GL gl_, ParameterTypeTuple!(fp_wglGetGammaTableI3D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglGetGammaTableI3D)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "wglGetGammaTable", funcPtr, params__);
		}
BOOL wglGetGammaTableParameters(GL gl_, ParameterTypeTuple!(fp_wglGetGammaTableParametersI3D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglGetGammaTableParametersI3D)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "wglGetGammaTableParameters", funcPtr, params__);
		}
BOOL wglSetGammaTable(GL gl_, ParameterTypeTuple!(fp_wglSetGammaTableI3D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglSetGammaTableI3D)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "wglSetGammaTable", funcPtr, params__);
		}
BOOL wglSetGammaTableParameters(GL gl_, ParameterTypeTuple!(fp_wglSetGammaTableParametersI3D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglSetGammaTableParametersI3D)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "wglSetGammaTableParameters", funcPtr, params__);
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
		void*[] funcAddr = new void*[4];
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
			if (!extStr.containsPattern("WGL_I3D_gamma")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"wglGetGammaTableI3D"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"wglGetGammaTableParametersI3D"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"wglSetGammaTableI3D"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"wglSetGammaTableParametersI3D"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
