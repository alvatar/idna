module dgl.ext.EXT_texture3D;
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



private ushort extensionId__ = 80;
alias extensionId__ EXT_texture3D;
import dgl.ext.EXT_texture;

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
			const GLenum GL_PACK_SKIP_IMAGES_EXT = 0x806B;
			const GLenum GL_PACK_IMAGE_HEIGHT_EXT = 0x806C;
			const GLenum GL_UNPACK_SKIP_IMAGES_EXT = 0x806D;
			const GLenum GL_UNPACK_IMAGE_HEIGHT_EXT = 0x806E;
			const GLenum GL_TEXTURE_3D_EXT = 0x806F;
			const GLenum GL_PROXY_TEXTURE_3D_EXT = 0x8070;
			const GLenum GL_TEXTURE_DEPTH_EXT = 0x8071;
			const GLenum GL_TEXTURE_WRAP_R_EXT = 0x8072;
			const GLenum GL_MAX_3D_TEXTURE_SIZE_EXT = 0x8073;
	}
	private {
		extern (System) {
			alias void function (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLenum format, GLenum type,  void* pixels)	fp_glTexImage3DEXT;
		}
	}
	public {
void TexImage3D(GL gl_, ParameterTypeTuple!(fp_glTexImage3DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTexImage3DEXT)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "TexImage3D", funcPtr, params__);
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
		void*[] funcAddr = new void*[1];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_EXT_texture3D")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glTexImage3DEXT"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
