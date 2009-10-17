module dgl.ext.ARB_shader_objects;
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



private ushort extensionId__ = 18;
alias extensionId__ ARB_shader_objects;

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
			const GLenum GL_PROGRAM_OBJECT_ARB = 0x8B40;
			const GLenum GL_SHADER_OBJECT_ARB = 0x8B48;
			const GLenum GL_OBJECT_TYPE_ARB = 0x8B4E;
			const GLenum GL_OBJECT_SUBTYPE_ARB = 0x8B4F;
			const GLenum GL_FLOAT_VEC2_ARB = 0x8B50;
			const GLenum GL_FLOAT_VEC3_ARB = 0x8B51;
			const GLenum GL_FLOAT_VEC4_ARB = 0x8B52;
			const GLenum GL_INT_VEC2_ARB = 0x8B53;
			const GLenum GL_INT_VEC3_ARB = 0x8B54;
			const GLenum GL_INT_VEC4_ARB = 0x8B55;
			const GLenum GL_BOOL_ARB = 0x8B56;
			const GLenum GL_BOOL_VEC2_ARB = 0x8B57;
			const GLenum GL_BOOL_VEC3_ARB = 0x8B58;
			const GLenum GL_BOOL_VEC4_ARB = 0x8B59;
			const GLenum GL_FLOAT_MAT2_ARB = 0x8B5A;
			const GLenum GL_FLOAT_MAT3_ARB = 0x8B5B;
			const GLenum GL_FLOAT_MAT4_ARB = 0x8B5C;
			const GLenum GL_SAMPLER_1D_ARB = 0x8B5D;
			const GLenum GL_SAMPLER_2D_ARB = 0x8B5E;
			const GLenum GL_SAMPLER_3D_ARB = 0x8B5F;
			const GLenum GL_SAMPLER_CUBE_ARB = 0x8B60;
			const GLenum GL_SAMPLER_1D_SHADOW_ARB = 0x8B61;
			const GLenum GL_SAMPLER_2D_SHADOW_ARB = 0x8B62;
			const GLenum GL_SAMPLER_2D_RECT_ARB = 0x8B63;
			const GLenum GL_SAMPLER_2D_RECT_SHADOW_ARB = 0x8B64;
			const GLenum GL_OBJECT_DELETE_STATUS_ARB = 0x8B80;
			const GLenum GL_OBJECT_COMPILE_STATUS_ARB = 0x8B81;
			const GLenum GL_OBJECT_LINK_STATUS_ARB = 0x8B82;
			const GLenum GL_OBJECT_VALIDATE_STATUS_ARB = 0x8B83;
			const GLenum GL_OBJECT_INFO_LOG_LENGTH_ARB = 0x8B84;
			const GLenum GL_OBJECT_ATTACHED_OBJECTS_ARB = 0x8B85;
			const GLenum GL_OBJECT_ACTIVE_UNIFORMS_ARB = 0x8B86;
			const GLenum GL_OBJECT_ACTIVE_UNIFORM_MAX_LENGTH_ARB = 0x8B87;
			const GLenum GL_OBJECT_SHADER_SOURCE_LENGTH_ARB = 0x8B88;
	}
	private {
		extern (System) {
			alias void function (GLhandleARB containerObj, GLhandleARB obj)	fp_glAttachObjectARB;
			alias void function (GLhandleARB shaderObj)	fp_glCompileShaderARB;
			alias GLhandleARB function ()	fp_glCreateProgramObjectARB;
			alias GLhandleARB function (GLenum shaderType)	fp_glCreateShaderObjectARB;
			alias void function (GLhandleARB obj)	fp_glDeleteObjectARB;
			alias void function (GLhandleARB containerObj, GLhandleARB attachedObj)	fp_glDetachObjectARB;
			alias void function (GLhandleARB programObj, GLuint index, GLsizei maxLength, GLsizei* length, GLint *size, GLenum *type, GLcharARB *name)	fp_glGetActiveUniformARB;
			alias void function (GLhandleARB containerObj, GLsizei maxCount, GLsizei* count, GLhandleARB *obj)	fp_glGetAttachedObjectsARB;
			alias GLhandleARB function (GLenum pname)	fp_glGetHandleARB;
			alias void function (GLhandleARB obj, GLsizei maxLength, GLsizei* length, GLcharARB *infoLog)	fp_glGetInfoLogARB;
			alias void function (GLhandleARB obj, GLenum pname, GLfloat* params)	fp_glGetObjectParameterfvARB;
			alias void function (GLhandleARB obj, GLenum pname, GLint* params)	fp_glGetObjectParameterivARB;
			alias void function (GLhandleARB obj, GLsizei maxLength, GLsizei* length, GLcharARB *source)	fp_glGetShaderSourceARB;
			alias GLint function (GLhandleARB programObj,  GLcharARB* name)	fp_glGetUniformLocationARB;
			alias void function (GLhandleARB programObj, GLint location, GLfloat* params)	fp_glGetUniformfvARB;
			alias void function (GLhandleARB programObj, GLint location, GLint* params)	fp_glGetUniformivARB;
			alias void function (GLhandleARB programObj)	fp_glLinkProgramARB;
			alias void function (GLhandleARB shaderObj, GLsizei count,  GLcharARB ** string,  GLint *length)	fp_glShaderSourceARB;
			alias void function (GLint location, GLfloat v0)	fp_glUniform1fARB;
			alias void function (GLint location, GLsizei count,  GLfloat* value)	fp_glUniform1fvARB;
			alias void function (GLint location, GLint v0)	fp_glUniform1iARB;
			alias void function (GLint location, GLsizei count,  GLint* value)	fp_glUniform1ivARB;
			alias void function (GLint location, GLfloat v0, GLfloat v1)	fp_glUniform2fARB;
			alias void function (GLint location, GLsizei count,  GLfloat* value)	fp_glUniform2fvARB;
			alias void function (GLint location, GLint v0, GLint v1)	fp_glUniform2iARB;
			alias void function (GLint location, GLsizei count,  GLint* value)	fp_glUniform2ivARB;
			alias void function (GLint location, GLfloat v0, GLfloat v1, GLfloat v2)	fp_glUniform3fARB;
			alias void function (GLint location, GLsizei count,  GLfloat* value)	fp_glUniform3fvARB;
			alias void function (GLint location, GLint v0, GLint v1, GLint v2)	fp_glUniform3iARB;
			alias void function (GLint location, GLsizei count,  GLint* value)	fp_glUniform3ivARB;
			alias void function (GLint location, GLfloat v0, GLfloat v1, GLfloat v2, GLfloat v3)	fp_glUniform4fARB;
			alias void function (GLint location, GLsizei count,  GLfloat* value)	fp_glUniform4fvARB;
			alias void function (GLint location, GLint v0, GLint v1, GLint v2, GLint v3)	fp_glUniform4iARB;
			alias void function (GLint location, GLsizei count,  GLint* value)	fp_glUniform4ivARB;
			alias void function (GLint location, GLsizei count, GLboolean transpose,  GLfloat* value)	fp_glUniformMatrix2fvARB;
			alias void function (GLint location, GLsizei count, GLboolean transpose,  GLfloat* value)	fp_glUniformMatrix3fvARB;
			alias void function (GLint location, GLsizei count, GLboolean transpose,  GLfloat* value)	fp_glUniformMatrix4fvARB;
			alias void function (GLhandleARB programObj)	fp_glUseProgramObjectARB;
			alias void function (GLhandleARB programObj)	fp_glValidateProgramARB;
		}
	}
	public {
void AttachObject(GL gl_, ParameterTypeTuple!(fp_glAttachObjectARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glAttachObjectARB)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "AttachObject", funcPtr, params__);
		}
void CompileShader(GL gl_, ParameterTypeTuple!(fp_glCompileShaderARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCompileShaderARB)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "CompileShader", funcPtr, params__);
		}
GLhandleARB CreateProgramObject(GL gl_, ParameterTypeTuple!(fp_glCreateProgramObjectARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCreateProgramObjectARB)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "CreateProgramObject", funcPtr, params__);
		}
GLhandleARB CreateShaderObject(GL gl_, ParameterTypeTuple!(fp_glCreateShaderObjectARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCreateShaderObjectARB)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "CreateShaderObject", funcPtr, params__);
		}
void DeleteObject(GL gl_, ParameterTypeTuple!(fp_glDeleteObjectARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDeleteObjectARB)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "DeleteObject", funcPtr, params__);
		}
void DetachObject(GL gl_, ParameterTypeTuple!(fp_glDetachObjectARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDetachObjectARB)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "DetachObject", funcPtr, params__);
		}
void GetActiveUniform(GL gl_, ParameterTypeTuple!(fp_glGetActiveUniformARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetActiveUniformARB)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "GetActiveUniform", funcPtr, params__);
		}
void GetAttachedObjects(GL gl_, ParameterTypeTuple!(fp_glGetAttachedObjectsARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetAttachedObjectsARB)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "GetAttachedObjects", funcPtr, params__);
		}
GLhandleARB GetHandle(GL gl_, ParameterTypeTuple!(fp_glGetHandleARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetHandleARB)(gl.extFuncs[extensionId__][8]);
			return checkedCall(gl_, "GetHandle", funcPtr, params__);
		}
void GetInfoLog(GL gl_, ParameterTypeTuple!(fp_glGetInfoLogARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetInfoLogARB)(gl.extFuncs[extensionId__][9]);
			return checkedCall(gl_, "GetInfoLog", funcPtr, params__);
		}
void GetObjectParameterfv(GL gl_, ParameterTypeTuple!(fp_glGetObjectParameterfvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetObjectParameterfvARB)(gl.extFuncs[extensionId__][10]);
			return checkedCall(gl_, "GetObjectParameterfv", funcPtr, params__);
		}
void GetObjectParameteriv(GL gl_, ParameterTypeTuple!(fp_glGetObjectParameterivARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetObjectParameterivARB)(gl.extFuncs[extensionId__][11]);
			return checkedCall(gl_, "GetObjectParameteriv", funcPtr, params__);
		}
void GetShaderSource(GL gl_, ParameterTypeTuple!(fp_glGetShaderSourceARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetShaderSourceARB)(gl.extFuncs[extensionId__][12]);
			return checkedCall(gl_, "GetShaderSource", funcPtr, params__);
		}
GLint GetUniformLocation(GL gl_, ParameterTypeTuple!(fp_glGetUniformLocationARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetUniformLocationARB)(gl.extFuncs[extensionId__][13]);
			return checkedCall(gl_, "GetUniformLocation", funcPtr, params__);
		}
void GetUniformfv(GL gl_, ParameterTypeTuple!(fp_glGetUniformfvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetUniformfvARB)(gl.extFuncs[extensionId__][14]);
			return checkedCall(gl_, "GetUniformfv", funcPtr, params__);
		}
void GetUniformiv(GL gl_, ParameterTypeTuple!(fp_glGetUniformivARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetUniformivARB)(gl.extFuncs[extensionId__][15]);
			return checkedCall(gl_, "GetUniformiv", funcPtr, params__);
		}
void LinkProgram(GL gl_, ParameterTypeTuple!(fp_glLinkProgramARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glLinkProgramARB)(gl.extFuncs[extensionId__][16]);
			return checkedCall(gl_, "LinkProgram", funcPtr, params__);
		}
void ShaderSource(GL gl_, ParameterTypeTuple!(fp_glShaderSourceARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glShaderSourceARB)(gl.extFuncs[extensionId__][17]);
			return checkedCall(gl_, "ShaderSource", funcPtr, params__);
		}
void Uniform1f(GL gl_, ParameterTypeTuple!(fp_glUniform1fARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform1fARB)(gl.extFuncs[extensionId__][18]);
			return checkedCall(gl_, "Uniform1f", funcPtr, params__);
		}
void Uniform1fv(GL gl_, ParameterTypeTuple!(fp_glUniform1fvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform1fvARB)(gl.extFuncs[extensionId__][19]);
			return checkedCall(gl_, "Uniform1fv", funcPtr, params__);
		}
void Uniform1i(GL gl_, ParameterTypeTuple!(fp_glUniform1iARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform1iARB)(gl.extFuncs[extensionId__][20]);
			return checkedCall(gl_, "Uniform1i", funcPtr, params__);
		}
void Uniform1iv(GL gl_, ParameterTypeTuple!(fp_glUniform1ivARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform1ivARB)(gl.extFuncs[extensionId__][21]);
			return checkedCall(gl_, "Uniform1iv", funcPtr, params__);
		}
void Uniform2f(GL gl_, ParameterTypeTuple!(fp_glUniform2fARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform2fARB)(gl.extFuncs[extensionId__][22]);
			return checkedCall(gl_, "Uniform2f", funcPtr, params__);
		}
void Uniform2fv(GL gl_, ParameterTypeTuple!(fp_glUniform2fvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform2fvARB)(gl.extFuncs[extensionId__][23]);
			return checkedCall(gl_, "Uniform2fv", funcPtr, params__);
		}
void Uniform2i(GL gl_, ParameterTypeTuple!(fp_glUniform2iARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform2iARB)(gl.extFuncs[extensionId__][24]);
			return checkedCall(gl_, "Uniform2i", funcPtr, params__);
		}
void Uniform2iv(GL gl_, ParameterTypeTuple!(fp_glUniform2ivARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform2ivARB)(gl.extFuncs[extensionId__][25]);
			return checkedCall(gl_, "Uniform2iv", funcPtr, params__);
		}
void Uniform3f(GL gl_, ParameterTypeTuple!(fp_glUniform3fARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform3fARB)(gl.extFuncs[extensionId__][26]);
			return checkedCall(gl_, "Uniform3f", funcPtr, params__);
		}
void Uniform3fv(GL gl_, ParameterTypeTuple!(fp_glUniform3fvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform3fvARB)(gl.extFuncs[extensionId__][27]);
			return checkedCall(gl_, "Uniform3fv", funcPtr, params__);
		}
void Uniform3i(GL gl_, ParameterTypeTuple!(fp_glUniform3iARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform3iARB)(gl.extFuncs[extensionId__][28]);
			return checkedCall(gl_, "Uniform3i", funcPtr, params__);
		}
void Uniform3iv(GL gl_, ParameterTypeTuple!(fp_glUniform3ivARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform3ivARB)(gl.extFuncs[extensionId__][29]);
			return checkedCall(gl_, "Uniform3iv", funcPtr, params__);
		}
void Uniform4f(GL gl_, ParameterTypeTuple!(fp_glUniform4fARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform4fARB)(gl.extFuncs[extensionId__][30]);
			return checkedCall(gl_, "Uniform4f", funcPtr, params__);
		}
void Uniform4fv(GL gl_, ParameterTypeTuple!(fp_glUniform4fvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform4fvARB)(gl.extFuncs[extensionId__][31]);
			return checkedCall(gl_, "Uniform4fv", funcPtr, params__);
		}
void Uniform4i(GL gl_, ParameterTypeTuple!(fp_glUniform4iARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform4iARB)(gl.extFuncs[extensionId__][32]);
			return checkedCall(gl_, "Uniform4i", funcPtr, params__);
		}
void Uniform4iv(GL gl_, ParameterTypeTuple!(fp_glUniform4ivARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform4ivARB)(gl.extFuncs[extensionId__][33]);
			return checkedCall(gl_, "Uniform4iv", funcPtr, params__);
		}
void UniformMatrix2fv(GL gl_, ParameterTypeTuple!(fp_glUniformMatrix2fvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniformMatrix2fvARB)(gl.extFuncs[extensionId__][34]);
			return checkedCall(gl_, "UniformMatrix2fv", funcPtr, params__);
		}
void UniformMatrix3fv(GL gl_, ParameterTypeTuple!(fp_glUniformMatrix3fvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniformMatrix3fvARB)(gl.extFuncs[extensionId__][35]);
			return checkedCall(gl_, "UniformMatrix3fv", funcPtr, params__);
		}
void UniformMatrix4fv(GL gl_, ParameterTypeTuple!(fp_glUniformMatrix4fvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniformMatrix4fvARB)(gl.extFuncs[extensionId__][36]);
			return checkedCall(gl_, "UniformMatrix4fv", funcPtr, params__);
		}
void UseProgramObject(GL gl_, ParameterTypeTuple!(fp_glUseProgramObjectARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUseProgramObjectARB)(gl.extFuncs[extensionId__][37]);
			return checkedCall(gl_, "UseProgramObject", funcPtr, params__);
		}
void ValidateProgram(GL gl_, ParameterTypeTuple!(fp_glValidateProgramARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glValidateProgramARB)(gl.extFuncs[extensionId__][38]);
			return checkedCall(gl_, "ValidateProgram", funcPtr, params__);
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
		void*[] funcAddr = new void*[39];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_ARB_shader_objects")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glAttachObjectARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glCompileShaderARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glCreateProgramObjectARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glCreateShaderObjectARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glDeleteObjectARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glDetachObjectARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glGetActiveUniformARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glGetAttachedObjectsARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[8] = getExtensionFuncPtr(cast(char*)"glGetHandleARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[9] = getExtensionFuncPtr(cast(char*)"glGetInfoLogARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[10] = getExtensionFuncPtr(cast(char*)"glGetObjectParameterfvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[11] = getExtensionFuncPtr(cast(char*)"glGetObjectParameterivARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[12] = getExtensionFuncPtr(cast(char*)"glGetShaderSourceARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[13] = getExtensionFuncPtr(cast(char*)"glGetUniformLocationARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[14] = getExtensionFuncPtr(cast(char*)"glGetUniformfvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[15] = getExtensionFuncPtr(cast(char*)"glGetUniformivARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[16] = getExtensionFuncPtr(cast(char*)"glLinkProgramARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[17] = getExtensionFuncPtr(cast(char*)"glShaderSourceARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[18] = getExtensionFuncPtr(cast(char*)"glUniform1fARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[19] = getExtensionFuncPtr(cast(char*)"glUniform1fvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[20] = getExtensionFuncPtr(cast(char*)"glUniform1iARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[21] = getExtensionFuncPtr(cast(char*)"glUniform1ivARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[22] = getExtensionFuncPtr(cast(char*)"glUniform2fARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[23] = getExtensionFuncPtr(cast(char*)"glUniform2fvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[24] = getExtensionFuncPtr(cast(char*)"glUniform2iARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[25] = getExtensionFuncPtr(cast(char*)"glUniform2ivARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[26] = getExtensionFuncPtr(cast(char*)"glUniform3fARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[27] = getExtensionFuncPtr(cast(char*)"glUniform3fvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[28] = getExtensionFuncPtr(cast(char*)"glUniform3iARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[29] = getExtensionFuncPtr(cast(char*)"glUniform3ivARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[30] = getExtensionFuncPtr(cast(char*)"glUniform4fARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[31] = getExtensionFuncPtr(cast(char*)"glUniform4fvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[32] = getExtensionFuncPtr(cast(char*)"glUniform4iARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[33] = getExtensionFuncPtr(cast(char*)"glUniform4ivARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[34] = getExtensionFuncPtr(cast(char*)"glUniformMatrix2fvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[35] = getExtensionFuncPtr(cast(char*)"glUniformMatrix3fvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[36] = getExtensionFuncPtr(cast(char*)"glUniformMatrix4fvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[37] = getExtensionFuncPtr(cast(char*)"glUseProgramObjectARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[38] = getExtensionFuncPtr(cast(char*)"glValidateProgramARB"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
