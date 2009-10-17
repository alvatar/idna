module dgl.ext.ATI_envmap_bumpmap;
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



private ushort extensionId__ = 443;
alias extensionId__ ATI_envmap_bumpmap;

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
			const GLenum GL_BUMP_ROT_MATRIX_ATI = 0x8775;
			const GLenum GL_BUMP_ROT_MATRIX_SIZE_ATI = 0x8776;
			const GLenum GL_BUMP_NUM_TEX_UNITS_ATI = 0x8777;
			const GLenum GL_BUMP_TEX_UNITS_ATI = 0x8778;
			const GLenum GL_DUDV_ATI = 0x8779;
			const GLenum GL_DU8DV8_ATI = 0x877A;
			const GLenum GL_BUMP_ENVMAP_ATI = 0x877B;
			const GLenum GL_BUMP_TARGET_ATI = 0x877C;
	}
	private {
		extern (System) {
			alias void function (GLenum pname, GLint *param)	fp_glTexBumpParameterivATI;
			alias void function (GLenum pname, GLfloat *param)	fp_glTexBumpParameterfvATI;
			alias void function (GLenum pname, GLint *param)	fp_glGetTexBumpParameterivATI;
			alias void function (GLenum pname, GLfloat *param)	fp_glGetTexBumpParameterfvATI;
		}
	}
	public {
void TexBumpParameteriv(GL gl_, ParameterTypeTuple!(fp_glTexBumpParameterivATI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTexBumpParameterivATI)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "TexBumpParameteriv", funcPtr, params__);
		}
void TexBumpParameterfv(GL gl_, ParameterTypeTuple!(fp_glTexBumpParameterfvATI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTexBumpParameterfvATI)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "TexBumpParameterfv", funcPtr, params__);
		}
void GetTexBumpParameteriv(GL gl_, ParameterTypeTuple!(fp_glGetTexBumpParameterivATI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetTexBumpParameterivATI)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "GetTexBumpParameteriv", funcPtr, params__);
		}
void GetTexBumpParameterfv(GL gl_, ParameterTypeTuple!(fp_glGetTexBumpParameterfvATI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetTexBumpParameterfvATI)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "GetTexBumpParameterfv", funcPtr, params__);
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
		void*[] funcAddr = new void*[4];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_ATI_envmap_bumpmap")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glTexBumpParameterivATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glTexBumpParameterfvATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glGetTexBumpParameterivATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glGetTexBumpParameterfvATI"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
