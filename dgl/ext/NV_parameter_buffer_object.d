module dgl.ext.NV_parameter_buffer_object;
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



private ushort extensionId__ = 411;
alias extensionId__ NV_parameter_buffer_object;
import dgl.ext.NV_gpu_program4;

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
			const GLenum GL_VERTEX_PROGRAM_PARAMETER_BUFFER_NV = 0x8DA2;
			const GLenum GL_GEOMETRY_PROGRAM_PARAMETER_BUFFER_NV = 0x8DA3;
			const GLenum GL_FRAGMENT_PROGRAM_PARAMETER_BUFFER_NV = 0x8DA4;
			const GLenum GL_MAX_PROGRAM_PARAMETER_BUFFER_BINDINGS_NV = 0x8DA0;
			const GLenum GL_MAX_PROGRAM_PARAMETER_BUFFER_SIZE_NV = 0x8DA1;
	}
	private {
		extern (System) {
			alias void function (GLenum target, GLuint buffer, GLuint index, GLsizei count,  GLfloat *params)	fp_glProgramBufferParametersfvNV;
			alias void function (GLenum target, GLuint buffer, GLuint index, GLsizei count,  GLint *params)	fp_glProgramBufferParametersIivNV;
			alias void function (GLenum target, GLuint buffer, GLuint index, GLsizei count,  GLuint *params)	fp_glProgramBufferParametersIuivNV;
		}
	}
	public {
void ProgramBufferParametersfv(GL gl_, ParameterTypeTuple!(fp_glProgramBufferParametersfvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramBufferParametersfvNV)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "ProgramBufferParametersfv", funcPtr, params__);
		}
void ProgramBufferParametersIiv(GL gl_, ParameterTypeTuple!(fp_glProgramBufferParametersIivNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramBufferParametersIivNV)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "ProgramBufferParametersIiv", funcPtr, params__);
		}
void ProgramBufferParametersIuiv(GL gl_, ParameterTypeTuple!(fp_glProgramBufferParametersIuivNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramBufferParametersIuivNV)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "ProgramBufferParametersIuiv", funcPtr, params__);
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
			if (!extStr.containsPattern("GL_NV_parameter_buffer_object")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glProgramBufferParametersfvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glProgramBufferParametersIivNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glProgramBufferParametersIuivNV"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
