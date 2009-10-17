module dgl.ext.WGL_OML_sync_control;
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



private ushort extensionId__ = 56;
alias extensionId__ WGL_OML_sync_control;
import dgl.ext.WGL_ARB_extensions_string;

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
	}
	private {
		extern (System) {
			alias BOOL function (HDC hdc, INT32* numerator, INT32 *denominator)	fp_wglGetMscRateOML;
			alias BOOL function (HDC hdc, INT64* ust, INT64 *msc, INT64 *sbc)	fp_wglGetSyncValuesOML;
			alias INT64 function (HDC hdc, INT64 target_msc, INT64 divisor, INT64 remainder)	fp_wglSwapBuffersMscOML;
			alias INT64 function (HDC hdc, INT fuPlanes, INT64 target_msc, INT64 divisor, INT64 remainder)	fp_wglSwapLayerBuffersMscOML;
			alias BOOL function (HDC hdc, INT64 target_msc, INT64 divisor, INT64 remainder, INT64* ust, INT64 *msc, INT64 *sbc)	fp_wglWaitForMscOML;
			alias BOOL function (HDC hdc, INT64 target_sbc, INT64* ust, INT64 *msc, INT64 *sbc)	fp_wglWaitForSbcOML;
		}
	}
	public {
BOOL wglGetMscRate(GL gl_, ParameterTypeTuple!(fp_wglGetMscRateOML) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglGetMscRateOML)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "wglGetMscRate", funcPtr, params__);
		}
BOOL wglGetSyncValues(GL gl_, ParameterTypeTuple!(fp_wglGetSyncValuesOML) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglGetSyncValuesOML)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "wglGetSyncValues", funcPtr, params__);
		}
INT64 wglSwapBuffersMsc(GL gl_, ParameterTypeTuple!(fp_wglSwapBuffersMscOML) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglSwapBuffersMscOML)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "wglSwapBuffersMsc", funcPtr, params__);
		}
INT64 wglSwapLayerBuffersMsc(GL gl_, ParameterTypeTuple!(fp_wglSwapLayerBuffersMscOML) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglSwapLayerBuffersMscOML)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "wglSwapLayerBuffersMsc", funcPtr, params__);
		}
BOOL wglWaitForMsc(GL gl_, ParameterTypeTuple!(fp_wglWaitForMscOML) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglWaitForMscOML)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "wglWaitForMsc", funcPtr, params__);
		}
BOOL wglWaitForSbc(GL gl_, ParameterTypeTuple!(fp_wglWaitForSbcOML) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglWaitForSbcOML)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "wglWaitForSbc", funcPtr, params__);
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
		void*[] funcAddr = new void*[6];
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
			if (!extStr.containsPattern("WGL_OML_sync_control")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"wglGetMscRateOML"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"wglGetSyncValuesOML"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"wglSwapBuffersMscOML"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"wglSwapLayerBuffersMscOML"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"wglWaitForMscOML"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"wglWaitForSbcOML"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
