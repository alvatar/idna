module dgl.ext.ARB_texture_compression;
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



private ushort extensionId__ = 23;
alias extensionId__ ARB_texture_compression;

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

version (all) {
	public {
			const GLenum GL_COMPRESSED_ALPHA_ARB = 0x84E9;
			const GLenum GL_COMPRESSED_LUMINANCE_ARB = 0x84EA;
			const GLenum GL_COMPRESSED_LUMINANCE_ALPHA_ARB = 0x84EB;
			const GLenum GL_COMPRESSED_INTENSITY_ARB = 0x84EC;
			const GLenum GL_COMPRESSED_RGB_ARB = 0x84ED;
			const GLenum GL_COMPRESSED_RGBA_ARB = 0x84EE;
			const GLenum GL_TEXTURE_COMPRESSION_HINT_ARB = 0x84EF;
			const GLenum GL_TEXTURE_COMPRESSED_IMAGE_SIZE_ARB = 0x86A0;
			const GLenum GL_TEXTURE_COMPRESSED_ARB = 0x86A1;
			const GLenum GL_NUM_COMPRESSED_TEXTURE_FORMATS_ARB = 0x86A2;
			const GLenum GL_COMPRESSED_TEXTURE_FORMATS_ARB = 0x86A3;
	}
	private {
		extern (System) {
			alias void function (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLint border, GLsizei imageSize,  void* data)	fp_glCompressedTexImage1DARB;
			alias void function (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize,  void* data)	fp_glCompressedTexImage2DARB;
			alias void function (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imageSize,  void* data)	fp_glCompressedTexImage3DARB;
			alias void function (GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLsizei imageSize,  void* data)	fp_glCompressedTexSubImage1DARB;
			alias void function (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize,  void* data)	fp_glCompressedTexSubImage2DARB;
			alias void function (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize,  void* data)	fp_glCompressedTexSubImage3DARB;
			alias void function (GLenum target, GLint lod, void* img)	fp_glGetCompressedTexImageARB;
		}
	}
	public {
void CompressedTexImage1D(GL gl_, ParameterTypeTuple!(fp_glCompressedTexImage1DARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCompressedTexImage1DARB)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "CompressedTexImage1D", funcPtr, params__);
		}
void CompressedTexImage2D(GL gl_, ParameterTypeTuple!(fp_glCompressedTexImage2DARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCompressedTexImage2DARB)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "CompressedTexImage2D", funcPtr, params__);
		}
void CompressedTexImage3D(GL gl_, ParameterTypeTuple!(fp_glCompressedTexImage3DARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCompressedTexImage3DARB)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "CompressedTexImage3D", funcPtr, params__);
		}
void CompressedTexSubImage1D(GL gl_, ParameterTypeTuple!(fp_glCompressedTexSubImage1DARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCompressedTexSubImage1DARB)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "CompressedTexSubImage1D", funcPtr, params__);
		}
void CompressedTexSubImage2D(GL gl_, ParameterTypeTuple!(fp_glCompressedTexSubImage2DARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCompressedTexSubImage2DARB)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "CompressedTexSubImage2D", funcPtr, params__);
		}
void CompressedTexSubImage3D(GL gl_, ParameterTypeTuple!(fp_glCompressedTexSubImage3DARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCompressedTexSubImage3DARB)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "CompressedTexSubImage3D", funcPtr, params__);
		}
void GetCompressedTexImage(GL gl_, ParameterTypeTuple!(fp_glGetCompressedTexImageARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetCompressedTexImageARB)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "GetCompressedTexImage", funcPtr, params__);
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
		void*[] funcAddr = new void*[7];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_ARB_texture_compression")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glCompressedTexImage1DARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glCompressedTexImage2DARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glCompressedTexImage3DARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glCompressedTexSubImage1DARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glCompressedTexSubImage2DARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glCompressedTexSubImage3DARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glGetCompressedTexImageARB"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
