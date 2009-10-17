module dgl.ext.WGL_NV_gpu_affinity;
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



private ushort extensionId__ = 481;
alias extensionId__ WGL_NV_gpu_affinity;
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
			const GLenum WGL_ERROR_INCOMPATIBLE_AFFINITY_MASKS_NV = 0x20D0;
			const GLenum WGL_ERROR_MISSING_AFFINITY_MASK_NV = 0x20D1;
			typedef HANDLE HGPUNV;
			struct _GPU_DEVICE {  DWORD cb;   CHAR DeviceName[32];   CHAR DeviceString[128];   DWORD Flags;   RECT rcVirtualScreen; }
			alias _GPU_DEVICE  GPU_DEVICE;
			alias _GPU_DEVICE  *PGPU_DEVICE;;
	}
	private {
		extern (System) {
			alias BOOL function (UINT iGpuIndex, HGPUNV *phGpu)	fp_wglEnumGpusNV;
			alias BOOL function (HGPUNV hGpu, UINT iDeviceIndex, PGPU_DEVICE lpGpuDevice)	fp_wglEnumGpuDevicesNV;
			alias HDC function ( HGPUNV *phGpuList)	fp_wglCreateAffinityDCNV;
			alias BOOL function (HDC hAffinityDC, UINT iGpuIndex, HGPUNV *hGpu)	fp_wglEnumGpusFromAffinityDCNV;
			alias BOOL function (HDC hdc)	fp_wglDeleteDCNV;
		}
	}
	public {
BOOL wglEnumGpus(GL gl_, ParameterTypeTuple!(fp_wglEnumGpusNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglEnumGpusNV)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "wglEnumGpus", funcPtr, params__);
		}
BOOL wglEnumGpuDevices(GL gl_, ParameterTypeTuple!(fp_wglEnumGpuDevicesNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglEnumGpuDevicesNV)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "wglEnumGpuDevices", funcPtr, params__);
		}
HDC wglCreateAffinityDC(GL gl_, ParameterTypeTuple!(fp_wglCreateAffinityDCNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglCreateAffinityDCNV)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "wglCreateAffinityDC", funcPtr, params__);
		}
BOOL wglEnumGpusFromAffinityDC(GL gl_, ParameterTypeTuple!(fp_wglEnumGpusFromAffinityDCNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglEnumGpusFromAffinityDCNV)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "wglEnumGpusFromAffinityDC", funcPtr, params__);
		}
BOOL wglDeleteDC(GL gl_, ParameterTypeTuple!(fp_wglDeleteDCNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglDeleteDCNV)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "wglDeleteDC", funcPtr, params__);
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
			if (!extStr.containsPattern("WGL_NV_gpu_affinity")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"wglEnumGpusNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"wglEnumGpuDevicesNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"wglCreateAffinityDCNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"wglEnumGpusFromAffinityDCNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"wglDeleteDCNV"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
