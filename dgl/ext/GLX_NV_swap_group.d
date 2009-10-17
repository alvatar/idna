module dgl.ext.GLX_NV_swap_group;
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



private ushort extensionId__ = 359;
alias extensionId__ GLX_NV_swap_group;

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
			alias Bool function (Display* dpy, GLuint group, GLuint barrier)	fp_glXBindSwapBarrierNV;
			alias Bool function (Display* dpy, GLXDrawable drawable, GLuint group)	fp_glXJoinSwapGroupNV;
			alias Bool function (Display* dpy, int screen, GLuint *count)	fp_glXQueryFrameCountNV;
			alias Bool function (Display* dpy, int screen, GLuint *maxGroups, GLuint *maxBarriers)	fp_glXQueryMaxSwapGroupsNV;
			alias Bool function (Display* dpy, GLXDrawable drawable, GLuint *group, GLuint *barrier)	fp_glXQuerySwapGroupNV;
			alias Bool function (Display* dpy, int screen)	fp_glXResetFrameCountNV;
		}
	}
	public {
Bool XBindSwapBarrier(GL gl_, ParameterTypeTuple!(fp_glXBindSwapBarrierNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXBindSwapBarrierNV)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "XBindSwapBarrier", funcPtr, params__);
		}
Bool XJoinSwapGroup(GL gl_, ParameterTypeTuple!(fp_glXJoinSwapGroupNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXJoinSwapGroupNV)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "XJoinSwapGroup", funcPtr, params__);
		}
Bool XQueryFrameCount(GL gl_, ParameterTypeTuple!(fp_glXQueryFrameCountNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXQueryFrameCountNV)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "XQueryFrameCount", funcPtr, params__);
		}
Bool XQueryMaxSwapGroups(GL gl_, ParameterTypeTuple!(fp_glXQueryMaxSwapGroupsNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXQueryMaxSwapGroupsNV)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "XQueryMaxSwapGroups", funcPtr, params__);
		}
Bool XQuerySwapGroup(GL gl_, ParameterTypeTuple!(fp_glXQuerySwapGroupNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXQuerySwapGroupNV)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "XQuerySwapGroup", funcPtr, params__);
		}
Bool XResetFrameCount(GL gl_, ParameterTypeTuple!(fp_glXResetFrameCountNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXResetFrameCountNV)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "XResetFrameCount", funcPtr, params__);
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
		void*[] funcAddr = new void*[6];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GLX_NV_swap_group")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glXBindSwapBarrierNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glXJoinSwapGroupNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glXQueryFrameCountNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glXQueryMaxSwapGroupsNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glXQuerySwapGroupNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glXResetFrameCountNV"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
