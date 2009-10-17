module dgl.ext.WGL_EXT_pixel_format;
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



private ushort extensionId__ = 211;
alias extensionId__ WGL_EXT_pixel_format;
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
			const GLenum WGL_NUMBER_PIXEL_FORMATS_EXT = 0x2000;
			const GLenum WGL_DRAW_TO_WINDOW_EXT = 0x2001;
			const GLenum WGL_DRAW_TO_BITMAP_EXT = 0x2002;
			const GLenum WGL_ACCELERATION_EXT = 0x2003;
			const GLenum WGL_NEED_PALETTE_EXT = 0x2004;
			const GLenum WGL_NEED_SYSTEM_PALETTE_EXT = 0x2005;
			const GLenum WGL_SWAP_LAYER_BUFFERS_EXT = 0x2006;
			const GLenum WGL_SWAP_METHOD_EXT = 0x2007;
			const GLenum WGL_NUMBER_OVERLAYS_EXT = 0x2008;
			const GLenum WGL_NUMBER_UNDERLAYS_EXT = 0x2009;
			const GLenum WGL_TRANSPARENT_EXT = 0x200A;
			const GLenum WGL_TRANSPARENT_VALUE_EXT = 0x200B;
			const GLenum WGL_SHARE_DEPTH_EXT = 0x200C;
			const GLenum WGL_SHARE_STENCIL_EXT = 0x200D;
			const GLenum WGL_SHARE_ACCUM_EXT = 0x200E;
			const GLenum WGL_SUPPORT_GDI_EXT = 0x200F;
			const GLenum WGL_SUPPORT_OPENGL_EXT = 0x2010;
			const GLenum WGL_DOUBLE_BUFFER_EXT = 0x2011;
			const GLenum WGL_STEREO_EXT = 0x2012;
			const GLenum WGL_PIXEL_TYPE_EXT = 0x2013;
			const GLenum WGL_COLOR_BITS_EXT = 0x2014;
			const GLenum WGL_RED_BITS_EXT = 0x2015;
			const GLenum WGL_RED_SHIFT_EXT = 0x2016;
			const GLenum WGL_GREEN_BITS_EXT = 0x2017;
			const GLenum WGL_GREEN_SHIFT_EXT = 0x2018;
			const GLenum WGL_BLUE_BITS_EXT = 0x2019;
			const GLenum WGL_BLUE_SHIFT_EXT = 0x201A;
			const GLenum WGL_ALPHA_BITS_EXT = 0x201B;
			const GLenum WGL_ALPHA_SHIFT_EXT = 0x201C;
			const GLenum WGL_ACCUM_BITS_EXT = 0x201D;
			const GLenum WGL_ACCUM_RED_BITS_EXT = 0x201E;
			const GLenum WGL_ACCUM_GREEN_BITS_EXT = 0x201F;
			const GLenum WGL_ACCUM_BLUE_BITS_EXT = 0x2020;
			const GLenum WGL_ACCUM_ALPHA_BITS_EXT = 0x2021;
			const GLenum WGL_DEPTH_BITS_EXT = 0x2022;
			const GLenum WGL_STENCIL_BITS_EXT = 0x2023;
			const GLenum WGL_AUX_BUFFERS_EXT = 0x2024;
			const GLenum WGL_NO_ACCELERATION_EXT = 0x2025;
			const GLenum WGL_GENERIC_ACCELERATION_EXT = 0x2026;
			const GLenum WGL_FULL_ACCELERATION_EXT = 0x2027;
			const GLenum WGL_SWAP_EXCHANGE_EXT = 0x2028;
			const GLenum WGL_SWAP_COPY_EXT = 0x2029;
			const GLenum WGL_SWAP_UNDEFINED_EXT = 0x202A;
			const GLenum WGL_TYPE_RGBA_EXT = 0x202B;
			const GLenum WGL_TYPE_COLORINDEX_EXT = 0x202C;
	}
	private {
		extern (System) {
			alias BOOL function (HDC hdc,  int* piAttribIList,  FLOAT *pfAttribFList, UINT nMaxFormats, int *piFormats, UINT *nNumFormats)	fp_wglChoosePixelFormatEXT;
			alias BOOL function (HDC hdc, int iPixelFormat, int iLayerPlane, UINT nAttributes, int* piAttributes, FLOAT *pfValues)	fp_wglGetPixelFormatAttribfvEXT;
			alias BOOL function (HDC hdc, int iPixelFormat, int iLayerPlane, UINT nAttributes, int* piAttributes, int *piValues)	fp_wglGetPixelFormatAttribivEXT;
		}
	}
	public {
BOOL wglChoosePixelFormat(GL gl_, ParameterTypeTuple!(fp_wglChoosePixelFormatEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglChoosePixelFormatEXT)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "wglChoosePixelFormat", funcPtr, params__);
		}
BOOL wglGetPixelFormatAttribfv(GL gl_, ParameterTypeTuple!(fp_wglGetPixelFormatAttribfvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglGetPixelFormatAttribfvEXT)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "wglGetPixelFormatAttribfv", funcPtr, params__);
		}
BOOL wglGetPixelFormatAttribiv(GL gl_, ParameterTypeTuple!(fp_wglGetPixelFormatAttribivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglGetPixelFormatAttribivEXT)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "wglGetPixelFormatAttribiv", funcPtr, params__);
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
			if (!extStr.containsPattern("WGL_EXT_pixel_format")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"wglChoosePixelFormatEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"wglGetPixelFormatAttribfvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"wglGetPixelFormatAttribivEXT"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
