module dgl.ext.GLX_OML_sync_control;
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



private ushort extensionId__ = 216;
alias extensionId__ GLX_OML_sync_control;

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
	}
	private {
		extern (System) {
			alias Bool function (Display* dpy, GLXDrawable drawable, int32_t* numerator, int32_t* denominator)	fp_glXGetMscRateOML;
			alias Bool function (Display* dpy, GLXDrawable drawable, int64_t* ust, int64_t* msc, int64_t* sbc)	fp_glXGetSyncValuesOML;
			alias int64_t function (Display* dpy, GLXDrawable drawable, int64_t target_msc, int64_t divisor, int64_t remainder)	fp_glXSwapBuffersMscOML;
			alias Bool function (Display* dpy, GLXDrawable drawable, int64_t target_msc, int64_t divisor, int64_t remainder, int64_t* ust, int64_t* msc, int64_t* sbc)	fp_glXWaitForMscOML;
			alias Bool function (Display* dpy, GLXDrawable drawable, int64_t target_sbc, int64_t* ust, int64_t* msc, int64_t* sbc)	fp_glXWaitForSbcOML;
		}
	}
	public {
Bool XGetMscRate(GL gl_, ParameterTypeTuple!(fp_glXGetMscRateOML) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXGetMscRateOML)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "XGetMscRate", funcPtr, params__);
		}
Bool XGetSyncValues(GL gl_, ParameterTypeTuple!(fp_glXGetSyncValuesOML) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXGetSyncValuesOML)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "XGetSyncValues", funcPtr, params__);
		}
int64_t XSwapBuffersMsc(GL gl_, ParameterTypeTuple!(fp_glXSwapBuffersMscOML) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXSwapBuffersMscOML)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "XSwapBuffersMsc", funcPtr, params__);
		}
Bool XWaitForMsc(GL gl_, ParameterTypeTuple!(fp_glXWaitForMscOML) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXWaitForMscOML)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "XWaitForMsc", funcPtr, params__);
		}
Bool XWaitForSbc(GL gl_, ParameterTypeTuple!(fp_glXWaitForSbcOML) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXWaitForSbcOML)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "XWaitForSbc", funcPtr, params__);
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
			if (!extStr.containsPattern("GLX_OML_sync_control")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glXGetMscRateOML"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glXGetSyncValuesOML"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glXSwapBuffersMscOML"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glXWaitForMscOML"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glXWaitForSbcOML"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
