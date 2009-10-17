module dgl.ext.WGL_I3D_digital_video_control;
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



private ushort extensionId__ = 87;
alias extensionId__ WGL_I3D_digital_video_control;
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
			const GLenum WGL_DIGITAL_VIDEO_CURSOR_ALPHA_FRAMEBUFFER_I3D = 0x2050;
			const GLenum WGL_DIGITAL_VIDEO_CURSOR_ALPHA_VALUE_I3D = 0x2051;
			const GLenum WGL_DIGITAL_VIDEO_CURSOR_INCLUDED_I3D = 0x2052;
			const GLenum WGL_DIGITAL_VIDEO_GAMMA_CORRECTED_I3D = 0x2053;
	}
	private {
		extern (System) {
			alias BOOL function (HDC hDC, int iAttribute, int* piValue)	fp_wglGetDigitalVideoParametersI3D;
			alias BOOL function (HDC hDC, int iAttribute,  int* piValue)	fp_wglSetDigitalVideoParametersI3D;
		}
	}
	public {
BOOL wglGetDigitalVideoParameters(GL gl_, ParameterTypeTuple!(fp_wglGetDigitalVideoParametersI3D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglGetDigitalVideoParametersI3D)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "wglGetDigitalVideoParameters", funcPtr, params__);
		}
BOOL wglSetDigitalVideoParameters(GL gl_, ParameterTypeTuple!(fp_wglSetDigitalVideoParametersI3D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglSetDigitalVideoParametersI3D)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "wglSetDigitalVideoParameters", funcPtr, params__);
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
		void*[] funcAddr = new void*[2];
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
			if (!extStr.containsPattern("WGL_I3D_digital_video_control")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"wglGetDigitalVideoParametersI3D"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"wglSetDigitalVideoParametersI3D"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
