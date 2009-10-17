module dgl.ext.WGL_ARB_buffer_region;
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



private ushort extensionId__ = 366;
alias extensionId__ WGL_ARB_buffer_region;
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
			const GLenum WGL_FRONT_COLOR_BUFFER_BIT_ARB = 0x00000001;
			const GLenum WGL_BACK_COLOR_BUFFER_BIT_ARB = 0x00000002;
			const GLenum WGL_DEPTH_BUFFER_BIT_ARB = 0x00000004;
			const GLenum WGL_STENCIL_BUFFER_BIT_ARB = 0x00000008;
	}
	private {
		extern (System) {
			alias HANDLE function (HDC hDC, int iLayerPlane, UINT uType)	fp_wglCreateBufferRegionARB;
			alias VOID function (HANDLE hRegion)	fp_wglDeleteBufferRegionARB;
			alias BOOL function (HANDLE hRegion, int x, int y, int width, int height, int xSrc, int ySrc)	fp_wglRestoreBufferRegionARB;
			alias BOOL function (HANDLE hRegion, int x, int y, int width, int height)	fp_wglSaveBufferRegionARB;
		}
	}
	public {
HANDLE wglCreateBufferRegion(GL gl_, ParameterTypeTuple!(fp_wglCreateBufferRegionARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglCreateBufferRegionARB)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "wglCreateBufferRegion", funcPtr, params__);
		}
VOID wglDeleteBufferRegion(GL gl_, ParameterTypeTuple!(fp_wglDeleteBufferRegionARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglDeleteBufferRegionARB)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "wglDeleteBufferRegion", funcPtr, params__);
		}
BOOL wglRestoreBufferRegion(GL gl_, ParameterTypeTuple!(fp_wglRestoreBufferRegionARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglRestoreBufferRegionARB)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "wglRestoreBufferRegion", funcPtr, params__);
		}
BOOL wglSaveBufferRegion(GL gl_, ParameterTypeTuple!(fp_wglSaveBufferRegionARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglSaveBufferRegionARB)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "wglSaveBufferRegion", funcPtr, params__);
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
			if (!extStr.containsPattern("WGL_ARB_buffer_region")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"wglCreateBufferRegionARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"wglDeleteBufferRegionARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"wglRestoreBufferRegionARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"wglSaveBufferRegionARB"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
