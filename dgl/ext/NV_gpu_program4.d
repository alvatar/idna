module dgl.ext.NV_gpu_program4;
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



private ushort extensionId__ = 64;
alias extensionId__ NV_gpu_program4;

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
			const GLenum GL_MIN_PROGRAM_TEXEL_OFFSET_NV = 0x8904;
			const GLenum GL_MAX_PROGRAM_TEXEL_OFFSET_NV = 0x8905;
			const GLenum GL_PROGRAM_ATTRIB_COMPONENTS_NV = 0x8906;
			const GLenum GL_PROGRAM_RESULT_COMPONENTS_NV = 0x8907;
			const GLenum GL_MAX_PROGRAM_ATTRIB_COMPONENTS_NV = 0x8908;
			const GLenum GL_MAX_PROGRAM_RESULT_COMPONENTS_NV = 0x8909;
			const GLenum GL_MAX_PROGRAM_GENERIC_ATTRIBS_NV = 0x8DA5;
			const GLenum GL_MAX_PROGRAM_GENERIC_RESULTS_NV = 0x8DA6;
	}
	private {
		extern (System) {
			alias void function (GLenum target, GLuint index, GLint x, GLint y, GLint z, GLint w)	fp_glProgramLocalParameterI4iNV;
			alias void function (GLenum target, GLuint index,  GLint *params)	fp_glProgramLocalParameterI4ivNV;
			alias void function (GLenum target, GLuint index, GLsizei count,  GLint *params)	fp_glProgramLocalParametersI4ivNV;
			alias void function (GLenum target, GLuint index, GLuint x, GLuint y, GLuint z, GLuint w)	fp_glProgramLocalParameterI4uiNV;
			alias void function (GLenum target, GLuint index,  GLuint *params)	fp_glProgramLocalParameterI4uivNV;
			alias void function (GLenum target, GLuint index, GLsizei count,  GLuint *params)	fp_glProgramLocalParametersI4uivNV;
			alias void function (GLenum target, GLuint index, GLint x, GLint y, GLint z, GLint w)	fp_glProgramEnvParameterI4iNV;
			alias void function (GLenum target, GLuint index,  GLint *params)	fp_glProgramEnvParameterI4ivNV;
			alias void function (GLenum target, GLuint index, GLsizei count,  GLint *params)	fp_glProgramEnvParametersI4ivNV;
			alias void function (GLenum target, GLuint index, GLuint x, GLuint y, GLuint z, GLuint w)	fp_glProgramEnvParameterI4uiNV;
			alias void function (GLenum target, GLuint index,  GLuint *params)	fp_glProgramEnvParameterI4uivNV;
			alias void function (GLenum target, GLuint index, GLsizei count,  GLuint *params)	fp_glProgramEnvParametersI4uivNV;
		}
	}
	public {
void ProgramLocalParameterI4i(GL gl_, ParameterTypeTuple!(fp_glProgramLocalParameterI4iNV) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramLocalParameterI4iNV)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "ProgramLocalParameterI4i", funcPtr, params__);
		}
void ProgramLocalParameterI4iv(GL gl_, ParameterTypeTuple!(fp_glProgramLocalParameterI4ivNV) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramLocalParameterI4ivNV)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "ProgramLocalParameterI4iv", funcPtr, params__);
		}
void ProgramLocalParametersI4iv(GL gl_, ParameterTypeTuple!(fp_glProgramLocalParametersI4ivNV) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramLocalParametersI4ivNV)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "ProgramLocalParametersI4iv", funcPtr, params__);
		}
void ProgramLocalParameterI4ui(GL gl_, ParameterTypeTuple!(fp_glProgramLocalParameterI4uiNV) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramLocalParameterI4uiNV)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "ProgramLocalParameterI4ui", funcPtr, params__);
		}
void ProgramLocalParameterI4uiv(GL gl_, ParameterTypeTuple!(fp_glProgramLocalParameterI4uivNV) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramLocalParameterI4uivNV)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "ProgramLocalParameterI4uiv", funcPtr, params__);
		}
void ProgramLocalParametersI4uiv(GL gl_, ParameterTypeTuple!(fp_glProgramLocalParametersI4uivNV) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramLocalParametersI4uivNV)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "ProgramLocalParametersI4uiv", funcPtr, params__);
		}
void ProgramEnvParameterI4i(GL gl_, ParameterTypeTuple!(fp_glProgramEnvParameterI4iNV) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramEnvParameterI4iNV)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "ProgramEnvParameterI4i", funcPtr, params__);
		}
void ProgramEnvParameterI4iv(GL gl_, ParameterTypeTuple!(fp_glProgramEnvParameterI4ivNV) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramEnvParameterI4ivNV)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "ProgramEnvParameterI4iv", funcPtr, params__);
		}
void ProgramEnvParametersI4iv(GL gl_, ParameterTypeTuple!(fp_glProgramEnvParametersI4ivNV) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramEnvParametersI4ivNV)(gl.extFuncs[extensionId__][8]);
			return checkedCall(gl_, "ProgramEnvParametersI4iv", funcPtr, params__);
		}
void ProgramEnvParameterI4ui(GL gl_, ParameterTypeTuple!(fp_glProgramEnvParameterI4uiNV) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramEnvParameterI4uiNV)(gl.extFuncs[extensionId__][9]);
			return checkedCall(gl_, "ProgramEnvParameterI4ui", funcPtr, params__);
		}
void ProgramEnvParameterI4uiv(GL gl_, ParameterTypeTuple!(fp_glProgramEnvParameterI4uivNV) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramEnvParameterI4uivNV)(gl.extFuncs[extensionId__][10]);
			return checkedCall(gl_, "ProgramEnvParameterI4uiv", funcPtr, params__);
		}
void ProgramEnvParametersI4uiv(GL gl_, ParameterTypeTuple!(fp_glProgramEnvParametersI4uivNV) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramEnvParametersI4uivNV)(gl.extFuncs[extensionId__][11]);
			return checkedCall(gl_, "ProgramEnvParametersI4uiv", funcPtr, params__);
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
		void*[] funcAddr = new void*[12];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_NV_gpu_program4")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glProgramLocalParameterI4iNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glProgramLocalParameterI4ivNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glProgramLocalParametersI4ivNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glProgramLocalParameterI4uiNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glProgramLocalParameterI4uivNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glProgramLocalParametersI4uivNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glProgramEnvParameterI4iNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glProgramEnvParameterI4ivNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[8] = getExtensionFuncPtr(cast(char*)"glProgramEnvParametersI4ivNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[9] = getExtensionFuncPtr(cast(char*)"glProgramEnvParameterI4uiNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[10] = getExtensionFuncPtr(cast(char*)"glProgramEnvParameterI4uivNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[11] = getExtensionFuncPtr(cast(char*)"glProgramEnvParametersI4uivNV"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
