module dgl.ext.EXT_direct_state_access;
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



private ushort extensionId__ = 70;
alias extensionId__ EXT_direct_state_access;

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
			const GLenum GL_PROGRAM_MATRIX_EXT = 0x8E2D;
			const GLenum GL_TRANSPOSE_PROGRAM_MATRIX_EXT = 0x8E2E;
			const GLenum GL_PROGRAM_MATRIX_STACK_DEPTH_EXT = 0x8E2F;
	}
	private {
		extern (System) {
			alias void function (GLenum texunit, GLenum target, GLuint texture)	fp_glBindMultiTextureEXT;
			alias GLenum function (GLuint framebuffer, GLenum target)	fp_glCheckNamedFramebufferStatusEXT;
			alias void function (GLbitfield mask)	fp_glClientAttribDefaultEXT;
			alias void function (GLenum texunit, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLint border, GLsizei imageSize,  void* data)	fp_glCompressedMultiTexImage1DEXT;
			alias void function (GLenum texunit, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize,  void* data)	fp_glCompressedMultiTexImage2DEXT;
			alias void function (GLenum texunit, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imageSize,  void* data)	fp_glCompressedMultiTexImage3DEXT;
			alias void function (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLsizei imageSize,  void* data)	fp_glCompressedMultiTexSubImage1DEXT;
			alias void function (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize,  void* data)	fp_glCompressedMultiTexSubImage2DEXT;
			alias void function (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize,  void* data)	fp_glCompressedMultiTexSubImage3DEXT;
			alias void function (GLuint texture, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLint border, GLsizei imageSize,  void* data)	fp_glCompressedTextureImage1DEXT;
			alias void function (GLuint texture, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize,  void* data)	fp_glCompressedTextureImage2DEXT;
			alias void function (GLuint texture, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imageSize,  void* data)	fp_glCompressedTextureImage3DEXT;
			alias void function (GLuint texture, GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLsizei imageSize,  void* data)	fp_glCompressedTextureSubImage1DEXT;
			alias void function (GLuint texture, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize,  void* data)	fp_glCompressedTextureSubImage2DEXT;
			alias void function (GLuint texture, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize,  void* data)	fp_glCompressedTextureSubImage3DEXT;
			alias void function (GLenum texunit, GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLint border)	fp_glCopyMultiTexImage1DEXT;
			alias void function (GLenum texunit, GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height, GLint border)	fp_glCopyMultiTexImage2DEXT;
			alias void function (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint x, GLint y, GLsizei width)	fp_glCopyMultiTexSubImage1DEXT;
			alias void function (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height)	fp_glCopyMultiTexSubImage2DEXT;
			alias void function (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height)	fp_glCopyMultiTexSubImage3DEXT;
			alias void function (GLuint texture, GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLint border)	fp_glCopyTextureImage1DEXT;
			alias void function (GLuint texture, GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height, GLint border)	fp_glCopyTextureImage2DEXT;
			alias void function (GLuint texture, GLenum target, GLint level, GLint xoffset, GLint x, GLint y, GLsizei width)	fp_glCopyTextureSubImage1DEXT;
			alias void function (GLuint texture, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height)	fp_glCopyTextureSubImage2DEXT;
			alias void function (GLuint texture, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height)	fp_glCopyTextureSubImage3DEXT;
			alias void function (GLenum array, GLuint index)	fp_glDisableClientStateIndexedEXT;
			alias void function (GLenum array, GLuint index)	fp_glEnableClientStateIndexedEXT;
			alias void function (GLuint framebuffer, GLenum mode)	fp_glFramebufferDrawBufferEXT;
			alias void function (GLuint framebuffer, GLsizei n,  GLenum* bufs)	fp_glFramebufferDrawBuffersEXT;
			alias void function (GLuint framebuffer, GLenum mode)	fp_glFramebufferReadBufferEXT;
			alias void function (GLenum texunit, GLenum target)	fp_glGenerateMultiTexMipmapEXT;
			alias void function (GLuint texture, GLenum target)	fp_glGenerateTextureMipmapEXT;
			alias void function (GLenum texunit, GLenum target, GLint level, void* img)	fp_glGetCompressedMultiTexImageEXT;
			alias void function (GLuint texture, GLenum target, GLint level, void* img)	fp_glGetCompressedTextureImageEXT;
			alias void function (GLenum pname, GLuint index, GLdouble* params)	fp_glGetDoubleIndexedvEXT;
			alias void function (GLenum pname, GLuint index, GLfloat* params)	fp_glGetFloatIndexedvEXT;
			alias void function (GLuint framebuffer, GLenum pname, GLint* param)	fp_glGetFramebufferParameterivEXT;
			alias void function (GLenum texunit, GLenum target, GLenum pname, GLfloat* params)	fp_glGetMultiTexEnvfvEXT;
			alias void function (GLenum texunit, GLenum target, GLenum pname, GLint* params)	fp_glGetMultiTexEnvivEXT;
			alias void function (GLenum texunit, GLenum coord, GLenum pname, GLdouble* params)	fp_glGetMultiTexGendvEXT;
			alias void function (GLenum texunit, GLenum coord, GLenum pname, GLfloat* params)	fp_glGetMultiTexGenfvEXT;
			alias void function (GLenum texunit, GLenum coord, GLenum pname, GLint* params)	fp_glGetMultiTexGenivEXT;
			alias void function (GLenum texunit, GLenum target, GLint level, GLenum format, GLenum type, void* pixels)	fp_glGetMultiTexImageEXT;
			alias void function (GLenum texunit, GLenum target, GLint level, GLenum pname, GLfloat* params)	fp_glGetMultiTexLevelParameterfvEXT;
			alias void function (GLenum texunit, GLenum target, GLint level, GLenum pname, GLint* params)	fp_glGetMultiTexLevelParameterivEXT;
			alias void function (GLenum texunit, GLenum target, GLenum pname, GLint* params)	fp_glGetMultiTexParameterIivEXT;
			alias void function (GLenum texunit, GLenum target, GLenum pname, GLuint* params)	fp_glGetMultiTexParameterIuivEXT;
			alias void function (GLenum texunit, GLenum target, GLenum pname, GLfloat* params)	fp_glGetMultiTexParameterfvEXT;
			alias void function (GLenum texunit, GLenum target, GLenum pname, GLint* params)	fp_glGetMultiTexParameterivEXT;
			alias void function (GLuint buffer, GLenum pname, GLint* params)	fp_glGetNamedBufferParameterivEXT;
			alias void function (GLuint buffer, GLenum pname, void** params)	fp_glGetNamedBufferPointervEXT;
			alias void function (GLuint buffer, GLintptr offset, GLsizeiptr size, void* data)	fp_glGetNamedBufferSubDataEXT;
			alias void function (GLuint framebuffer, GLenum attachment, GLenum pname, GLint* params)	fp_glGetNamedFramebufferAttachmentParameterivEXT;
			alias void function (GLuint program, GLenum target, GLuint index, GLint* params)	fp_glGetNamedProgramLocalParameterIivEXT;
			alias void function (GLuint program, GLenum target, GLuint index, GLuint* params)	fp_glGetNamedProgramLocalParameterIuivEXT;
			alias void function (GLuint program, GLenum target, GLuint index, GLdouble* params)	fp_glGetNamedProgramLocalParameterdvEXT;
			alias void function (GLuint program, GLenum target, GLuint index, GLfloat* params)	fp_glGetNamedProgramLocalParameterfvEXT;
			alias void function (GLuint program, GLenum target, GLenum pname, void* string)	fp_glGetNamedProgramStringEXT;
			alias void function (GLuint program, GLenum target, GLenum pname, GLint* params)	fp_glGetNamedProgramivEXT;
			alias void function (GLuint renderbuffer, GLenum pname, GLint* params)	fp_glGetNamedRenderbufferParameterivEXT;
			alias void function (GLenum pname, GLuint index, GLvoid** params)	fp_glGetPointerIndexedvEXT;
			alias void function (GLuint texture, GLenum target, GLint level, GLenum format, GLenum type, void* pixels)	fp_glGetTextureImageEXT;
			alias void function (GLuint texture, GLenum target, GLint level, GLenum pname, GLfloat* params)	fp_glGetTextureLevelParameterfvEXT;
			alias void function (GLuint texture, GLenum target, GLint level, GLenum pname, GLint* params)	fp_glGetTextureLevelParameterivEXT;
			alias void function (GLuint texture, GLenum target, GLenum pname, GLint* params)	fp_glGetTextureParameterIivEXT;
			alias void function (GLuint texture, GLenum target, GLenum pname, GLuint* params)	fp_glGetTextureParameterIuivEXT;
			alias void function (GLuint texture, GLenum target, GLenum pname, GLfloat* params)	fp_glGetTextureParameterfvEXT;
			alias void function (GLuint texture, GLenum target, GLenum pname, GLint* params)	fp_glGetTextureParameterivEXT;
			alias GLvoid * function (GLuint buffer, GLenum access)	fp_glMapNamedBufferEXT;
			alias void function (GLenum matrixMode, GLdouble l, GLdouble r, GLdouble b, GLdouble t, GLdouble n, GLdouble f)	fp_glMatrixFrustumEXT;
			alias void function (GLenum matrixMode)	fp_glMatrixLoadIdentityEXT;
			alias void function (GLenum matrixMode,  GLdouble* m)	fp_glMatrixLoadTransposedEXT;
			alias void function (GLenum matrixMode,  GLfloat* m)	fp_glMatrixLoadTransposefEXT;
			alias void function (GLenum matrixMode,  GLdouble* m)	fp_glMatrixLoaddEXT;
			alias void function (GLenum matrixMode,  GLfloat* m)	fp_glMatrixLoadfEXT;
			alias void function (GLenum matrixMode,  GLdouble* m)	fp_glMatrixMultTransposedEXT;
			alias void function (GLenum matrixMode,  GLfloat* m)	fp_glMatrixMultTransposefEXT;
			alias void function (GLenum matrixMode,  GLdouble* m)	fp_glMatrixMultdEXT;
			alias void function (GLenum matrixMode,  GLfloat* m)	fp_glMatrixMultfEXT;
			alias void function (GLenum matrixMode, GLdouble l, GLdouble r, GLdouble b, GLdouble t, GLdouble n, GLdouble f)	fp_glMatrixOrthoEXT;
			alias void function (GLenum matrixMode)	fp_glMatrixPopEXT;
			alias void function (GLenum matrixMode)	fp_glMatrixPushEXT;
			alias void function (GLenum matrixMode, GLdouble angle, GLdouble x, GLdouble y, GLdouble z)	fp_glMatrixRotatedEXT;
			alias void function (GLenum matrixMode, GLfloat angle, GLfloat x, GLfloat y, GLfloat z)	fp_glMatrixRotatefEXT;
			alias void function (GLenum matrixMode, GLdouble x, GLdouble y, GLdouble z)	fp_glMatrixScaledEXT;
			alias void function (GLenum matrixMode, GLfloat x, GLfloat y, GLfloat z)	fp_glMatrixScalefEXT;
			alias void function (GLenum matrixMode, GLdouble x, GLdouble y, GLdouble z)	fp_glMatrixTranslatedEXT;
			alias void function (GLenum matrixMode, GLfloat x, GLfloat y, GLfloat z)	fp_glMatrixTranslatefEXT;
			alias void function (GLenum texunit, GLenum target, GLenum internalformat, GLuint buffer)	fp_glMultiTexBufferEXT;
			alias void function (GLenum texunit, GLint size, GLenum type, GLsizei stride,  void* pointer)	fp_glMultiTexCoordPointerEXT;
			alias void function (GLenum texunit, GLenum target, GLenum pname, GLfloat param)	fp_glMultiTexEnvfEXT;
			alias void function (GLenum texunit, GLenum target, GLenum pname,  GLfloat* params)	fp_glMultiTexEnvfvEXT;
			alias void function (GLenum texunit, GLenum target, GLenum pname, GLint param)	fp_glMultiTexEnviEXT;
			alias void function (GLenum texunit, GLenum target, GLenum pname,  GLint* params)	fp_glMultiTexEnvivEXT;
			alias void function (GLenum texunit, GLenum coord, GLenum pname, GLdouble param)	fp_glMultiTexGendEXT;
			alias void function (GLenum texunit, GLenum coord, GLenum pname,  GLdouble* params)	fp_glMultiTexGendvEXT;
			alias void function (GLenum texunit, GLenum coord, GLenum pname, GLfloat param)	fp_glMultiTexGenfEXT;
			alias void function (GLenum texunit, GLenum coord, GLenum pname,  GLfloat* params)	fp_glMultiTexGenfvEXT;
			alias void function (GLenum texunit, GLenum coord, GLenum pname, GLint param)	fp_glMultiTexGeniEXT;
			alias void function (GLenum texunit, GLenum coord, GLenum pname,  GLint* params)	fp_glMultiTexGenivEXT;
			alias void function (GLenum texunit, GLenum target, GLint level, GLint internalformat, GLsizei width, GLint border, GLenum format, GLenum type,  void* pixels)	fp_glMultiTexImage1DEXT;
			alias void function (GLenum texunit, GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type,  void* pixels)	fp_glMultiTexImage2DEXT;
			alias void function (GLenum texunit, GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLenum format, GLenum type,  void* pixels)	fp_glMultiTexImage3DEXT;
			alias void function (GLenum texunit, GLenum target, GLenum pname,  GLint* params)	fp_glMultiTexParameterIivEXT;
			alias void function (GLenum texunit, GLenum target, GLenum pname,  GLuint* params)	fp_glMultiTexParameterIuivEXT;
			alias void function (GLenum texunit, GLenum target, GLenum pname, GLfloat param)	fp_glMultiTexParameterfEXT;
			alias void function (GLenum texunit, GLenum target, GLenum pname,  GLfloat* param)	fp_glMultiTexParameterfvEXT;
			alias void function (GLenum texunit, GLenum target, GLenum pname, GLint param)	fp_glMultiTexParameteriEXT;
			alias void function (GLenum texunit, GLenum target, GLenum pname,  GLint* param)	fp_glMultiTexParameterivEXT;
			alias void function (GLenum texunit, GLenum target, GLuint renderbuffer)	fp_glMultiTexRenderbufferEXT;
			alias void function (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLenum type,  void* pixels)	fp_glMultiTexSubImage1DEXT;
			alias void function (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type,  void* pixels)	fp_glMultiTexSubImage2DEXT;
			alias void function (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type,  void* pixels)	fp_glMultiTexSubImage3DEXT;
			alias void function (GLuint buffer, GLsizeiptr size,  void* data, GLenum usage)	fp_glNamedBufferDataEXT;
			alias void function (GLuint buffer, GLintptr offset, GLsizeiptr size,  void* data)	fp_glNamedBufferSubDataEXT;
			alias void function (GLuint framebuffer, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer)	fp_glNamedFramebufferRenderbufferEXT;
			alias void function (GLuint framebuffer, GLenum attachment, GLenum textarget, GLuint texture, GLint level)	fp_glNamedFramebufferTexture1DEXT;
			alias void function (GLuint framebuffer, GLenum attachment, GLenum textarget, GLuint texture, GLint level)	fp_glNamedFramebufferTexture2DEXT;
			alias void function (GLuint framebuffer, GLenum attachment, GLenum textarget, GLuint texture, GLint level, GLint zoffset)	fp_glNamedFramebufferTexture3DEXT;
			alias void function (GLuint framebuffer, GLenum attachment, GLuint texture, GLint level)	fp_glNamedFramebufferTextureEXT;
			alias void function (GLuint framebuffer, GLenum attachment, GLuint texture, GLint level, GLenum face)	fp_glNamedFramebufferTextureFaceEXT;
			alias void function (GLuint framebuffer, GLenum attachment, GLuint texture, GLint level, GLint layer)	fp_glNamedFramebufferTextureLayerEXT;
			alias void function (GLuint program, GLenum target, GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w)	fp_glNamedProgramLocalParameter4dEXT;
			alias void function (GLuint program, GLenum target, GLuint index,  GLdouble* params)	fp_glNamedProgramLocalParameter4dvEXT;
			alias void function (GLuint program, GLenum target, GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w)	fp_glNamedProgramLocalParameter4fEXT;
			alias void function (GLuint program, GLenum target, GLuint index,  GLfloat* params)	fp_glNamedProgramLocalParameter4fvEXT;
			alias void function (GLuint program, GLenum target, GLuint index, GLint x, GLint y, GLint z, GLint w)	fp_glNamedProgramLocalParameterI4iEXT;
			alias void function (GLuint program, GLenum target, GLuint index,  GLint* params)	fp_glNamedProgramLocalParameterI4ivEXT;
			alias void function (GLuint program, GLenum target, GLuint index, GLuint x, GLuint y, GLuint z, GLuint w)	fp_glNamedProgramLocalParameterI4uiEXT;
			alias void function (GLuint program, GLenum target, GLuint index,  GLuint* params)	fp_glNamedProgramLocalParameterI4uivEXT;
			alias void function (GLuint program, GLenum target, GLuint index, GLsizei count,  GLfloat* params)	fp_glNamedProgramLocalParameters4fvEXT;
			alias void function (GLuint program, GLenum target, GLuint index, GLsizei count,  GLint* params)	fp_glNamedProgramLocalParametersI4ivEXT;
			alias void function (GLuint program, GLenum target, GLuint index, GLsizei count,  GLuint* params)	fp_glNamedProgramLocalParametersI4uivEXT;
			alias void function (GLuint program, GLenum target, GLenum format, GLsizei len,  void* string)	fp_glNamedProgramStringEXT;
			alias void function (GLuint renderbuffer, GLenum internalformat, GLsizei width, GLsizei height)	fp_glNamedRenderbufferStorageEXT;
			alias void function (GLuint renderbuffer, GLsizei coverageSamples, GLsizei colorSamples, GLenum internalformat, GLsizei width, GLsizei height)	fp_glNamedRenderbufferStorageMultisampleCoverageEXT;
			alias void function (GLuint renderbuffer, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height)	fp_glNamedRenderbufferStorageMultisampleEXT;
			alias void function (GLuint program, GLint location, GLfloat v0)	fp_glProgramUniform1fEXT;
			alias void function (GLuint program, GLint location, GLsizei count,  GLfloat* value)	fp_glProgramUniform1fvEXT;
			alias void function (GLuint program, GLint location, GLint v0)	fp_glProgramUniform1iEXT;
			alias void function (GLuint program, GLint location, GLsizei count,  GLint* value)	fp_glProgramUniform1ivEXT;
			alias void function (GLuint program, GLint location, GLuint v0)	fp_glProgramUniform1uiEXT;
			alias void function (GLuint program, GLint location, GLsizei count,  GLuint* value)	fp_glProgramUniform1uivEXT;
			alias void function (GLuint program, GLint location, GLfloat v0, GLfloat v1)	fp_glProgramUniform2fEXT;
			alias void function (GLuint program, GLint location, GLsizei count,  GLfloat* value)	fp_glProgramUniform2fvEXT;
			alias void function (GLuint program, GLint location, GLint v0, GLint v1)	fp_glProgramUniform2iEXT;
			alias void function (GLuint program, GLint location, GLsizei count,  GLint* value)	fp_glProgramUniform2ivEXT;
			alias void function (GLuint program, GLint location, GLuint v0, GLuint v1)	fp_glProgramUniform2uiEXT;
			alias void function (GLuint program, GLint location, GLsizei count,  GLuint* value)	fp_glProgramUniform2uivEXT;
			alias void function (GLuint program, GLint location, GLfloat v0, GLfloat v1, GLfloat v2)	fp_glProgramUniform3fEXT;
			alias void function (GLuint program, GLint location, GLsizei count,  GLfloat* value)	fp_glProgramUniform3fvEXT;
			alias void function (GLuint program, GLint location, GLint v0, GLint v1, GLint v2)	fp_glProgramUniform3iEXT;
			alias void function (GLuint program, GLint location, GLsizei count,  GLint* value)	fp_glProgramUniform3ivEXT;
			alias void function (GLuint program, GLint location, GLuint v0, GLuint v1, GLuint v2)	fp_glProgramUniform3uiEXT;
			alias void function (GLuint program, GLint location, GLsizei count,  GLuint* value)	fp_glProgramUniform3uivEXT;
			alias void function (GLuint program, GLint location, GLfloat v0, GLfloat v1, GLfloat v2, GLfloat v3)	fp_glProgramUniform4fEXT;
			alias void function (GLuint program, GLint location, GLsizei count,  GLfloat* value)	fp_glProgramUniform4fvEXT;
			alias void function (GLuint program, GLint location, GLint v0, GLint v1, GLint v2, GLint v3)	fp_glProgramUniform4iEXT;
			alias void function (GLuint program, GLint location, GLsizei count,  GLint* value)	fp_glProgramUniform4ivEXT;
			alias void function (GLuint program, GLint location, GLuint v0, GLuint v1, GLuint v2, GLuint v3)	fp_glProgramUniform4uiEXT;
			alias void function (GLuint program, GLint location, GLsizei count,  GLuint* value)	fp_glProgramUniform4uivEXT;
			alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose,  GLfloat* value)	fp_glProgramUniformMatrix2fvEXT;
			alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose,  GLfloat* value)	fp_glProgramUniformMatrix2x3fvEXT;
			alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose,  GLfloat* value)	fp_glProgramUniformMatrix2x4fvEXT;
			alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose,  GLfloat* value)	fp_glProgramUniformMatrix3fvEXT;
			alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose,  GLfloat* value)	fp_glProgramUniformMatrix3x2fvEXT;
			alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose,  GLfloat* value)	fp_glProgramUniformMatrix3x4fvEXT;
			alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose,  GLfloat* value)	fp_glProgramUniformMatrix4fvEXT;
			alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose,  GLfloat* value)	fp_glProgramUniformMatrix4x2fvEXT;
			alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose,  GLfloat* value)	fp_glProgramUniformMatrix4x3fvEXT;
			alias void function (GLbitfield mask)	fp_glPushClientAttribDefaultEXT;
			alias void function (GLuint texture, GLenum target, GLenum internalformat, GLuint buffer)	fp_glTextureBufferEXT;
			alias void function (GLuint texture, GLenum target, GLint level, GLint internalformat, GLsizei width, GLint border, GLenum format, GLenum type,  void* pixels)	fp_glTextureImage1DEXT;
			alias void function (GLuint texture, GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type,  void* pixels)	fp_glTextureImage2DEXT;
			alias void function (GLuint texture, GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLenum format, GLenum type,  void* pixels)	fp_glTextureImage3DEXT;
			alias void function (GLuint texture, GLenum target, GLenum pname,  GLint* params)	fp_glTextureParameterIivEXT;
			alias void function (GLuint texture, GLenum target, GLenum pname,  GLuint* params)	fp_glTextureParameterIuivEXT;
			alias void function (GLuint texture, GLenum target, GLenum pname, GLfloat param)	fp_glTextureParameterfEXT;
			alias void function (GLuint texture, GLenum target, GLenum pname,  GLfloat* param)	fp_glTextureParameterfvEXT;
			alias void function (GLuint texture, GLenum target, GLenum pname, GLint param)	fp_glTextureParameteriEXT;
			alias void function (GLuint texture, GLenum target, GLenum pname,  GLint* param)	fp_glTextureParameterivEXT;
			alias void function (GLuint texture, GLenum target, GLuint renderbuffer)	fp_glTextureRenderbufferEXT;
			alias void function (GLuint texture, GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLenum type,  void* pixels)	fp_glTextureSubImage1DEXT;
			alias void function (GLuint texture, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type,  void* pixels)	fp_glTextureSubImage2DEXT;
			alias void function (GLuint texture, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type,  void* pixels)	fp_glTextureSubImage3DEXT;
			alias GLboolean function (GLuint buffer)	fp_glUnmapNamedBufferEXT;
		}
	}
	public {
void BindMultiTexture(GL gl_, ParameterTypeTuple!(fp_glBindMultiTextureEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBindMultiTextureEXT)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "BindMultiTexture", funcPtr, params__);
		}
GLenum CheckNamedFramebufferStatus(GL gl_, ParameterTypeTuple!(fp_glCheckNamedFramebufferStatusEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCheckNamedFramebufferStatusEXT)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "CheckNamedFramebufferStatus", funcPtr, params__);
		}
void ClientAttribDefault(GL gl_, ParameterTypeTuple!(fp_glClientAttribDefaultEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glClientAttribDefaultEXT)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "ClientAttribDefault", funcPtr, params__);
		}
void CompressedMultiTexImage1D(GL gl_, ParameterTypeTuple!(fp_glCompressedMultiTexImage1DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCompressedMultiTexImage1DEXT)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "CompressedMultiTexImage1D", funcPtr, params__);
		}
void CompressedMultiTexImage2D(GL gl_, ParameterTypeTuple!(fp_glCompressedMultiTexImage2DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCompressedMultiTexImage2DEXT)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "CompressedMultiTexImage2D", funcPtr, params__);
		}
void CompressedMultiTexImage3D(GL gl_, ParameterTypeTuple!(fp_glCompressedMultiTexImage3DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCompressedMultiTexImage3DEXT)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "CompressedMultiTexImage3D", funcPtr, params__);
		}
void CompressedMultiTexSubImage1D(GL gl_, ParameterTypeTuple!(fp_glCompressedMultiTexSubImage1DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCompressedMultiTexSubImage1DEXT)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "CompressedMultiTexSubImage1D", funcPtr, params__);
		}
void CompressedMultiTexSubImage2D(GL gl_, ParameterTypeTuple!(fp_glCompressedMultiTexSubImage2DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCompressedMultiTexSubImage2DEXT)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "CompressedMultiTexSubImage2D", funcPtr, params__);
		}
void CompressedMultiTexSubImage3D(GL gl_, ParameterTypeTuple!(fp_glCompressedMultiTexSubImage3DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCompressedMultiTexSubImage3DEXT)(gl.extFuncs[extensionId__][8]);
			return checkedCall(gl_, "CompressedMultiTexSubImage3D", funcPtr, params__);
		}
void CompressedTextureImage1D(GL gl_, ParameterTypeTuple!(fp_glCompressedTextureImage1DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCompressedTextureImage1DEXT)(gl.extFuncs[extensionId__][9]);
			return checkedCall(gl_, "CompressedTextureImage1D", funcPtr, params__);
		}
void CompressedTextureImage2D(GL gl_, ParameterTypeTuple!(fp_glCompressedTextureImage2DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCompressedTextureImage2DEXT)(gl.extFuncs[extensionId__][10]);
			return checkedCall(gl_, "CompressedTextureImage2D", funcPtr, params__);
		}
void CompressedTextureImage3D(GL gl_, ParameterTypeTuple!(fp_glCompressedTextureImage3DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCompressedTextureImage3DEXT)(gl.extFuncs[extensionId__][11]);
			return checkedCall(gl_, "CompressedTextureImage3D", funcPtr, params__);
		}
void CompressedTextureSubImage1D(GL gl_, ParameterTypeTuple!(fp_glCompressedTextureSubImage1DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCompressedTextureSubImage1DEXT)(gl.extFuncs[extensionId__][12]);
			return checkedCall(gl_, "CompressedTextureSubImage1D", funcPtr, params__);
		}
void CompressedTextureSubImage2D(GL gl_, ParameterTypeTuple!(fp_glCompressedTextureSubImage2DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCompressedTextureSubImage2DEXT)(gl.extFuncs[extensionId__][13]);
			return checkedCall(gl_, "CompressedTextureSubImage2D", funcPtr, params__);
		}
void CompressedTextureSubImage3D(GL gl_, ParameterTypeTuple!(fp_glCompressedTextureSubImage3DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCompressedTextureSubImage3DEXT)(gl.extFuncs[extensionId__][14]);
			return checkedCall(gl_, "CompressedTextureSubImage3D", funcPtr, params__);
		}
void CopyMultiTexImage1D(GL gl_, ParameterTypeTuple!(fp_glCopyMultiTexImage1DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCopyMultiTexImage1DEXT)(gl.extFuncs[extensionId__][15]);
			return checkedCall(gl_, "CopyMultiTexImage1D", funcPtr, params__);
		}
void CopyMultiTexImage2D(GL gl_, ParameterTypeTuple!(fp_glCopyMultiTexImage2DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCopyMultiTexImage2DEXT)(gl.extFuncs[extensionId__][16]);
			return checkedCall(gl_, "CopyMultiTexImage2D", funcPtr, params__);
		}
void CopyMultiTexSubImage1D(GL gl_, ParameterTypeTuple!(fp_glCopyMultiTexSubImage1DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCopyMultiTexSubImage1DEXT)(gl.extFuncs[extensionId__][17]);
			return checkedCall(gl_, "CopyMultiTexSubImage1D", funcPtr, params__);
		}
void CopyMultiTexSubImage2D(GL gl_, ParameterTypeTuple!(fp_glCopyMultiTexSubImage2DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCopyMultiTexSubImage2DEXT)(gl.extFuncs[extensionId__][18]);
			return checkedCall(gl_, "CopyMultiTexSubImage2D", funcPtr, params__);
		}
void CopyMultiTexSubImage3D(GL gl_, ParameterTypeTuple!(fp_glCopyMultiTexSubImage3DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCopyMultiTexSubImage3DEXT)(gl.extFuncs[extensionId__][19]);
			return checkedCall(gl_, "CopyMultiTexSubImage3D", funcPtr, params__);
		}
void CopyTextureImage1D(GL gl_, ParameterTypeTuple!(fp_glCopyTextureImage1DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCopyTextureImage1DEXT)(gl.extFuncs[extensionId__][20]);
			return checkedCall(gl_, "CopyTextureImage1D", funcPtr, params__);
		}
void CopyTextureImage2D(GL gl_, ParameterTypeTuple!(fp_glCopyTextureImage2DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCopyTextureImage2DEXT)(gl.extFuncs[extensionId__][21]);
			return checkedCall(gl_, "CopyTextureImage2D", funcPtr, params__);
		}
void CopyTextureSubImage1D(GL gl_, ParameterTypeTuple!(fp_glCopyTextureSubImage1DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCopyTextureSubImage1DEXT)(gl.extFuncs[extensionId__][22]);
			return checkedCall(gl_, "CopyTextureSubImage1D", funcPtr, params__);
		}
void CopyTextureSubImage2D(GL gl_, ParameterTypeTuple!(fp_glCopyTextureSubImage2DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCopyTextureSubImage2DEXT)(gl.extFuncs[extensionId__][23]);
			return checkedCall(gl_, "CopyTextureSubImage2D", funcPtr, params__);
		}
void CopyTextureSubImage3D(GL gl_, ParameterTypeTuple!(fp_glCopyTextureSubImage3DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCopyTextureSubImage3DEXT)(gl.extFuncs[extensionId__][24]);
			return checkedCall(gl_, "CopyTextureSubImage3D", funcPtr, params__);
		}
void DisableClientStateIndexed(GL gl_, ParameterTypeTuple!(fp_glDisableClientStateIndexedEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDisableClientStateIndexedEXT)(gl.extFuncs[extensionId__][25]);
			return checkedCall(gl_, "DisableClientStateIndexed", funcPtr, params__);
		}
void EnableClientStateIndexed(GL gl_, ParameterTypeTuple!(fp_glEnableClientStateIndexedEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glEnableClientStateIndexedEXT)(gl.extFuncs[extensionId__][26]);
			return checkedCall(gl_, "EnableClientStateIndexed", funcPtr, params__);
		}
void FramebufferDrawBuffer(GL gl_, ParameterTypeTuple!(fp_glFramebufferDrawBufferEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFramebufferDrawBufferEXT)(gl.extFuncs[extensionId__][27]);
			return checkedCall(gl_, "FramebufferDrawBuffer", funcPtr, params__);
		}
void FramebufferDrawBuffers(GL gl_, ParameterTypeTuple!(fp_glFramebufferDrawBuffersEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFramebufferDrawBuffersEXT)(gl.extFuncs[extensionId__][28]);
			return checkedCall(gl_, "FramebufferDrawBuffers", funcPtr, params__);
		}
void FramebufferReadBuffer(GL gl_, ParameterTypeTuple!(fp_glFramebufferReadBufferEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFramebufferReadBufferEXT)(gl.extFuncs[extensionId__][29]);
			return checkedCall(gl_, "FramebufferReadBuffer", funcPtr, params__);
		}
void GenerateMultiTexMipmap(GL gl_, ParameterTypeTuple!(fp_glGenerateMultiTexMipmapEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGenerateMultiTexMipmapEXT)(gl.extFuncs[extensionId__][30]);
			return checkedCall(gl_, "GenerateMultiTexMipmap", funcPtr, params__);
		}
void GenerateTextureMipmap(GL gl_, ParameterTypeTuple!(fp_glGenerateTextureMipmapEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGenerateTextureMipmapEXT)(gl.extFuncs[extensionId__][31]);
			return checkedCall(gl_, "GenerateTextureMipmap", funcPtr, params__);
		}
void GetCompressedMultiTexImage(GL gl_, ParameterTypeTuple!(fp_glGetCompressedMultiTexImageEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetCompressedMultiTexImageEXT)(gl.extFuncs[extensionId__][32]);
			return checkedCall(gl_, "GetCompressedMultiTexImage", funcPtr, params__);
		}
void GetCompressedTextureImage(GL gl_, ParameterTypeTuple!(fp_glGetCompressedTextureImageEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetCompressedTextureImageEXT)(gl.extFuncs[extensionId__][33]);
			return checkedCall(gl_, "GetCompressedTextureImage", funcPtr, params__);
		}
void GetDoubleIndexedv(GL gl_, ParameterTypeTuple!(fp_glGetDoubleIndexedvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetDoubleIndexedvEXT)(gl.extFuncs[extensionId__][34]);
			return checkedCall(gl_, "GetDoubleIndexedv", funcPtr, params__);
		}
void GetFloatIndexedv(GL gl_, ParameterTypeTuple!(fp_glGetFloatIndexedvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetFloatIndexedvEXT)(gl.extFuncs[extensionId__][35]);
			return checkedCall(gl_, "GetFloatIndexedv", funcPtr, params__);
		}
void GetFramebufferParameteriv(GL gl_, ParameterTypeTuple!(fp_glGetFramebufferParameterivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetFramebufferParameterivEXT)(gl.extFuncs[extensionId__][36]);
			return checkedCall(gl_, "GetFramebufferParameteriv", funcPtr, params__);
		}
void GetMultiTexEnvfv(GL gl_, ParameterTypeTuple!(fp_glGetMultiTexEnvfvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetMultiTexEnvfvEXT)(gl.extFuncs[extensionId__][37]);
			return checkedCall(gl_, "GetMultiTexEnvfv", funcPtr, params__);
		}
void GetMultiTexEnviv(GL gl_, ParameterTypeTuple!(fp_glGetMultiTexEnvivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetMultiTexEnvivEXT)(gl.extFuncs[extensionId__][38]);
			return checkedCall(gl_, "GetMultiTexEnviv", funcPtr, params__);
		}
void GetMultiTexGendv(GL gl_, ParameterTypeTuple!(fp_glGetMultiTexGendvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetMultiTexGendvEXT)(gl.extFuncs[extensionId__][39]);
			return checkedCall(gl_, "GetMultiTexGendv", funcPtr, params__);
		}
void GetMultiTexGenfv(GL gl_, ParameterTypeTuple!(fp_glGetMultiTexGenfvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetMultiTexGenfvEXT)(gl.extFuncs[extensionId__][40]);
			return checkedCall(gl_, "GetMultiTexGenfv", funcPtr, params__);
		}
void GetMultiTexGeniv(GL gl_, ParameterTypeTuple!(fp_glGetMultiTexGenivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetMultiTexGenivEXT)(gl.extFuncs[extensionId__][41]);
			return checkedCall(gl_, "GetMultiTexGeniv", funcPtr, params__);
		}
void GetMultiTexImage(GL gl_, ParameterTypeTuple!(fp_glGetMultiTexImageEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetMultiTexImageEXT)(gl.extFuncs[extensionId__][42]);
			return checkedCall(gl_, "GetMultiTexImage", funcPtr, params__);
		}
void GetMultiTexLevelParameterfv(GL gl_, ParameterTypeTuple!(fp_glGetMultiTexLevelParameterfvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetMultiTexLevelParameterfvEXT)(gl.extFuncs[extensionId__][43]);
			return checkedCall(gl_, "GetMultiTexLevelParameterfv", funcPtr, params__);
		}
void GetMultiTexLevelParameteriv(GL gl_, ParameterTypeTuple!(fp_glGetMultiTexLevelParameterivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetMultiTexLevelParameterivEXT)(gl.extFuncs[extensionId__][44]);
			return checkedCall(gl_, "GetMultiTexLevelParameteriv", funcPtr, params__);
		}
void GetMultiTexParameterIiv(GL gl_, ParameterTypeTuple!(fp_glGetMultiTexParameterIivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetMultiTexParameterIivEXT)(gl.extFuncs[extensionId__][45]);
			return checkedCall(gl_, "GetMultiTexParameterIiv", funcPtr, params__);
		}
void GetMultiTexParameterIuiv(GL gl_, ParameterTypeTuple!(fp_glGetMultiTexParameterIuivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetMultiTexParameterIuivEXT)(gl.extFuncs[extensionId__][46]);
			return checkedCall(gl_, "GetMultiTexParameterIuiv", funcPtr, params__);
		}
void GetMultiTexParameterfv(GL gl_, ParameterTypeTuple!(fp_glGetMultiTexParameterfvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetMultiTexParameterfvEXT)(gl.extFuncs[extensionId__][47]);
			return checkedCall(gl_, "GetMultiTexParameterfv", funcPtr, params__);
		}
void GetMultiTexParameteriv(GL gl_, ParameterTypeTuple!(fp_glGetMultiTexParameterivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetMultiTexParameterivEXT)(gl.extFuncs[extensionId__][48]);
			return checkedCall(gl_, "GetMultiTexParameteriv", funcPtr, params__);
		}
void GetNamedBufferParameteriv(GL gl_, ParameterTypeTuple!(fp_glGetNamedBufferParameterivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetNamedBufferParameterivEXT)(gl.extFuncs[extensionId__][49]);
			return checkedCall(gl_, "GetNamedBufferParameteriv", funcPtr, params__);
		}
void GetNamedBufferPointerv(GL gl_, ParameterTypeTuple!(fp_glGetNamedBufferPointervEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetNamedBufferPointervEXT)(gl.extFuncs[extensionId__][50]);
			return checkedCall(gl_, "GetNamedBufferPointerv", funcPtr, params__);
		}
void GetNamedBufferSubData(GL gl_, ParameterTypeTuple!(fp_glGetNamedBufferSubDataEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetNamedBufferSubDataEXT)(gl.extFuncs[extensionId__][51]);
			return checkedCall(gl_, "GetNamedBufferSubData", funcPtr, params__);
		}
void GetNamedFramebufferAttachmentParameteriv(GL gl_, ParameterTypeTuple!(fp_glGetNamedFramebufferAttachmentParameterivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetNamedFramebufferAttachmentParameterivEXT)(gl.extFuncs[extensionId__][52]);
			return checkedCall(gl_, "GetNamedFramebufferAttachmentParameteriv", funcPtr, params__);
		}
void GetNamedProgramLocalParameterIiv(GL gl_, ParameterTypeTuple!(fp_glGetNamedProgramLocalParameterIivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetNamedProgramLocalParameterIivEXT)(gl.extFuncs[extensionId__][53]);
			return checkedCall(gl_, "GetNamedProgramLocalParameterIiv", funcPtr, params__);
		}
void GetNamedProgramLocalParameterIuiv(GL gl_, ParameterTypeTuple!(fp_glGetNamedProgramLocalParameterIuivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetNamedProgramLocalParameterIuivEXT)(gl.extFuncs[extensionId__][54]);
			return checkedCall(gl_, "GetNamedProgramLocalParameterIuiv", funcPtr, params__);
		}
void GetNamedProgramLocalParameterdv(GL gl_, ParameterTypeTuple!(fp_glGetNamedProgramLocalParameterdvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetNamedProgramLocalParameterdvEXT)(gl.extFuncs[extensionId__][55]);
			return checkedCall(gl_, "GetNamedProgramLocalParameterdv", funcPtr, params__);
		}
void GetNamedProgramLocalParameterfv(GL gl_, ParameterTypeTuple!(fp_glGetNamedProgramLocalParameterfvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetNamedProgramLocalParameterfvEXT)(gl.extFuncs[extensionId__][56]);
			return checkedCall(gl_, "GetNamedProgramLocalParameterfv", funcPtr, params__);
		}
void GetNamedProgramString(GL gl_, ParameterTypeTuple!(fp_glGetNamedProgramStringEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetNamedProgramStringEXT)(gl.extFuncs[extensionId__][57]);
			return checkedCall(gl_, "GetNamedProgramString", funcPtr, params__);
		}
void GetNamedProgramiv(GL gl_, ParameterTypeTuple!(fp_glGetNamedProgramivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetNamedProgramivEXT)(gl.extFuncs[extensionId__][58]);
			return checkedCall(gl_, "GetNamedProgramiv", funcPtr, params__);
		}
void GetNamedRenderbufferParameteriv(GL gl_, ParameterTypeTuple!(fp_glGetNamedRenderbufferParameterivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetNamedRenderbufferParameterivEXT)(gl.extFuncs[extensionId__][59]);
			return checkedCall(gl_, "GetNamedRenderbufferParameteriv", funcPtr, params__);
		}
void GetPointerIndexedv(GL gl_, ParameterTypeTuple!(fp_glGetPointerIndexedvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetPointerIndexedvEXT)(gl.extFuncs[extensionId__][60]);
			return checkedCall(gl_, "GetPointerIndexedv", funcPtr, params__);
		}
void GetTextureImage(GL gl_, ParameterTypeTuple!(fp_glGetTextureImageEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetTextureImageEXT)(gl.extFuncs[extensionId__][61]);
			return checkedCall(gl_, "GetTextureImage", funcPtr, params__);
		}
void GetTextureLevelParameterfv(GL gl_, ParameterTypeTuple!(fp_glGetTextureLevelParameterfvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetTextureLevelParameterfvEXT)(gl.extFuncs[extensionId__][62]);
			return checkedCall(gl_, "GetTextureLevelParameterfv", funcPtr, params__);
		}
void GetTextureLevelParameteriv(GL gl_, ParameterTypeTuple!(fp_glGetTextureLevelParameterivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetTextureLevelParameterivEXT)(gl.extFuncs[extensionId__][63]);
			return checkedCall(gl_, "GetTextureLevelParameteriv", funcPtr, params__);
		}
void GetTextureParameterIiv(GL gl_, ParameterTypeTuple!(fp_glGetTextureParameterIivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetTextureParameterIivEXT)(gl.extFuncs[extensionId__][64]);
			return checkedCall(gl_, "GetTextureParameterIiv", funcPtr, params__);
		}
void GetTextureParameterIuiv(GL gl_, ParameterTypeTuple!(fp_glGetTextureParameterIuivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetTextureParameterIuivEXT)(gl.extFuncs[extensionId__][65]);
			return checkedCall(gl_, "GetTextureParameterIuiv", funcPtr, params__);
		}
void GetTextureParameterfv(GL gl_, ParameterTypeTuple!(fp_glGetTextureParameterfvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetTextureParameterfvEXT)(gl.extFuncs[extensionId__][66]);
			return checkedCall(gl_, "GetTextureParameterfv", funcPtr, params__);
		}
void GetTextureParameteriv(GL gl_, ParameterTypeTuple!(fp_glGetTextureParameterivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetTextureParameterivEXT)(gl.extFuncs[extensionId__][67]);
			return checkedCall(gl_, "GetTextureParameteriv", funcPtr, params__);
		}
GLvoid * MapNamedBuffer(GL gl_, ParameterTypeTuple!(fp_glMapNamedBufferEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMapNamedBufferEXT)(gl.extFuncs[extensionId__][68]);
			return checkedCall(gl_, "MapNamedBuffer", funcPtr, params__);
		}
void MatrixFrustum(GL gl_, ParameterTypeTuple!(fp_glMatrixFrustumEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMatrixFrustumEXT)(gl.extFuncs[extensionId__][69]);
			return checkedCall(gl_, "MatrixFrustum", funcPtr, params__);
		}
void MatrixLoadIdentity(GL gl_, ParameterTypeTuple!(fp_glMatrixLoadIdentityEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMatrixLoadIdentityEXT)(gl.extFuncs[extensionId__][70]);
			return checkedCall(gl_, "MatrixLoadIdentity", funcPtr, params__);
		}
void MatrixLoadTransposed(GL gl_, ParameterTypeTuple!(fp_glMatrixLoadTransposedEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMatrixLoadTransposedEXT)(gl.extFuncs[extensionId__][71]);
			return checkedCall(gl_, "MatrixLoadTransposed", funcPtr, params__);
		}
void MatrixLoadTransposef(GL gl_, ParameterTypeTuple!(fp_glMatrixLoadTransposefEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMatrixLoadTransposefEXT)(gl.extFuncs[extensionId__][72]);
			return checkedCall(gl_, "MatrixLoadTransposef", funcPtr, params__);
		}
void MatrixLoadd(GL gl_, ParameterTypeTuple!(fp_glMatrixLoaddEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMatrixLoaddEXT)(gl.extFuncs[extensionId__][73]);
			return checkedCall(gl_, "MatrixLoadd", funcPtr, params__);
		}
void MatrixLoadf(GL gl_, ParameterTypeTuple!(fp_glMatrixLoadfEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMatrixLoadfEXT)(gl.extFuncs[extensionId__][74]);
			return checkedCall(gl_, "MatrixLoadf", funcPtr, params__);
		}
void MatrixMultTransposed(GL gl_, ParameterTypeTuple!(fp_glMatrixMultTransposedEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMatrixMultTransposedEXT)(gl.extFuncs[extensionId__][75]);
			return checkedCall(gl_, "MatrixMultTransposed", funcPtr, params__);
		}
void MatrixMultTransposef(GL gl_, ParameterTypeTuple!(fp_glMatrixMultTransposefEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMatrixMultTransposefEXT)(gl.extFuncs[extensionId__][76]);
			return checkedCall(gl_, "MatrixMultTransposef", funcPtr, params__);
		}
void MatrixMultd(GL gl_, ParameterTypeTuple!(fp_glMatrixMultdEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMatrixMultdEXT)(gl.extFuncs[extensionId__][77]);
			return checkedCall(gl_, "MatrixMultd", funcPtr, params__);
		}
void MatrixMultf(GL gl_, ParameterTypeTuple!(fp_glMatrixMultfEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMatrixMultfEXT)(gl.extFuncs[extensionId__][78]);
			return checkedCall(gl_, "MatrixMultf", funcPtr, params__);
		}
void MatrixOrtho(GL gl_, ParameterTypeTuple!(fp_glMatrixOrthoEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMatrixOrthoEXT)(gl.extFuncs[extensionId__][79]);
			return checkedCall(gl_, "MatrixOrtho", funcPtr, params__);
		}
void MatrixPop(GL gl_, ParameterTypeTuple!(fp_glMatrixPopEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMatrixPopEXT)(gl.extFuncs[extensionId__][80]);
			return checkedCall(gl_, "MatrixPop", funcPtr, params__);
		}
void MatrixPush(GL gl_, ParameterTypeTuple!(fp_glMatrixPushEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMatrixPushEXT)(gl.extFuncs[extensionId__][81]);
			return checkedCall(gl_, "MatrixPush", funcPtr, params__);
		}
void MatrixRotated(GL gl_, ParameterTypeTuple!(fp_glMatrixRotatedEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMatrixRotatedEXT)(gl.extFuncs[extensionId__][82]);
			return checkedCall(gl_, "MatrixRotated", funcPtr, params__);
		}
void MatrixRotatef(GL gl_, ParameterTypeTuple!(fp_glMatrixRotatefEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMatrixRotatefEXT)(gl.extFuncs[extensionId__][83]);
			return checkedCall(gl_, "MatrixRotatef", funcPtr, params__);
		}
void MatrixScaled(GL gl_, ParameterTypeTuple!(fp_glMatrixScaledEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMatrixScaledEXT)(gl.extFuncs[extensionId__][84]);
			return checkedCall(gl_, "MatrixScaled", funcPtr, params__);
		}
void MatrixScalef(GL gl_, ParameterTypeTuple!(fp_glMatrixScalefEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMatrixScalefEXT)(gl.extFuncs[extensionId__][85]);
			return checkedCall(gl_, "MatrixScalef", funcPtr, params__);
		}
void MatrixTranslated(GL gl_, ParameterTypeTuple!(fp_glMatrixTranslatedEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMatrixTranslatedEXT)(gl.extFuncs[extensionId__][86]);
			return checkedCall(gl_, "MatrixTranslated", funcPtr, params__);
		}
void MatrixTranslatef(GL gl_, ParameterTypeTuple!(fp_glMatrixTranslatefEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMatrixTranslatefEXT)(gl.extFuncs[extensionId__][87]);
			return checkedCall(gl_, "MatrixTranslatef", funcPtr, params__);
		}
void MultiTexBuffer(GL gl_, ParameterTypeTuple!(fp_glMultiTexBufferEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexBufferEXT)(gl.extFuncs[extensionId__][88]);
			return checkedCall(gl_, "MultiTexBuffer", funcPtr, params__);
		}
void MultiTexCoordPointer(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoordPointerEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoordPointerEXT)(gl.extFuncs[extensionId__][89]);
			return checkedCall(gl_, "MultiTexCoordPointer", funcPtr, params__);
		}
void MultiTexEnvf(GL gl_, ParameterTypeTuple!(fp_glMultiTexEnvfEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexEnvfEXT)(gl.extFuncs[extensionId__][90]);
			return checkedCall(gl_, "MultiTexEnvf", funcPtr, params__);
		}
void MultiTexEnvfv(GL gl_, ParameterTypeTuple!(fp_glMultiTexEnvfvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexEnvfvEXT)(gl.extFuncs[extensionId__][91]);
			return checkedCall(gl_, "MultiTexEnvfv", funcPtr, params__);
		}
void MultiTexEnvi(GL gl_, ParameterTypeTuple!(fp_glMultiTexEnviEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexEnviEXT)(gl.extFuncs[extensionId__][92]);
			return checkedCall(gl_, "MultiTexEnvi", funcPtr, params__);
		}
void MultiTexEnviv(GL gl_, ParameterTypeTuple!(fp_glMultiTexEnvivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexEnvivEXT)(gl.extFuncs[extensionId__][93]);
			return checkedCall(gl_, "MultiTexEnviv", funcPtr, params__);
		}
void MultiTexGend(GL gl_, ParameterTypeTuple!(fp_glMultiTexGendEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexGendEXT)(gl.extFuncs[extensionId__][94]);
			return checkedCall(gl_, "MultiTexGend", funcPtr, params__);
		}
void MultiTexGendv(GL gl_, ParameterTypeTuple!(fp_glMultiTexGendvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexGendvEXT)(gl.extFuncs[extensionId__][95]);
			return checkedCall(gl_, "MultiTexGendv", funcPtr, params__);
		}
void MultiTexGenf(GL gl_, ParameterTypeTuple!(fp_glMultiTexGenfEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexGenfEXT)(gl.extFuncs[extensionId__][96]);
			return checkedCall(gl_, "MultiTexGenf", funcPtr, params__);
		}
void MultiTexGenfv(GL gl_, ParameterTypeTuple!(fp_glMultiTexGenfvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexGenfvEXT)(gl.extFuncs[extensionId__][97]);
			return checkedCall(gl_, "MultiTexGenfv", funcPtr, params__);
		}
void MultiTexGeni(GL gl_, ParameterTypeTuple!(fp_glMultiTexGeniEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexGeniEXT)(gl.extFuncs[extensionId__][98]);
			return checkedCall(gl_, "MultiTexGeni", funcPtr, params__);
		}
void MultiTexGeniv(GL gl_, ParameterTypeTuple!(fp_glMultiTexGenivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexGenivEXT)(gl.extFuncs[extensionId__][99]);
			return checkedCall(gl_, "MultiTexGeniv", funcPtr, params__);
		}
void MultiTexImage1D(GL gl_, ParameterTypeTuple!(fp_glMultiTexImage1DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexImage1DEXT)(gl.extFuncs[extensionId__][100]);
			return checkedCall(gl_, "MultiTexImage1D", funcPtr, params__);
		}
void MultiTexImage2D(GL gl_, ParameterTypeTuple!(fp_glMultiTexImage2DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexImage2DEXT)(gl.extFuncs[extensionId__][101]);
			return checkedCall(gl_, "MultiTexImage2D", funcPtr, params__);
		}
void MultiTexImage3D(GL gl_, ParameterTypeTuple!(fp_glMultiTexImage3DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexImage3DEXT)(gl.extFuncs[extensionId__][102]);
			return checkedCall(gl_, "MultiTexImage3D", funcPtr, params__);
		}
void MultiTexParameterIiv(GL gl_, ParameterTypeTuple!(fp_glMultiTexParameterIivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexParameterIivEXT)(gl.extFuncs[extensionId__][103]);
			return checkedCall(gl_, "MultiTexParameterIiv", funcPtr, params__);
		}
void MultiTexParameterIuiv(GL gl_, ParameterTypeTuple!(fp_glMultiTexParameterIuivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexParameterIuivEXT)(gl.extFuncs[extensionId__][104]);
			return checkedCall(gl_, "MultiTexParameterIuiv", funcPtr, params__);
		}
void MultiTexParameterf(GL gl_, ParameterTypeTuple!(fp_glMultiTexParameterfEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexParameterfEXT)(gl.extFuncs[extensionId__][105]);
			return checkedCall(gl_, "MultiTexParameterf", funcPtr, params__);
		}
void MultiTexParameterfv(GL gl_, ParameterTypeTuple!(fp_glMultiTexParameterfvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexParameterfvEXT)(gl.extFuncs[extensionId__][106]);
			return checkedCall(gl_, "MultiTexParameterfv", funcPtr, params__);
		}
void MultiTexParameteri(GL gl_, ParameterTypeTuple!(fp_glMultiTexParameteriEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexParameteriEXT)(gl.extFuncs[extensionId__][107]);
			return checkedCall(gl_, "MultiTexParameteri", funcPtr, params__);
		}
void MultiTexParameteriv(GL gl_, ParameterTypeTuple!(fp_glMultiTexParameterivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexParameterivEXT)(gl.extFuncs[extensionId__][108]);
			return checkedCall(gl_, "MultiTexParameteriv", funcPtr, params__);
		}
void MultiTexRenderbuffer(GL gl_, ParameterTypeTuple!(fp_glMultiTexRenderbufferEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexRenderbufferEXT)(gl.extFuncs[extensionId__][109]);
			return checkedCall(gl_, "MultiTexRenderbuffer", funcPtr, params__);
		}
void MultiTexSubImage1D(GL gl_, ParameterTypeTuple!(fp_glMultiTexSubImage1DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexSubImage1DEXT)(gl.extFuncs[extensionId__][110]);
			return checkedCall(gl_, "MultiTexSubImage1D", funcPtr, params__);
		}
void MultiTexSubImage2D(GL gl_, ParameterTypeTuple!(fp_glMultiTexSubImage2DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexSubImage2DEXT)(gl.extFuncs[extensionId__][111]);
			return checkedCall(gl_, "MultiTexSubImage2D", funcPtr, params__);
		}
void MultiTexSubImage3D(GL gl_, ParameterTypeTuple!(fp_glMultiTexSubImage3DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexSubImage3DEXT)(gl.extFuncs[extensionId__][112]);
			return checkedCall(gl_, "MultiTexSubImage3D", funcPtr, params__);
		}
void NamedBufferData(GL gl_, ParameterTypeTuple!(fp_glNamedBufferDataEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNamedBufferDataEXT)(gl.extFuncs[extensionId__][113]);
			return checkedCall(gl_, "NamedBufferData", funcPtr, params__);
		}
void NamedBufferSubData(GL gl_, ParameterTypeTuple!(fp_glNamedBufferSubDataEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNamedBufferSubDataEXT)(gl.extFuncs[extensionId__][114]);
			return checkedCall(gl_, "NamedBufferSubData", funcPtr, params__);
		}
void NamedFramebufferRenderbuffer(GL gl_, ParameterTypeTuple!(fp_glNamedFramebufferRenderbufferEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNamedFramebufferRenderbufferEXT)(gl.extFuncs[extensionId__][115]);
			return checkedCall(gl_, "NamedFramebufferRenderbuffer", funcPtr, params__);
		}
void NamedFramebufferTexture1D(GL gl_, ParameterTypeTuple!(fp_glNamedFramebufferTexture1DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNamedFramebufferTexture1DEXT)(gl.extFuncs[extensionId__][116]);
			return checkedCall(gl_, "NamedFramebufferTexture1D", funcPtr, params__);
		}
void NamedFramebufferTexture2D(GL gl_, ParameterTypeTuple!(fp_glNamedFramebufferTexture2DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNamedFramebufferTexture2DEXT)(gl.extFuncs[extensionId__][117]);
			return checkedCall(gl_, "NamedFramebufferTexture2D", funcPtr, params__);
		}
void NamedFramebufferTexture3D(GL gl_, ParameterTypeTuple!(fp_glNamedFramebufferTexture3DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNamedFramebufferTexture3DEXT)(gl.extFuncs[extensionId__][118]);
			return checkedCall(gl_, "NamedFramebufferTexture3D", funcPtr, params__);
		}
void NamedFramebufferTexture(GL gl_, ParameterTypeTuple!(fp_glNamedFramebufferTextureEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNamedFramebufferTextureEXT)(gl.extFuncs[extensionId__][119]);
			return checkedCall(gl_, "NamedFramebufferTexture", funcPtr, params__);
		}
void NamedFramebufferTextureFace(GL gl_, ParameterTypeTuple!(fp_glNamedFramebufferTextureFaceEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNamedFramebufferTextureFaceEXT)(gl.extFuncs[extensionId__][120]);
			return checkedCall(gl_, "NamedFramebufferTextureFace", funcPtr, params__);
		}
void NamedFramebufferTextureLayer(GL gl_, ParameterTypeTuple!(fp_glNamedFramebufferTextureLayerEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNamedFramebufferTextureLayerEXT)(gl.extFuncs[extensionId__][121]);
			return checkedCall(gl_, "NamedFramebufferTextureLayer", funcPtr, params__);
		}
void NamedProgramLocalParameter4d(GL gl_, ParameterTypeTuple!(fp_glNamedProgramLocalParameter4dEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNamedProgramLocalParameter4dEXT)(gl.extFuncs[extensionId__][122]);
			return checkedCall(gl_, "NamedProgramLocalParameter4d", funcPtr, params__);
		}
void NamedProgramLocalParameter4dv(GL gl_, ParameterTypeTuple!(fp_glNamedProgramLocalParameter4dvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNamedProgramLocalParameter4dvEXT)(gl.extFuncs[extensionId__][123]);
			return checkedCall(gl_, "NamedProgramLocalParameter4dv", funcPtr, params__);
		}
void NamedProgramLocalParameter4f(GL gl_, ParameterTypeTuple!(fp_glNamedProgramLocalParameter4fEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNamedProgramLocalParameter4fEXT)(gl.extFuncs[extensionId__][124]);
			return checkedCall(gl_, "NamedProgramLocalParameter4f", funcPtr, params__);
		}
void NamedProgramLocalParameter4fv(GL gl_, ParameterTypeTuple!(fp_glNamedProgramLocalParameter4fvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNamedProgramLocalParameter4fvEXT)(gl.extFuncs[extensionId__][125]);
			return checkedCall(gl_, "NamedProgramLocalParameter4fv", funcPtr, params__);
		}
void NamedProgramLocalParameterI4i(GL gl_, ParameterTypeTuple!(fp_glNamedProgramLocalParameterI4iEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNamedProgramLocalParameterI4iEXT)(gl.extFuncs[extensionId__][126]);
			return checkedCall(gl_, "NamedProgramLocalParameterI4i", funcPtr, params__);
		}
void NamedProgramLocalParameterI4iv(GL gl_, ParameterTypeTuple!(fp_glNamedProgramLocalParameterI4ivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNamedProgramLocalParameterI4ivEXT)(gl.extFuncs[extensionId__][127]);
			return checkedCall(gl_, "NamedProgramLocalParameterI4iv", funcPtr, params__);
		}
void NamedProgramLocalParameterI4ui(GL gl_, ParameterTypeTuple!(fp_glNamedProgramLocalParameterI4uiEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNamedProgramLocalParameterI4uiEXT)(gl.extFuncs[extensionId__][128]);
			return checkedCall(gl_, "NamedProgramLocalParameterI4ui", funcPtr, params__);
		}
void NamedProgramLocalParameterI4uiv(GL gl_, ParameterTypeTuple!(fp_glNamedProgramLocalParameterI4uivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNamedProgramLocalParameterI4uivEXT)(gl.extFuncs[extensionId__][129]);
			return checkedCall(gl_, "NamedProgramLocalParameterI4uiv", funcPtr, params__);
		}
void NamedProgramLocalParameters4fv(GL gl_, ParameterTypeTuple!(fp_glNamedProgramLocalParameters4fvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNamedProgramLocalParameters4fvEXT)(gl.extFuncs[extensionId__][130]);
			return checkedCall(gl_, "NamedProgramLocalParameters4fv", funcPtr, params__);
		}
void NamedProgramLocalParametersI4iv(GL gl_, ParameterTypeTuple!(fp_glNamedProgramLocalParametersI4ivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNamedProgramLocalParametersI4ivEXT)(gl.extFuncs[extensionId__][131]);
			return checkedCall(gl_, "NamedProgramLocalParametersI4iv", funcPtr, params__);
		}
void NamedProgramLocalParametersI4uiv(GL gl_, ParameterTypeTuple!(fp_glNamedProgramLocalParametersI4uivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNamedProgramLocalParametersI4uivEXT)(gl.extFuncs[extensionId__][132]);
			return checkedCall(gl_, "NamedProgramLocalParametersI4uiv", funcPtr, params__);
		}
void NamedProgramString(GL gl_, ParameterTypeTuple!(fp_glNamedProgramStringEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNamedProgramStringEXT)(gl.extFuncs[extensionId__][133]);
			return checkedCall(gl_, "NamedProgramString", funcPtr, params__);
		}
void NamedRenderbufferStorage(GL gl_, ParameterTypeTuple!(fp_glNamedRenderbufferStorageEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNamedRenderbufferStorageEXT)(gl.extFuncs[extensionId__][134]);
			return checkedCall(gl_, "NamedRenderbufferStorage", funcPtr, params__);
		}
void NamedRenderbufferStorageMultisampleCoverage(GL gl_, ParameterTypeTuple!(fp_glNamedRenderbufferStorageMultisampleCoverageEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNamedRenderbufferStorageMultisampleCoverageEXT)(gl.extFuncs[extensionId__][135]);
			return checkedCall(gl_, "NamedRenderbufferStorageMultisampleCoverage", funcPtr, params__);
		}
void NamedRenderbufferStorageMultisample(GL gl_, ParameterTypeTuple!(fp_glNamedRenderbufferStorageMultisampleEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNamedRenderbufferStorageMultisampleEXT)(gl.extFuncs[extensionId__][136]);
			return checkedCall(gl_, "NamedRenderbufferStorageMultisample", funcPtr, params__);
		}
void ProgramUniform1f(GL gl_, ParameterTypeTuple!(fp_glProgramUniform1fEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramUniform1fEXT)(gl.extFuncs[extensionId__][137]);
			return checkedCall(gl_, "ProgramUniform1f", funcPtr, params__);
		}
void ProgramUniform1fv(GL gl_, ParameterTypeTuple!(fp_glProgramUniform1fvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramUniform1fvEXT)(gl.extFuncs[extensionId__][138]);
			return checkedCall(gl_, "ProgramUniform1fv", funcPtr, params__);
		}
void ProgramUniform1i(GL gl_, ParameterTypeTuple!(fp_glProgramUniform1iEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramUniform1iEXT)(gl.extFuncs[extensionId__][139]);
			return checkedCall(gl_, "ProgramUniform1i", funcPtr, params__);
		}
void ProgramUniform1iv(GL gl_, ParameterTypeTuple!(fp_glProgramUniform1ivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramUniform1ivEXT)(gl.extFuncs[extensionId__][140]);
			return checkedCall(gl_, "ProgramUniform1iv", funcPtr, params__);
		}
void ProgramUniform1ui(GL gl_, ParameterTypeTuple!(fp_glProgramUniform1uiEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramUniform1uiEXT)(gl.extFuncs[extensionId__][141]);
			return checkedCall(gl_, "ProgramUniform1ui", funcPtr, params__);
		}
void ProgramUniform1uiv(GL gl_, ParameterTypeTuple!(fp_glProgramUniform1uivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramUniform1uivEXT)(gl.extFuncs[extensionId__][142]);
			return checkedCall(gl_, "ProgramUniform1uiv", funcPtr, params__);
		}
void ProgramUniform2f(GL gl_, ParameterTypeTuple!(fp_glProgramUniform2fEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramUniform2fEXT)(gl.extFuncs[extensionId__][143]);
			return checkedCall(gl_, "ProgramUniform2f", funcPtr, params__);
		}
void ProgramUniform2fv(GL gl_, ParameterTypeTuple!(fp_glProgramUniform2fvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramUniform2fvEXT)(gl.extFuncs[extensionId__][144]);
			return checkedCall(gl_, "ProgramUniform2fv", funcPtr, params__);
		}
void ProgramUniform2i(GL gl_, ParameterTypeTuple!(fp_glProgramUniform2iEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramUniform2iEXT)(gl.extFuncs[extensionId__][145]);
			return checkedCall(gl_, "ProgramUniform2i", funcPtr, params__);
		}
void ProgramUniform2iv(GL gl_, ParameterTypeTuple!(fp_glProgramUniform2ivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramUniform2ivEXT)(gl.extFuncs[extensionId__][146]);
			return checkedCall(gl_, "ProgramUniform2iv", funcPtr, params__);
		}
void ProgramUniform2ui(GL gl_, ParameterTypeTuple!(fp_glProgramUniform2uiEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramUniform2uiEXT)(gl.extFuncs[extensionId__][147]);
			return checkedCall(gl_, "ProgramUniform2ui", funcPtr, params__);
		}
void ProgramUniform2uiv(GL gl_, ParameterTypeTuple!(fp_glProgramUniform2uivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramUniform2uivEXT)(gl.extFuncs[extensionId__][148]);
			return checkedCall(gl_, "ProgramUniform2uiv", funcPtr, params__);
		}
void ProgramUniform3f(GL gl_, ParameterTypeTuple!(fp_glProgramUniform3fEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramUniform3fEXT)(gl.extFuncs[extensionId__][149]);
			return checkedCall(gl_, "ProgramUniform3f", funcPtr, params__);
		}
void ProgramUniform3fv(GL gl_, ParameterTypeTuple!(fp_glProgramUniform3fvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramUniform3fvEXT)(gl.extFuncs[extensionId__][150]);
			return checkedCall(gl_, "ProgramUniform3fv", funcPtr, params__);
		}
void ProgramUniform3i(GL gl_, ParameterTypeTuple!(fp_glProgramUniform3iEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramUniform3iEXT)(gl.extFuncs[extensionId__][151]);
			return checkedCall(gl_, "ProgramUniform3i", funcPtr, params__);
		}
void ProgramUniform3iv(GL gl_, ParameterTypeTuple!(fp_glProgramUniform3ivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramUniform3ivEXT)(gl.extFuncs[extensionId__][152]);
			return checkedCall(gl_, "ProgramUniform3iv", funcPtr, params__);
		}
void ProgramUniform3ui(GL gl_, ParameterTypeTuple!(fp_glProgramUniform3uiEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramUniform3uiEXT)(gl.extFuncs[extensionId__][153]);
			return checkedCall(gl_, "ProgramUniform3ui", funcPtr, params__);
		}
void ProgramUniform3uiv(GL gl_, ParameterTypeTuple!(fp_glProgramUniform3uivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramUniform3uivEXT)(gl.extFuncs[extensionId__][154]);
			return checkedCall(gl_, "ProgramUniform3uiv", funcPtr, params__);
		}
void ProgramUniform4f(GL gl_, ParameterTypeTuple!(fp_glProgramUniform4fEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramUniform4fEXT)(gl.extFuncs[extensionId__][155]);
			return checkedCall(gl_, "ProgramUniform4f", funcPtr, params__);
		}
void ProgramUniform4fv(GL gl_, ParameterTypeTuple!(fp_glProgramUniform4fvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramUniform4fvEXT)(gl.extFuncs[extensionId__][156]);
			return checkedCall(gl_, "ProgramUniform4fv", funcPtr, params__);
		}
void ProgramUniform4i(GL gl_, ParameterTypeTuple!(fp_glProgramUniform4iEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramUniform4iEXT)(gl.extFuncs[extensionId__][157]);
			return checkedCall(gl_, "ProgramUniform4i", funcPtr, params__);
		}
void ProgramUniform4iv(GL gl_, ParameterTypeTuple!(fp_glProgramUniform4ivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramUniform4ivEXT)(gl.extFuncs[extensionId__][158]);
			return checkedCall(gl_, "ProgramUniform4iv", funcPtr, params__);
		}
void ProgramUniform4ui(GL gl_, ParameterTypeTuple!(fp_glProgramUniform4uiEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramUniform4uiEXT)(gl.extFuncs[extensionId__][159]);
			return checkedCall(gl_, "ProgramUniform4ui", funcPtr, params__);
		}
void ProgramUniform4uiv(GL gl_, ParameterTypeTuple!(fp_glProgramUniform4uivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramUniform4uivEXT)(gl.extFuncs[extensionId__][160]);
			return checkedCall(gl_, "ProgramUniform4uiv", funcPtr, params__);
		}
void ProgramUniformMatrix2fv(GL gl_, ParameterTypeTuple!(fp_glProgramUniformMatrix2fvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramUniformMatrix2fvEXT)(gl.extFuncs[extensionId__][161]);
			return checkedCall(gl_, "ProgramUniformMatrix2fv", funcPtr, params__);
		}
void ProgramUniformMatrix2x3fv(GL gl_, ParameterTypeTuple!(fp_glProgramUniformMatrix2x3fvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramUniformMatrix2x3fvEXT)(gl.extFuncs[extensionId__][162]);
			return checkedCall(gl_, "ProgramUniformMatrix2x3fv", funcPtr, params__);
		}
void ProgramUniformMatrix2x4fv(GL gl_, ParameterTypeTuple!(fp_glProgramUniformMatrix2x4fvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramUniformMatrix2x4fvEXT)(gl.extFuncs[extensionId__][163]);
			return checkedCall(gl_, "ProgramUniformMatrix2x4fv", funcPtr, params__);
		}
void ProgramUniformMatrix3fv(GL gl_, ParameterTypeTuple!(fp_glProgramUniformMatrix3fvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramUniformMatrix3fvEXT)(gl.extFuncs[extensionId__][164]);
			return checkedCall(gl_, "ProgramUniformMatrix3fv", funcPtr, params__);
		}
void ProgramUniformMatrix3x2fv(GL gl_, ParameterTypeTuple!(fp_glProgramUniformMatrix3x2fvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramUniformMatrix3x2fvEXT)(gl.extFuncs[extensionId__][165]);
			return checkedCall(gl_, "ProgramUniformMatrix3x2fv", funcPtr, params__);
		}
void ProgramUniformMatrix3x4fv(GL gl_, ParameterTypeTuple!(fp_glProgramUniformMatrix3x4fvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramUniformMatrix3x4fvEXT)(gl.extFuncs[extensionId__][166]);
			return checkedCall(gl_, "ProgramUniformMatrix3x4fv", funcPtr, params__);
		}
void ProgramUniformMatrix4fv(GL gl_, ParameterTypeTuple!(fp_glProgramUniformMatrix4fvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramUniformMatrix4fvEXT)(gl.extFuncs[extensionId__][167]);
			return checkedCall(gl_, "ProgramUniformMatrix4fv", funcPtr, params__);
		}
void ProgramUniformMatrix4x2fv(GL gl_, ParameterTypeTuple!(fp_glProgramUniformMatrix4x2fvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramUniformMatrix4x2fvEXT)(gl.extFuncs[extensionId__][168]);
			return checkedCall(gl_, "ProgramUniformMatrix4x2fv", funcPtr, params__);
		}
void ProgramUniformMatrix4x3fv(GL gl_, ParameterTypeTuple!(fp_glProgramUniformMatrix4x3fvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramUniformMatrix4x3fvEXT)(gl.extFuncs[extensionId__][169]);
			return checkedCall(gl_, "ProgramUniformMatrix4x3fv", funcPtr, params__);
		}
void PushClientAttribDefault(GL gl_, ParameterTypeTuple!(fp_glPushClientAttribDefaultEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glPushClientAttribDefaultEXT)(gl.extFuncs[extensionId__][170]);
			return checkedCall(gl_, "PushClientAttribDefault", funcPtr, params__);
		}
void TextureBuffer(GL gl_, ParameterTypeTuple!(fp_glTextureBufferEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTextureBufferEXT)(gl.extFuncs[extensionId__][171]);
			return checkedCall(gl_, "TextureBuffer", funcPtr, params__);
		}
void TextureImage1D(GL gl_, ParameterTypeTuple!(fp_glTextureImage1DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTextureImage1DEXT)(gl.extFuncs[extensionId__][172]);
			return checkedCall(gl_, "TextureImage1D", funcPtr, params__);
		}
void TextureImage2D(GL gl_, ParameterTypeTuple!(fp_glTextureImage2DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTextureImage2DEXT)(gl.extFuncs[extensionId__][173]);
			return checkedCall(gl_, "TextureImage2D", funcPtr, params__);
		}
void TextureImage3D(GL gl_, ParameterTypeTuple!(fp_glTextureImage3DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTextureImage3DEXT)(gl.extFuncs[extensionId__][174]);
			return checkedCall(gl_, "TextureImage3D", funcPtr, params__);
		}
void TextureParameterIiv(GL gl_, ParameterTypeTuple!(fp_glTextureParameterIivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTextureParameterIivEXT)(gl.extFuncs[extensionId__][175]);
			return checkedCall(gl_, "TextureParameterIiv", funcPtr, params__);
		}
void TextureParameterIuiv(GL gl_, ParameterTypeTuple!(fp_glTextureParameterIuivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTextureParameterIuivEXT)(gl.extFuncs[extensionId__][176]);
			return checkedCall(gl_, "TextureParameterIuiv", funcPtr, params__);
		}
void TextureParameterf(GL gl_, ParameterTypeTuple!(fp_glTextureParameterfEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTextureParameterfEXT)(gl.extFuncs[extensionId__][177]);
			return checkedCall(gl_, "TextureParameterf", funcPtr, params__);
		}
void TextureParameterfv(GL gl_, ParameterTypeTuple!(fp_glTextureParameterfvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTextureParameterfvEXT)(gl.extFuncs[extensionId__][178]);
			return checkedCall(gl_, "TextureParameterfv", funcPtr, params__);
		}
void TextureParameteri(GL gl_, ParameterTypeTuple!(fp_glTextureParameteriEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTextureParameteriEXT)(gl.extFuncs[extensionId__][179]);
			return checkedCall(gl_, "TextureParameteri", funcPtr, params__);
		}
void TextureParameteriv(GL gl_, ParameterTypeTuple!(fp_glTextureParameterivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTextureParameterivEXT)(gl.extFuncs[extensionId__][180]);
			return checkedCall(gl_, "TextureParameteriv", funcPtr, params__);
		}
void TextureRenderbuffer(GL gl_, ParameterTypeTuple!(fp_glTextureRenderbufferEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTextureRenderbufferEXT)(gl.extFuncs[extensionId__][181]);
			return checkedCall(gl_, "TextureRenderbuffer", funcPtr, params__);
		}
void TextureSubImage1D(GL gl_, ParameterTypeTuple!(fp_glTextureSubImage1DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTextureSubImage1DEXT)(gl.extFuncs[extensionId__][182]);
			return checkedCall(gl_, "TextureSubImage1D", funcPtr, params__);
		}
void TextureSubImage2D(GL gl_, ParameterTypeTuple!(fp_glTextureSubImage2DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTextureSubImage2DEXT)(gl.extFuncs[extensionId__][183]);
			return checkedCall(gl_, "TextureSubImage2D", funcPtr, params__);
		}
void TextureSubImage3D(GL gl_, ParameterTypeTuple!(fp_glTextureSubImage3DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTextureSubImage3DEXT)(gl.extFuncs[extensionId__][184]);
			return checkedCall(gl_, "TextureSubImage3D", funcPtr, params__);
		}
GLboolean UnmapNamedBuffer(GL gl_, ParameterTypeTuple!(fp_glUnmapNamedBufferEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUnmapNamedBufferEXT)(gl.extFuncs[extensionId__][185]);
			return checkedCall(gl_, "UnmapNamedBuffer", funcPtr, params__);
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
		void*[] funcAddr = new void*[186];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_EXT_direct_state_access")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glBindMultiTextureEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glCheckNamedFramebufferStatusEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glClientAttribDefaultEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glCompressedMultiTexImage1DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glCompressedMultiTexImage2DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glCompressedMultiTexImage3DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glCompressedMultiTexSubImage1DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glCompressedMultiTexSubImage2DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[8] = getExtensionFuncPtr(cast(char*)"glCompressedMultiTexSubImage3DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[9] = getExtensionFuncPtr(cast(char*)"glCompressedTextureImage1DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[10] = getExtensionFuncPtr(cast(char*)"glCompressedTextureImage2DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[11] = getExtensionFuncPtr(cast(char*)"glCompressedTextureImage3DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[12] = getExtensionFuncPtr(cast(char*)"glCompressedTextureSubImage1DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[13] = getExtensionFuncPtr(cast(char*)"glCompressedTextureSubImage2DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[14] = getExtensionFuncPtr(cast(char*)"glCompressedTextureSubImage3DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[15] = getExtensionFuncPtr(cast(char*)"glCopyMultiTexImage1DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[16] = getExtensionFuncPtr(cast(char*)"glCopyMultiTexImage2DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[17] = getExtensionFuncPtr(cast(char*)"glCopyMultiTexSubImage1DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[18] = getExtensionFuncPtr(cast(char*)"glCopyMultiTexSubImage2DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[19] = getExtensionFuncPtr(cast(char*)"glCopyMultiTexSubImage3DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[20] = getExtensionFuncPtr(cast(char*)"glCopyTextureImage1DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[21] = getExtensionFuncPtr(cast(char*)"glCopyTextureImage2DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[22] = getExtensionFuncPtr(cast(char*)"glCopyTextureSubImage1DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[23] = getExtensionFuncPtr(cast(char*)"glCopyTextureSubImage2DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[24] = getExtensionFuncPtr(cast(char*)"glCopyTextureSubImage3DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[25] = getExtensionFuncPtr(cast(char*)"glDisableClientStateIndexedEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[26] = getExtensionFuncPtr(cast(char*)"glEnableClientStateIndexedEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[27] = getExtensionFuncPtr(cast(char*)"glFramebufferDrawBufferEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[28] = getExtensionFuncPtr(cast(char*)"glFramebufferDrawBuffersEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[29] = getExtensionFuncPtr(cast(char*)"glFramebufferReadBufferEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[30] = getExtensionFuncPtr(cast(char*)"glGenerateMultiTexMipmapEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[31] = getExtensionFuncPtr(cast(char*)"glGenerateTextureMipmapEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[32] = getExtensionFuncPtr(cast(char*)"glGetCompressedMultiTexImageEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[33] = getExtensionFuncPtr(cast(char*)"glGetCompressedTextureImageEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[34] = getExtensionFuncPtr(cast(char*)"glGetDoubleIndexedvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[35] = getExtensionFuncPtr(cast(char*)"glGetFloatIndexedvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[36] = getExtensionFuncPtr(cast(char*)"glGetFramebufferParameterivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[37] = getExtensionFuncPtr(cast(char*)"glGetMultiTexEnvfvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[38] = getExtensionFuncPtr(cast(char*)"glGetMultiTexEnvivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[39] = getExtensionFuncPtr(cast(char*)"glGetMultiTexGendvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[40] = getExtensionFuncPtr(cast(char*)"glGetMultiTexGenfvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[41] = getExtensionFuncPtr(cast(char*)"glGetMultiTexGenivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[42] = getExtensionFuncPtr(cast(char*)"glGetMultiTexImageEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[43] = getExtensionFuncPtr(cast(char*)"glGetMultiTexLevelParameterfvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[44] = getExtensionFuncPtr(cast(char*)"glGetMultiTexLevelParameterivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[45] = getExtensionFuncPtr(cast(char*)"glGetMultiTexParameterIivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[46] = getExtensionFuncPtr(cast(char*)"glGetMultiTexParameterIuivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[47] = getExtensionFuncPtr(cast(char*)"glGetMultiTexParameterfvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[48] = getExtensionFuncPtr(cast(char*)"glGetMultiTexParameterivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[49] = getExtensionFuncPtr(cast(char*)"glGetNamedBufferParameterivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[50] = getExtensionFuncPtr(cast(char*)"glGetNamedBufferPointervEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[51] = getExtensionFuncPtr(cast(char*)"glGetNamedBufferSubDataEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[52] = getExtensionFuncPtr(cast(char*)"glGetNamedFramebufferAttachmentParameterivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[53] = getExtensionFuncPtr(cast(char*)"glGetNamedProgramLocalParameterIivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[54] = getExtensionFuncPtr(cast(char*)"glGetNamedProgramLocalParameterIuivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[55] = getExtensionFuncPtr(cast(char*)"glGetNamedProgramLocalParameterdvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[56] = getExtensionFuncPtr(cast(char*)"glGetNamedProgramLocalParameterfvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[57] = getExtensionFuncPtr(cast(char*)"glGetNamedProgramStringEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[58] = getExtensionFuncPtr(cast(char*)"glGetNamedProgramivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[59] = getExtensionFuncPtr(cast(char*)"glGetNamedRenderbufferParameterivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[60] = getExtensionFuncPtr(cast(char*)"glGetPointerIndexedvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[61] = getExtensionFuncPtr(cast(char*)"glGetTextureImageEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[62] = getExtensionFuncPtr(cast(char*)"glGetTextureLevelParameterfvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[63] = getExtensionFuncPtr(cast(char*)"glGetTextureLevelParameterivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[64] = getExtensionFuncPtr(cast(char*)"glGetTextureParameterIivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[65] = getExtensionFuncPtr(cast(char*)"glGetTextureParameterIuivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[66] = getExtensionFuncPtr(cast(char*)"glGetTextureParameterfvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[67] = getExtensionFuncPtr(cast(char*)"glGetTextureParameterivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[68] = getExtensionFuncPtr(cast(char*)"glMapNamedBufferEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[69] = getExtensionFuncPtr(cast(char*)"glMatrixFrustumEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[70] = getExtensionFuncPtr(cast(char*)"glMatrixLoadIdentityEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[71] = getExtensionFuncPtr(cast(char*)"glMatrixLoadTransposedEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[72] = getExtensionFuncPtr(cast(char*)"glMatrixLoadTransposefEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[73] = getExtensionFuncPtr(cast(char*)"glMatrixLoaddEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[74] = getExtensionFuncPtr(cast(char*)"glMatrixLoadfEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[75] = getExtensionFuncPtr(cast(char*)"glMatrixMultTransposedEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[76] = getExtensionFuncPtr(cast(char*)"glMatrixMultTransposefEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[77] = getExtensionFuncPtr(cast(char*)"glMatrixMultdEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[78] = getExtensionFuncPtr(cast(char*)"glMatrixMultfEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[79] = getExtensionFuncPtr(cast(char*)"glMatrixOrthoEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[80] = getExtensionFuncPtr(cast(char*)"glMatrixPopEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[81] = getExtensionFuncPtr(cast(char*)"glMatrixPushEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[82] = getExtensionFuncPtr(cast(char*)"glMatrixRotatedEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[83] = getExtensionFuncPtr(cast(char*)"glMatrixRotatefEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[84] = getExtensionFuncPtr(cast(char*)"glMatrixScaledEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[85] = getExtensionFuncPtr(cast(char*)"glMatrixScalefEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[86] = getExtensionFuncPtr(cast(char*)"glMatrixTranslatedEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[87] = getExtensionFuncPtr(cast(char*)"glMatrixTranslatefEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[88] = getExtensionFuncPtr(cast(char*)"glMultiTexBufferEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[89] = getExtensionFuncPtr(cast(char*)"glMultiTexCoordPointerEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[90] = getExtensionFuncPtr(cast(char*)"glMultiTexEnvfEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[91] = getExtensionFuncPtr(cast(char*)"glMultiTexEnvfvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[92] = getExtensionFuncPtr(cast(char*)"glMultiTexEnviEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[93] = getExtensionFuncPtr(cast(char*)"glMultiTexEnvivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[94] = getExtensionFuncPtr(cast(char*)"glMultiTexGendEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[95] = getExtensionFuncPtr(cast(char*)"glMultiTexGendvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[96] = getExtensionFuncPtr(cast(char*)"glMultiTexGenfEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[97] = getExtensionFuncPtr(cast(char*)"glMultiTexGenfvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[98] = getExtensionFuncPtr(cast(char*)"glMultiTexGeniEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[99] = getExtensionFuncPtr(cast(char*)"glMultiTexGenivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[100] = getExtensionFuncPtr(cast(char*)"glMultiTexImage1DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[101] = getExtensionFuncPtr(cast(char*)"glMultiTexImage2DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[102] = getExtensionFuncPtr(cast(char*)"glMultiTexImage3DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[103] = getExtensionFuncPtr(cast(char*)"glMultiTexParameterIivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[104] = getExtensionFuncPtr(cast(char*)"glMultiTexParameterIuivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[105] = getExtensionFuncPtr(cast(char*)"glMultiTexParameterfEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[106] = getExtensionFuncPtr(cast(char*)"glMultiTexParameterfvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[107] = getExtensionFuncPtr(cast(char*)"glMultiTexParameteriEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[108] = getExtensionFuncPtr(cast(char*)"glMultiTexParameterivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[109] = getExtensionFuncPtr(cast(char*)"glMultiTexRenderbufferEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[110] = getExtensionFuncPtr(cast(char*)"glMultiTexSubImage1DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[111] = getExtensionFuncPtr(cast(char*)"glMultiTexSubImage2DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[112] = getExtensionFuncPtr(cast(char*)"glMultiTexSubImage3DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[113] = getExtensionFuncPtr(cast(char*)"glNamedBufferDataEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[114] = getExtensionFuncPtr(cast(char*)"glNamedBufferSubDataEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[115] = getExtensionFuncPtr(cast(char*)"glNamedFramebufferRenderbufferEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[116] = getExtensionFuncPtr(cast(char*)"glNamedFramebufferTexture1DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[117] = getExtensionFuncPtr(cast(char*)"glNamedFramebufferTexture2DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[118] = getExtensionFuncPtr(cast(char*)"glNamedFramebufferTexture3DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[119] = getExtensionFuncPtr(cast(char*)"glNamedFramebufferTextureEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[120] = getExtensionFuncPtr(cast(char*)"glNamedFramebufferTextureFaceEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[121] = getExtensionFuncPtr(cast(char*)"glNamedFramebufferTextureLayerEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[122] = getExtensionFuncPtr(cast(char*)"glNamedProgramLocalParameter4dEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[123] = getExtensionFuncPtr(cast(char*)"glNamedProgramLocalParameter4dvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[124] = getExtensionFuncPtr(cast(char*)"glNamedProgramLocalParameter4fEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[125] = getExtensionFuncPtr(cast(char*)"glNamedProgramLocalParameter4fvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[126] = getExtensionFuncPtr(cast(char*)"glNamedProgramLocalParameterI4iEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[127] = getExtensionFuncPtr(cast(char*)"glNamedProgramLocalParameterI4ivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[128] = getExtensionFuncPtr(cast(char*)"glNamedProgramLocalParameterI4uiEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[129] = getExtensionFuncPtr(cast(char*)"glNamedProgramLocalParameterI4uivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[130] = getExtensionFuncPtr(cast(char*)"glNamedProgramLocalParameters4fvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[131] = getExtensionFuncPtr(cast(char*)"glNamedProgramLocalParametersI4ivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[132] = getExtensionFuncPtr(cast(char*)"glNamedProgramLocalParametersI4uivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[133] = getExtensionFuncPtr(cast(char*)"glNamedProgramStringEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[134] = getExtensionFuncPtr(cast(char*)"glNamedRenderbufferStorageEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[135] = getExtensionFuncPtr(cast(char*)"glNamedRenderbufferStorageMultisampleCoverageEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[136] = getExtensionFuncPtr(cast(char*)"glNamedRenderbufferStorageMultisampleEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[137] = getExtensionFuncPtr(cast(char*)"glProgramUniform1fEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[138] = getExtensionFuncPtr(cast(char*)"glProgramUniform1fvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[139] = getExtensionFuncPtr(cast(char*)"glProgramUniform1iEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[140] = getExtensionFuncPtr(cast(char*)"glProgramUniform1ivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[141] = getExtensionFuncPtr(cast(char*)"glProgramUniform1uiEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[142] = getExtensionFuncPtr(cast(char*)"glProgramUniform1uivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[143] = getExtensionFuncPtr(cast(char*)"glProgramUniform2fEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[144] = getExtensionFuncPtr(cast(char*)"glProgramUniform2fvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[145] = getExtensionFuncPtr(cast(char*)"glProgramUniform2iEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[146] = getExtensionFuncPtr(cast(char*)"glProgramUniform2ivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[147] = getExtensionFuncPtr(cast(char*)"glProgramUniform2uiEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[148] = getExtensionFuncPtr(cast(char*)"glProgramUniform2uivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[149] = getExtensionFuncPtr(cast(char*)"glProgramUniform3fEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[150] = getExtensionFuncPtr(cast(char*)"glProgramUniform3fvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[151] = getExtensionFuncPtr(cast(char*)"glProgramUniform3iEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[152] = getExtensionFuncPtr(cast(char*)"glProgramUniform3ivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[153] = getExtensionFuncPtr(cast(char*)"glProgramUniform3uiEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[154] = getExtensionFuncPtr(cast(char*)"glProgramUniform3uivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[155] = getExtensionFuncPtr(cast(char*)"glProgramUniform4fEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[156] = getExtensionFuncPtr(cast(char*)"glProgramUniform4fvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[157] = getExtensionFuncPtr(cast(char*)"glProgramUniform4iEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[158] = getExtensionFuncPtr(cast(char*)"glProgramUniform4ivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[159] = getExtensionFuncPtr(cast(char*)"glProgramUniform4uiEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[160] = getExtensionFuncPtr(cast(char*)"glProgramUniform4uivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[161] = getExtensionFuncPtr(cast(char*)"glProgramUniformMatrix2fvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[162] = getExtensionFuncPtr(cast(char*)"glProgramUniformMatrix2x3fvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[163] = getExtensionFuncPtr(cast(char*)"glProgramUniformMatrix2x4fvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[164] = getExtensionFuncPtr(cast(char*)"glProgramUniformMatrix3fvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[165] = getExtensionFuncPtr(cast(char*)"glProgramUniformMatrix3x2fvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[166] = getExtensionFuncPtr(cast(char*)"glProgramUniformMatrix3x4fvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[167] = getExtensionFuncPtr(cast(char*)"glProgramUniformMatrix4fvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[168] = getExtensionFuncPtr(cast(char*)"glProgramUniformMatrix4x2fvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[169] = getExtensionFuncPtr(cast(char*)"glProgramUniformMatrix4x3fvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[170] = getExtensionFuncPtr(cast(char*)"glPushClientAttribDefaultEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[171] = getExtensionFuncPtr(cast(char*)"glTextureBufferEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[172] = getExtensionFuncPtr(cast(char*)"glTextureImage1DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[173] = getExtensionFuncPtr(cast(char*)"glTextureImage2DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[174] = getExtensionFuncPtr(cast(char*)"glTextureImage3DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[175] = getExtensionFuncPtr(cast(char*)"glTextureParameterIivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[176] = getExtensionFuncPtr(cast(char*)"glTextureParameterIuivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[177] = getExtensionFuncPtr(cast(char*)"glTextureParameterfEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[178] = getExtensionFuncPtr(cast(char*)"glTextureParameterfvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[179] = getExtensionFuncPtr(cast(char*)"glTextureParameteriEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[180] = getExtensionFuncPtr(cast(char*)"glTextureParameterivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[181] = getExtensionFuncPtr(cast(char*)"glTextureRenderbufferEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[182] = getExtensionFuncPtr(cast(char*)"glTextureSubImage1DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[183] = getExtensionFuncPtr(cast(char*)"glTextureSubImage2DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[184] = getExtensionFuncPtr(cast(char*)"glTextureSubImage3DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[185] = getExtensionFuncPtr(cast(char*)"glUnmapNamedBufferEXT"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
