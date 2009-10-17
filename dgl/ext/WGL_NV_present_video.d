module dgl.ext.WGL_NV_present_video;
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



private ushort extensionId__ = 60;
alias extensionId__ WGL_NV_present_video;
import dgl.ext.ARB_occlusion_query;
import dgl.ext.EXT_timer_query;

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
			const GLenum WGL_NUM_VIDEO_SLOTS_NV = 0x20F0;
			typedef HANDLE HVIDEOOUTPUTDEVICENV;
	}
	private {
		extern (System) {
			alias BOOL function (HDC hDc, uint uVideoSlot, HVIDEOOUTPUTDEVICENV hVideoDevice,  int* piAttribList)	fp_wglBindVideoDeviceNV;
			alias int function (HDC hDc, HVIDEOOUTPUTDEVICENV* phDeviceList)	fp_wglEnumerateVideoDevicesNV;
			alias BOOL function (int iAttribute, int* piValue)	fp_wglQueryCurrentContextNV;
		}
	}
	public {
BOOL wglBindVideoDevice(GL gl_, ParameterTypeTuple!(fp_wglBindVideoDeviceNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglBindVideoDeviceNV)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "wglBindVideoDevice", funcPtr, params__);
		}
int wglEnumerateVideoDevices(GL gl_, ParameterTypeTuple!(fp_wglEnumerateVideoDevicesNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglEnumerateVideoDevicesNV)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "wglEnumerateVideoDevices", funcPtr, params__);
		}
BOOL wglQueryCurrentContext(GL gl_, ParameterTypeTuple!(fp_wglQueryCurrentContextNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglQueryCurrentContextNV)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "wglQueryCurrentContext", funcPtr, params__);
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
		void*[] funcAddr = new void*[3];
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
			if (!extStr.containsPattern("WGL_NV_present_video")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"wglBindVideoDeviceNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"wglEnumerateVideoDevicesNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"wglQueryCurrentContextNV"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
