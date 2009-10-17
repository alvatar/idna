module dgl.ext.EXT_gpu_shader4;
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



private ushort extensionId__ = 471;
alias extensionId__ EXT_gpu_shader4;

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
			const GLenum GL_SAMPLER_1D_ARRAY_EXT = 0x8DC0;
			const GLenum GL_SAMPLER_2D_ARRAY_EXT = 0x8DC1;
			const GLenum GL_SAMPLER_BUFFER_EXT = 0x8DC2;
			const GLenum GL_SAMPLER_1D_ARRAY_SHADOW_EXT = 0x8DC3;
			const GLenum GL_SAMPLER_2D_ARRAY_SHADOW_EXT = 0x8DC4;
			const GLenum GL_SAMPLER_CUBE_SHADOW_EXT = 0x8DC5;
			const GLenum GL_UNSIGNED_INT_VEC2_EXT = 0x8DC6;
			const GLenum GL_UNSIGNED_INT_VEC3_EXT = 0x8DC7;
			const GLenum GL_UNSIGNED_INT_VEC4_EXT = 0x8DC8;
			const GLenum GL_INT_SAMPLER_1D_EXT = 0x8DC9;
			const GLenum GL_INT_SAMPLER_2D_EXT = 0x8DCA;
			const GLenum GL_INT_SAMPLER_3D_EXT = 0x8DCB;
			const GLenum GL_INT_SAMPLER_CUBE_EXT = 0x8DCC;
			const GLenum GL_INT_SAMPLER_2D_RECT_EXT = 0x8DCD;
			const GLenum GL_INT_SAMPLER_1D_ARRAY_EXT = 0x8DCE;
			const GLenum GL_INT_SAMPLER_2D_ARRAY_EXT = 0x8DCF;
			const GLenum GL_INT_SAMPLER_BUFFER_EXT = 0x8DD0;
			const GLenum GL_UNSIGNED_INT_SAMPLER_1D_EXT = 0x8DD1;
			const GLenum GL_UNSIGNED_INT_SAMPLER_2D_EXT = 0x8DD2;
			const GLenum GL_UNSIGNED_INT_SAMPLER_3D_EXT = 0x8DD3;
			const GLenum GL_UNSIGNED_INT_SAMPLER_CUBE_EXT = 0x8DD4;
			const GLenum GL_UNSIGNED_INT_SAMPLER_2D_RECT_EXT = 0x8DD5;
			const GLenum GL_UNSIGNED_INT_SAMPLER_1D_ARRAY_EXT = 0x8DD6;
			const GLenum GL_UNSIGNED_INT_SAMPLER_2D_ARRAY_EXT = 0x8DD7;
			const GLenum GL_UNSIGNED_INT_SAMPLER_BUFFER_EXT = 0x8DD8;
			const GLenum GL_VERTEX_ATTRIB_ARRAY_INTEGER_EXT = 0x88FD;
	}
	private {
		extern (System) {
			alias void function (GLuint program, GLint location, GLuint *params)	fp_glGetUniformuivEXT;
			alias void function (GLuint program, GLuint color,  GLchar *name)	fp_glBindFragDataLocationEXT;
			alias GLint function (GLuint program,  GLchar *name)	fp_glGetFragDataLocationEXT;
			alias void function (GLint location, GLuint v0)	fp_glUniform1uiEXT;
			alias void function (GLint location, GLuint v0, GLuint v1)	fp_glUniform2uiEXT;
			alias void function (GLint location, GLuint v0, GLuint v1, GLuint v2)	fp_glUniform3uiEXT;
			alias void function (GLint location, GLuint v0, GLuint v1, GLuint v2, GLuint v3)	fp_glUniform4uiEXT;
			alias void function (GLint location, GLsizei count,  GLuint *value)	fp_glUniform1uivEXT;
			alias void function (GLint location, GLsizei count,  GLuint *value)	fp_glUniform2uivEXT;
			alias void function (GLint location, GLsizei count,  GLuint *value)	fp_glUniform3uivEXT;
			alias void function (GLint location, GLsizei count,  GLuint *value)	fp_glUniform4uivEXT;
			alias void function (GLuint index, GLint x)	fp_glVertexAttribI1iEXT;
			alias void function (GLuint index, GLint x, GLint y)	fp_glVertexAttribI2iEXT;
			alias void function (GLuint index, GLint x, GLint y, GLint z)	fp_glVertexAttribI3iEXT;
			alias void function (GLuint index, GLint x, GLint y, GLint z, GLint w)	fp_glVertexAttribI4iEXT;
			alias void function (GLuint index, GLuint x)	fp_glVertexAttribI1uiEXT;
			alias void function (GLuint index, GLuint x, GLuint y)	fp_glVertexAttribI2uiEXT;
			alias void function (GLuint index, GLuint x, GLuint y, GLuint z)	fp_glVertexAttribI3uiEXT;
			alias void function (GLuint index, GLuint x, GLuint y, GLuint z, GLuint w)	fp_glVertexAttribI4uiEXT;
			alias void function (GLuint index,  GLint *v)	fp_glVertexAttribI1ivEXT;
			alias void function (GLuint index,  GLint *v)	fp_glVertexAttribI2ivEXT;
			alias void function (GLuint index,  GLint *v)	fp_glVertexAttribI3ivEXT;
			alias void function (GLuint index,  GLint *v)	fp_glVertexAttribI4ivEXT;
			alias void function (GLuint index,  GLuint *v)	fp_glVertexAttribI1uivEXT;
			alias void function (GLuint index,  GLuint *v)	fp_glVertexAttribI2uivEXT;
			alias void function (GLuint index,  GLuint *v)	fp_glVertexAttribI3uivEXT;
			alias void function (GLuint index,  GLuint *v)	fp_glVertexAttribI4uivEXT;
			alias void function (GLuint index,  GLbyte *v)	fp_glVertexAttribI4bvEXT;
			alias void function (GLuint index,  GLshort *v)	fp_glVertexAttribI4svEXT;
			alias void function (GLuint index,  GLubyte *v)	fp_glVertexAttribI4ubvEXT;
			alias void function (GLuint index,  GLushort *v)	fp_glVertexAttribI4usvEXT;
			alias void function (GLuint index, GLint size, GLenum type, GLsizei stride,  GLvoid *pointer)	fp_glVertexAttribIPointerEXT;
			alias void function (GLuint index, GLenum pname, GLint *params)	fp_glGetVertexAttribIivEXT;
			alias void function (GLuint index, GLenum pname, GLuint *params)	fp_glGetVertexAttribIuivEXT;
		}
	}
	public {
void GetUniformuiv(GL gl_, ParameterTypeTuple!(fp_glGetUniformuivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetUniformuivEXT)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "GetUniformuiv", funcPtr, params__);
		}
void BindFragDataLocation(GL gl_, ParameterTypeTuple!(fp_glBindFragDataLocationEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBindFragDataLocationEXT)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "BindFragDataLocation", funcPtr, params__);
		}
GLint GetFragDataLocation(GL gl_, ParameterTypeTuple!(fp_glGetFragDataLocationEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetFragDataLocationEXT)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "GetFragDataLocation", funcPtr, params__);
		}
void Uniform1ui(GL gl_, ParameterTypeTuple!(fp_glUniform1uiEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform1uiEXT)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "Uniform1ui", funcPtr, params__);
		}
void Uniform2ui(GL gl_, ParameterTypeTuple!(fp_glUniform2uiEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform2uiEXT)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "Uniform2ui", funcPtr, params__);
		}
void Uniform3ui(GL gl_, ParameterTypeTuple!(fp_glUniform3uiEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform3uiEXT)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "Uniform3ui", funcPtr, params__);
		}
void Uniform4ui(GL gl_, ParameterTypeTuple!(fp_glUniform4uiEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform4uiEXT)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "Uniform4ui", funcPtr, params__);
		}
void Uniform1uiv(GL gl_, ParameterTypeTuple!(fp_glUniform1uivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform1uivEXT)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "Uniform1uiv", funcPtr, params__);
		}
void Uniform2uiv(GL gl_, ParameterTypeTuple!(fp_glUniform2uivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform2uivEXT)(gl.extFuncs[extensionId__][8]);
			return checkedCall(gl_, "Uniform2uiv", funcPtr, params__);
		}
void Uniform3uiv(GL gl_, ParameterTypeTuple!(fp_glUniform3uivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform3uivEXT)(gl.extFuncs[extensionId__][9]);
			return checkedCall(gl_, "Uniform3uiv", funcPtr, params__);
		}
void Uniform4uiv(GL gl_, ParameterTypeTuple!(fp_glUniform4uivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform4uivEXT)(gl.extFuncs[extensionId__][10]);
			return checkedCall(gl_, "Uniform4uiv", funcPtr, params__);
		}
void VertexAttribI1i(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI1iEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI1iEXT)(gl.extFuncs[extensionId__][11]);
			return checkedCall(gl_, "VertexAttribI1i", funcPtr, params__);
		}
void VertexAttribI2i(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI2iEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI2iEXT)(gl.extFuncs[extensionId__][12]);
			return checkedCall(gl_, "VertexAttribI2i", funcPtr, params__);
		}
void VertexAttribI3i(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI3iEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI3iEXT)(gl.extFuncs[extensionId__][13]);
			return checkedCall(gl_, "VertexAttribI3i", funcPtr, params__);
		}
void VertexAttribI4i(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI4iEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI4iEXT)(gl.extFuncs[extensionId__][14]);
			return checkedCall(gl_, "VertexAttribI4i", funcPtr, params__);
		}
void VertexAttribI1ui(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI1uiEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI1uiEXT)(gl.extFuncs[extensionId__][15]);
			return checkedCall(gl_, "VertexAttribI1ui", funcPtr, params__);
		}
void VertexAttribI2ui(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI2uiEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI2uiEXT)(gl.extFuncs[extensionId__][16]);
			return checkedCall(gl_, "VertexAttribI2ui", funcPtr, params__);
		}
void VertexAttribI3ui(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI3uiEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI3uiEXT)(gl.extFuncs[extensionId__][17]);
			return checkedCall(gl_, "VertexAttribI3ui", funcPtr, params__);
		}
void VertexAttribI4ui(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI4uiEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI4uiEXT)(gl.extFuncs[extensionId__][18]);
			return checkedCall(gl_, "VertexAttribI4ui", funcPtr, params__);
		}
void VertexAttribI1iv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI1ivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI1ivEXT)(gl.extFuncs[extensionId__][19]);
			return checkedCall(gl_, "VertexAttribI1iv", funcPtr, params__);
		}
void VertexAttribI2iv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI2ivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI2ivEXT)(gl.extFuncs[extensionId__][20]);
			return checkedCall(gl_, "VertexAttribI2iv", funcPtr, params__);
		}
void VertexAttribI3iv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI3ivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI3ivEXT)(gl.extFuncs[extensionId__][21]);
			return checkedCall(gl_, "VertexAttribI3iv", funcPtr, params__);
		}
void VertexAttribI4iv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI4ivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI4ivEXT)(gl.extFuncs[extensionId__][22]);
			return checkedCall(gl_, "VertexAttribI4iv", funcPtr, params__);
		}
void VertexAttribI1uiv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI1uivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI1uivEXT)(gl.extFuncs[extensionId__][23]);
			return checkedCall(gl_, "VertexAttribI1uiv", funcPtr, params__);
		}
void VertexAttribI2uiv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI2uivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI2uivEXT)(gl.extFuncs[extensionId__][24]);
			return checkedCall(gl_, "VertexAttribI2uiv", funcPtr, params__);
		}
void VertexAttribI3uiv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI3uivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI3uivEXT)(gl.extFuncs[extensionId__][25]);
			return checkedCall(gl_, "VertexAttribI3uiv", funcPtr, params__);
		}
void VertexAttribI4uiv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI4uivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI4uivEXT)(gl.extFuncs[extensionId__][26]);
			return checkedCall(gl_, "VertexAttribI4uiv", funcPtr, params__);
		}
void VertexAttribI4bv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI4bvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI4bvEXT)(gl.extFuncs[extensionId__][27]);
			return checkedCall(gl_, "VertexAttribI4bv", funcPtr, params__);
		}
void VertexAttribI4sv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI4svEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI4svEXT)(gl.extFuncs[extensionId__][28]);
			return checkedCall(gl_, "VertexAttribI4sv", funcPtr, params__);
		}
void VertexAttribI4ubv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI4ubvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI4ubvEXT)(gl.extFuncs[extensionId__][29]);
			return checkedCall(gl_, "VertexAttribI4ubv", funcPtr, params__);
		}
void VertexAttribI4usv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI4usvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI4usvEXT)(gl.extFuncs[extensionId__][30]);
			return checkedCall(gl_, "VertexAttribI4usv", funcPtr, params__);
		}
void VertexAttribIPointer(GL gl_, ParameterTypeTuple!(fp_glVertexAttribIPointerEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribIPointerEXT)(gl.extFuncs[extensionId__][31]);
			return checkedCall(gl_, "VertexAttribIPointer", funcPtr, params__);
		}
void GetVertexAttribIiv(GL gl_, ParameterTypeTuple!(fp_glGetVertexAttribIivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetVertexAttribIivEXT)(gl.extFuncs[extensionId__][32]);
			return checkedCall(gl_, "GetVertexAttribIiv", funcPtr, params__);
		}
void GetVertexAttribIuiv(GL gl_, ParameterTypeTuple!(fp_glGetVertexAttribIuivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetVertexAttribIuivEXT)(gl.extFuncs[extensionId__][33]);
			return checkedCall(gl_, "GetVertexAttribIuiv", funcPtr, params__);
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
		void*[] funcAddr = new void*[34];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_EXT_gpu_shader4")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glGetUniformuivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glBindFragDataLocationEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glGetFragDataLocationEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glUniform1uiEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glUniform2uiEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glUniform3uiEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glUniform4uiEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glUniform1uivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[8] = getExtensionFuncPtr(cast(char*)"glUniform2uivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[9] = getExtensionFuncPtr(cast(char*)"glUniform3uivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[10] = getExtensionFuncPtr(cast(char*)"glUniform4uivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[11] = getExtensionFuncPtr(cast(char*)"glVertexAttribI1iEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[12] = getExtensionFuncPtr(cast(char*)"glVertexAttribI2iEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[13] = getExtensionFuncPtr(cast(char*)"glVertexAttribI3iEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[14] = getExtensionFuncPtr(cast(char*)"glVertexAttribI4iEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[15] = getExtensionFuncPtr(cast(char*)"glVertexAttribI1uiEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[16] = getExtensionFuncPtr(cast(char*)"glVertexAttribI2uiEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[17] = getExtensionFuncPtr(cast(char*)"glVertexAttribI3uiEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[18] = getExtensionFuncPtr(cast(char*)"glVertexAttribI4uiEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[19] = getExtensionFuncPtr(cast(char*)"glVertexAttribI1ivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[20] = getExtensionFuncPtr(cast(char*)"glVertexAttribI2ivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[21] = getExtensionFuncPtr(cast(char*)"glVertexAttribI3ivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[22] = getExtensionFuncPtr(cast(char*)"glVertexAttribI4ivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[23] = getExtensionFuncPtr(cast(char*)"glVertexAttribI1uivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[24] = getExtensionFuncPtr(cast(char*)"glVertexAttribI2uivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[25] = getExtensionFuncPtr(cast(char*)"glVertexAttribI3uivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[26] = getExtensionFuncPtr(cast(char*)"glVertexAttribI4uivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[27] = getExtensionFuncPtr(cast(char*)"glVertexAttribI4bvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[28] = getExtensionFuncPtr(cast(char*)"glVertexAttribI4svEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[29] = getExtensionFuncPtr(cast(char*)"glVertexAttribI4ubvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[30] = getExtensionFuncPtr(cast(char*)"glVertexAttribI4usvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[31] = getExtensionFuncPtr(cast(char*)"glVertexAttribIPointerEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[32] = getExtensionFuncPtr(cast(char*)"glGetVertexAttribIivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[33] = getExtensionFuncPtr(cast(char*)"glGetVertexAttribIuivEXT"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
