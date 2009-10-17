module dgl.ext.WGL_ARB_render_texture;
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



private ushort extensionId__ = 334;
alias extensionId__ WGL_ARB_render_texture;
import dgl.ext.WGL_ARB_pbuffer;
import dgl.ext.WGL_ARB_pixel_format;

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
			const GLenum WGL_BIND_TO_TEXTURE_RGB_ARB = 0x2070;
			const GLenum WGL_BIND_TO_TEXTURE_RGBA_ARB = 0x2071;
			const GLenum WGL_TEXTURE_FORMAT_ARB = 0x2072;
			const GLenum WGL_TEXTURE_TARGET_ARB = 0x2073;
			const GLenum WGL_MIPMAP_TEXTURE_ARB = 0x2074;
			const GLenum WGL_TEXTURE_RGB_ARB = 0x2075;
			const GLenum WGL_TEXTURE_RGBA_ARB = 0x2076;
			const GLenum WGL_NO_TEXTURE_ARB = 0x2077;
			const GLenum WGL_TEXTURE_CUBE_MAP_ARB = 0x2078;
			const GLenum WGL_TEXTURE_1D_ARB = 0x2079;
			const GLenum WGL_TEXTURE_2D_ARB = 0x207A;
			const GLenum WGL_MIPMAP_LEVEL_ARB = 0x207B;
			const GLenum WGL_CUBE_MAP_FACE_ARB = 0x207C;
			const GLenum WGL_TEXTURE_CUBE_MAP_POSITIVE_X_ARB = 0x207D;
			const GLenum WGL_TEXTURE_CUBE_MAP_NEGATIVE_X_ARB = 0x207E;
			const GLenum WGL_TEXTURE_CUBE_MAP_POSITIVE_Y_ARB = 0x207F;
			const GLenum WGL_TEXTURE_CUBE_MAP_NEGATIVE_Y_ARB = 0x2080;
			const GLenum WGL_TEXTURE_CUBE_MAP_POSITIVE_Z_ARB = 0x2081;
			const GLenum WGL_TEXTURE_CUBE_MAP_NEGATIVE_Z_ARB = 0x2082;
			const GLenum WGL_FRONT_LEFT_ARB = 0x2083;
			const GLenum WGL_FRONT_RIGHT_ARB = 0x2084;
			const GLenum WGL_BACK_LEFT_ARB = 0x2085;
			const GLenum WGL_BACK_RIGHT_ARB = 0x2086;
			const GLenum WGL_AUX0_ARB = 0x2087;
			const GLenum WGL_AUX1_ARB = 0x2088;
			const GLenum WGL_AUX2_ARB = 0x2089;
			const GLenum WGL_AUX3_ARB = 0x208A;
			const GLenum WGL_AUX4_ARB = 0x208B;
			const GLenum WGL_AUX5_ARB = 0x208C;
			const GLenum WGL_AUX6_ARB = 0x208D;
			const GLenum WGL_AUX7_ARB = 0x208E;
			const GLenum WGL_AUX8_ARB = 0x208F;
			const GLenum WGL_AUX9_ARB = 0x2090;
	}
	private {
		extern (System) {
			alias BOOL function (HPBUFFERARB hPbuffer, int iBuffer)	fp_wglBindTexImageARB;
			alias BOOL function (HPBUFFERARB hPbuffer, int iBuffer)	fp_wglReleaseTexImageARB;
			alias BOOL function (HPBUFFERARB hPbuffer,  int* piAttribList)	fp_wglSetPbufferAttribARB;
		}
	}
	public {
BOOL wglBindTexImage(GL gl_, ParameterTypeTuple!(fp_wglBindTexImageARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglBindTexImageARB)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "wglBindTexImage", funcPtr, params__);
		}
BOOL wglReleaseTexImage(GL gl_, ParameterTypeTuple!(fp_wglReleaseTexImageARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglReleaseTexImageARB)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "wglReleaseTexImage", funcPtr, params__);
		}
BOOL wglSetPbufferAttrib(GL gl_, ParameterTypeTuple!(fp_wglSetPbufferAttribARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglSetPbufferAttribARB)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "wglSetPbufferAttrib", funcPtr, params__);
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
			if (!extStr.containsPattern("WGL_ARB_render_texture")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"wglBindTexImageARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"wglReleaseTexImageARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"wglSetPbufferAttribARB"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
