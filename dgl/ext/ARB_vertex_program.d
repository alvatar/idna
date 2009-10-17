module dgl.ext.ARB_vertex_program;
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



private ushort extensionId__ = 196;
alias extensionId__ ARB_vertex_program;

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
			const GLenum GL_COLOR_SUM_ARB = 0x8458;
			const GLenum GL_VERTEX_PROGRAM_ARB = 0x8620;
			const GLenum GL_VERTEX_ATTRIB_ARRAY_ENABLED_ARB = 0x8622;
			const GLenum GL_VERTEX_ATTRIB_ARRAY_SIZE_ARB = 0x8623;
			const GLenum GL_VERTEX_ATTRIB_ARRAY_STRIDE_ARB = 0x8624;
			const GLenum GL_VERTEX_ATTRIB_ARRAY_TYPE_ARB = 0x8625;
			const GLenum GL_CURRENT_VERTEX_ATTRIB_ARB = 0x8626;
			const GLenum GL_PROGRAM_LENGTH_ARB = 0x8627;
			const GLenum GL_PROGRAM_STRING_ARB = 0x8628;
			const GLenum GL_MAX_PROGRAM_MATRIX_STACK_DEPTH_ARB = 0x862E;
			const GLenum GL_MAX_PROGRAM_MATRICES_ARB = 0x862F;
			const GLenum GL_CURRENT_MATRIX_STACK_DEPTH_ARB = 0x8640;
			const GLenum GL_CURRENT_MATRIX_ARB = 0x8641;
			const GLenum GL_VERTEX_PROGRAM_POINT_SIZE_ARB = 0x8642;
			const GLenum GL_VERTEX_PROGRAM_TWO_SIDE_ARB = 0x8643;
			const GLenum GL_VERTEX_ATTRIB_ARRAY_POINTER_ARB = 0x8645;
			const GLenum GL_PROGRAM_ERROR_POSITION_ARB = 0x864B;
			const GLenum GL_PROGRAM_BINDING_ARB = 0x8677;
			const GLenum GL_MAX_VERTEX_ATTRIBS_ARB = 0x8869;
			const GLenum GL_VERTEX_ATTRIB_ARRAY_NORMALIZED_ARB = 0x886A;
			const GLenum GL_PROGRAM_ERROR_STRING_ARB = 0x8874;
			const GLenum GL_PROGRAM_FORMAT_ASCII_ARB = 0x8875;
			const GLenum GL_PROGRAM_FORMAT_ARB = 0x8876;
			const GLenum GL_PROGRAM_INSTRUCTIONS_ARB = 0x88A0;
			const GLenum GL_MAX_PROGRAM_INSTRUCTIONS_ARB = 0x88A1;
			const GLenum GL_PROGRAM_NATIVE_INSTRUCTIONS_ARB = 0x88A2;
			const GLenum GL_MAX_PROGRAM_NATIVE_INSTRUCTIONS_ARB = 0x88A3;
			const GLenum GL_PROGRAM_TEMPORARIES_ARB = 0x88A4;
			const GLenum GL_MAX_PROGRAM_TEMPORARIES_ARB = 0x88A5;
			const GLenum GL_PROGRAM_NATIVE_TEMPORARIES_ARB = 0x88A6;
			const GLenum GL_MAX_PROGRAM_NATIVE_TEMPORARIES_ARB = 0x88A7;
			const GLenum GL_PROGRAM_PARAMETERS_ARB = 0x88A8;
			const GLenum GL_MAX_PROGRAM_PARAMETERS_ARB = 0x88A9;
			const GLenum GL_PROGRAM_NATIVE_PARAMETERS_ARB = 0x88AA;
			const GLenum GL_MAX_PROGRAM_NATIVE_PARAMETERS_ARB = 0x88AB;
			const GLenum GL_PROGRAM_ATTRIBS_ARB = 0x88AC;
			const GLenum GL_MAX_PROGRAM_ATTRIBS_ARB = 0x88AD;
			const GLenum GL_PROGRAM_NATIVE_ATTRIBS_ARB = 0x88AE;
			const GLenum GL_MAX_PROGRAM_NATIVE_ATTRIBS_ARB = 0x88AF;
			const GLenum GL_PROGRAM_ADDRESS_REGISTERS_ARB = 0x88B0;
			const GLenum GL_MAX_PROGRAM_ADDRESS_REGISTERS_ARB = 0x88B1;
			const GLenum GL_PROGRAM_NATIVE_ADDRESS_REGISTERS_ARB = 0x88B2;
			const GLenum GL_MAX_PROGRAM_NATIVE_ADDRESS_REGISTERS_ARB = 0x88B3;
			const GLenum GL_MAX_PROGRAM_LOCAL_PARAMETERS_ARB = 0x88B4;
			const GLenum GL_MAX_PROGRAM_ENV_PARAMETERS_ARB = 0x88B5;
			const GLenum GL_PROGRAM_UNDER_NATIVE_LIMITS_ARB = 0x88B6;
			const GLenum GL_TRANSPOSE_CURRENT_MATRIX_ARB = 0x88B7;
			const GLenum GL_MATRIX0_ARB = 0x88C0;
			const GLenum GL_MATRIX1_ARB = 0x88C1;
			const GLenum GL_MATRIX2_ARB = 0x88C2;
			const GLenum GL_MATRIX3_ARB = 0x88C3;
			const GLenum GL_MATRIX4_ARB = 0x88C4;
			const GLenum GL_MATRIX5_ARB = 0x88C5;
			const GLenum GL_MATRIX6_ARB = 0x88C6;
			const GLenum GL_MATRIX7_ARB = 0x88C7;
			const GLenum GL_MATRIX8_ARB = 0x88C8;
			const GLenum GL_MATRIX9_ARB = 0x88C9;
			const GLenum GL_MATRIX10_ARB = 0x88CA;
			const GLenum GL_MATRIX11_ARB = 0x88CB;
			const GLenum GL_MATRIX12_ARB = 0x88CC;
			const GLenum GL_MATRIX13_ARB = 0x88CD;
			const GLenum GL_MATRIX14_ARB = 0x88CE;
			const GLenum GL_MATRIX15_ARB = 0x88CF;
			const GLenum GL_MATRIX16_ARB = 0x88D0;
			const GLenum GL_MATRIX17_ARB = 0x88D1;
			const GLenum GL_MATRIX18_ARB = 0x88D2;
			const GLenum GL_MATRIX19_ARB = 0x88D3;
			const GLenum GL_MATRIX20_ARB = 0x88D4;
			const GLenum GL_MATRIX21_ARB = 0x88D5;
			const GLenum GL_MATRIX22_ARB = 0x88D6;
			const GLenum GL_MATRIX23_ARB = 0x88D7;
			const GLenum GL_MATRIX24_ARB = 0x88D8;
			const GLenum GL_MATRIX25_ARB = 0x88D9;
			const GLenum GL_MATRIX26_ARB = 0x88DA;
			const GLenum GL_MATRIX27_ARB = 0x88DB;
			const GLenum GL_MATRIX28_ARB = 0x88DC;
			const GLenum GL_MATRIX29_ARB = 0x88DD;
			const GLenum GL_MATRIX30_ARB = 0x88DE;
			const GLenum GL_MATRIX31_ARB = 0x88DF;
	}
	private {
		extern (System) {
			alias void function (GLenum target, GLuint program)	fp_glBindProgramARB;
			alias void function (GLsizei n,  GLuint* programs)	fp_glDeleteProgramsARB;
			alias void function (GLuint index)	fp_glDisableVertexAttribArrayARB;
			alias void function (GLuint index)	fp_glEnableVertexAttribArrayARB;
			alias void function (GLsizei n, GLuint* programs)	fp_glGenProgramsARB;
			alias void function (GLenum target, GLuint index, GLdouble* params)	fp_glGetProgramEnvParameterdvARB;
			alias void function (GLenum target, GLuint index, GLfloat* params)	fp_glGetProgramEnvParameterfvARB;
			alias void function (GLenum target, GLuint index, GLdouble* params)	fp_glGetProgramLocalParameterdvARB;
			alias void function (GLenum target, GLuint index, GLfloat* params)	fp_glGetProgramLocalParameterfvARB;
			alias void function (GLenum target, GLenum pname, void* string)	fp_glGetProgramStringARB;
			alias void function (GLenum target, GLenum pname, GLint* params)	fp_glGetProgramivARB;
			alias void function (GLuint index, GLenum pname, GLvoid** pointer)	fp_glGetVertexAttribPointervARB;
			alias void function (GLuint index, GLenum pname, GLdouble* params)	fp_glGetVertexAttribdvARB;
			alias void function (GLuint index, GLenum pname, GLfloat* params)	fp_glGetVertexAttribfvARB;
			alias void function (GLuint index, GLenum pname, GLint* params)	fp_glGetVertexAttribivARB;
			alias GLboolean function (GLuint program)	fp_glIsProgramARB;
			alias void function (GLenum target, GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w)	fp_glProgramEnvParameter4dARB;
			alias void function (GLenum target, GLuint index,  GLdouble* params)	fp_glProgramEnvParameter4dvARB;
			alias void function (GLenum target, GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w)	fp_glProgramEnvParameter4fARB;
			alias void function (GLenum target, GLuint index,  GLfloat* params)	fp_glProgramEnvParameter4fvARB;
			alias void function (GLenum target, GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w)	fp_glProgramLocalParameter4dARB;
			alias void function (GLenum target, GLuint index,  GLdouble* params)	fp_glProgramLocalParameter4dvARB;
			alias void function (GLenum target, GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w)	fp_glProgramLocalParameter4fARB;
			alias void function (GLenum target, GLuint index,  GLfloat* params)	fp_glProgramLocalParameter4fvARB;
			alias void function (GLenum target, GLenum format, GLsizei len,  void* string)	fp_glProgramStringARB;
			alias void function (GLuint index, GLdouble x)	fp_glVertexAttrib1dARB;
			alias void function (GLuint index,  GLdouble* v)	fp_glVertexAttrib1dvARB;
			alias void function (GLuint index, GLfloat x)	fp_glVertexAttrib1fARB;
			alias void function (GLuint index,  GLfloat* v)	fp_glVertexAttrib1fvARB;
			alias void function (GLuint index, GLshort x)	fp_glVertexAttrib1sARB;
			alias void function (GLuint index,  GLshort* v)	fp_glVertexAttrib1svARB;
			alias void function (GLuint index, GLdouble x, GLdouble y)	fp_glVertexAttrib2dARB;
			alias void function (GLuint index,  GLdouble* v)	fp_glVertexAttrib2dvARB;
			alias void function (GLuint index, GLfloat x, GLfloat y)	fp_glVertexAttrib2fARB;
			alias void function (GLuint index,  GLfloat* v)	fp_glVertexAttrib2fvARB;
			alias void function (GLuint index, GLshort x, GLshort y)	fp_glVertexAttrib2sARB;
			alias void function (GLuint index,  GLshort* v)	fp_glVertexAttrib2svARB;
			alias void function (GLuint index, GLdouble x, GLdouble y, GLdouble z)	fp_glVertexAttrib3dARB;
			alias void function (GLuint index,  GLdouble* v)	fp_glVertexAttrib3dvARB;
			alias void function (GLuint index, GLfloat x, GLfloat y, GLfloat z)	fp_glVertexAttrib3fARB;
			alias void function (GLuint index,  GLfloat* v)	fp_glVertexAttrib3fvARB;
			alias void function (GLuint index, GLshort x, GLshort y, GLshort z)	fp_glVertexAttrib3sARB;
			alias void function (GLuint index,  GLshort* v)	fp_glVertexAttrib3svARB;
			alias void function (GLuint index,  GLbyte* v)	fp_glVertexAttrib4NbvARB;
			alias void function (GLuint index,  GLint* v)	fp_glVertexAttrib4NivARB;
			alias void function (GLuint index,  GLshort* v)	fp_glVertexAttrib4NsvARB;
			alias void function (GLuint index, GLubyte x, GLubyte y, GLubyte z, GLubyte w)	fp_glVertexAttrib4NubARB;
			alias void function (GLuint index,  GLubyte* v)	fp_glVertexAttrib4NubvARB;
			alias void function (GLuint index,  GLuint* v)	fp_glVertexAttrib4NuivARB;
			alias void function (GLuint index,  GLushort* v)	fp_glVertexAttrib4NusvARB;
			alias void function (GLuint index,  GLbyte* v)	fp_glVertexAttrib4bvARB;
			alias void function (GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w)	fp_glVertexAttrib4dARB;
			alias void function (GLuint index,  GLdouble* v)	fp_glVertexAttrib4dvARB;
			alias void function (GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w)	fp_glVertexAttrib4fARB;
			alias void function (GLuint index,  GLfloat* v)	fp_glVertexAttrib4fvARB;
			alias void function (GLuint index,  GLint* v)	fp_glVertexAttrib4ivARB;
			alias void function (GLuint index, GLshort x, GLshort y, GLshort z, GLshort w)	fp_glVertexAttrib4sARB;
			alias void function (GLuint index,  GLshort* v)	fp_glVertexAttrib4svARB;
			alias void function (GLuint index,  GLubyte* v)	fp_glVertexAttrib4ubvARB;
			alias void function (GLuint index,  GLuint* v)	fp_glVertexAttrib4uivARB;
			alias void function (GLuint index,  GLushort* v)	fp_glVertexAttrib4usvARB;
			alias void function (GLuint index, GLint size, GLenum type, GLboolean normalized, GLsizei stride,  void* pointer)	fp_glVertexAttribPointerARB;
		}
	}
	public {
void BindProgram(GL gl_, ParameterTypeTuple!(fp_glBindProgramARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBindProgramARB)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "BindProgram", funcPtr, params__);
		}
void DeletePrograms(GL gl_, ParameterTypeTuple!(fp_glDeleteProgramsARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDeleteProgramsARB)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "DeletePrograms", funcPtr, params__);
		}
void DisableVertexAttribArray(GL gl_, ParameterTypeTuple!(fp_glDisableVertexAttribArrayARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDisableVertexAttribArrayARB)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "DisableVertexAttribArray", funcPtr, params__);
		}
void EnableVertexAttribArray(GL gl_, ParameterTypeTuple!(fp_glEnableVertexAttribArrayARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glEnableVertexAttribArrayARB)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "EnableVertexAttribArray", funcPtr, params__);
		}
void GenPrograms(GL gl_, ParameterTypeTuple!(fp_glGenProgramsARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGenProgramsARB)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "GenPrograms", funcPtr, params__);
		}
void GetProgramEnvParameterdv(GL gl_, ParameterTypeTuple!(fp_glGetProgramEnvParameterdvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetProgramEnvParameterdvARB)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "GetProgramEnvParameterdv", funcPtr, params__);
		}
void GetProgramEnvParameterfv(GL gl_, ParameterTypeTuple!(fp_glGetProgramEnvParameterfvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetProgramEnvParameterfvARB)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "GetProgramEnvParameterfv", funcPtr, params__);
		}
void GetProgramLocalParameterdv(GL gl_, ParameterTypeTuple!(fp_glGetProgramLocalParameterdvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetProgramLocalParameterdvARB)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "GetProgramLocalParameterdv", funcPtr, params__);
		}
void GetProgramLocalParameterfv(GL gl_, ParameterTypeTuple!(fp_glGetProgramLocalParameterfvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetProgramLocalParameterfvARB)(gl.extFuncs[extensionId__][8]);
			return checkedCall(gl_, "GetProgramLocalParameterfv", funcPtr, params__);
		}
void GetProgramString(GL gl_, ParameterTypeTuple!(fp_glGetProgramStringARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetProgramStringARB)(gl.extFuncs[extensionId__][9]);
			return checkedCall(gl_, "GetProgramString", funcPtr, params__);
		}
void GetProgramiv(GL gl_, ParameterTypeTuple!(fp_glGetProgramivARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetProgramivARB)(gl.extFuncs[extensionId__][10]);
			return checkedCall(gl_, "GetProgramiv", funcPtr, params__);
		}
void GetVertexAttribPointerv(GL gl_, ParameterTypeTuple!(fp_glGetVertexAttribPointervARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetVertexAttribPointervARB)(gl.extFuncs[extensionId__][11]);
			return checkedCall(gl_, "GetVertexAttribPointerv", funcPtr, params__);
		}
void GetVertexAttribdv(GL gl_, ParameterTypeTuple!(fp_glGetVertexAttribdvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetVertexAttribdvARB)(gl.extFuncs[extensionId__][12]);
			return checkedCall(gl_, "GetVertexAttribdv", funcPtr, params__);
		}
void GetVertexAttribfv(GL gl_, ParameterTypeTuple!(fp_glGetVertexAttribfvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetVertexAttribfvARB)(gl.extFuncs[extensionId__][13]);
			return checkedCall(gl_, "GetVertexAttribfv", funcPtr, params__);
		}
void GetVertexAttribiv(GL gl_, ParameterTypeTuple!(fp_glGetVertexAttribivARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetVertexAttribivARB)(gl.extFuncs[extensionId__][14]);
			return checkedCall(gl_, "GetVertexAttribiv", funcPtr, params__);
		}
GLboolean IsProgram(GL gl_, ParameterTypeTuple!(fp_glIsProgramARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glIsProgramARB)(gl.extFuncs[extensionId__][15]);
			return checkedCall(gl_, "IsProgram", funcPtr, params__);
		}
void ProgramEnvParameter4d(GL gl_, ParameterTypeTuple!(fp_glProgramEnvParameter4dARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramEnvParameter4dARB)(gl.extFuncs[extensionId__][16]);
			return checkedCall(gl_, "ProgramEnvParameter4d", funcPtr, params__);
		}
void ProgramEnvParameter4dv(GL gl_, ParameterTypeTuple!(fp_glProgramEnvParameter4dvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramEnvParameter4dvARB)(gl.extFuncs[extensionId__][17]);
			return checkedCall(gl_, "ProgramEnvParameter4dv", funcPtr, params__);
		}
void ProgramEnvParameter4f(GL gl_, ParameterTypeTuple!(fp_glProgramEnvParameter4fARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramEnvParameter4fARB)(gl.extFuncs[extensionId__][18]);
			return checkedCall(gl_, "ProgramEnvParameter4f", funcPtr, params__);
		}
void ProgramEnvParameter4fv(GL gl_, ParameterTypeTuple!(fp_glProgramEnvParameter4fvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramEnvParameter4fvARB)(gl.extFuncs[extensionId__][19]);
			return checkedCall(gl_, "ProgramEnvParameter4fv", funcPtr, params__);
		}
void ProgramLocalParameter4d(GL gl_, ParameterTypeTuple!(fp_glProgramLocalParameter4dARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramLocalParameter4dARB)(gl.extFuncs[extensionId__][20]);
			return checkedCall(gl_, "ProgramLocalParameter4d", funcPtr, params__);
		}
void ProgramLocalParameter4dv(GL gl_, ParameterTypeTuple!(fp_glProgramLocalParameter4dvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramLocalParameter4dvARB)(gl.extFuncs[extensionId__][21]);
			return checkedCall(gl_, "ProgramLocalParameter4dv", funcPtr, params__);
		}
void ProgramLocalParameter4f(GL gl_, ParameterTypeTuple!(fp_glProgramLocalParameter4fARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramLocalParameter4fARB)(gl.extFuncs[extensionId__][22]);
			return checkedCall(gl_, "ProgramLocalParameter4f", funcPtr, params__);
		}
void ProgramLocalParameter4fv(GL gl_, ParameterTypeTuple!(fp_glProgramLocalParameter4fvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramLocalParameter4fvARB)(gl.extFuncs[extensionId__][23]);
			return checkedCall(gl_, "ProgramLocalParameter4fv", funcPtr, params__);
		}
void ProgramString(GL gl_, ParameterTypeTuple!(fp_glProgramStringARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramStringARB)(gl.extFuncs[extensionId__][24]);
			return checkedCall(gl_, "ProgramString", funcPtr, params__);
		}
void VertexAttrib1d(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib1dARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib1dARB)(gl.extFuncs[extensionId__][25]);
			return checkedCall(gl_, "VertexAttrib1d", funcPtr, params__);
		}
void VertexAttrib1dv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib1dvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib1dvARB)(gl.extFuncs[extensionId__][26]);
			return checkedCall(gl_, "VertexAttrib1dv", funcPtr, params__);
		}
void VertexAttrib1f(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib1fARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib1fARB)(gl.extFuncs[extensionId__][27]);
			return checkedCall(gl_, "VertexAttrib1f", funcPtr, params__);
		}
void VertexAttrib1fv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib1fvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib1fvARB)(gl.extFuncs[extensionId__][28]);
			return checkedCall(gl_, "VertexAttrib1fv", funcPtr, params__);
		}
void VertexAttrib1s(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib1sARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib1sARB)(gl.extFuncs[extensionId__][29]);
			return checkedCall(gl_, "VertexAttrib1s", funcPtr, params__);
		}
void VertexAttrib1sv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib1svARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib1svARB)(gl.extFuncs[extensionId__][30]);
			return checkedCall(gl_, "VertexAttrib1sv", funcPtr, params__);
		}
void VertexAttrib2d(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib2dARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib2dARB)(gl.extFuncs[extensionId__][31]);
			return checkedCall(gl_, "VertexAttrib2d", funcPtr, params__);
		}
void VertexAttrib2dv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib2dvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib2dvARB)(gl.extFuncs[extensionId__][32]);
			return checkedCall(gl_, "VertexAttrib2dv", funcPtr, params__);
		}
void VertexAttrib2f(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib2fARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib2fARB)(gl.extFuncs[extensionId__][33]);
			return checkedCall(gl_, "VertexAttrib2f", funcPtr, params__);
		}
void VertexAttrib2fv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib2fvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib2fvARB)(gl.extFuncs[extensionId__][34]);
			return checkedCall(gl_, "VertexAttrib2fv", funcPtr, params__);
		}
void VertexAttrib2s(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib2sARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib2sARB)(gl.extFuncs[extensionId__][35]);
			return checkedCall(gl_, "VertexAttrib2s", funcPtr, params__);
		}
void VertexAttrib2sv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib2svARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib2svARB)(gl.extFuncs[extensionId__][36]);
			return checkedCall(gl_, "VertexAttrib2sv", funcPtr, params__);
		}
void VertexAttrib3d(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib3dARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib3dARB)(gl.extFuncs[extensionId__][37]);
			return checkedCall(gl_, "VertexAttrib3d", funcPtr, params__);
		}
void VertexAttrib3dv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib3dvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib3dvARB)(gl.extFuncs[extensionId__][38]);
			return checkedCall(gl_, "VertexAttrib3dv", funcPtr, params__);
		}
void VertexAttrib3f(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib3fARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib3fARB)(gl.extFuncs[extensionId__][39]);
			return checkedCall(gl_, "VertexAttrib3f", funcPtr, params__);
		}
void VertexAttrib3fv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib3fvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib3fvARB)(gl.extFuncs[extensionId__][40]);
			return checkedCall(gl_, "VertexAttrib3fv", funcPtr, params__);
		}
void VertexAttrib3s(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib3sARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib3sARB)(gl.extFuncs[extensionId__][41]);
			return checkedCall(gl_, "VertexAttrib3s", funcPtr, params__);
		}
void VertexAttrib3sv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib3svARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib3svARB)(gl.extFuncs[extensionId__][42]);
			return checkedCall(gl_, "VertexAttrib3sv", funcPtr, params__);
		}
void VertexAttrib4Nbv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4NbvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4NbvARB)(gl.extFuncs[extensionId__][43]);
			return checkedCall(gl_, "VertexAttrib4Nbv", funcPtr, params__);
		}
void VertexAttrib4Niv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4NivARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4NivARB)(gl.extFuncs[extensionId__][44]);
			return checkedCall(gl_, "VertexAttrib4Niv", funcPtr, params__);
		}
void VertexAttrib4Nsv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4NsvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4NsvARB)(gl.extFuncs[extensionId__][45]);
			return checkedCall(gl_, "VertexAttrib4Nsv", funcPtr, params__);
		}
void VertexAttrib4Nub(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4NubARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4NubARB)(gl.extFuncs[extensionId__][46]);
			return checkedCall(gl_, "VertexAttrib4Nub", funcPtr, params__);
		}
void VertexAttrib4Nubv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4NubvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4NubvARB)(gl.extFuncs[extensionId__][47]);
			return checkedCall(gl_, "VertexAttrib4Nubv", funcPtr, params__);
		}
void VertexAttrib4Nuiv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4NuivARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4NuivARB)(gl.extFuncs[extensionId__][48]);
			return checkedCall(gl_, "VertexAttrib4Nuiv", funcPtr, params__);
		}
void VertexAttrib4Nusv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4NusvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4NusvARB)(gl.extFuncs[extensionId__][49]);
			return checkedCall(gl_, "VertexAttrib4Nusv", funcPtr, params__);
		}
void VertexAttrib4bv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4bvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4bvARB)(gl.extFuncs[extensionId__][50]);
			return checkedCall(gl_, "VertexAttrib4bv", funcPtr, params__);
		}
void VertexAttrib4d(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4dARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4dARB)(gl.extFuncs[extensionId__][51]);
			return checkedCall(gl_, "VertexAttrib4d", funcPtr, params__);
		}
void VertexAttrib4dv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4dvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4dvARB)(gl.extFuncs[extensionId__][52]);
			return checkedCall(gl_, "VertexAttrib4dv", funcPtr, params__);
		}
void VertexAttrib4f(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4fARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4fARB)(gl.extFuncs[extensionId__][53]);
			return checkedCall(gl_, "VertexAttrib4f", funcPtr, params__);
		}
void VertexAttrib4fv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4fvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4fvARB)(gl.extFuncs[extensionId__][54]);
			return checkedCall(gl_, "VertexAttrib4fv", funcPtr, params__);
		}
void VertexAttrib4iv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4ivARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4ivARB)(gl.extFuncs[extensionId__][55]);
			return checkedCall(gl_, "VertexAttrib4iv", funcPtr, params__);
		}
void VertexAttrib4s(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4sARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4sARB)(gl.extFuncs[extensionId__][56]);
			return checkedCall(gl_, "VertexAttrib4s", funcPtr, params__);
		}
void VertexAttrib4sv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4svARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4svARB)(gl.extFuncs[extensionId__][57]);
			return checkedCall(gl_, "VertexAttrib4sv", funcPtr, params__);
		}
void VertexAttrib4ubv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4ubvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4ubvARB)(gl.extFuncs[extensionId__][58]);
			return checkedCall(gl_, "VertexAttrib4ubv", funcPtr, params__);
		}
void VertexAttrib4uiv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4uivARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4uivARB)(gl.extFuncs[extensionId__][59]);
			return checkedCall(gl_, "VertexAttrib4uiv", funcPtr, params__);
		}
void VertexAttrib4usv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4usvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4usvARB)(gl.extFuncs[extensionId__][60]);
			return checkedCall(gl_, "VertexAttrib4usv", funcPtr, params__);
		}
void VertexAttribPointer(GL gl_, ParameterTypeTuple!(fp_glVertexAttribPointerARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribPointerARB)(gl.extFuncs[extensionId__][61]);
			return checkedCall(gl_, "VertexAttribPointer", funcPtr, params__);
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
		void*[] funcAddr = new void*[62];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_ARB_vertex_program")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glBindProgramARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glDeleteProgramsARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glDisableVertexAttribArrayARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glEnableVertexAttribArrayARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glGenProgramsARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glGetProgramEnvParameterdvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glGetProgramEnvParameterfvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glGetProgramLocalParameterdvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[8] = getExtensionFuncPtr(cast(char*)"glGetProgramLocalParameterfvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[9] = getExtensionFuncPtr(cast(char*)"glGetProgramStringARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[10] = getExtensionFuncPtr(cast(char*)"glGetProgramivARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[11] = getExtensionFuncPtr(cast(char*)"glGetVertexAttribPointervARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[12] = getExtensionFuncPtr(cast(char*)"glGetVertexAttribdvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[13] = getExtensionFuncPtr(cast(char*)"glGetVertexAttribfvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[14] = getExtensionFuncPtr(cast(char*)"glGetVertexAttribivARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[15] = getExtensionFuncPtr(cast(char*)"glIsProgramARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[16] = getExtensionFuncPtr(cast(char*)"glProgramEnvParameter4dARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[17] = getExtensionFuncPtr(cast(char*)"glProgramEnvParameter4dvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[18] = getExtensionFuncPtr(cast(char*)"glProgramEnvParameter4fARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[19] = getExtensionFuncPtr(cast(char*)"glProgramEnvParameter4fvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[20] = getExtensionFuncPtr(cast(char*)"glProgramLocalParameter4dARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[21] = getExtensionFuncPtr(cast(char*)"glProgramLocalParameter4dvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[22] = getExtensionFuncPtr(cast(char*)"glProgramLocalParameter4fARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[23] = getExtensionFuncPtr(cast(char*)"glProgramLocalParameter4fvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[24] = getExtensionFuncPtr(cast(char*)"glProgramStringARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[25] = getExtensionFuncPtr(cast(char*)"glVertexAttrib1dARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[26] = getExtensionFuncPtr(cast(char*)"glVertexAttrib1dvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[27] = getExtensionFuncPtr(cast(char*)"glVertexAttrib1fARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[28] = getExtensionFuncPtr(cast(char*)"glVertexAttrib1fvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[29] = getExtensionFuncPtr(cast(char*)"glVertexAttrib1sARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[30] = getExtensionFuncPtr(cast(char*)"glVertexAttrib1svARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[31] = getExtensionFuncPtr(cast(char*)"glVertexAttrib2dARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[32] = getExtensionFuncPtr(cast(char*)"glVertexAttrib2dvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[33] = getExtensionFuncPtr(cast(char*)"glVertexAttrib2fARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[34] = getExtensionFuncPtr(cast(char*)"glVertexAttrib2fvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[35] = getExtensionFuncPtr(cast(char*)"glVertexAttrib2sARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[36] = getExtensionFuncPtr(cast(char*)"glVertexAttrib2svARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[37] = getExtensionFuncPtr(cast(char*)"glVertexAttrib3dARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[38] = getExtensionFuncPtr(cast(char*)"glVertexAttrib3dvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[39] = getExtensionFuncPtr(cast(char*)"glVertexAttrib3fARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[40] = getExtensionFuncPtr(cast(char*)"glVertexAttrib3fvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[41] = getExtensionFuncPtr(cast(char*)"glVertexAttrib3sARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[42] = getExtensionFuncPtr(cast(char*)"glVertexAttrib3svARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[43] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4NbvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[44] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4NivARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[45] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4NsvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[46] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4NubARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[47] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4NubvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[48] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4NuivARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[49] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4NusvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[50] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4bvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[51] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4dARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[52] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4dvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[53] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4fARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[54] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4fvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[55] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4ivARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[56] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4sARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[57] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4svARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[58] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4ubvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[59] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4uivARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[60] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4usvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[61] = getExtensionFuncPtr(cast(char*)"glVertexAttribPointerARB"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
