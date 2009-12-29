module dgl.ext.VERSION_1_2;
import dgl.opengl;
import dgl.glext;

version( D_Version2 ) {
	import std.string : containsPattern = count;
	import std.conv;
} else {
	import tango.text.Util : containsPattern;
	import tango.stdc.stringz : fromStringz;
	alias char[] string;
}



private ushort extensionId__ = 6;
alias extensionId__ VERSION_1_2;

	version (DglNoExtSupportAsserts) {
	} else {
		version = DglExtSupportAsserts;
	}
	
	static this() {
		if (__extSupportCheckingFuncs.length <= extensionId__) {
			__extSupportCheckingFuncs.length = extensionId__ + 1;
		}
		__extSupportCheckingFuncs[extensionId__] = &__supported;
	}

version (all) {
	public {
			const GLenum GL_UNSIGNED_BYTE_3_3_2 = 0x8032;
			const GLenum GL_UNSIGNED_SHORT_4_4_4_4 = 0x8033;
			const GLenum GL_UNSIGNED_SHORT_5_5_5_1 = 0x8034;
			const GLenum GL_UNSIGNED_INT_8_8_8_8 = 0x8035;
			const GLenum GL_UNSIGNED_INT_10_10_10_2 = 0x8036;
			const GLenum GL_RESCALE_NORMAL = 0x803A;
			const GLenum GL_UNSIGNED_BYTE_2_3_3_REV = 0x8362;
			const GLenum GL_UNSIGNED_SHORT_5_6_5 = 0x8363;
			const GLenum GL_UNSIGNED_SHORT_5_6_5_REV = 0x8364;
			const GLenum GL_UNSIGNED_SHORT_4_4_4_4_REV = 0x8365;
			const GLenum GL_UNSIGNED_SHORT_1_5_5_5_REV = 0x8366;
			const GLenum GL_UNSIGNED_INT_8_8_8_8_REV = 0x8367;
			const GLenum GL_UNSIGNED_INT_2_10_10_10_REV = 0x8368;
			const GLenum GL_BGR = 0x80E0;
			const GLenum GL_BGRA = 0x80E1;
			const GLenum GL_MAX_ELEMENTS_VERTICES = 0x80E8;
			const GLenum GL_MAX_ELEMENTS_INDICES = 0x80E9;
			const GLenum GL_CLAMP_TO_EDGE = 0x812F;
			const GLenum GL_TEXTURE_MIN_LOD = 0x813A;
			const GLenum GL_TEXTURE_MAX_LOD = 0x813B;
			const GLenum GL_TEXTURE_BASE_LEVEL = 0x813C;
			const GLenum GL_TEXTURE_MAX_LEVEL = 0x813D;
			const GLenum GL_LIGHT_MODEL_COLOR_CONTROL = 0x81F8;
			const GLenum GL_SINGLE_COLOR = 0x81F9;
			const GLenum GL_SEPARATE_SPECULAR_COLOR = 0x81FA;
			const GLenum GL_SMOOTH_POINT_SIZE_RANGE = 0x0B12;
			const GLenum GL_SMOOTH_POINT_SIZE_GRANULARITY = 0x0B13;
			const GLenum GL_SMOOTH_LINE_WIDTH_RANGE = 0x0B22;
			const GLenum GL_SMOOTH_LINE_WIDTH_GRANULARITY = 0x0B23;
			const GLenum GL_ALIASED_POINT_SIZE_RANGE = 0x846D;
			const GLenum GL_ALIASED_LINE_WIDTH_RANGE = 0x846E;
			const GLenum GL_PACK_SKIP_IMAGES = 0x806B;
			const GLenum GL_PACK_IMAGE_HEIGHT = 0x806C;
			const GLenum GL_UNPACK_SKIP_IMAGES = 0x806D;
			const GLenum GL_UNPACK_IMAGE_HEIGHT = 0x806E;
			const GLenum GL_TEXTURE_3D = 0x806F;
			const GLenum GL_PROXY_TEXTURE_3D = 0x8070;
			const GLenum GL_TEXTURE_DEPTH = 0x8071;
			const GLenum GL_TEXTURE_WRAP_R = 0x8072;
			const GLenum GL_MAX_3D_TEXTURE_SIZE = 0x8073;
			const GLenum GL_TEXTURE_BINDING_3D = 0x806A;
	}
	private {
		extern (System) {
			alias void function (GLenum mode, GLuint start, GLuint end, GLsizei count, GLenum type,  GLvoid *indices)	fp_glDrawRangeElements;
			alias void function (GLenum target, GLint level, GLint internalFormat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLenum format, GLenum type,  GLvoid *pixels)	fp_glTexImage3D;
			alias void function (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type,  GLvoid *pixels)	fp_glTexSubImage3D;
			alias void function (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height)	fp_glCopyTexSubImage3D;
		}
	}
	public {
void DrawRangeElements(GL gl_, ParameterTypeTuple!(fp_glDrawRangeElements) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDrawRangeElements)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "DrawRangeElements", funcPtr, params__);
		}
void TexImage3D(GL gl_, ParameterTypeTuple!(fp_glTexImage3D) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTexImage3D)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "TexImage3D", funcPtr, params__);
		}
void TexSubImage3D(GL gl_, ParameterTypeTuple!(fp_glTexSubImage3D) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTexSubImage3D)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "TexSubImage3D", funcPtr, params__);
		}
void CopyTexSubImage3D(GL gl_, ParameterTypeTuple!(fp_glCopyTexSubImage3D) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCopyTexSubImage3D)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "CopyTexSubImage3D", funcPtr, params__);
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
				
				version (DglExtSupportAsserts) {
					gl.extEnabled.length = extensionId__ + 1;
				}
			}
			gl.extFuncs[extensionId__] = loadFunctions__(gl_);
			
			return gl.extFuncs[extensionId__][0] !is null;
		}
	}
	private void*[] loadFunctions__(GL gl) {
		void*[] funcAddr = new void*[4];
		{
			if (!isOpenGLVersionSupported("1_2", '_')) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glDrawRangeElements"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glTexImage3D"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glTexSubImage3D"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glCopyTexSubImage3D"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
