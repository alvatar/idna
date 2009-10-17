module dgl.ext.WGL_I3D_swap_frame_lock;
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



private ushort extensionId__ = 174;
alias extensionId__ WGL_I3D_swap_frame_lock;
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
	}
	private {
		extern (System) {
			alias BOOL function ()	fp_wglDisableFrameLockI3D;
			alias BOOL function ()	fp_wglEnableFrameLockI3D;
			alias BOOL function (BOOL* pFlag)	fp_wglIsEnabledFrameLockI3D;
			alias BOOL function (BOOL* pFlag)	fp_wglQueryFrameLockMasterI3D;
		}
	}
	public {
BOOL wglDisableFrameLock(GL gl_, ParameterTypeTuple!(fp_wglDisableFrameLockI3D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglDisableFrameLockI3D)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "wglDisableFrameLock", funcPtr, params__);
		}
BOOL wglEnableFrameLock(GL gl_, ParameterTypeTuple!(fp_wglEnableFrameLockI3D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglEnableFrameLockI3D)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "wglEnableFrameLock", funcPtr, params__);
		}
BOOL wglIsEnabledFrameLock(GL gl_, ParameterTypeTuple!(fp_wglIsEnabledFrameLockI3D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglIsEnabledFrameLockI3D)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "wglIsEnabledFrameLock", funcPtr, params__);
		}
BOOL wglQueryFrameLockMaster(GL gl_, ParameterTypeTuple!(fp_wglQueryFrameLockMasterI3D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglQueryFrameLockMasterI3D)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "wglQueryFrameLockMaster", funcPtr, params__);
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
			if (!extStr.containsPattern("WGL_I3D_swap_frame_lock")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"wglDisableFrameLockI3D"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"wglEnableFrameLockI3D"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"wglIsEnabledFrameLockI3D"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"wglQueryFrameLockMasterI3D"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
