module dgl.ext.EXT_texture_object;
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



private ushort extensionId__ = 69;
alias extensionId__ EXT_texture_object;

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
			const GLenum GL_TEXTURE_PRIORITY_EXT = 0x8066;
			const GLenum GL_TEXTURE_RESIDENT_EXT = 0x8067;
			const GLenum GL_TEXTURE_1D_BINDING_EXT = 0x8068;
			const GLenum GL_TEXTURE_2D_BINDING_EXT = 0x8069;
			const GLenum GL_TEXTURE_3D_BINDING_EXT = 0x806A;
	}
	private {
		extern (System) {
			alias GLboolean function (GLsizei n,  GLuint* textures, GLboolean* residences)	fp_glAreTexturesResidentEXT;
			alias void function (GLenum target, GLuint texture)	fp_glBindTextureEXT;
			alias void function (GLsizei n,  GLuint* textures)	fp_glDeleteTexturesEXT;
			alias void function (GLsizei n, GLuint* textures)	fp_glGenTexturesEXT;
			alias GLboolean function (GLuint texture)	fp_glIsTextureEXT;
			alias void function (GLsizei n,  GLuint* textures,  GLclampf* priorities)	fp_glPrioritizeTexturesEXT;
		}
	}
	public {
GLboolean AreTexturesResident(GL gl_, ParameterTypeTuple!(fp_glAreTexturesResidentEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glAreTexturesResidentEXT)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "AreTexturesResident", funcPtr, params__);
		}
void BindTexture(GL gl_, ParameterTypeTuple!(fp_glBindTextureEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBindTextureEXT)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "BindTexture", funcPtr, params__);
		}
void DeleteTextures(GL gl_, ParameterTypeTuple!(fp_glDeleteTexturesEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDeleteTexturesEXT)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "DeleteTextures", funcPtr, params__);
		}
void GenTextures(GL gl_, ParameterTypeTuple!(fp_glGenTexturesEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGenTexturesEXT)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "GenTextures", funcPtr, params__);
		}
GLboolean IsTexture(GL gl_, ParameterTypeTuple!(fp_glIsTextureEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glIsTextureEXT)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "IsTexture", funcPtr, params__);
		}
void PrioritizeTextures(GL gl_, ParameterTypeTuple!(fp_glPrioritizeTexturesEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glPrioritizeTexturesEXT)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "PrioritizeTextures", funcPtr, params__);
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
		void*[] funcAddr = new void*[6];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_EXT_texture_object")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glAreTexturesResidentEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glBindTextureEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glDeleteTexturesEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glGenTexturesEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glIsTextureEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glPrioritizeTexturesEXT"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
