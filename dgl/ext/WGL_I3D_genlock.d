module dgl.ext.WGL_I3D_genlock;
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



private ushort extensionId__ = 209;
alias extensionId__ WGL_I3D_genlock;
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
			const GLenum WGL_GENLOCK_SOURCE_MULTIVIEW_I3D = 0x2044;
			const GLenum WGL_GENLOCK_SOURCE_EXTERNAL_SYNC_I3D = 0x2045;
			const GLenum WGL_GENLOCK_SOURCE_EXTERNAL_FIELD_I3D = 0x2046;
			const GLenum WGL_GENLOCK_SOURCE_EXTERNAL_TTL_I3D = 0x2047;
			const GLenum WGL_GENLOCK_SOURCE_DIGITAL_SYNC_I3D = 0x2048;
			const GLenum WGL_GENLOCK_SOURCE_DIGITAL_FIELD_I3D = 0x2049;
			const GLenum WGL_GENLOCK_SOURCE_EDGE_FALLING_I3D = 0x204A;
			const GLenum WGL_GENLOCK_SOURCE_EDGE_RISING_I3D = 0x204B;
			const GLenum WGL_GENLOCK_SOURCE_EDGE_BOTH_I3D = 0x204C;
	}
	private {
		extern (System) {
			alias BOOL function (HDC hDC)	fp_wglDisableGenlockI3D;
			alias BOOL function (HDC hDC)	fp_wglEnableGenlockI3D;
			alias BOOL function (HDC hDC, UINT uRate)	fp_wglGenlockSampleRateI3D;
			alias BOOL function (HDC hDC, UINT uDelay)	fp_wglGenlockSourceDelayI3D;
			alias BOOL function (HDC hDC, UINT uEdge)	fp_wglGenlockSourceEdgeI3D;
			alias BOOL function (HDC hDC, UINT uSource)	fp_wglGenlockSourceI3D;
			alias BOOL function (HDC hDC, UINT* uRate)	fp_wglGetGenlockSampleRateI3D;
			alias BOOL function (HDC hDC, UINT* uDelay)	fp_wglGetGenlockSourceDelayI3D;
			alias BOOL function (HDC hDC, UINT* uEdge)	fp_wglGetGenlockSourceEdgeI3D;
			alias BOOL function (HDC hDC, UINT* uSource)	fp_wglGetGenlockSourceI3D;
			alias BOOL function (HDC hDC, BOOL* pFlag)	fp_wglIsEnabledGenlockI3D;
			alias BOOL function (HDC hDC, UINT* uMaxLineDelay, UINT *uMaxPixelDelay)	fp_wglQueryGenlockMaxSourceDelayI3D;
		}
	}
	public {
BOOL wglDisableGenlock(GL gl_, ParameterTypeTuple!(fp_wglDisableGenlockI3D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglDisableGenlockI3D)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "wglDisableGenlock", funcPtr, params__);
		}
BOOL wglEnableGenlock(GL gl_, ParameterTypeTuple!(fp_wglEnableGenlockI3D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglEnableGenlockI3D)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "wglEnableGenlock", funcPtr, params__);
		}
BOOL wglGenlockSampleRate(GL gl_, ParameterTypeTuple!(fp_wglGenlockSampleRateI3D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglGenlockSampleRateI3D)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "wglGenlockSampleRate", funcPtr, params__);
		}
BOOL wglGenlockSourceDelay(GL gl_, ParameterTypeTuple!(fp_wglGenlockSourceDelayI3D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglGenlockSourceDelayI3D)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "wglGenlockSourceDelay", funcPtr, params__);
		}
BOOL wglGenlockSourceEdge(GL gl_, ParameterTypeTuple!(fp_wglGenlockSourceEdgeI3D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglGenlockSourceEdgeI3D)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "wglGenlockSourceEdge", funcPtr, params__);
		}
BOOL wglGenlockSource(GL gl_, ParameterTypeTuple!(fp_wglGenlockSourceI3D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglGenlockSourceI3D)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "wglGenlockSource", funcPtr, params__);
		}
BOOL wglGetGenlockSampleRate(GL gl_, ParameterTypeTuple!(fp_wglGetGenlockSampleRateI3D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglGetGenlockSampleRateI3D)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "wglGetGenlockSampleRate", funcPtr, params__);
		}
BOOL wglGetGenlockSourceDelay(GL gl_, ParameterTypeTuple!(fp_wglGetGenlockSourceDelayI3D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglGetGenlockSourceDelayI3D)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "wglGetGenlockSourceDelay", funcPtr, params__);
		}
BOOL wglGetGenlockSourceEdge(GL gl_, ParameterTypeTuple!(fp_wglGetGenlockSourceEdgeI3D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglGetGenlockSourceEdgeI3D)(gl.extFuncs[extensionId__][8]);
			return checkedCall(gl_, "wglGetGenlockSourceEdge", funcPtr, params__);
		}
BOOL wglGetGenlockSource(GL gl_, ParameterTypeTuple!(fp_wglGetGenlockSourceI3D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglGetGenlockSourceI3D)(gl.extFuncs[extensionId__][9]);
			return checkedCall(gl_, "wglGetGenlockSource", funcPtr, params__);
		}
BOOL wglIsEnabledGenlock(GL gl_, ParameterTypeTuple!(fp_wglIsEnabledGenlockI3D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglIsEnabledGenlockI3D)(gl.extFuncs[extensionId__][10]);
			return checkedCall(gl_, "wglIsEnabledGenlock", funcPtr, params__);
		}
BOOL wglQueryGenlockMaxSourceDelay(GL gl_, ParameterTypeTuple!(fp_wglQueryGenlockMaxSourceDelayI3D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglQueryGenlockMaxSourceDelayI3D)(gl.extFuncs[extensionId__][11]);
			return checkedCall(gl_, "wglQueryGenlockMaxSourceDelay", funcPtr, params__);
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
		void*[] funcAddr = new void*[12];
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
			if (!extStr.containsPattern("WGL_I3D_genlock")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"wglDisableGenlockI3D"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"wglEnableGenlockI3D"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"wglGenlockSampleRateI3D"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"wglGenlockSourceDelayI3D"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"wglGenlockSourceEdgeI3D"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"wglGenlockSourceI3D"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"wglGetGenlockSampleRateI3D"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"wglGetGenlockSourceDelayI3D"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[8] = getExtensionFuncPtr(cast(char*)"wglGetGenlockSourceEdgeI3D"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[9] = getExtensionFuncPtr(cast(char*)"wglGetGenlockSourceI3D"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[10] = getExtensionFuncPtr(cast(char*)"wglIsEnabledGenlockI3D"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[11] = getExtensionFuncPtr(cast(char*)"wglQueryGenlockMaxSourceDelayI3D"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
