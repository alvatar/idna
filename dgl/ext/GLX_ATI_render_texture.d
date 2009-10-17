module dgl.ext.GLX_ATI_render_texture;
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



private ushort extensionId__ = 419;
alias extensionId__ GLX_ATI_render_texture;

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
			const GLenum GLX_BIND_TO_TEXTURE_RGB_ATI = 0x9800;
			const GLenum GLX_BIND_TO_TEXTURE_RGBA_ATI = 0x9801;
			const GLenum GLX_TEXTURE_FORMAT_ATI = 0x9802;
			const GLenum GLX_TEXTURE_TARGET_ATI = 0x9803;
			const GLenum GLX_MIPMAP_TEXTURE_ATI = 0x9804;
			const GLenum GLX_TEXTURE_RGB_ATI = 0x9805;
			const GLenum GLX_TEXTURE_RGBA_ATI = 0x9806;
			const GLenum GLX_NO_TEXTURE_ATI = 0x9807;
			const GLenum GLX_TEXTURE_CUBE_MAP_ATI = 0x9808;
			const GLenum GLX_TEXTURE_1D_ATI = 0x9809;
			const GLenum GLX_TEXTURE_2D_ATI = 0x980A;
			const GLenum GLX_MIPMAP_LEVEL_ATI = 0x980B;
			const GLenum GLX_CUBE_MAP_FACE_ATI = 0x980C;
			const GLenum GLX_TEXTURE_CUBE_MAP_POSITIVE_X_ATI = 0x980D;
			const GLenum GLX_TEXTURE_CUBE_MAP_NEGATIVE_X_ATI = 0x980E;
			const GLenum GLX_TEXTURE_CUBE_MAP_POSITIVE_Y_ATI = 0x980F;
			const GLenum GLX_TEXTURE_CUBE_MAP_NEGATIVE_Y_ATI = 0x9810;
			const GLenum GLX_TEXTURE_CUBE_MAP_POSITIVE_Z_ATI = 0x9811;
			const GLenum GLX_TEXTURE_CUBE_MAP_NEGATIVE_Z_ATI = 0x9812;
			const GLenum GLX_FRONT_LEFT_ATI = 0x9813;
			const GLenum GLX_FRONT_RIGHT_ATI = 0x9814;
			const GLenum GLX_BACK_LEFT_ATI = 0x9815;
			const GLenum GLX_BACK_RIGHT_ATI = 0x9816;
			const GLenum GLX_AUX0_ATI = 0x9817;
			const GLenum GLX_AUX1_ATI = 0x9818;
			const GLenum GLX_AUX2_ATI = 0x9819;
			const GLenum GLX_AUX3_ATI = 0x981A;
			const GLenum GLX_AUX4_ATI = 0x981B;
			const GLenum GLX_AUX5_ATI = 0x981C;
			const GLenum GLX_AUX6_ATI = 0x981D;
			const GLenum GLX_AUX7_ATI = 0x981E;
			const GLenum GLX_AUX8_ATI = 0x981F;
			const GLenum GLX_AUX9_ATI = 0x9820;
			const GLenum GLX_BIND_TO_TEXTURE_LUMINANCE_ATI = 0x9821;
			const GLenum GLX_BIND_TO_TEXTURE_INTENSITY_ATI = 0x9822;
	}
	private {
		extern (System) {
			alias void function (Display *dpy, GLXPbuffer pbuf, int buffer)	fp_glXBindTexImageATI;
			alias void function (Display *dpy, GLXPbuffer pbuf, int buffer)	fp_glXReleaseTexImageATI;
			alias void function (Display *dpy, GLXDrawable draw,  int *attrib_list)	fp_glXDrawableAttribATI;
		}
	}
	public {
void XBindTexImage(GL gl_, ParameterTypeTuple!(fp_glXBindTexImageATI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXBindTexImageATI)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "XBindTexImage", funcPtr, params__);
		}
void XReleaseTexImage(GL gl_, ParameterTypeTuple!(fp_glXReleaseTexImageATI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXReleaseTexImageATI)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "XReleaseTexImage", funcPtr, params__);
		}
void XDrawableAttrib(GL gl_, ParameterTypeTuple!(fp_glXDrawableAttribATI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXDrawableAttribATI)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "XDrawableAttrib", funcPtr, params__);
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
		void*[] funcAddr = new void*[3];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GLX_ATI_render_texture")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glXBindTexImageATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glXReleaseTexImageATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glXDrawableAttribATI"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
