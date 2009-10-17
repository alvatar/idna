module dgl.ext.NV_vertex_program;
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



private ushort extensionId__ = 38;
alias extensionId__ NV_vertex_program;

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
			const GLenum GL_VERTEX_PROGRAM_NV = 0x8620;
			const GLenum GL_VERTEX_STATE_PROGRAM_NV = 0x8621;
			const GLenum GL_ATTRIB_ARRAY_SIZE_NV = 0x8623;
			const GLenum GL_ATTRIB_ARRAY_STRIDE_NV = 0x8624;
			const GLenum GL_ATTRIB_ARRAY_TYPE_NV = 0x8625;
			const GLenum GL_CURRENT_ATTRIB_NV = 0x8626;
			const GLenum GL_PROGRAM_LENGTH_NV = 0x8627;
			const GLenum GL_PROGRAM_STRING_NV = 0x8628;
			const GLenum GL_MODELVIEW_PROJECTION_NV = 0x8629;
			const GLenum GL_IDENTITY_NV = 0x862A;
			const GLenum GL_INVERSE_NV = 0x862B;
			const GLenum GL_TRANSPOSE_NV = 0x862C;
			const GLenum GL_INVERSE_TRANSPOSE_NV = 0x862D;
			const GLenum GL_MAX_TRACK_MATRIX_STACK_DEPTH_NV = 0x862E;
			const GLenum GL_MAX_TRACK_MATRICES_NV = 0x862F;
			const GLenum GL_MATRIX0_NV = 0x8630;
			const GLenum GL_MATRIX1_NV = 0x8631;
			const GLenum GL_MATRIX2_NV = 0x8632;
			const GLenum GL_MATRIX3_NV = 0x8633;
			const GLenum GL_MATRIX4_NV = 0x8634;
			const GLenum GL_MATRIX5_NV = 0x8635;
			const GLenum GL_MATRIX6_NV = 0x8636;
			const GLenum GL_MATRIX7_NV = 0x8637;
			const GLenum GL_CURRENT_MATRIX_STACK_DEPTH_NV = 0x8640;
			const GLenum GL_CURRENT_MATRIX_NV = 0x8641;
			const GLenum GL_VERTEX_PROGRAM_POINT_SIZE_NV = 0x8642;
			const GLenum GL_VERTEX_PROGRAM_TWO_SIDE_NV = 0x8643;
			const GLenum GL_PROGRAM_PARAMETER_NV = 0x8644;
			const GLenum GL_ATTRIB_ARRAY_POINTER_NV = 0x8645;
			const GLenum GL_PROGRAM_TARGET_NV = 0x8646;
			const GLenum GL_PROGRAM_RESIDENT_NV = 0x8647;
			const GLenum GL_TRACK_MATRIX_NV = 0x8648;
			const GLenum GL_TRACK_MATRIX_TRANSFORM_NV = 0x8649;
			const GLenum GL_VERTEX_PROGRAM_BINDING_NV = 0x864A;
			const GLenum GL_PROGRAM_ERROR_POSITION_NV = 0x864B;
			const GLenum GL_VERTEX_ATTRIB_ARRAY0_NV = 0x8650;
			const GLenum GL_VERTEX_ATTRIB_ARRAY1_NV = 0x8651;
			const GLenum GL_VERTEX_ATTRIB_ARRAY2_NV = 0x8652;
			const GLenum GL_VERTEX_ATTRIB_ARRAY3_NV = 0x8653;
			const GLenum GL_VERTEX_ATTRIB_ARRAY4_NV = 0x8654;
			const GLenum GL_VERTEX_ATTRIB_ARRAY5_NV = 0x8655;
			const GLenum GL_VERTEX_ATTRIB_ARRAY6_NV = 0x8656;
			const GLenum GL_VERTEX_ATTRIB_ARRAY7_NV = 0x8657;
			const GLenum GL_VERTEX_ATTRIB_ARRAY8_NV = 0x8658;
			const GLenum GL_VERTEX_ATTRIB_ARRAY9_NV = 0x8659;
			const GLenum GL_VERTEX_ATTRIB_ARRAY10_NV = 0x865A;
			const GLenum GL_VERTEX_ATTRIB_ARRAY11_NV = 0x865B;
			const GLenum GL_VERTEX_ATTRIB_ARRAY12_NV = 0x865C;
			const GLenum GL_VERTEX_ATTRIB_ARRAY13_NV = 0x865D;
			const GLenum GL_VERTEX_ATTRIB_ARRAY14_NV = 0x865E;
			const GLenum GL_VERTEX_ATTRIB_ARRAY15_NV = 0x865F;
			const GLenum GL_MAP1_VERTEX_ATTRIB0_4_NV = 0x8660;
			const GLenum GL_MAP1_VERTEX_ATTRIB1_4_NV = 0x8661;
			const GLenum GL_MAP1_VERTEX_ATTRIB2_4_NV = 0x8662;
			const GLenum GL_MAP1_VERTEX_ATTRIB3_4_NV = 0x8663;
			const GLenum GL_MAP1_VERTEX_ATTRIB4_4_NV = 0x8664;
			const GLenum GL_MAP1_VERTEX_ATTRIB5_4_NV = 0x8665;
			const GLenum GL_MAP1_VERTEX_ATTRIB6_4_NV = 0x8666;
			const GLenum GL_MAP1_VERTEX_ATTRIB7_4_NV = 0x8667;
			const GLenum GL_MAP1_VERTEX_ATTRIB8_4_NV = 0x8668;
			const GLenum GL_MAP1_VERTEX_ATTRIB9_4_NV = 0x8669;
			const GLenum GL_MAP1_VERTEX_ATTRIB10_4_NV = 0x866A;
			const GLenum GL_MAP1_VERTEX_ATTRIB11_4_NV = 0x866B;
			const GLenum GL_MAP1_VERTEX_ATTRIB12_4_NV = 0x866C;
			const GLenum GL_MAP1_VERTEX_ATTRIB13_4_NV = 0x866D;
			const GLenum GL_MAP1_VERTEX_ATTRIB14_4_NV = 0x866E;
			const GLenum GL_MAP1_VERTEX_ATTRIB15_4_NV = 0x866F;
			const GLenum GL_MAP2_VERTEX_ATTRIB0_4_NV = 0x8670;
			const GLenum GL_MAP2_VERTEX_ATTRIB1_4_NV = 0x8671;
			const GLenum GL_MAP2_VERTEX_ATTRIB2_4_NV = 0x8672;
			const GLenum GL_MAP2_VERTEX_ATTRIB3_4_NV = 0x8673;
			const GLenum GL_MAP2_VERTEX_ATTRIB4_4_NV = 0x8674;
			const GLenum GL_MAP2_VERTEX_ATTRIB5_4_NV = 0x8675;
			const GLenum GL_MAP2_VERTEX_ATTRIB6_4_NV = 0x8676;
			const GLenum GL_MAP2_VERTEX_ATTRIB7_4_NV = 0x8677;
			const GLenum GL_MAP2_VERTEX_ATTRIB8_4_NV = 0x8678;
			const GLenum GL_MAP2_VERTEX_ATTRIB9_4_NV = 0x8679;
			const GLenum GL_MAP2_VERTEX_ATTRIB10_4_NV = 0x867A;
			const GLenum GL_MAP2_VERTEX_ATTRIB11_4_NV = 0x867B;
			const GLenum GL_MAP2_VERTEX_ATTRIB12_4_NV = 0x867C;
			const GLenum GL_MAP2_VERTEX_ATTRIB13_4_NV = 0x867D;
			const GLenum GL_MAP2_VERTEX_ATTRIB14_4_NV = 0x867E;
			const GLenum GL_MAP2_VERTEX_ATTRIB15_4_NV = 0x867F;
	}
	private {
		extern (System) {
			alias GLboolean function (GLsizei n,  GLuint* ids, GLboolean *residences)	fp_glAreProgramsResidentNV;
			alias void function (GLenum target, GLuint id)	fp_glBindProgramNV;
			alias void function (GLsizei n,  GLuint* ids)	fp_glDeleteProgramsNV;
			alias void function (GLenum target, GLuint id,  GLfloat* params)	fp_glExecuteProgramNV;
			alias void function (GLsizei n, GLuint* ids)	fp_glGenProgramsNV;
			alias void function (GLenum target, GLuint index, GLenum pname, GLdouble* params)	fp_glGetProgramParameterdvNV;
			alias void function (GLenum target, GLuint index, GLenum pname, GLfloat* params)	fp_glGetProgramParameterfvNV;
			alias void function (GLuint id, GLenum pname, GLubyte* program)	fp_glGetProgramStringNV;
			alias void function (GLuint id, GLenum pname, GLint* params)	fp_glGetProgramivNV;
			alias void function (GLenum target, GLuint address, GLenum pname, GLint* params)	fp_glGetTrackMatrixivNV;
			alias void function (GLuint index, GLenum pname, GLvoid** pointer)	fp_glGetVertexAttribPointervNV;
			alias void function (GLuint index, GLenum pname, GLdouble* params)	fp_glGetVertexAttribdvNV;
			alias void function (GLuint index, GLenum pname, GLfloat* params)	fp_glGetVertexAttribfvNV;
			alias void function (GLuint index, GLenum pname, GLint* params)	fp_glGetVertexAttribivNV;
			alias GLboolean function (GLuint id)	fp_glIsProgramNV;
			alias void function (GLenum target, GLuint id, GLsizei len,  GLubyte* program)	fp_glLoadProgramNV;
			alias void function (GLenum target, GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w)	fp_glProgramParameter4dNV;
			alias void function (GLenum target, GLuint index,  GLdouble* params)	fp_glProgramParameter4dvNV;
			alias void function (GLenum target, GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w)	fp_glProgramParameter4fNV;
			alias void function (GLenum target, GLuint index,  GLfloat* params)	fp_glProgramParameter4fvNV;
			alias void function (GLenum target, GLuint index, GLuint num,  GLdouble* params)	fp_glProgramParameters4dvNV;
			alias void function (GLenum target, GLuint index, GLuint num,  GLfloat* params)	fp_glProgramParameters4fvNV;
			alias void function (GLsizei n, GLuint* ids)	fp_glRequestResidentProgramsNV;
			alias void function (GLenum target, GLuint address, GLenum matrix, GLenum transform)	fp_glTrackMatrixNV;
			alias void function (GLuint index, GLdouble x)	fp_glVertexAttrib1dNV;
			alias void function (GLuint index,  GLdouble* v)	fp_glVertexAttrib1dvNV;
			alias void function (GLuint index, GLfloat x)	fp_glVertexAttrib1fNV;
			alias void function (GLuint index,  GLfloat* v)	fp_glVertexAttrib1fvNV;
			alias void function (GLuint index, GLshort x)	fp_glVertexAttrib1sNV;
			alias void function (GLuint index,  GLshort* v)	fp_glVertexAttrib1svNV;
			alias void function (GLuint index, GLdouble x, GLdouble y)	fp_glVertexAttrib2dNV;
			alias void function (GLuint index,  GLdouble* v)	fp_glVertexAttrib2dvNV;
			alias void function (GLuint index, GLfloat x, GLfloat y)	fp_glVertexAttrib2fNV;
			alias void function (GLuint index,  GLfloat* v)	fp_glVertexAttrib2fvNV;
			alias void function (GLuint index, GLshort x, GLshort y)	fp_glVertexAttrib2sNV;
			alias void function (GLuint index,  GLshort* v)	fp_glVertexAttrib2svNV;
			alias void function (GLuint index, GLdouble x, GLdouble y, GLdouble z)	fp_glVertexAttrib3dNV;
			alias void function (GLuint index,  GLdouble* v)	fp_glVertexAttrib3dvNV;
			alias void function (GLuint index, GLfloat x, GLfloat y, GLfloat z)	fp_glVertexAttrib3fNV;
			alias void function (GLuint index,  GLfloat* v)	fp_glVertexAttrib3fvNV;
			alias void function (GLuint index, GLshort x, GLshort y, GLshort z)	fp_glVertexAttrib3sNV;
			alias void function (GLuint index,  GLshort* v)	fp_glVertexAttrib3svNV;
			alias void function (GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w)	fp_glVertexAttrib4dNV;
			alias void function (GLuint index,  GLdouble* v)	fp_glVertexAttrib4dvNV;
			alias void function (GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w)	fp_glVertexAttrib4fNV;
			alias void function (GLuint index,  GLfloat* v)	fp_glVertexAttrib4fvNV;
			alias void function (GLuint index, GLshort x, GLshort y, GLshort z, GLshort w)	fp_glVertexAttrib4sNV;
			alias void function (GLuint index,  GLshort* v)	fp_glVertexAttrib4svNV;
			alias void function (GLuint index, GLubyte x, GLubyte y, GLubyte z, GLubyte w)	fp_glVertexAttrib4ubNV;
			alias void function (GLuint index,  GLubyte* v)	fp_glVertexAttrib4ubvNV;
			alias void function (GLuint index, GLint size, GLenum type, GLsizei stride,  void* pointer)	fp_glVertexAttribPointerNV;
			alias void function (GLuint index, GLsizei n,  GLdouble* v)	fp_glVertexAttribs1dvNV;
			alias void function (GLuint index, GLsizei n,  GLfloat* v)	fp_glVertexAttribs1fvNV;
			alias void function (GLuint index, GLsizei n,  GLshort* v)	fp_glVertexAttribs1svNV;
			alias void function (GLuint index, GLsizei n,  GLdouble* v)	fp_glVertexAttribs2dvNV;
			alias void function (GLuint index, GLsizei n,  GLfloat* v)	fp_glVertexAttribs2fvNV;
			alias void function (GLuint index, GLsizei n,  GLshort* v)	fp_glVertexAttribs2svNV;
			alias void function (GLuint index, GLsizei n,  GLdouble* v)	fp_glVertexAttribs3dvNV;
			alias void function (GLuint index, GLsizei n,  GLfloat* v)	fp_glVertexAttribs3fvNV;
			alias void function (GLuint index, GLsizei n,  GLshort* v)	fp_glVertexAttribs3svNV;
			alias void function (GLuint index, GLsizei n,  GLdouble* v)	fp_glVertexAttribs4dvNV;
			alias void function (GLuint index, GLsizei n,  GLfloat* v)	fp_glVertexAttribs4fvNV;
			alias void function (GLuint index, GLsizei n,  GLshort* v)	fp_glVertexAttribs4svNV;
			alias void function (GLuint index, GLsizei n,  GLubyte* v)	fp_glVertexAttribs4ubvNV;
		}
	}
	public {
GLboolean AreProgramsResident(GL gl_, ParameterTypeTuple!(fp_glAreProgramsResidentNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glAreProgramsResidentNV)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "AreProgramsResident", funcPtr, params__);
		}
void BindProgram(GL gl_, ParameterTypeTuple!(fp_glBindProgramNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBindProgramNV)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "BindProgram", funcPtr, params__);
		}
void DeletePrograms(GL gl_, ParameterTypeTuple!(fp_glDeleteProgramsNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDeleteProgramsNV)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "DeletePrograms", funcPtr, params__);
		}
void ExecuteProgram(GL gl_, ParameterTypeTuple!(fp_glExecuteProgramNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glExecuteProgramNV)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "ExecuteProgram", funcPtr, params__);
		}
void GenPrograms(GL gl_, ParameterTypeTuple!(fp_glGenProgramsNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGenProgramsNV)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "GenPrograms", funcPtr, params__);
		}
void GetProgramParameterdv(GL gl_, ParameterTypeTuple!(fp_glGetProgramParameterdvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetProgramParameterdvNV)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "GetProgramParameterdv", funcPtr, params__);
		}
void GetProgramParameterfv(GL gl_, ParameterTypeTuple!(fp_glGetProgramParameterfvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetProgramParameterfvNV)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "GetProgramParameterfv", funcPtr, params__);
		}
void GetProgramString(GL gl_, ParameterTypeTuple!(fp_glGetProgramStringNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetProgramStringNV)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "GetProgramString", funcPtr, params__);
		}
void GetProgramiv(GL gl_, ParameterTypeTuple!(fp_glGetProgramivNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetProgramivNV)(gl.extFuncs[extensionId__][8]);
			return checkedCall(gl_, "GetProgramiv", funcPtr, params__);
		}
void GetTrackMatrixiv(GL gl_, ParameterTypeTuple!(fp_glGetTrackMatrixivNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetTrackMatrixivNV)(gl.extFuncs[extensionId__][9]);
			return checkedCall(gl_, "GetTrackMatrixiv", funcPtr, params__);
		}
void GetVertexAttribPointerv(GL gl_, ParameterTypeTuple!(fp_glGetVertexAttribPointervNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetVertexAttribPointervNV)(gl.extFuncs[extensionId__][10]);
			return checkedCall(gl_, "GetVertexAttribPointerv", funcPtr, params__);
		}
void GetVertexAttribdv(GL gl_, ParameterTypeTuple!(fp_glGetVertexAttribdvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetVertexAttribdvNV)(gl.extFuncs[extensionId__][11]);
			return checkedCall(gl_, "GetVertexAttribdv", funcPtr, params__);
		}
void GetVertexAttribfv(GL gl_, ParameterTypeTuple!(fp_glGetVertexAttribfvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetVertexAttribfvNV)(gl.extFuncs[extensionId__][12]);
			return checkedCall(gl_, "GetVertexAttribfv", funcPtr, params__);
		}
void GetVertexAttribiv(GL gl_, ParameterTypeTuple!(fp_glGetVertexAttribivNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetVertexAttribivNV)(gl.extFuncs[extensionId__][13]);
			return checkedCall(gl_, "GetVertexAttribiv", funcPtr, params__);
		}
GLboolean IsProgram(GL gl_, ParameterTypeTuple!(fp_glIsProgramNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glIsProgramNV)(gl.extFuncs[extensionId__][14]);
			return checkedCall(gl_, "IsProgram", funcPtr, params__);
		}
void LoadProgram(GL gl_, ParameterTypeTuple!(fp_glLoadProgramNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glLoadProgramNV)(gl.extFuncs[extensionId__][15]);
			return checkedCall(gl_, "LoadProgram", funcPtr, params__);
		}
void ProgramParameter4d(GL gl_, ParameterTypeTuple!(fp_glProgramParameter4dNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramParameter4dNV)(gl.extFuncs[extensionId__][16]);
			return checkedCall(gl_, "ProgramParameter4d", funcPtr, params__);
		}
void ProgramParameter4dv(GL gl_, ParameterTypeTuple!(fp_glProgramParameter4dvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramParameter4dvNV)(gl.extFuncs[extensionId__][17]);
			return checkedCall(gl_, "ProgramParameter4dv", funcPtr, params__);
		}
void ProgramParameter4f(GL gl_, ParameterTypeTuple!(fp_glProgramParameter4fNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramParameter4fNV)(gl.extFuncs[extensionId__][18]);
			return checkedCall(gl_, "ProgramParameter4f", funcPtr, params__);
		}
void ProgramParameter4fv(GL gl_, ParameterTypeTuple!(fp_glProgramParameter4fvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramParameter4fvNV)(gl.extFuncs[extensionId__][19]);
			return checkedCall(gl_, "ProgramParameter4fv", funcPtr, params__);
		}
void ProgramParameters4dv(GL gl_, ParameterTypeTuple!(fp_glProgramParameters4dvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramParameters4dvNV)(gl.extFuncs[extensionId__][20]);
			return checkedCall(gl_, "ProgramParameters4dv", funcPtr, params__);
		}
void ProgramParameters4fv(GL gl_, ParameterTypeTuple!(fp_glProgramParameters4fvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramParameters4fvNV)(gl.extFuncs[extensionId__][21]);
			return checkedCall(gl_, "ProgramParameters4fv", funcPtr, params__);
		}
void RequestResidentPrograms(GL gl_, ParameterTypeTuple!(fp_glRequestResidentProgramsNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glRequestResidentProgramsNV)(gl.extFuncs[extensionId__][22]);
			return checkedCall(gl_, "RequestResidentPrograms", funcPtr, params__);
		}
void TrackMatrix(GL gl_, ParameterTypeTuple!(fp_glTrackMatrixNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTrackMatrixNV)(gl.extFuncs[extensionId__][23]);
			return checkedCall(gl_, "TrackMatrix", funcPtr, params__);
		}
void VertexAttrib1d(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib1dNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib1dNV)(gl.extFuncs[extensionId__][24]);
			return checkedCall(gl_, "VertexAttrib1d", funcPtr, params__);
		}
void VertexAttrib1dv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib1dvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib1dvNV)(gl.extFuncs[extensionId__][25]);
			return checkedCall(gl_, "VertexAttrib1dv", funcPtr, params__);
		}
void VertexAttrib1f(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib1fNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib1fNV)(gl.extFuncs[extensionId__][26]);
			return checkedCall(gl_, "VertexAttrib1f", funcPtr, params__);
		}
void VertexAttrib1fv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib1fvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib1fvNV)(gl.extFuncs[extensionId__][27]);
			return checkedCall(gl_, "VertexAttrib1fv", funcPtr, params__);
		}
void VertexAttrib1s(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib1sNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib1sNV)(gl.extFuncs[extensionId__][28]);
			return checkedCall(gl_, "VertexAttrib1s", funcPtr, params__);
		}
void VertexAttrib1sv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib1svNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib1svNV)(gl.extFuncs[extensionId__][29]);
			return checkedCall(gl_, "VertexAttrib1sv", funcPtr, params__);
		}
void VertexAttrib2d(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib2dNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib2dNV)(gl.extFuncs[extensionId__][30]);
			return checkedCall(gl_, "VertexAttrib2d", funcPtr, params__);
		}
void VertexAttrib2dv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib2dvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib2dvNV)(gl.extFuncs[extensionId__][31]);
			return checkedCall(gl_, "VertexAttrib2dv", funcPtr, params__);
		}
void VertexAttrib2f(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib2fNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib2fNV)(gl.extFuncs[extensionId__][32]);
			return checkedCall(gl_, "VertexAttrib2f", funcPtr, params__);
		}
void VertexAttrib2fv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib2fvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib2fvNV)(gl.extFuncs[extensionId__][33]);
			return checkedCall(gl_, "VertexAttrib2fv", funcPtr, params__);
		}
void VertexAttrib2s(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib2sNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib2sNV)(gl.extFuncs[extensionId__][34]);
			return checkedCall(gl_, "VertexAttrib2s", funcPtr, params__);
		}
void VertexAttrib2sv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib2svNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib2svNV)(gl.extFuncs[extensionId__][35]);
			return checkedCall(gl_, "VertexAttrib2sv", funcPtr, params__);
		}
void VertexAttrib3d(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib3dNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib3dNV)(gl.extFuncs[extensionId__][36]);
			return checkedCall(gl_, "VertexAttrib3d", funcPtr, params__);
		}
void VertexAttrib3dv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib3dvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib3dvNV)(gl.extFuncs[extensionId__][37]);
			return checkedCall(gl_, "VertexAttrib3dv", funcPtr, params__);
		}
void VertexAttrib3f(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib3fNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib3fNV)(gl.extFuncs[extensionId__][38]);
			return checkedCall(gl_, "VertexAttrib3f", funcPtr, params__);
		}
void VertexAttrib3fv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib3fvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib3fvNV)(gl.extFuncs[extensionId__][39]);
			return checkedCall(gl_, "VertexAttrib3fv", funcPtr, params__);
		}
void VertexAttrib3s(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib3sNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib3sNV)(gl.extFuncs[extensionId__][40]);
			return checkedCall(gl_, "VertexAttrib3s", funcPtr, params__);
		}
void VertexAttrib3sv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib3svNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib3svNV)(gl.extFuncs[extensionId__][41]);
			return checkedCall(gl_, "VertexAttrib3sv", funcPtr, params__);
		}
void VertexAttrib4d(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4dNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4dNV)(gl.extFuncs[extensionId__][42]);
			return checkedCall(gl_, "VertexAttrib4d", funcPtr, params__);
		}
void VertexAttrib4dv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4dvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4dvNV)(gl.extFuncs[extensionId__][43]);
			return checkedCall(gl_, "VertexAttrib4dv", funcPtr, params__);
		}
void VertexAttrib4f(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4fNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4fNV)(gl.extFuncs[extensionId__][44]);
			return checkedCall(gl_, "VertexAttrib4f", funcPtr, params__);
		}
void VertexAttrib4fv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4fvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4fvNV)(gl.extFuncs[extensionId__][45]);
			return checkedCall(gl_, "VertexAttrib4fv", funcPtr, params__);
		}
void VertexAttrib4s(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4sNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4sNV)(gl.extFuncs[extensionId__][46]);
			return checkedCall(gl_, "VertexAttrib4s", funcPtr, params__);
		}
void VertexAttrib4sv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4svNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4svNV)(gl.extFuncs[extensionId__][47]);
			return checkedCall(gl_, "VertexAttrib4sv", funcPtr, params__);
		}
void VertexAttrib4ub(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4ubNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4ubNV)(gl.extFuncs[extensionId__][48]);
			return checkedCall(gl_, "VertexAttrib4ub", funcPtr, params__);
		}
void VertexAttrib4ubv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4ubvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4ubvNV)(gl.extFuncs[extensionId__][49]);
			return checkedCall(gl_, "VertexAttrib4ubv", funcPtr, params__);
		}
void VertexAttribPointer(GL gl_, ParameterTypeTuple!(fp_glVertexAttribPointerNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribPointerNV)(gl.extFuncs[extensionId__][50]);
			return checkedCall(gl_, "VertexAttribPointer", funcPtr, params__);
		}
void VertexAttribs1dv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribs1dvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribs1dvNV)(gl.extFuncs[extensionId__][51]);
			return checkedCall(gl_, "VertexAttribs1dv", funcPtr, params__);
		}
void VertexAttribs1fv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribs1fvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribs1fvNV)(gl.extFuncs[extensionId__][52]);
			return checkedCall(gl_, "VertexAttribs1fv", funcPtr, params__);
		}
void VertexAttribs1sv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribs1svNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribs1svNV)(gl.extFuncs[extensionId__][53]);
			return checkedCall(gl_, "VertexAttribs1sv", funcPtr, params__);
		}
void VertexAttribs2dv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribs2dvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribs2dvNV)(gl.extFuncs[extensionId__][54]);
			return checkedCall(gl_, "VertexAttribs2dv", funcPtr, params__);
		}
void VertexAttribs2fv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribs2fvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribs2fvNV)(gl.extFuncs[extensionId__][55]);
			return checkedCall(gl_, "VertexAttribs2fv", funcPtr, params__);
		}
void VertexAttribs2sv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribs2svNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribs2svNV)(gl.extFuncs[extensionId__][56]);
			return checkedCall(gl_, "VertexAttribs2sv", funcPtr, params__);
		}
void VertexAttribs3dv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribs3dvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribs3dvNV)(gl.extFuncs[extensionId__][57]);
			return checkedCall(gl_, "VertexAttribs3dv", funcPtr, params__);
		}
void VertexAttribs3fv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribs3fvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribs3fvNV)(gl.extFuncs[extensionId__][58]);
			return checkedCall(gl_, "VertexAttribs3fv", funcPtr, params__);
		}
void VertexAttribs3sv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribs3svNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribs3svNV)(gl.extFuncs[extensionId__][59]);
			return checkedCall(gl_, "VertexAttribs3sv", funcPtr, params__);
		}
void VertexAttribs4dv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribs4dvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribs4dvNV)(gl.extFuncs[extensionId__][60]);
			return checkedCall(gl_, "VertexAttribs4dv", funcPtr, params__);
		}
void VertexAttribs4fv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribs4fvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribs4fvNV)(gl.extFuncs[extensionId__][61]);
			return checkedCall(gl_, "VertexAttribs4fv", funcPtr, params__);
		}
void VertexAttribs4sv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribs4svNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribs4svNV)(gl.extFuncs[extensionId__][62]);
			return checkedCall(gl_, "VertexAttribs4sv", funcPtr, params__);
		}
void VertexAttribs4ubv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribs4ubvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribs4ubvNV)(gl.extFuncs[extensionId__][63]);
			return checkedCall(gl_, "VertexAttribs4ubv", funcPtr, params__);
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
		void*[] funcAddr = new void*[64];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_NV_vertex_program")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glAreProgramsResidentNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glBindProgramNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glDeleteProgramsNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glExecuteProgramNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glGenProgramsNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glGetProgramParameterdvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glGetProgramParameterfvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glGetProgramStringNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[8] = getExtensionFuncPtr(cast(char*)"glGetProgramivNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[9] = getExtensionFuncPtr(cast(char*)"glGetTrackMatrixivNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[10] = getExtensionFuncPtr(cast(char*)"glGetVertexAttribPointervNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[11] = getExtensionFuncPtr(cast(char*)"glGetVertexAttribdvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[12] = getExtensionFuncPtr(cast(char*)"glGetVertexAttribfvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[13] = getExtensionFuncPtr(cast(char*)"glGetVertexAttribivNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[14] = getExtensionFuncPtr(cast(char*)"glIsProgramNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[15] = getExtensionFuncPtr(cast(char*)"glLoadProgramNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[16] = getExtensionFuncPtr(cast(char*)"glProgramParameter4dNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[17] = getExtensionFuncPtr(cast(char*)"glProgramParameter4dvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[18] = getExtensionFuncPtr(cast(char*)"glProgramParameter4fNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[19] = getExtensionFuncPtr(cast(char*)"glProgramParameter4fvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[20] = getExtensionFuncPtr(cast(char*)"glProgramParameters4dvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[21] = getExtensionFuncPtr(cast(char*)"glProgramParameters4fvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[22] = getExtensionFuncPtr(cast(char*)"glRequestResidentProgramsNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[23] = getExtensionFuncPtr(cast(char*)"glTrackMatrixNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[24] = getExtensionFuncPtr(cast(char*)"glVertexAttrib1dNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[25] = getExtensionFuncPtr(cast(char*)"glVertexAttrib1dvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[26] = getExtensionFuncPtr(cast(char*)"glVertexAttrib1fNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[27] = getExtensionFuncPtr(cast(char*)"glVertexAttrib1fvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[28] = getExtensionFuncPtr(cast(char*)"glVertexAttrib1sNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[29] = getExtensionFuncPtr(cast(char*)"glVertexAttrib1svNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[30] = getExtensionFuncPtr(cast(char*)"glVertexAttrib2dNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[31] = getExtensionFuncPtr(cast(char*)"glVertexAttrib2dvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[32] = getExtensionFuncPtr(cast(char*)"glVertexAttrib2fNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[33] = getExtensionFuncPtr(cast(char*)"glVertexAttrib2fvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[34] = getExtensionFuncPtr(cast(char*)"glVertexAttrib2sNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[35] = getExtensionFuncPtr(cast(char*)"glVertexAttrib2svNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[36] = getExtensionFuncPtr(cast(char*)"glVertexAttrib3dNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[37] = getExtensionFuncPtr(cast(char*)"glVertexAttrib3dvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[38] = getExtensionFuncPtr(cast(char*)"glVertexAttrib3fNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[39] = getExtensionFuncPtr(cast(char*)"glVertexAttrib3fvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[40] = getExtensionFuncPtr(cast(char*)"glVertexAttrib3sNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[41] = getExtensionFuncPtr(cast(char*)"glVertexAttrib3svNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[42] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4dNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[43] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4dvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[44] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4fNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[45] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4fvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[46] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4sNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[47] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4svNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[48] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4ubNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[49] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4ubvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[50] = getExtensionFuncPtr(cast(char*)"glVertexAttribPointerNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[51] = getExtensionFuncPtr(cast(char*)"glVertexAttribs1dvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[52] = getExtensionFuncPtr(cast(char*)"glVertexAttribs1fvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[53] = getExtensionFuncPtr(cast(char*)"glVertexAttribs1svNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[54] = getExtensionFuncPtr(cast(char*)"glVertexAttribs2dvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[55] = getExtensionFuncPtr(cast(char*)"glVertexAttribs2fvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[56] = getExtensionFuncPtr(cast(char*)"glVertexAttribs2svNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[57] = getExtensionFuncPtr(cast(char*)"glVertexAttribs3dvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[58] = getExtensionFuncPtr(cast(char*)"glVertexAttribs3fvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[59] = getExtensionFuncPtr(cast(char*)"glVertexAttribs3svNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[60] = getExtensionFuncPtr(cast(char*)"glVertexAttribs4dvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[61] = getExtensionFuncPtr(cast(char*)"glVertexAttribs4fvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[62] = getExtensionFuncPtr(cast(char*)"glVertexAttribs4svNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[63] = getExtensionFuncPtr(cast(char*)"glVertexAttribs4ubvNV"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
