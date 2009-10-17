module dgl.ext.GLX_EXT_texture_from_pixmap;
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



private ushort extensionId__ = 44;
alias extensionId__ GLX_EXT_texture_from_pixmap;

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
			const GLenum GLX_TEXTURE_1D_BIT_EXT = 0x00000001;
			const GLenum GLX_TEXTURE_2D_BIT_EXT = 0x00000002;
			const GLenum GLX_TEXTURE_RECTANGLE_BIT_EXT = 0x00000004;
			const GLenum GLX_BIND_TO_TEXTURE_RGB_EXT = 0x20D0;
			const GLenum GLX_BIND_TO_TEXTURE_RGBA_EXT = 0x20D1;
			const GLenum GLX_BIND_TO_MIPMAP_TEXTURE_EXT = 0x20D2;
			const GLenum GLX_BIND_TO_TEXTURE_TARGETS_EXT = 0x20D3;
			const GLenum GLX_Y_INVERTED_EXT = 0x20D4;
			const GLenum GLX_TEXTURE_FORMAT_EXT = 0x20D5;
			const GLenum GLX_TEXTURE_TARGET_EXT = 0x20D6;
			const GLenum GLX_MIPMAP_TEXTURE_EXT = 0x20D7;
			const GLenum GLX_TEXTURE_FORMAT_NONE_EXT = 0x20D8;
			const GLenum GLX_TEXTURE_FORMAT_RGB_EXT = 0x20D9;
			const GLenum GLX_TEXTURE_FORMAT_RGBA_EXT = 0x20DA;
			const GLenum GLX_TEXTURE_1D_EXT = 0x20DB;
			const GLenum GLX_TEXTURE_2D_EXT = 0x20DC;
			const GLenum GLX_TEXTURE_RECTANGLE_EXT = 0x20DD;
			const GLenum GLX_FRONT_LEFT_EXT = 0x20DE;
			const GLenum GLX_FRONT_RIGHT_EXT = 0x20DF;
			const GLenum GLX_BACK_LEFT_EXT = 0x20E0;
			const GLenum GLX_BACK_RIGHT_EXT = 0x20E1;
			const GLenum GLX_AUX0_EXT = 0x20E2;
			const GLenum GLX_AUX1_EXT = 0x20E3;
			const GLenum GLX_AUX2_EXT = 0x20E4;
			const GLenum GLX_AUX3_EXT = 0x20E5;
			const GLenum GLX_AUX4_EXT = 0x20E6;
			const GLenum GLX_AUX5_EXT = 0x20E7;
			const GLenum GLX_AUX6_EXT = 0x20E8;
			const GLenum GLX_AUX7_EXT = 0x20E9;
			const GLenum GLX_AUX8_EXT = 0x20EA;
			const GLenum GLX_AUX9_EXT = 0x20EB;
	}
	private {
		extern (System) {
			alias void function (Display* display, GLXDrawable drawable, int buffer,  int *attrib_list)	fp_glXBindTexImageEXT;
			alias void function (Display* display, GLXDrawable drawable, int buffer)	fp_glXReleaseTexImageEXT;
		}
	}
	public {
void XBindTexImage(GL gl_, ParameterTypeTuple!(fp_glXBindTexImageEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXBindTexImageEXT)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "XBindTexImage", funcPtr, params__);
		}
void XReleaseTexImage(GL gl_, ParameterTypeTuple!(fp_glXReleaseTexImageEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXReleaseTexImageEXT)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "XReleaseTexImage", funcPtr, params__);
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
		void*[] funcAddr = new void*[2];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GLX_EXT_texture_from_pixmap")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glXBindTexImageEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glXReleaseTexImageEXT"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
