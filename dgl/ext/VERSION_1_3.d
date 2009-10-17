module dgl.ext.VERSION_1_3;
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



private ushort extensionId__ = 466;
alias extensionId__ VERSION_1_3;

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
			const GLenum GL_TEXTURE0 = 0x84C0;
			const GLenum GL_TEXTURE1 = 0x84C1;
			const GLenum GL_TEXTURE2 = 0x84C2;
			const GLenum GL_TEXTURE3 = 0x84C3;
			const GLenum GL_TEXTURE4 = 0x84C4;
			const GLenum GL_TEXTURE5 = 0x84C5;
			const GLenum GL_TEXTURE6 = 0x84C6;
			const GLenum GL_TEXTURE7 = 0x84C7;
			const GLenum GL_TEXTURE8 = 0x84C8;
			const GLenum GL_TEXTURE9 = 0x84C9;
			const GLenum GL_TEXTURE10 = 0x84CA;
			const GLenum GL_TEXTURE11 = 0x84CB;
			const GLenum GL_TEXTURE12 = 0x84CC;
			const GLenum GL_TEXTURE13 = 0x84CD;
			const GLenum GL_TEXTURE14 = 0x84CE;
			const GLenum GL_TEXTURE15 = 0x84CF;
			const GLenum GL_TEXTURE16 = 0x84D0;
			const GLenum GL_TEXTURE17 = 0x84D1;
			const GLenum GL_TEXTURE18 = 0x84D2;
			const GLenum GL_TEXTURE19 = 0x84D3;
			const GLenum GL_TEXTURE20 = 0x84D4;
			const GLenum GL_TEXTURE21 = 0x84D5;
			const GLenum GL_TEXTURE22 = 0x84D6;
			const GLenum GL_TEXTURE23 = 0x84D7;
			const GLenum GL_TEXTURE24 = 0x84D8;
			const GLenum GL_TEXTURE25 = 0x84D9;
			const GLenum GL_TEXTURE26 = 0x84DA;
			const GLenum GL_TEXTURE27 = 0x84DB;
			const GLenum GL_TEXTURE28 = 0x84DC;
			const GLenum GL_TEXTURE29 = 0x84DD;
			const GLenum GL_TEXTURE30 = 0x84DE;
			const GLenum GL_TEXTURE31 = 0x84DF;
			const GLenum GL_ACTIVE_TEXTURE = 0x84E0;
			const GLenum GL_CLIENT_ACTIVE_TEXTURE = 0x84E1;
			const GLenum GL_MAX_TEXTURE_UNITS = 0x84E2;
			const GLenum GL_NORMAL_MAP = 0x8511;
			const GLenum GL_REFLECTION_MAP = 0x8512;
			const GLenum GL_TEXTURE_CUBE_MAP = 0x8513;
			const GLenum GL_TEXTURE_BINDING_CUBE_MAP = 0x8514;
			const GLenum GL_TEXTURE_CUBE_MAP_POSITIVE_X = 0x8515;
			const GLenum GL_TEXTURE_CUBE_MAP_NEGATIVE_X = 0x8516;
			const GLenum GL_TEXTURE_CUBE_MAP_POSITIVE_Y = 0x8517;
			const GLenum GL_TEXTURE_CUBE_MAP_NEGATIVE_Y = 0x8518;
			const GLenum GL_TEXTURE_CUBE_MAP_POSITIVE_Z = 0x8519;
			const GLenum GL_TEXTURE_CUBE_MAP_NEGATIVE_Z = 0x851A;
			const GLenum GL_PROXY_TEXTURE_CUBE_MAP = 0x851B;
			const GLenum GL_MAX_CUBE_MAP_TEXTURE_SIZE = 0x851C;
			const GLenum GL_COMPRESSED_ALPHA = 0x84E9;
			const GLenum GL_COMPRESSED_LUMINANCE = 0x84EA;
			const GLenum GL_COMPRESSED_LUMINANCE_ALPHA = 0x84EB;
			const GLenum GL_COMPRESSED_INTENSITY = 0x84EC;
			const GLenum GL_COMPRESSED_RGB = 0x84ED;
			const GLenum GL_COMPRESSED_RGBA = 0x84EE;
			const GLenum GL_TEXTURE_COMPRESSION_HINT = 0x84EF;
			const GLenum GL_TEXTURE_COMPRESSED_IMAGE_SIZE = 0x86A0;
			const GLenum GL_TEXTURE_COMPRESSED = 0x86A1;
			const GLenum GL_NUM_COMPRESSED_TEXTURE_FORMATS = 0x86A2;
			const GLenum GL_COMPRESSED_TEXTURE_FORMATS = 0x86A3;
			const GLenum GL_MULTISAMPLE = 0x809D;
			const GLenum GL_SAMPLE_ALPHA_TO_COVERAGE = 0x809E;
			const GLenum GL_SAMPLE_ALPHA_TO_ONE = 0x809F;
			const GLenum GL_SAMPLE_COVERAGE = 0x80A0;
			const GLenum GL_SAMPLE_BUFFERS = 0x80A8;
			const GLenum GL_SAMPLES = 0x80A9;
			const GLenum GL_SAMPLE_COVERAGE_VALUE = 0x80AA;
			const GLenum GL_SAMPLE_COVERAGE_INVERT = 0x80AB;
			const GLenum GL_MULTISAMPLE_BIT = 0x20000000;
			const GLenum GL_TRANSPOSE_MODELVIEW_MATRIX = 0x84E3;
			const GLenum GL_TRANSPOSE_PROJECTION_MATRIX = 0x84E4;
			const GLenum GL_TRANSPOSE_TEXTURE_MATRIX = 0x84E5;
			const GLenum GL_TRANSPOSE_COLOR_MATRIX = 0x84E6;
			const GLenum GL_COMBINE = 0x8570;
			const GLenum GL_COMBINE_RGB = 0x8571;
			const GLenum GL_COMBINE_ALPHA = 0x8572;
			const GLenum GL_SOURCE0_RGB = 0x8580;
			const GLenum GL_SOURCE1_RGB = 0x8581;
			const GLenum GL_SOURCE2_RGB = 0x8582;
			const GLenum GL_SOURCE0_ALPHA = 0x8588;
			const GLenum GL_SOURCE1_ALPHA = 0x8589;
			const GLenum GL_SOURCE2_ALPHA = 0x858A;
			const GLenum GL_OPERAND0_RGB = 0x8590;
			const GLenum GL_OPERAND1_RGB = 0x8591;
			const GLenum GL_OPERAND2_RGB = 0x8592;
			const GLenum GL_OPERAND0_ALPHA = 0x8598;
			const GLenum GL_OPERAND1_ALPHA = 0x8599;
			const GLenum GL_OPERAND2_ALPHA = 0x859A;
			const GLenum GL_RGB_SCALE = 0x8573;
			const GLenum GL_ADD_SIGNED = 0x8574;
			const GLenum GL_INTERPOLATE = 0x8575;
			const GLenum GL_SUBTRACT = 0x84E7;
			const GLenum GL_CONSTANT = 0x8576;
			const GLenum GL_PRIMARY_COLOR = 0x8577;
			const GLenum GL_PREVIOUS = 0x8578;
			const GLenum GL_DOT3_RGB = 0x86AE;
			const GLenum GL_DOT3_RGBA = 0x86AF;
			const GLenum GL_CLAMP_TO_BORDER = 0x812D;
	}
	private {
		extern (System) {
			alias void function (GLenum texture)	fp_glActiveTexture;
			alias void function (GLenum texture)	fp_glClientActiveTexture;
			alias void function (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLint border, GLsizei imageSize,  GLvoid *data)	fp_glCompressedTexImage1D;
			alias void function (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize,  GLvoid *data)	fp_glCompressedTexImage2D;
			alias void function (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imageSize,  GLvoid *data)	fp_glCompressedTexImage3D;
			alias void function (GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLsizei imageSize,  GLvoid *data)	fp_glCompressedTexSubImage1D;
			alias void function (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize,  GLvoid *data)	fp_glCompressedTexSubImage2D;
			alias void function (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize,  GLvoid *data)	fp_glCompressedTexSubImage3D;
			alias void function (GLenum target, GLint lod, GLvoid *img)	fp_glGetCompressedTexImage;
			alias void function ( GLdouble m[16])	fp_glLoadTransposeMatrixd;
			alias void function ( GLfloat m[16])	fp_glLoadTransposeMatrixf;
			alias void function ( GLdouble m[16])	fp_glMultTransposeMatrixd;
			alias void function ( GLfloat m[16])	fp_glMultTransposeMatrixf;
			alias void function (GLenum target, GLdouble s)	fp_glMultiTexCoord1d;
			alias void function (GLenum target,  GLdouble *v)	fp_glMultiTexCoord1dv;
			alias void function (GLenum target, GLfloat s)	fp_glMultiTexCoord1f;
			alias void function (GLenum target,  GLfloat *v)	fp_glMultiTexCoord1fv;
			alias void function (GLenum target, GLint s)	fp_glMultiTexCoord1i;
			alias void function (GLenum target,  GLint *v)	fp_glMultiTexCoord1iv;
			alias void function (GLenum target, GLshort s)	fp_glMultiTexCoord1s;
			alias void function (GLenum target,  GLshort *v)	fp_glMultiTexCoord1sv;
			alias void function (GLenum target, GLdouble s, GLdouble t)	fp_glMultiTexCoord2d;
			alias void function (GLenum target,  GLdouble *v)	fp_glMultiTexCoord2dv;
			alias void function (GLenum target, GLfloat s, GLfloat t)	fp_glMultiTexCoord2f;
			alias void function (GLenum target,  GLfloat *v)	fp_glMultiTexCoord2fv;
			alias void function (GLenum target, GLint s, GLint t)	fp_glMultiTexCoord2i;
			alias void function (GLenum target,  GLint *v)	fp_glMultiTexCoord2iv;
			alias void function (GLenum target, GLshort s, GLshort t)	fp_glMultiTexCoord2s;
			alias void function (GLenum target,  GLshort *v)	fp_glMultiTexCoord2sv;
			alias void function (GLenum target, GLdouble s, GLdouble t, GLdouble r)	fp_glMultiTexCoord3d;
			alias void function (GLenum target,  GLdouble *v)	fp_glMultiTexCoord3dv;
			alias void function (GLenum target, GLfloat s, GLfloat t, GLfloat r)	fp_glMultiTexCoord3f;
			alias void function (GLenum target,  GLfloat *v)	fp_glMultiTexCoord3fv;
			alias void function (GLenum target, GLint s, GLint t, GLint r)	fp_glMultiTexCoord3i;
			alias void function (GLenum target,  GLint *v)	fp_glMultiTexCoord3iv;
			alias void function (GLenum target, GLshort s, GLshort t, GLshort r)	fp_glMultiTexCoord3s;
			alias void function (GLenum target,  GLshort *v)	fp_glMultiTexCoord3sv;
			alias void function (GLenum target, GLdouble s, GLdouble t, GLdouble r, GLdouble q)	fp_glMultiTexCoord4d;
			alias void function (GLenum target,  GLdouble *v)	fp_glMultiTexCoord4dv;
			alias void function (GLenum target, GLfloat s, GLfloat t, GLfloat r, GLfloat q)	fp_glMultiTexCoord4f;
			alias void function (GLenum target,  GLfloat *v)	fp_glMultiTexCoord4fv;
			alias void function (GLenum target, GLint s, GLint t, GLint r, GLint q)	fp_glMultiTexCoord4i;
			alias void function (GLenum target,  GLint *v)	fp_glMultiTexCoord4iv;
			alias void function (GLenum target, GLshort s, GLshort t, GLshort r, GLshort q)	fp_glMultiTexCoord4s;
			alias void function (GLenum target,  GLshort *v)	fp_glMultiTexCoord4sv;
			alias void function (GLclampf value, GLboolean invert)	fp_glSampleCoverage;
		}
	}
	public {
void ActiveTexture(GL gl_, ParameterTypeTuple!(fp_glActiveTexture) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glActiveTexture)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "ActiveTexture", funcPtr, params__);
		}
void ClientActiveTexture(GL gl_, ParameterTypeTuple!(fp_glClientActiveTexture) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glClientActiveTexture)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "ClientActiveTexture", funcPtr, params__);
		}
void CompressedTexImage1D(GL gl_, ParameterTypeTuple!(fp_glCompressedTexImage1D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCompressedTexImage1D)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "CompressedTexImage1D", funcPtr, params__);
		}
void CompressedTexImage2D(GL gl_, ParameterTypeTuple!(fp_glCompressedTexImage2D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCompressedTexImage2D)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "CompressedTexImage2D", funcPtr, params__);
		}
void CompressedTexImage3D(GL gl_, ParameterTypeTuple!(fp_glCompressedTexImage3D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCompressedTexImage3D)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "CompressedTexImage3D", funcPtr, params__);
		}
void CompressedTexSubImage1D(GL gl_, ParameterTypeTuple!(fp_glCompressedTexSubImage1D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCompressedTexSubImage1D)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "CompressedTexSubImage1D", funcPtr, params__);
		}
void CompressedTexSubImage2D(GL gl_, ParameterTypeTuple!(fp_glCompressedTexSubImage2D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCompressedTexSubImage2D)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "CompressedTexSubImage2D", funcPtr, params__);
		}
void CompressedTexSubImage3D(GL gl_, ParameterTypeTuple!(fp_glCompressedTexSubImage3D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCompressedTexSubImage3D)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "CompressedTexSubImage3D", funcPtr, params__);
		}
void GetCompressedTexImage(GL gl_, ParameterTypeTuple!(fp_glGetCompressedTexImage) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetCompressedTexImage)(gl.extFuncs[extensionId__][8]);
			return checkedCall(gl_, "GetCompressedTexImage", funcPtr, params__);
		}
void LoadTransposeMatrixd(GL gl_, ParameterTypeTuple!(fp_glLoadTransposeMatrixd) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glLoadTransposeMatrixd)(gl.extFuncs[extensionId__][9]);
			return checkedCall(gl_, "LoadTransposeMatrixd", funcPtr, params__);
		}
void LoadTransposeMatrixf(GL gl_, ParameterTypeTuple!(fp_glLoadTransposeMatrixf) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glLoadTransposeMatrixf)(gl.extFuncs[extensionId__][10]);
			return checkedCall(gl_, "LoadTransposeMatrixf", funcPtr, params__);
		}
void MultTransposeMatrixd(GL gl_, ParameterTypeTuple!(fp_glMultTransposeMatrixd) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultTransposeMatrixd)(gl.extFuncs[extensionId__][11]);
			return checkedCall(gl_, "MultTransposeMatrixd", funcPtr, params__);
		}
void MultTransposeMatrixf(GL gl_, ParameterTypeTuple!(fp_glMultTransposeMatrixf) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultTransposeMatrixf)(gl.extFuncs[extensionId__][12]);
			return checkedCall(gl_, "MultTransposeMatrixf", funcPtr, params__);
		}
void MultiTexCoord1d(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord1d) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord1d)(gl.extFuncs[extensionId__][13]);
			return checkedCall(gl_, "MultiTexCoord1d", funcPtr, params__);
		}
void MultiTexCoord1dv(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord1dv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord1dv)(gl.extFuncs[extensionId__][14]);
			return checkedCall(gl_, "MultiTexCoord1dv", funcPtr, params__);
		}
void MultiTexCoord1f(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord1f) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord1f)(gl.extFuncs[extensionId__][15]);
			return checkedCall(gl_, "MultiTexCoord1f", funcPtr, params__);
		}
void MultiTexCoord1fv(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord1fv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord1fv)(gl.extFuncs[extensionId__][16]);
			return checkedCall(gl_, "MultiTexCoord1fv", funcPtr, params__);
		}
void MultiTexCoord1i(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord1i) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord1i)(gl.extFuncs[extensionId__][17]);
			return checkedCall(gl_, "MultiTexCoord1i", funcPtr, params__);
		}
void MultiTexCoord1iv(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord1iv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord1iv)(gl.extFuncs[extensionId__][18]);
			return checkedCall(gl_, "MultiTexCoord1iv", funcPtr, params__);
		}
void MultiTexCoord1s(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord1s) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord1s)(gl.extFuncs[extensionId__][19]);
			return checkedCall(gl_, "MultiTexCoord1s", funcPtr, params__);
		}
void MultiTexCoord1sv(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord1sv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord1sv)(gl.extFuncs[extensionId__][20]);
			return checkedCall(gl_, "MultiTexCoord1sv", funcPtr, params__);
		}
void MultiTexCoord2d(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord2d) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord2d)(gl.extFuncs[extensionId__][21]);
			return checkedCall(gl_, "MultiTexCoord2d", funcPtr, params__);
		}
void MultiTexCoord2dv(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord2dv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord2dv)(gl.extFuncs[extensionId__][22]);
			return checkedCall(gl_, "MultiTexCoord2dv", funcPtr, params__);
		}
void MultiTexCoord2f(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord2f) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord2f)(gl.extFuncs[extensionId__][23]);
			return checkedCall(gl_, "MultiTexCoord2f", funcPtr, params__);
		}
void MultiTexCoord2fv(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord2fv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord2fv)(gl.extFuncs[extensionId__][24]);
			return checkedCall(gl_, "MultiTexCoord2fv", funcPtr, params__);
		}
void MultiTexCoord2i(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord2i) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord2i)(gl.extFuncs[extensionId__][25]);
			return checkedCall(gl_, "MultiTexCoord2i", funcPtr, params__);
		}
void MultiTexCoord2iv(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord2iv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord2iv)(gl.extFuncs[extensionId__][26]);
			return checkedCall(gl_, "MultiTexCoord2iv", funcPtr, params__);
		}
void MultiTexCoord2s(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord2s) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord2s)(gl.extFuncs[extensionId__][27]);
			return checkedCall(gl_, "MultiTexCoord2s", funcPtr, params__);
		}
void MultiTexCoord2sv(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord2sv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord2sv)(gl.extFuncs[extensionId__][28]);
			return checkedCall(gl_, "MultiTexCoord2sv", funcPtr, params__);
		}
void MultiTexCoord3d(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord3d) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord3d)(gl.extFuncs[extensionId__][29]);
			return checkedCall(gl_, "MultiTexCoord3d", funcPtr, params__);
		}
void MultiTexCoord3dv(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord3dv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord3dv)(gl.extFuncs[extensionId__][30]);
			return checkedCall(gl_, "MultiTexCoord3dv", funcPtr, params__);
		}
void MultiTexCoord3f(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord3f) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord3f)(gl.extFuncs[extensionId__][31]);
			return checkedCall(gl_, "MultiTexCoord3f", funcPtr, params__);
		}
void MultiTexCoord3fv(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord3fv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord3fv)(gl.extFuncs[extensionId__][32]);
			return checkedCall(gl_, "MultiTexCoord3fv", funcPtr, params__);
		}
void MultiTexCoord3i(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord3i) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord3i)(gl.extFuncs[extensionId__][33]);
			return checkedCall(gl_, "MultiTexCoord3i", funcPtr, params__);
		}
void MultiTexCoord3iv(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord3iv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord3iv)(gl.extFuncs[extensionId__][34]);
			return checkedCall(gl_, "MultiTexCoord3iv", funcPtr, params__);
		}
void MultiTexCoord3s(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord3s) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord3s)(gl.extFuncs[extensionId__][35]);
			return checkedCall(gl_, "MultiTexCoord3s", funcPtr, params__);
		}
void MultiTexCoord3sv(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord3sv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord3sv)(gl.extFuncs[extensionId__][36]);
			return checkedCall(gl_, "MultiTexCoord3sv", funcPtr, params__);
		}
void MultiTexCoord4d(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord4d) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord4d)(gl.extFuncs[extensionId__][37]);
			return checkedCall(gl_, "MultiTexCoord4d", funcPtr, params__);
		}
void MultiTexCoord4dv(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord4dv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord4dv)(gl.extFuncs[extensionId__][38]);
			return checkedCall(gl_, "MultiTexCoord4dv", funcPtr, params__);
		}
void MultiTexCoord4f(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord4f) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord4f)(gl.extFuncs[extensionId__][39]);
			return checkedCall(gl_, "MultiTexCoord4f", funcPtr, params__);
		}
void MultiTexCoord4fv(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord4fv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord4fv)(gl.extFuncs[extensionId__][40]);
			return checkedCall(gl_, "MultiTexCoord4fv", funcPtr, params__);
		}
void MultiTexCoord4i(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord4i) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord4i)(gl.extFuncs[extensionId__][41]);
			return checkedCall(gl_, "MultiTexCoord4i", funcPtr, params__);
		}
void MultiTexCoord4iv(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord4iv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord4iv)(gl.extFuncs[extensionId__][42]);
			return checkedCall(gl_, "MultiTexCoord4iv", funcPtr, params__);
		}
void MultiTexCoord4s(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord4s) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord4s)(gl.extFuncs[extensionId__][43]);
			return checkedCall(gl_, "MultiTexCoord4s", funcPtr, params__);
		}
void MultiTexCoord4sv(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord4sv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord4sv)(gl.extFuncs[extensionId__][44]);
			return checkedCall(gl_, "MultiTexCoord4sv", funcPtr, params__);
		}
void SampleCoverage(GL gl_, ParameterTypeTuple!(fp_glSampleCoverage) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSampleCoverage)(gl.extFuncs[extensionId__][45]);
			return checkedCall(gl_, "SampleCoverage", funcPtr, params__);
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
		void*[] funcAddr = new void*[46];
		{
			if (!isOpenGLVersionSupported("1_3", '_')) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glActiveTexture"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glClientActiveTexture"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glCompressedTexImage1D"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glCompressedTexImage2D"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glCompressedTexImage3D"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glCompressedTexSubImage1D"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glCompressedTexSubImage2D"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glCompressedTexSubImage3D"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[8] = getExtensionFuncPtr(cast(char*)"glGetCompressedTexImage"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[9] = getExtensionFuncPtr(cast(char*)"glLoadTransposeMatrixd"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[10] = getExtensionFuncPtr(cast(char*)"glLoadTransposeMatrixf"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[11] = getExtensionFuncPtr(cast(char*)"glMultTransposeMatrixd"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[12] = getExtensionFuncPtr(cast(char*)"glMultTransposeMatrixf"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[13] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord1d"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[14] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord1dv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[15] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord1f"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[16] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord1fv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[17] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord1i"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[18] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord1iv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[19] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord1s"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[20] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord1sv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[21] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord2d"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[22] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord2dv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[23] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord2f"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[24] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord2fv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[25] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord2i"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[26] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord2iv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[27] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord2s"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[28] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord2sv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[29] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord3d"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[30] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord3dv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[31] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord3f"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[32] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord3fv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[33] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord3i"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[34] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord3iv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[35] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord3s"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[36] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord3sv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[37] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord4d"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[38] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord4dv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[39] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord4f"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[40] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord4fv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[41] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord4i"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[42] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord4iv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[43] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord4s"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[44] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord4sv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[45] = getExtensionFuncPtr(cast(char*)"glSampleCoverage"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
