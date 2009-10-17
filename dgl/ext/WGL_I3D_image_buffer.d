module dgl.ext.WGL_I3D_image_buffer;
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



private ushort extensionId__ = 88;
alias extensionId__ WGL_I3D_image_buffer;
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
			const GLenum WGL_IMAGE_BUFFER_MIN_ACCESS_I3D = 0x00000001;
			const GLenum WGL_IMAGE_BUFFER_LOCK_I3D = 0x00000002;
	}
	private {
		extern (System) {
			alias BOOL function (HDC hdc, HANDLE* pEvent, LPVOID *pAddress, DWORD *pSize, UINT count)	fp_wglAssociateImageBufferEventsI3D;
			alias LPVOID function (HDC hDC, DWORD dwSize, UINT uFlags)	fp_wglCreateImageBufferI3D;
			alias BOOL function (HDC hDC, LPVOID pAddress)	fp_wglDestroyImageBufferI3D;
			alias BOOL function (HDC hdc, LPVOID* pAddress, UINT count)	fp_wglReleaseImageBufferEventsI3D;
		}
	}
	public {
BOOL wglAssociateImageBufferEvents(GL gl_, ParameterTypeTuple!(fp_wglAssociateImageBufferEventsI3D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglAssociateImageBufferEventsI3D)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "wglAssociateImageBufferEvents", funcPtr, params__);
		}
LPVOID wglCreateImageBuffer(GL gl_, ParameterTypeTuple!(fp_wglCreateImageBufferI3D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglCreateImageBufferI3D)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "wglCreateImageBuffer", funcPtr, params__);
		}
BOOL wglDestroyImageBuffer(GL gl_, ParameterTypeTuple!(fp_wglDestroyImageBufferI3D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglDestroyImageBufferI3D)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "wglDestroyImageBuffer", funcPtr, params__);
		}
BOOL wglReleaseImageBufferEvents(GL gl_, ParameterTypeTuple!(fp_wglReleaseImageBufferEventsI3D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglReleaseImageBufferEventsI3D)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "wglReleaseImageBufferEvents", funcPtr, params__);
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
			if (!extStr.containsPattern("WGL_I3D_image_buffer")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"wglAssociateImageBufferEventsI3D"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"wglCreateImageBufferI3D"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"wglDestroyImageBufferI3D"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"wglReleaseImageBufferEventsI3D"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
