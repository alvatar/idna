module dgl.ext.VERSION_2_0;
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



private ushort extensionId__ = 40;
alias extensionId__ VERSION_2_0;

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
			const GLenum GL_VERTEX_ATTRIB_ARRAY_ENABLED = 0x8622;
			const GLenum GL_VERTEX_ATTRIB_ARRAY_SIZE = 0x8623;
			const GLenum GL_VERTEX_ATTRIB_ARRAY_STRIDE = 0x8624;
			const GLenum GL_VERTEX_ATTRIB_ARRAY_TYPE = 0x8625;
			const GLenum GL_CURRENT_VERTEX_ATTRIB = 0x8626;
			const GLenum GL_VERTEX_PROGRAM_POINT_SIZE = 0x8642;
			const GLenum GL_VERTEX_PROGRAM_TWO_SIDE = 0x8643;
			const GLenum GL_VERTEX_ATTRIB_ARRAY_POINTER = 0x8645;
			const GLenum GL_STENCIL_BACK_FUNC = 0x8800;
			const GLenum GL_STENCIL_BACK_FAIL = 0x8801;
			const GLenum GL_STENCIL_BACK_PASS_DEPTH_FAIL = 0x8802;
			const GLenum GL_STENCIL_BACK_PASS_DEPTH_PASS = 0x8803;
			const GLenum GL_MAX_DRAW_BUFFERS = 0x8824;
			const GLenum GL_DRAW_BUFFER0 = 0x8825;
			const GLenum GL_DRAW_BUFFER1 = 0x8826;
			const GLenum GL_DRAW_BUFFER2 = 0x8827;
			const GLenum GL_DRAW_BUFFER3 = 0x8828;
			const GLenum GL_DRAW_BUFFER4 = 0x8829;
			const GLenum GL_DRAW_BUFFER5 = 0x882A;
			const GLenum GL_DRAW_BUFFER6 = 0x882B;
			const GLenum GL_DRAW_BUFFER7 = 0x882C;
			const GLenum GL_DRAW_BUFFER8 = 0x882D;
			const GLenum GL_DRAW_BUFFER9 = 0x882E;
			const GLenum GL_DRAW_BUFFER10 = 0x882F;
			const GLenum GL_DRAW_BUFFER11 = 0x8830;
			const GLenum GL_DRAW_BUFFER12 = 0x8831;
			const GLenum GL_DRAW_BUFFER13 = 0x8832;
			const GLenum GL_DRAW_BUFFER14 = 0x8833;
			const GLenum GL_DRAW_BUFFER15 = 0x8834;
			const GLenum GL_BLEND_EQUATION_ALPHA = 0x883D;
			const GLenum GL_POINT_SPRITE = 0x8861;
			const GLenum GL_COORD_REPLACE = 0x8862;
			const GLenum GL_MAX_VERTEX_ATTRIBS = 0x8869;
			const GLenum GL_VERTEX_ATTRIB_ARRAY_NORMALIZED = 0x886A;
			const GLenum GL_MAX_TEXTURE_COORDS = 0x8871;
			const GLenum GL_MAX_TEXTURE_IMAGE_UNITS = 0x8872;
			const GLenum GL_FRAGMENT_SHADER = 0x8B30;
			const GLenum GL_VERTEX_SHADER = 0x8B31;
			const GLenum GL_MAX_FRAGMENT_UNIFORM_COMPONENTS = 0x8B49;
			const GLenum GL_MAX_VERTEX_UNIFORM_COMPONENTS = 0x8B4A;
			const GLenum GL_MAX_VARYING_FLOATS = 0x8B4B;
			const GLenum GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS = 0x8B4C;
			const GLenum GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS = 0x8B4D;
			const GLenum GL_SHADER_TYPE = 0x8B4F;
			const GLenum GL_FLOAT_VEC2 = 0x8B50;
			const GLenum GL_FLOAT_VEC3 = 0x8B51;
			const GLenum GL_FLOAT_VEC4 = 0x8B52;
			const GLenum GL_INT_VEC2 = 0x8B53;
			const GLenum GL_INT_VEC3 = 0x8B54;
			const GLenum GL_INT_VEC4 = 0x8B55;
			const GLenum GL_BOOL = 0x8B56;
			const GLenum GL_BOOL_VEC2 = 0x8B57;
			const GLenum GL_BOOL_VEC3 = 0x8B58;
			const GLenum GL_BOOL_VEC4 = 0x8B59;
			const GLenum GL_FLOAT_MAT2 = 0x8B5A;
			const GLenum GL_FLOAT_MAT3 = 0x8B5B;
			const GLenum GL_FLOAT_MAT4 = 0x8B5C;
			const GLenum GL_SAMPLER_1D = 0x8B5D;
			const GLenum GL_SAMPLER_2D = 0x8B5E;
			const GLenum GL_SAMPLER_3D = 0x8B5F;
			const GLenum GL_SAMPLER_CUBE = 0x8B60;
			const GLenum GL_SAMPLER_1D_SHADOW = 0x8B61;
			const GLenum GL_SAMPLER_2D_SHADOW = 0x8B62;
			const GLenum GL_DELETE_STATUS = 0x8B80;
			const GLenum GL_COMPILE_STATUS = 0x8B81;
			const GLenum GL_LINK_STATUS = 0x8B82;
			const GLenum GL_VALIDATE_STATUS = 0x8B83;
			const GLenum GL_INFO_LOG_LENGTH = 0x8B84;
			const GLenum GL_ATTACHED_SHADERS = 0x8B85;
			const GLenum GL_ACTIVE_UNIFORMS = 0x8B86;
			const GLenum GL_ACTIVE_UNIFORM_MAX_LENGTH = 0x8B87;
			const GLenum GL_SHADER_SOURCE_LENGTH = 0x8B88;
			const GLenum GL_ACTIVE_ATTRIBUTES = 0x8B89;
			const GLenum GL_ACTIVE_ATTRIBUTE_MAX_LENGTH = 0x8B8A;
			const GLenum GL_FRAGMENT_SHADER_DERIVATIVE_HINT = 0x8B8B;
			const GLenum GL_SHADING_LANGUAGE_VERSION = 0x8B8C;
			const GLenum GL_CURRENT_PROGRAM = 0x8B8D;
			const GLenum GL_POINT_SPRITE_COORD_ORIGIN = 0x8CA0;
			const GLenum GL_LOWER_LEFT = 0x8CA1;
			const GLenum GL_UPPER_LEFT = 0x8CA2;
			const GLenum GL_STENCIL_BACK_REF = 0x8CA3;
			const GLenum GL_STENCIL_BACK_VALUE_MASK = 0x8CA4;
			const GLenum GL_STENCIL_BACK_WRITEMASK = 0x8CA5;
			alias char GLchar;
	}
	private {
		extern (System) {
			alias void function (GLenum, GLenum)	fp_glBlendEquationSeparate;
			alias void function (GLsizei n,  GLenum* bufs)	fp_glDrawBuffers;
			alias void function (GLenum face, GLenum sfail, GLenum dpfail, GLenum dppass)	fp_glStencilOpSeparate;
			alias void function (GLenum frontfunc, GLenum backfunc, GLint ref_, GLuint mask)	fp_glStencilFuncSeparate;
			alias void function (GLenum, GLuint)	fp_glStencilMaskSeparate;
			alias void function (GLuint program, GLuint shader)	fp_glAttachShader;
			alias void function (GLuint program, GLuint index,  GLchar* name)	fp_glBindAttribLocation;
			alias void function (GLuint shader)	fp_glCompileShader;
			alias GLuint function ()	fp_glCreateProgram;
			alias GLuint function (GLenum type)	fp_glCreateShader;
			alias void function (GLuint program)	fp_glDeleteProgram;
			alias void function (GLuint shader)	fp_glDeleteShader;
			alias void function (GLuint program, GLuint shader)	fp_glDetachShader;
			alias void function (GLuint)	fp_glDisableVertexAttribArray;
			alias void function (GLuint)	fp_glEnableVertexAttribArray;
			alias void function (GLuint program, GLuint index, GLsizei maxLength, GLsizei* length, GLint* size, GLenum* type, GLchar* name)	fp_glGetActiveAttrib;
			alias void function (GLuint program, GLuint index, GLsizei maxLength, GLsizei* length, GLint* size, GLenum* type, GLchar* name)	fp_glGetActiveUniform;
			alias void function (GLuint program, GLsizei maxCount, GLsizei* count, GLuint* shaders)	fp_glGetAttachedShaders;
			alias GLint function (GLuint program,  GLchar* name)	fp_glGetAttribLocation;
			alias void function (GLuint program, GLenum pname, GLint* param)	fp_glGetProgramiv;
			alias void function (GLuint program, GLsizei bufSize, GLsizei* length, GLchar* infoLog)	fp_glGetProgramInfoLog;
			alias void function (GLuint shader, GLenum pname, GLint* param)	fp_glGetShaderiv;
			alias void function (GLuint shader, GLsizei bufSize, GLsizei* length, GLchar* infoLog)	fp_glGetShaderInfoLog;
			alias void function (GLuint shader, GLsizei count,  GLchar** strings,  GLint* lengths)	fp_glShaderSource;
			alias GLint function (GLuint program,  GLchar* name)	fp_glGetUniformLocation;
			alias void function (GLuint program, GLint location, GLfloat* params)	fp_glGetUniformfv;
			alias void function (GLuint program, GLint location, GLint* params)	fp_glGetUniformiv;
			alias void function (GLuint, GLenum, GLdouble*)	fp_glGetVertexAttribdv;
			alias void function (GLuint, GLenum, GLfloat*)	fp_glGetVertexAttribfv;
			alias void function (GLuint, GLenum, GLint*)	fp_glGetVertexAttribiv;
			alias void function (GLuint, GLenum, GLvoid*)	fp_glGetVertexAttribPointerv;
			alias GLboolean function (GLuint program)	fp_glIsProgram;
			alias GLboolean function (GLuint shader)	fp_glIsShader;
			alias void function (GLuint program)	fp_glLinkProgram;
			alias void function (GLint obj, GLsizei maxLength, GLsizei* length, GLchar* source)	fp_glGetShaderSource;
			alias void function (GLuint program)	fp_glUseProgram;
			alias void function (GLint location, GLfloat v0)	fp_glUniform1f;
			alias void function (GLint location, GLsizei count,  GLfloat* value)	fp_glUniform1fv;
			alias void function (GLint location, GLint v0)	fp_glUniform1i;
			alias void function (GLint location, GLsizei count,  GLint* value)	fp_glUniform1iv;
			alias void function (GLint location, GLfloat v0, GLfloat v1)	fp_glUniform2f;
			alias void function (GLint location, GLsizei count,  GLfloat* value)	fp_glUniform2fv;
			alias void function (GLint location, GLint v0, GLint v1)	fp_glUniform2i;
			alias void function (GLint location, GLsizei count,  GLint* value)	fp_glUniform2iv;
			alias void function (GLint location, GLfloat v0, GLfloat v1, GLfloat v2)	fp_glUniform3f;
			alias void function (GLint location, GLsizei count,  GLfloat* value)	fp_glUniform3fv;
			alias void function (GLint location, GLint v0, GLint v1, GLint v2)	fp_glUniform3i;
			alias void function (GLint location, GLsizei count,  GLint* value)	fp_glUniform3iv;
			alias void function (GLint location, GLfloat v0, GLfloat v1, GLfloat v2, GLfloat v3)	fp_glUniform4f;
			alias void function (GLint location, GLsizei count,  GLfloat* value)	fp_glUniform4fv;
			alias void function (GLint location, GLint v0, GLint v1, GLint v2, GLint v3)	fp_glUniform4i;
			alias void function (GLint location, GLsizei count,  GLint* value)	fp_glUniform4iv;
			alias void function (GLint location, GLsizei count, GLboolean transpose,  GLfloat* value)	fp_glUniformMatrix2fv;
			alias void function (GLint location, GLsizei count, GLboolean transpose,  GLfloat* value)	fp_glUniformMatrix3fv;
			alias void function (GLint location, GLsizei count, GLboolean transpose,  GLfloat* value)	fp_glUniformMatrix4fv;
			alias void function (GLuint program)	fp_glValidateProgram;
			alias void function (GLuint index, GLdouble x)	fp_glVertexAttrib1d;
			alias void function (GLuint index,  GLdouble* v)	fp_glVertexAttrib1dv;
			alias void function (GLuint index, GLfloat x)	fp_glVertexAttrib1f;
			alias void function (GLuint index,  GLfloat* v)	fp_glVertexAttrib1fv;
			alias void function (GLuint index, GLshort x)	fp_glVertexAttrib1s;
			alias void function (GLuint index,  GLshort* v)	fp_glVertexAttrib1sv;
			alias void function (GLuint index, GLdouble x, GLdouble y)	fp_glVertexAttrib2d;
			alias void function (GLuint index,  GLdouble* v)	fp_glVertexAttrib2dv;
			alias void function (GLuint index, GLfloat x, GLfloat y)	fp_glVertexAttrib2f;
			alias void function (GLuint index,  GLfloat* v)	fp_glVertexAttrib2fv;
			alias void function (GLuint index, GLshort x, GLshort y)	fp_glVertexAttrib2s;
			alias void function (GLuint index,  GLshort* v)	fp_glVertexAttrib2sv;
			alias void function (GLuint index, GLdouble x, GLdouble y, GLdouble z)	fp_glVertexAttrib3d;
			alias void function (GLuint index,  GLdouble* v)	fp_glVertexAttrib3dv;
			alias void function (GLuint index, GLfloat x, GLfloat y, GLfloat z)	fp_glVertexAttrib3f;
			alias void function (GLuint index,  GLfloat* v)	fp_glVertexAttrib3fv;
			alias void function (GLuint index, GLshort x, GLshort y, GLshort z)	fp_glVertexAttrib3s;
			alias void function (GLuint index,  GLshort* v)	fp_glVertexAttrib3sv;
			alias void function (GLuint index,  GLbyte* v)	fp_glVertexAttrib4Nbv;
			alias void function (GLuint index,  GLint* v)	fp_glVertexAttrib4Niv;
			alias void function (GLuint index,  GLshort* v)	fp_glVertexAttrib4Nsv;
			alias void function (GLuint index, GLubyte x, GLubyte y, GLubyte z, GLubyte w)	fp_glVertexAttrib4Nub;
			alias void function (GLuint index,  GLubyte* v)	fp_glVertexAttrib4Nubv;
			alias void function (GLuint index,  GLuint* v)	fp_glVertexAttrib4Nuiv;
			alias void function (GLuint index,  GLushort* v)	fp_glVertexAttrib4Nusv;
			alias void function (GLuint index,  GLbyte* v)	fp_glVertexAttrib4bv;
			alias void function (GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w)	fp_glVertexAttrib4d;
			alias void function (GLuint index,  GLdouble* v)	fp_glVertexAttrib4dv;
			alias void function (GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w)	fp_glVertexAttrib4f;
			alias void function (GLuint index,  GLfloat* v)	fp_glVertexAttrib4fv;
			alias void function (GLuint index,  GLint* v)	fp_glVertexAttrib4iv;
			alias void function (GLuint index, GLshort x, GLshort y, GLshort z, GLshort w)	fp_glVertexAttrib4s;
			alias void function (GLuint index,  GLshort* v)	fp_glVertexAttrib4sv;
			alias void function (GLuint index,  GLubyte* v)	fp_glVertexAttrib4ubv;
			alias void function (GLuint index,  GLuint* v)	fp_glVertexAttrib4uiv;
			alias void function (GLuint index,  GLushort* v)	fp_glVertexAttrib4usv;
			alias void function (GLuint index, GLint size, GLenum type, GLboolean normalized, GLsizei stride,  GLvoid* pointer)	fp_glVertexAttribPointer;
		}
	}
	public {
void BlendEquationSeparate(GL gl_, ParameterTypeTuple!(fp_glBlendEquationSeparate) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBlendEquationSeparate)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "BlendEquationSeparate", funcPtr, params__);
		}
void DrawBuffers(GL gl_, ParameterTypeTuple!(fp_glDrawBuffers) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDrawBuffers)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "DrawBuffers", funcPtr, params__);
		}
void StencilOpSeparate(GL gl_, ParameterTypeTuple!(fp_glStencilOpSeparate) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glStencilOpSeparate)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "StencilOpSeparate", funcPtr, params__);
		}
void StencilFuncSeparate(GL gl_, ParameterTypeTuple!(fp_glStencilFuncSeparate) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glStencilFuncSeparate)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "StencilFuncSeparate", funcPtr, params__);
		}
void StencilMaskSeparate(GL gl_, ParameterTypeTuple!(fp_glStencilMaskSeparate) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glStencilMaskSeparate)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "StencilMaskSeparate", funcPtr, params__);
		}
void AttachShader(GL gl_, ParameterTypeTuple!(fp_glAttachShader) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glAttachShader)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "AttachShader", funcPtr, params__);
		}
void BindAttribLocation(GL gl_, ParameterTypeTuple!(fp_glBindAttribLocation) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBindAttribLocation)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "BindAttribLocation", funcPtr, params__);
		}
void CompileShader(GL gl_, ParameterTypeTuple!(fp_glCompileShader) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCompileShader)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "CompileShader", funcPtr, params__);
		}
GLuint CreateProgram(GL gl_, ParameterTypeTuple!(fp_glCreateProgram) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCreateProgram)(gl.extFuncs[extensionId__][8]);
			return checkedCall(gl_, "CreateProgram", funcPtr, params__);
		}
GLuint CreateShader(GL gl_, ParameterTypeTuple!(fp_glCreateShader) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCreateShader)(gl.extFuncs[extensionId__][9]);
			return checkedCall(gl_, "CreateShader", funcPtr, params__);
		}
void DeleteProgram(GL gl_, ParameterTypeTuple!(fp_glDeleteProgram) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDeleteProgram)(gl.extFuncs[extensionId__][10]);
			return checkedCall(gl_, "DeleteProgram", funcPtr, params__);
		}
void DeleteShader(GL gl_, ParameterTypeTuple!(fp_glDeleteShader) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDeleteShader)(gl.extFuncs[extensionId__][11]);
			return checkedCall(gl_, "DeleteShader", funcPtr, params__);
		}
void DetachShader(GL gl_, ParameterTypeTuple!(fp_glDetachShader) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDetachShader)(gl.extFuncs[extensionId__][12]);
			return checkedCall(gl_, "DetachShader", funcPtr, params__);
		}
void DisableVertexAttribArray(GL gl_, ParameterTypeTuple!(fp_glDisableVertexAttribArray) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDisableVertexAttribArray)(gl.extFuncs[extensionId__][13]);
			return checkedCall(gl_, "DisableVertexAttribArray", funcPtr, params__);
		}
void EnableVertexAttribArray(GL gl_, ParameterTypeTuple!(fp_glEnableVertexAttribArray) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glEnableVertexAttribArray)(gl.extFuncs[extensionId__][14]);
			return checkedCall(gl_, "EnableVertexAttribArray", funcPtr, params__);
		}
void GetActiveAttrib(GL gl_, ParameterTypeTuple!(fp_glGetActiveAttrib) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetActiveAttrib)(gl.extFuncs[extensionId__][15]);
			return checkedCall(gl_, "GetActiveAttrib", funcPtr, params__);
		}
void GetActiveUniform(GL gl_, ParameterTypeTuple!(fp_glGetActiveUniform) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetActiveUniform)(gl.extFuncs[extensionId__][16]);
			return checkedCall(gl_, "GetActiveUniform", funcPtr, params__);
		}
void GetAttachedShaders(GL gl_, ParameterTypeTuple!(fp_glGetAttachedShaders) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetAttachedShaders)(gl.extFuncs[extensionId__][17]);
			return checkedCall(gl_, "GetAttachedShaders", funcPtr, params__);
		}
GLint GetAttribLocation(GL gl_, ParameterTypeTuple!(fp_glGetAttribLocation) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetAttribLocation)(gl.extFuncs[extensionId__][18]);
			return checkedCall(gl_, "GetAttribLocation", funcPtr, params__);
		}
void GetProgramiv(GL gl_, ParameterTypeTuple!(fp_glGetProgramiv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetProgramiv)(gl.extFuncs[extensionId__][19]);
			return checkedCall(gl_, "GetProgramiv", funcPtr, params__);
		}
void GetProgramInfoLog(GL gl_, ParameterTypeTuple!(fp_glGetProgramInfoLog) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetProgramInfoLog)(gl.extFuncs[extensionId__][20]);
			return checkedCall(gl_, "GetProgramInfoLog", funcPtr, params__);
		}
void GetShaderiv(GL gl_, ParameterTypeTuple!(fp_glGetShaderiv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetShaderiv)(gl.extFuncs[extensionId__][21]);
			return checkedCall(gl_, "GetShaderiv", funcPtr, params__);
		}
void GetShaderInfoLog(GL gl_, ParameterTypeTuple!(fp_glGetShaderInfoLog) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetShaderInfoLog)(gl.extFuncs[extensionId__][22]);
			return checkedCall(gl_, "GetShaderInfoLog", funcPtr, params__);
		}
void ShaderSource(GL gl_, ParameterTypeTuple!(fp_glShaderSource) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glShaderSource)(gl.extFuncs[extensionId__][23]);
			return checkedCall(gl_, "ShaderSource", funcPtr, params__);
		}
GLint GetUniformLocation(GL gl_, ParameterTypeTuple!(fp_glGetUniformLocation) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetUniformLocation)(gl.extFuncs[extensionId__][24]);
			return checkedCall(gl_, "GetUniformLocation", funcPtr, params__);
		}
void GetUniformfv(GL gl_, ParameterTypeTuple!(fp_glGetUniformfv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetUniformfv)(gl.extFuncs[extensionId__][25]);
			return checkedCall(gl_, "GetUniformfv", funcPtr, params__);
		}
void GetUniformiv(GL gl_, ParameterTypeTuple!(fp_glGetUniformiv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetUniformiv)(gl.extFuncs[extensionId__][26]);
			return checkedCall(gl_, "GetUniformiv", funcPtr, params__);
		}
void GetVertexAttribdv(GL gl_, ParameterTypeTuple!(fp_glGetVertexAttribdv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetVertexAttribdv)(gl.extFuncs[extensionId__][27]);
			return checkedCall(gl_, "GetVertexAttribdv", funcPtr, params__);
		}
void GetVertexAttribfv(GL gl_, ParameterTypeTuple!(fp_glGetVertexAttribfv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetVertexAttribfv)(gl.extFuncs[extensionId__][28]);
			return checkedCall(gl_, "GetVertexAttribfv", funcPtr, params__);
		}
void GetVertexAttribiv(GL gl_, ParameterTypeTuple!(fp_glGetVertexAttribiv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetVertexAttribiv)(gl.extFuncs[extensionId__][29]);
			return checkedCall(gl_, "GetVertexAttribiv", funcPtr, params__);
		}
void GetVertexAttribPointerv(GL gl_, ParameterTypeTuple!(fp_glGetVertexAttribPointerv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetVertexAttribPointerv)(gl.extFuncs[extensionId__][30]);
			return checkedCall(gl_, "GetVertexAttribPointerv", funcPtr, params__);
		}
GLboolean IsProgram(GL gl_, ParameterTypeTuple!(fp_glIsProgram) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glIsProgram)(gl.extFuncs[extensionId__][31]);
			return checkedCall(gl_, "IsProgram", funcPtr, params__);
		}
GLboolean IsShader(GL gl_, ParameterTypeTuple!(fp_glIsShader) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glIsShader)(gl.extFuncs[extensionId__][32]);
			return checkedCall(gl_, "IsShader", funcPtr, params__);
		}
void LinkProgram(GL gl_, ParameterTypeTuple!(fp_glLinkProgram) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glLinkProgram)(gl.extFuncs[extensionId__][33]);
			return checkedCall(gl_, "LinkProgram", funcPtr, params__);
		}
void GetShaderSource(GL gl_, ParameterTypeTuple!(fp_glGetShaderSource) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetShaderSource)(gl.extFuncs[extensionId__][34]);
			return checkedCall(gl_, "GetShaderSource", funcPtr, params__);
		}
void UseProgram(GL gl_, ParameterTypeTuple!(fp_glUseProgram) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUseProgram)(gl.extFuncs[extensionId__][35]);
			return checkedCall(gl_, "UseProgram", funcPtr, params__);
		}
void Uniform1f(GL gl_, ParameterTypeTuple!(fp_glUniform1f) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform1f)(gl.extFuncs[extensionId__][36]);
			return checkedCall(gl_, "Uniform1f", funcPtr, params__);
		}
void Uniform1fv(GL gl_, ParameterTypeTuple!(fp_glUniform1fv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform1fv)(gl.extFuncs[extensionId__][37]);
			return checkedCall(gl_, "Uniform1fv", funcPtr, params__);
		}
void Uniform1i(GL gl_, ParameterTypeTuple!(fp_glUniform1i) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform1i)(gl.extFuncs[extensionId__][38]);
			return checkedCall(gl_, "Uniform1i", funcPtr, params__);
		}
void Uniform1iv(GL gl_, ParameterTypeTuple!(fp_glUniform1iv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform1iv)(gl.extFuncs[extensionId__][39]);
			return checkedCall(gl_, "Uniform1iv", funcPtr, params__);
		}
void Uniform2f(GL gl_, ParameterTypeTuple!(fp_glUniform2f) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform2f)(gl.extFuncs[extensionId__][40]);
			return checkedCall(gl_, "Uniform2f", funcPtr, params__);
		}
void Uniform2fv(GL gl_, ParameterTypeTuple!(fp_glUniform2fv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform2fv)(gl.extFuncs[extensionId__][41]);
			return checkedCall(gl_, "Uniform2fv", funcPtr, params__);
		}
void Uniform2i(GL gl_, ParameterTypeTuple!(fp_glUniform2i) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform2i)(gl.extFuncs[extensionId__][42]);
			return checkedCall(gl_, "Uniform2i", funcPtr, params__);
		}
void Uniform2iv(GL gl_, ParameterTypeTuple!(fp_glUniform2iv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform2iv)(gl.extFuncs[extensionId__][43]);
			return checkedCall(gl_, "Uniform2iv", funcPtr, params__);
		}
void Uniform3f(GL gl_, ParameterTypeTuple!(fp_glUniform3f) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform3f)(gl.extFuncs[extensionId__][44]);
			return checkedCall(gl_, "Uniform3f", funcPtr, params__);
		}
void Uniform3fv(GL gl_, ParameterTypeTuple!(fp_glUniform3fv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform3fv)(gl.extFuncs[extensionId__][45]);
			return checkedCall(gl_, "Uniform3fv", funcPtr, params__);
		}
void Uniform3i(GL gl_, ParameterTypeTuple!(fp_glUniform3i) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform3i)(gl.extFuncs[extensionId__][46]);
			return checkedCall(gl_, "Uniform3i", funcPtr, params__);
		}
void Uniform3iv(GL gl_, ParameterTypeTuple!(fp_glUniform3iv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform3iv)(gl.extFuncs[extensionId__][47]);
			return checkedCall(gl_, "Uniform3iv", funcPtr, params__);
		}
void Uniform4f(GL gl_, ParameterTypeTuple!(fp_glUniform4f) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform4f)(gl.extFuncs[extensionId__][48]);
			return checkedCall(gl_, "Uniform4f", funcPtr, params__);
		}
void Uniform4fv(GL gl_, ParameterTypeTuple!(fp_glUniform4fv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform4fv)(gl.extFuncs[extensionId__][49]);
			return checkedCall(gl_, "Uniform4fv", funcPtr, params__);
		}
void Uniform4i(GL gl_, ParameterTypeTuple!(fp_glUniform4i) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform4i)(gl.extFuncs[extensionId__][50]);
			return checkedCall(gl_, "Uniform4i", funcPtr, params__);
		}
void Uniform4iv(GL gl_, ParameterTypeTuple!(fp_glUniform4iv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform4iv)(gl.extFuncs[extensionId__][51]);
			return checkedCall(gl_, "Uniform4iv", funcPtr, params__);
		}
void UniformMatrix2fv(GL gl_, ParameterTypeTuple!(fp_glUniformMatrix2fv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniformMatrix2fv)(gl.extFuncs[extensionId__][52]);
			return checkedCall(gl_, "UniformMatrix2fv", funcPtr, params__);
		}
void UniformMatrix3fv(GL gl_, ParameterTypeTuple!(fp_glUniformMatrix3fv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniformMatrix3fv)(gl.extFuncs[extensionId__][53]);
			return checkedCall(gl_, "UniformMatrix3fv", funcPtr, params__);
		}
void UniformMatrix4fv(GL gl_, ParameterTypeTuple!(fp_glUniformMatrix4fv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniformMatrix4fv)(gl.extFuncs[extensionId__][54]);
			return checkedCall(gl_, "UniformMatrix4fv", funcPtr, params__);
		}
void ValidateProgram(GL gl_, ParameterTypeTuple!(fp_glValidateProgram) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glValidateProgram)(gl.extFuncs[extensionId__][55]);
			return checkedCall(gl_, "ValidateProgram", funcPtr, params__);
		}
void VertexAttrib1d(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib1d) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib1d)(gl.extFuncs[extensionId__][56]);
			return checkedCall(gl_, "VertexAttrib1d", funcPtr, params__);
		}
void VertexAttrib1dv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib1dv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib1dv)(gl.extFuncs[extensionId__][57]);
			return checkedCall(gl_, "VertexAttrib1dv", funcPtr, params__);
		}
void VertexAttrib1f(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib1f) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib1f)(gl.extFuncs[extensionId__][58]);
			return checkedCall(gl_, "VertexAttrib1f", funcPtr, params__);
		}
void VertexAttrib1fv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib1fv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib1fv)(gl.extFuncs[extensionId__][59]);
			return checkedCall(gl_, "VertexAttrib1fv", funcPtr, params__);
		}
void VertexAttrib1s(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib1s) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib1s)(gl.extFuncs[extensionId__][60]);
			return checkedCall(gl_, "VertexAttrib1s", funcPtr, params__);
		}
void VertexAttrib1sv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib1sv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib1sv)(gl.extFuncs[extensionId__][61]);
			return checkedCall(gl_, "VertexAttrib1sv", funcPtr, params__);
		}
void VertexAttrib2d(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib2d) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib2d)(gl.extFuncs[extensionId__][62]);
			return checkedCall(gl_, "VertexAttrib2d", funcPtr, params__);
		}
void VertexAttrib2dv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib2dv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib2dv)(gl.extFuncs[extensionId__][63]);
			return checkedCall(gl_, "VertexAttrib2dv", funcPtr, params__);
		}
void VertexAttrib2f(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib2f) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib2f)(gl.extFuncs[extensionId__][64]);
			return checkedCall(gl_, "VertexAttrib2f", funcPtr, params__);
		}
void VertexAttrib2fv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib2fv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib2fv)(gl.extFuncs[extensionId__][65]);
			return checkedCall(gl_, "VertexAttrib2fv", funcPtr, params__);
		}
void VertexAttrib2s(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib2s) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib2s)(gl.extFuncs[extensionId__][66]);
			return checkedCall(gl_, "VertexAttrib2s", funcPtr, params__);
		}
void VertexAttrib2sv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib2sv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib2sv)(gl.extFuncs[extensionId__][67]);
			return checkedCall(gl_, "VertexAttrib2sv", funcPtr, params__);
		}
void VertexAttrib3d(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib3d) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib3d)(gl.extFuncs[extensionId__][68]);
			return checkedCall(gl_, "VertexAttrib3d", funcPtr, params__);
		}
void VertexAttrib3dv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib3dv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib3dv)(gl.extFuncs[extensionId__][69]);
			return checkedCall(gl_, "VertexAttrib3dv", funcPtr, params__);
		}
void VertexAttrib3f(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib3f) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib3f)(gl.extFuncs[extensionId__][70]);
			return checkedCall(gl_, "VertexAttrib3f", funcPtr, params__);
		}
void VertexAttrib3fv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib3fv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib3fv)(gl.extFuncs[extensionId__][71]);
			return checkedCall(gl_, "VertexAttrib3fv", funcPtr, params__);
		}
void VertexAttrib3s(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib3s) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib3s)(gl.extFuncs[extensionId__][72]);
			return checkedCall(gl_, "VertexAttrib3s", funcPtr, params__);
		}
void VertexAttrib3sv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib3sv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib3sv)(gl.extFuncs[extensionId__][73]);
			return checkedCall(gl_, "VertexAttrib3sv", funcPtr, params__);
		}
void VertexAttrib4Nbv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4Nbv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4Nbv)(gl.extFuncs[extensionId__][74]);
			return checkedCall(gl_, "VertexAttrib4Nbv", funcPtr, params__);
		}
void VertexAttrib4Niv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4Niv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4Niv)(gl.extFuncs[extensionId__][75]);
			return checkedCall(gl_, "VertexAttrib4Niv", funcPtr, params__);
		}
void VertexAttrib4Nsv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4Nsv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4Nsv)(gl.extFuncs[extensionId__][76]);
			return checkedCall(gl_, "VertexAttrib4Nsv", funcPtr, params__);
		}
void VertexAttrib4Nub(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4Nub) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4Nub)(gl.extFuncs[extensionId__][77]);
			return checkedCall(gl_, "VertexAttrib4Nub", funcPtr, params__);
		}
void VertexAttrib4Nubv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4Nubv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4Nubv)(gl.extFuncs[extensionId__][78]);
			return checkedCall(gl_, "VertexAttrib4Nubv", funcPtr, params__);
		}
void VertexAttrib4Nuiv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4Nuiv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4Nuiv)(gl.extFuncs[extensionId__][79]);
			return checkedCall(gl_, "VertexAttrib4Nuiv", funcPtr, params__);
		}
void VertexAttrib4Nusv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4Nusv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4Nusv)(gl.extFuncs[extensionId__][80]);
			return checkedCall(gl_, "VertexAttrib4Nusv", funcPtr, params__);
		}
void VertexAttrib4bv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4bv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4bv)(gl.extFuncs[extensionId__][81]);
			return checkedCall(gl_, "VertexAttrib4bv", funcPtr, params__);
		}
void VertexAttrib4d(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4d) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4d)(gl.extFuncs[extensionId__][82]);
			return checkedCall(gl_, "VertexAttrib4d", funcPtr, params__);
		}
void VertexAttrib4dv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4dv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4dv)(gl.extFuncs[extensionId__][83]);
			return checkedCall(gl_, "VertexAttrib4dv", funcPtr, params__);
		}
void VertexAttrib4f(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4f) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4f)(gl.extFuncs[extensionId__][84]);
			return checkedCall(gl_, "VertexAttrib4f", funcPtr, params__);
		}
void VertexAttrib4fv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4fv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4fv)(gl.extFuncs[extensionId__][85]);
			return checkedCall(gl_, "VertexAttrib4fv", funcPtr, params__);
		}
void VertexAttrib4iv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4iv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4iv)(gl.extFuncs[extensionId__][86]);
			return checkedCall(gl_, "VertexAttrib4iv", funcPtr, params__);
		}
void VertexAttrib4s(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4s) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4s)(gl.extFuncs[extensionId__][87]);
			return checkedCall(gl_, "VertexAttrib4s", funcPtr, params__);
		}
void VertexAttrib4sv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4sv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4sv)(gl.extFuncs[extensionId__][88]);
			return checkedCall(gl_, "VertexAttrib4sv", funcPtr, params__);
		}
void VertexAttrib4ubv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4ubv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4ubv)(gl.extFuncs[extensionId__][89]);
			return checkedCall(gl_, "VertexAttrib4ubv", funcPtr, params__);
		}
void VertexAttrib4uiv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4uiv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4uiv)(gl.extFuncs[extensionId__][90]);
			return checkedCall(gl_, "VertexAttrib4uiv", funcPtr, params__);
		}
void VertexAttrib4usv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4usv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4usv)(gl.extFuncs[extensionId__][91]);
			return checkedCall(gl_, "VertexAttrib4usv", funcPtr, params__);
		}
void VertexAttribPointer(GL gl_, ParameterTypeTuple!(fp_glVertexAttribPointer) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribPointer)(gl.extFuncs[extensionId__][92]);
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
				
				version (DglExtSupportAsserts) {
					gl.extEnabled.length = extensionId__ + 1;
				}
			}
			gl.extFuncs[extensionId__] = loadFunctions__(gl_);
			
			return gl.extFuncs[extensionId__][0] !is null;
		}
	}
	private void*[] loadFunctions__(GL gl) {
		void*[] funcAddr = new void*[93];
		{
			if (!isOpenGLVersionSupported("2_0", '_')) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glBlendEquationSeparate"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glDrawBuffers"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glStencilOpSeparate"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glStencilFuncSeparate"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glStencilMaskSeparate"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glAttachShader"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glBindAttribLocation"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glCompileShader"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[8] = getExtensionFuncPtr(cast(char*)"glCreateProgram"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[9] = getExtensionFuncPtr(cast(char*)"glCreateShader"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[10] = getExtensionFuncPtr(cast(char*)"glDeleteProgram"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[11] = getExtensionFuncPtr(cast(char*)"glDeleteShader"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[12] = getExtensionFuncPtr(cast(char*)"glDetachShader"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[13] = getExtensionFuncPtr(cast(char*)"glDisableVertexAttribArray"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[14] = getExtensionFuncPtr(cast(char*)"glEnableVertexAttribArray"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[15] = getExtensionFuncPtr(cast(char*)"glGetActiveAttrib"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[16] = getExtensionFuncPtr(cast(char*)"glGetActiveUniform"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[17] = getExtensionFuncPtr(cast(char*)"glGetAttachedShaders"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[18] = getExtensionFuncPtr(cast(char*)"glGetAttribLocation"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[19] = getExtensionFuncPtr(cast(char*)"glGetProgramiv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[20] = getExtensionFuncPtr(cast(char*)"glGetProgramInfoLog"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[21] = getExtensionFuncPtr(cast(char*)"glGetShaderiv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[22] = getExtensionFuncPtr(cast(char*)"glGetShaderInfoLog"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[23] = getExtensionFuncPtr(cast(char*)"glShaderSource"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[24] = getExtensionFuncPtr(cast(char*)"glGetUniformLocation"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[25] = getExtensionFuncPtr(cast(char*)"glGetUniformfv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[26] = getExtensionFuncPtr(cast(char*)"glGetUniformiv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[27] = getExtensionFuncPtr(cast(char*)"glGetVertexAttribdv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[28] = getExtensionFuncPtr(cast(char*)"glGetVertexAttribfv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[29] = getExtensionFuncPtr(cast(char*)"glGetVertexAttribiv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[30] = getExtensionFuncPtr(cast(char*)"glGetVertexAttribPointerv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[31] = getExtensionFuncPtr(cast(char*)"glIsProgram"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[32] = getExtensionFuncPtr(cast(char*)"glIsShader"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[33] = getExtensionFuncPtr(cast(char*)"glLinkProgram"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[34] = getExtensionFuncPtr(cast(char*)"glGetShaderSource"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[35] = getExtensionFuncPtr(cast(char*)"glUseProgram"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[36] = getExtensionFuncPtr(cast(char*)"glUniform1f"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[37] = getExtensionFuncPtr(cast(char*)"glUniform1fv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[38] = getExtensionFuncPtr(cast(char*)"glUniform1i"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[39] = getExtensionFuncPtr(cast(char*)"glUniform1iv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[40] = getExtensionFuncPtr(cast(char*)"glUniform2f"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[41] = getExtensionFuncPtr(cast(char*)"glUniform2fv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[42] = getExtensionFuncPtr(cast(char*)"glUniform2i"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[43] = getExtensionFuncPtr(cast(char*)"glUniform2iv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[44] = getExtensionFuncPtr(cast(char*)"glUniform3f"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[45] = getExtensionFuncPtr(cast(char*)"glUniform3fv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[46] = getExtensionFuncPtr(cast(char*)"glUniform3i"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[47] = getExtensionFuncPtr(cast(char*)"glUniform3iv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[48] = getExtensionFuncPtr(cast(char*)"glUniform4f"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[49] = getExtensionFuncPtr(cast(char*)"glUniform4fv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[50] = getExtensionFuncPtr(cast(char*)"glUniform4i"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[51] = getExtensionFuncPtr(cast(char*)"glUniform4iv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[52] = getExtensionFuncPtr(cast(char*)"glUniformMatrix2fv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[53] = getExtensionFuncPtr(cast(char*)"glUniformMatrix3fv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[54] = getExtensionFuncPtr(cast(char*)"glUniformMatrix4fv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[55] = getExtensionFuncPtr(cast(char*)"glValidateProgram"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[56] = getExtensionFuncPtr(cast(char*)"glVertexAttrib1d"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[57] = getExtensionFuncPtr(cast(char*)"glVertexAttrib1dv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[58] = getExtensionFuncPtr(cast(char*)"glVertexAttrib1f"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[59] = getExtensionFuncPtr(cast(char*)"glVertexAttrib1fv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[60] = getExtensionFuncPtr(cast(char*)"glVertexAttrib1s"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[61] = getExtensionFuncPtr(cast(char*)"glVertexAttrib1sv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[62] = getExtensionFuncPtr(cast(char*)"glVertexAttrib2d"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[63] = getExtensionFuncPtr(cast(char*)"glVertexAttrib2dv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[64] = getExtensionFuncPtr(cast(char*)"glVertexAttrib2f"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[65] = getExtensionFuncPtr(cast(char*)"glVertexAttrib2fv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[66] = getExtensionFuncPtr(cast(char*)"glVertexAttrib2s"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[67] = getExtensionFuncPtr(cast(char*)"glVertexAttrib2sv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[68] = getExtensionFuncPtr(cast(char*)"glVertexAttrib3d"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[69] = getExtensionFuncPtr(cast(char*)"glVertexAttrib3dv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[70] = getExtensionFuncPtr(cast(char*)"glVertexAttrib3f"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[71] = getExtensionFuncPtr(cast(char*)"glVertexAttrib3fv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[72] = getExtensionFuncPtr(cast(char*)"glVertexAttrib3s"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[73] = getExtensionFuncPtr(cast(char*)"glVertexAttrib3sv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[74] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4Nbv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[75] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4Niv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[76] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4Nsv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[77] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4Nub"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[78] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4Nubv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[79] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4Nuiv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[80] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4Nusv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[81] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4bv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[82] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4d"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[83] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4dv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[84] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4f"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[85] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4fv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[86] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4iv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[87] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4s"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[88] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4sv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[89] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4ubv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[90] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4uiv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[91] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4usv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[92] = getExtensionFuncPtr(cast(char*)"glVertexAttribPointer"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
