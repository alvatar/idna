module dgl.ext.WGL_NV_swap_group;
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



private ushort extensionId__ = 35;
alias extensionId__ WGL_NV_swap_group;

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
			alias BOOL function (GLuint group, GLuint barrier)	fp_wglBindSwapBarrierNV;
			alias BOOL function (HDC hDC, GLuint group)	fp_wglJoinSwapGroupNV;
			alias BOOL function (HDC hDC, GLuint* count)	fp_wglQueryFrameCountNV;
			alias BOOL function (HDC hDC, GLuint* maxGroups, GLuint *maxBarriers)	fp_wglQueryMaxSwapGroupsNV;
			alias BOOL function (HDC hDC, GLuint* group)	fp_wglQuerySwapGroupNV;
			alias BOOL function (HDC hDC)	fp_wglResetFrameCountNV;
		}
	}
	public {
BOOL wglBindSwapBarrier(GL gl_, ParameterTypeTuple!(fp_wglBindSwapBarrierNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglBindSwapBarrierNV)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "wglBindSwapBarrier", funcPtr, params__);
		}
BOOL wglJoinSwapGroup(GL gl_, ParameterTypeTuple!(fp_wglJoinSwapGroupNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglJoinSwapGroupNV)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "wglJoinSwapGroup", funcPtr, params__);
		}
BOOL wglQueryFrameCount(GL gl_, ParameterTypeTuple!(fp_wglQueryFrameCountNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglQueryFrameCountNV)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "wglQueryFrameCount", funcPtr, params__);
		}
BOOL wglQueryMaxSwapGroups(GL gl_, ParameterTypeTuple!(fp_wglQueryMaxSwapGroupsNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglQueryMaxSwapGroupsNV)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "wglQueryMaxSwapGroups", funcPtr, params__);
		}
BOOL wglQuerySwapGroup(GL gl_, ParameterTypeTuple!(fp_wglQuerySwapGroupNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglQuerySwapGroupNV)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "wglQuerySwapGroup", funcPtr, params__);
		}
BOOL wglResetFrameCount(GL gl_, ParameterTypeTuple!(fp_wglResetFrameCountNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglResetFrameCountNV)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "wglResetFrameCount", funcPtr, params__);
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
			if (!extStr.containsPattern("WGL_NV_swap_group")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"wglBindSwapBarrierNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"wglJoinSwapGroupNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"wglQueryFrameCountNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"wglQueryMaxSwapGroupsNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"wglQuerySwapGroupNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"wglResetFrameCountNV"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
