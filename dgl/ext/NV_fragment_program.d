module dgl.ext.NV_fragment_program;
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



private ushort extensionId__ = 369;
alias extensionId__ NV_fragment_program;

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
			const GLenum GL_MAX_FRAGMENT_PROGRAM_LOCAL_PARAMETERS_NV = 0x8868;
			const GLenum GL_FRAGMENT_PROGRAM_NV = 0x8870;
			const GLenum GL_MAX_TEXTURE_COORDS_NV = 0x8871;
			const GLenum GL_MAX_TEXTURE_IMAGE_UNITS_NV = 0x8872;
			const GLenum GL_FRAGMENT_PROGRAM_BINDING_NV = 0x8873;
			const GLenum GL_PROGRAM_ERROR_STRING_NV = 0x8874;
	}
	private {
		extern (System) {
			alias void function (GLuint id, GLsizei len,  GLubyte* name, GLdouble *params)	fp_glGetProgramNamedParameterdvNV;
			alias void function (GLuint id, GLsizei len,  GLubyte* name, GLfloat *params)	fp_glGetProgramNamedParameterfvNV;
			alias void function (GLuint id, GLsizei len,  GLubyte* name, GLdouble x, GLdouble y, GLdouble z, GLdouble w)	fp_glProgramNamedParameter4dNV;
			alias void function (GLuint id, GLsizei len,  GLubyte* name,  GLdouble v[])	fp_glProgramNamedParameter4dvNV;
			alias void function (GLuint id, GLsizei len,  GLubyte* name, GLfloat x, GLfloat y, GLfloat z, GLfloat w)	fp_glProgramNamedParameter4fNV;
			alias void function (GLuint id, GLsizei len,  GLubyte* name,  GLfloat v[])	fp_glProgramNamedParameter4fvNV;
		}
	}
	public {
void GetProgramNamedParameterdv(GL gl_, ParameterTypeTuple!(fp_glGetProgramNamedParameterdvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetProgramNamedParameterdvNV)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "GetProgramNamedParameterdv", funcPtr, params__);
		}
void GetProgramNamedParameterfv(GL gl_, ParameterTypeTuple!(fp_glGetProgramNamedParameterfvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetProgramNamedParameterfvNV)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "GetProgramNamedParameterfv", funcPtr, params__);
		}
void ProgramNamedParameter4d(GL gl_, ParameterTypeTuple!(fp_glProgramNamedParameter4dNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramNamedParameter4dNV)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "ProgramNamedParameter4d", funcPtr, params__);
		}
void ProgramNamedParameter4dv(GL gl_, ParameterTypeTuple!(fp_glProgramNamedParameter4dvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramNamedParameter4dvNV)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "ProgramNamedParameter4dv", funcPtr, params__);
		}
void ProgramNamedParameter4f(GL gl_, ParameterTypeTuple!(fp_glProgramNamedParameter4fNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramNamedParameter4fNV)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "ProgramNamedParameter4f", funcPtr, params__);
		}
void ProgramNamedParameter4fv(GL gl_, ParameterTypeTuple!(fp_glProgramNamedParameter4fvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramNamedParameter4fvNV)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "ProgramNamedParameter4fv", funcPtr, params__);
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
			if (!extStr.containsPattern("GL_NV_fragment_program")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glGetProgramNamedParameterdvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glGetProgramNamedParameterfvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glProgramNamedParameter4dNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glProgramNamedParameter4dvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glProgramNamedParameter4fNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glProgramNamedParameter4fvNV"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
