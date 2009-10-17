module dgl.ext.VERSION_1_4;
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



private ushort extensionId__ = 449;
alias extensionId__ VERSION_1_4;

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
			const GLenum GL_GENERATE_MIPMAP = 0x8191;
			const GLenum GL_GENERATE_MIPMAP_HINT = 0x8192;
			const GLenum GL_DEPTH_COMPONENT16 = 0x81A5;
			const GLenum GL_DEPTH_COMPONENT24 = 0x81A6;
			const GLenum GL_DEPTH_COMPONENT32 = 0x81A7;
			const GLenum GL_TEXTURE_DEPTH_SIZE = 0x884A;
			const GLenum GL_DEPTH_TEXTURE_MODE = 0x884B;
			const GLenum GL_TEXTURE_COMPARE_MODE = 0x884C;
			const GLenum GL_TEXTURE_COMPARE_FUNC = 0x884D;
			const GLenum GL_COMPARE_R_TO_TEXTURE = 0x884E;
			const GLenum GL_FOG_COORDINATE_SOURCE = 0x8450;
			const GLenum GL_FOG_COORDINATE = 0x8451;
			const GLenum GL_FRAGMENT_DEPTH = 0x8452;
			const GLenum GL_CURRENT_FOG_COORDINATE = 0x8453;
			const GLenum GL_FOG_COORDINATE_ARRAY_TYPE = 0x8454;
			const GLenum GL_FOG_COORDINATE_ARRAY_STRIDE = 0x8455;
			const GLenum GL_FOG_COORDINATE_ARRAY_POINTER = 0x8456;
			const GLenum GL_FOG_COORDINATE_ARRAY = 0x8457;
			const GLenum GL_POINT_SIZE_MIN = 0x8126;
			const GLenum GL_POINT_SIZE_MAX = 0x8127;
			const GLenum GL_POINT_FADE_THRESHOLD_SIZE = 0x8128;
			const GLenum GL_POINT_DISTANCE_ATTENUATION = 0x8129;
			const GLenum GL_COLOR_SUM = 0x8458;
			const GLenum GL_CURRENT_SECONDARY_COLOR = 0x8459;
			const GLenum GL_SECONDARY_COLOR_ARRAY_SIZE = 0x845A;
			const GLenum GL_SECONDARY_COLOR_ARRAY_TYPE = 0x845B;
			const GLenum GL_SECONDARY_COLOR_ARRAY_STRIDE = 0x845C;
			const GLenum GL_SECONDARY_COLOR_ARRAY_POINTER = 0x845D;
			const GLenum GL_SECONDARY_COLOR_ARRAY = 0x845E;
			const GLenum GL_BLEND_DST_RGB = 0x80C8;
			const GLenum GL_BLEND_SRC_RGB = 0x80C9;
			const GLenum GL_BLEND_DST_ALPHA = 0x80CA;
			const GLenum GL_BLEND_SRC_ALPHA = 0x80CB;
			const GLenum GL_INCR_WRAP = 0x8507;
			const GLenum GL_DECR_WRAP = 0x8508;
			const GLenum GL_TEXTURE_FILTER_CONTROL = 0x8500;
			const GLenum GL_TEXTURE_LOD_BIAS = 0x8501;
			const GLenum GL_MAX_TEXTURE_LOD_BIAS = 0x84FD;
			const GLenum GL_MIRRORED_REPEAT = 0x8370;
	}
	private {
		extern (System) {
			alias void function (GLenum mode)	fp_glBlendEquation;
			alias void function (GLclampf red, GLclampf green, GLclampf blue, GLclampf alpha)	fp_glBlendColor;
			alias void function (GLfloat coord)	fp_glFogCoordf;
			alias void function ( GLfloat *coord)	fp_glFogCoordfv;
			alias void function (GLdouble coord)	fp_glFogCoordd;
			alias void function ( GLdouble *coord)	fp_glFogCoorddv;
			alias void function (GLenum type, GLsizei stride,  GLvoid *pointer)	fp_glFogCoordPointer;
			alias void function (GLenum mode, GLint *first, GLsizei *count, GLsizei primcount)	fp_glMultiDrawArrays;
			alias void function (GLenum mode, GLsizei *count, GLenum type,  GLvoid **indices, GLsizei primcount)	fp_glMultiDrawElements;
			alias void function (GLenum pname, GLint param)	fp_glPointParameteri;
			alias void function (GLenum pname, GLint *params)	fp_glPointParameteriv;
			alias void function (GLenum pname, GLfloat param)	fp_glPointParameterf;
			alias void function (GLenum pname, GLfloat *params)	fp_glPointParameterfv;
			alias void function (GLbyte red, GLbyte green, GLbyte blue)	fp_glSecondaryColor3b;
			alias void function ( GLbyte *v)	fp_glSecondaryColor3bv;
			alias void function (GLdouble red, GLdouble green, GLdouble blue)	fp_glSecondaryColor3d;
			alias void function ( GLdouble *v)	fp_glSecondaryColor3dv;
			alias void function (GLfloat red, GLfloat green, GLfloat blue)	fp_glSecondaryColor3f;
			alias void function ( GLfloat *v)	fp_glSecondaryColor3fv;
			alias void function (GLint red, GLint green, GLint blue)	fp_glSecondaryColor3i;
			alias void function ( GLint *v)	fp_glSecondaryColor3iv;
			alias void function (GLshort red, GLshort green, GLshort blue)	fp_glSecondaryColor3s;
			alias void function ( GLshort *v)	fp_glSecondaryColor3sv;
			alias void function (GLubyte red, GLubyte green, GLubyte blue)	fp_glSecondaryColor3ub;
			alias void function ( GLubyte *v)	fp_glSecondaryColor3ubv;
			alias void function (GLuint red, GLuint green, GLuint blue)	fp_glSecondaryColor3ui;
			alias void function ( GLuint *v)	fp_glSecondaryColor3uiv;
			alias void function (GLushort red, GLushort green, GLushort blue)	fp_glSecondaryColor3us;
			alias void function ( GLushort *v)	fp_glSecondaryColor3usv;
			alias void function (GLint size, GLenum type, GLsizei stride, GLvoid *pointer)	fp_glSecondaryColorPointer;
			alias void function (GLenum sfactorRGB, GLenum dfactorRGB, GLenum sfactorAlpha, GLenum dfactorAlpha)	fp_glBlendFuncSeparate;
			alias void function (GLdouble x, GLdouble y)	fp_glWindowPos2d;
			alias void function (GLfloat x, GLfloat y)	fp_glWindowPos2f;
			alias void function (GLint x, GLint y)	fp_glWindowPos2i;
			alias void function (GLshort x, GLshort y)	fp_glWindowPos2s;
			alias void function ( GLdouble *p)	fp_glWindowPos2dv;
			alias void function ( GLfloat *p)	fp_glWindowPos2fv;
			alias void function ( GLint *p)	fp_glWindowPos2iv;
			alias void function ( GLshort *p)	fp_glWindowPos2sv;
			alias void function (GLdouble x, GLdouble y, GLdouble z)	fp_glWindowPos3d;
			alias void function (GLfloat x, GLfloat y, GLfloat z)	fp_glWindowPos3f;
			alias void function (GLint x, GLint y, GLint z)	fp_glWindowPos3i;
			alias void function (GLshort x, GLshort y, GLshort z)	fp_glWindowPos3s;
			alias void function ( GLdouble *p)	fp_glWindowPos3dv;
			alias void function ( GLfloat *p)	fp_glWindowPos3fv;
			alias void function ( GLint *p)	fp_glWindowPos3iv;
			alias void function ( GLshort *p)	fp_glWindowPos3sv;
		}
	}
	public {
void BlendEquation(GL gl_, ParameterTypeTuple!(fp_glBlendEquation) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBlendEquation)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "BlendEquation", funcPtr, params__);
		}
void BlendColor(GL gl_, ParameterTypeTuple!(fp_glBlendColor) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBlendColor)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "BlendColor", funcPtr, params__);
		}
void FogCoordf(GL gl_, ParameterTypeTuple!(fp_glFogCoordf) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFogCoordf)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "FogCoordf", funcPtr, params__);
		}
void FogCoordfv(GL gl_, ParameterTypeTuple!(fp_glFogCoordfv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFogCoordfv)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "FogCoordfv", funcPtr, params__);
		}
void FogCoordd(GL gl_, ParameterTypeTuple!(fp_glFogCoordd) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFogCoordd)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "FogCoordd", funcPtr, params__);
		}
void FogCoorddv(GL gl_, ParameterTypeTuple!(fp_glFogCoorddv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFogCoorddv)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "FogCoorddv", funcPtr, params__);
		}
void FogCoordPointer(GL gl_, ParameterTypeTuple!(fp_glFogCoordPointer) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFogCoordPointer)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "FogCoordPointer", funcPtr, params__);
		}
void MultiDrawArrays(GL gl_, ParameterTypeTuple!(fp_glMultiDrawArrays) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiDrawArrays)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "MultiDrawArrays", funcPtr, params__);
		}
void MultiDrawElements(GL gl_, ParameterTypeTuple!(fp_glMultiDrawElements) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiDrawElements)(gl.extFuncs[extensionId__][8]);
			return checkedCall(gl_, "MultiDrawElements", funcPtr, params__);
		}
void PointParameteri(GL gl_, ParameterTypeTuple!(fp_glPointParameteri) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glPointParameteri)(gl.extFuncs[extensionId__][9]);
			return checkedCall(gl_, "PointParameteri", funcPtr, params__);
		}
void PointParameteriv(GL gl_, ParameterTypeTuple!(fp_glPointParameteriv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glPointParameteriv)(gl.extFuncs[extensionId__][10]);
			return checkedCall(gl_, "PointParameteriv", funcPtr, params__);
		}
void PointParameterf(GL gl_, ParameterTypeTuple!(fp_glPointParameterf) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glPointParameterf)(gl.extFuncs[extensionId__][11]);
			return checkedCall(gl_, "PointParameterf", funcPtr, params__);
		}
void PointParameterfv(GL gl_, ParameterTypeTuple!(fp_glPointParameterfv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glPointParameterfv)(gl.extFuncs[extensionId__][12]);
			return checkedCall(gl_, "PointParameterfv", funcPtr, params__);
		}
void SecondaryColor3b(GL gl_, ParameterTypeTuple!(fp_glSecondaryColor3b) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSecondaryColor3b)(gl.extFuncs[extensionId__][13]);
			return checkedCall(gl_, "SecondaryColor3b", funcPtr, params__);
		}
void SecondaryColor3bv(GL gl_, ParameterTypeTuple!(fp_glSecondaryColor3bv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSecondaryColor3bv)(gl.extFuncs[extensionId__][14]);
			return checkedCall(gl_, "SecondaryColor3bv", funcPtr, params__);
		}
void SecondaryColor3d(GL gl_, ParameterTypeTuple!(fp_glSecondaryColor3d) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSecondaryColor3d)(gl.extFuncs[extensionId__][15]);
			return checkedCall(gl_, "SecondaryColor3d", funcPtr, params__);
		}
void SecondaryColor3dv(GL gl_, ParameterTypeTuple!(fp_glSecondaryColor3dv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSecondaryColor3dv)(gl.extFuncs[extensionId__][16]);
			return checkedCall(gl_, "SecondaryColor3dv", funcPtr, params__);
		}
void SecondaryColor3f(GL gl_, ParameterTypeTuple!(fp_glSecondaryColor3f) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSecondaryColor3f)(gl.extFuncs[extensionId__][17]);
			return checkedCall(gl_, "SecondaryColor3f", funcPtr, params__);
		}
void SecondaryColor3fv(GL gl_, ParameterTypeTuple!(fp_glSecondaryColor3fv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSecondaryColor3fv)(gl.extFuncs[extensionId__][18]);
			return checkedCall(gl_, "SecondaryColor3fv", funcPtr, params__);
		}
void SecondaryColor3i(GL gl_, ParameterTypeTuple!(fp_glSecondaryColor3i) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSecondaryColor3i)(gl.extFuncs[extensionId__][19]);
			return checkedCall(gl_, "SecondaryColor3i", funcPtr, params__);
		}
void SecondaryColor3iv(GL gl_, ParameterTypeTuple!(fp_glSecondaryColor3iv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSecondaryColor3iv)(gl.extFuncs[extensionId__][20]);
			return checkedCall(gl_, "SecondaryColor3iv", funcPtr, params__);
		}
void SecondaryColor3s(GL gl_, ParameterTypeTuple!(fp_glSecondaryColor3s) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSecondaryColor3s)(gl.extFuncs[extensionId__][21]);
			return checkedCall(gl_, "SecondaryColor3s", funcPtr, params__);
		}
void SecondaryColor3sv(GL gl_, ParameterTypeTuple!(fp_glSecondaryColor3sv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSecondaryColor3sv)(gl.extFuncs[extensionId__][22]);
			return checkedCall(gl_, "SecondaryColor3sv", funcPtr, params__);
		}
void SecondaryColor3ub(GL gl_, ParameterTypeTuple!(fp_glSecondaryColor3ub) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSecondaryColor3ub)(gl.extFuncs[extensionId__][23]);
			return checkedCall(gl_, "SecondaryColor3ub", funcPtr, params__);
		}
void SecondaryColor3ubv(GL gl_, ParameterTypeTuple!(fp_glSecondaryColor3ubv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSecondaryColor3ubv)(gl.extFuncs[extensionId__][24]);
			return checkedCall(gl_, "SecondaryColor3ubv", funcPtr, params__);
		}
void SecondaryColor3ui(GL gl_, ParameterTypeTuple!(fp_glSecondaryColor3ui) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSecondaryColor3ui)(gl.extFuncs[extensionId__][25]);
			return checkedCall(gl_, "SecondaryColor3ui", funcPtr, params__);
		}
void SecondaryColor3uiv(GL gl_, ParameterTypeTuple!(fp_glSecondaryColor3uiv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSecondaryColor3uiv)(gl.extFuncs[extensionId__][26]);
			return checkedCall(gl_, "SecondaryColor3uiv", funcPtr, params__);
		}
void SecondaryColor3us(GL gl_, ParameterTypeTuple!(fp_glSecondaryColor3us) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSecondaryColor3us)(gl.extFuncs[extensionId__][27]);
			return checkedCall(gl_, "SecondaryColor3us", funcPtr, params__);
		}
void SecondaryColor3usv(GL gl_, ParameterTypeTuple!(fp_glSecondaryColor3usv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSecondaryColor3usv)(gl.extFuncs[extensionId__][28]);
			return checkedCall(gl_, "SecondaryColor3usv", funcPtr, params__);
		}
void SecondaryColorPointer(GL gl_, ParameterTypeTuple!(fp_glSecondaryColorPointer) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSecondaryColorPointer)(gl.extFuncs[extensionId__][29]);
			return checkedCall(gl_, "SecondaryColorPointer", funcPtr, params__);
		}
void BlendFuncSeparate(GL gl_, ParameterTypeTuple!(fp_glBlendFuncSeparate) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBlendFuncSeparate)(gl.extFuncs[extensionId__][30]);
			return checkedCall(gl_, "BlendFuncSeparate", funcPtr, params__);
		}
void WindowPos2d(GL gl_, ParameterTypeTuple!(fp_glWindowPos2d) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos2d)(gl.extFuncs[extensionId__][31]);
			return checkedCall(gl_, "WindowPos2d", funcPtr, params__);
		}
void WindowPos2f(GL gl_, ParameterTypeTuple!(fp_glWindowPos2f) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos2f)(gl.extFuncs[extensionId__][32]);
			return checkedCall(gl_, "WindowPos2f", funcPtr, params__);
		}
void WindowPos2i(GL gl_, ParameterTypeTuple!(fp_glWindowPos2i) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos2i)(gl.extFuncs[extensionId__][33]);
			return checkedCall(gl_, "WindowPos2i", funcPtr, params__);
		}
void WindowPos2s(GL gl_, ParameterTypeTuple!(fp_glWindowPos2s) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos2s)(gl.extFuncs[extensionId__][34]);
			return checkedCall(gl_, "WindowPos2s", funcPtr, params__);
		}
void WindowPos2dv(GL gl_, ParameterTypeTuple!(fp_glWindowPos2dv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos2dv)(gl.extFuncs[extensionId__][35]);
			return checkedCall(gl_, "WindowPos2dv", funcPtr, params__);
		}
void WindowPos2fv(GL gl_, ParameterTypeTuple!(fp_glWindowPos2fv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos2fv)(gl.extFuncs[extensionId__][36]);
			return checkedCall(gl_, "WindowPos2fv", funcPtr, params__);
		}
void WindowPos2iv(GL gl_, ParameterTypeTuple!(fp_glWindowPos2iv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos2iv)(gl.extFuncs[extensionId__][37]);
			return checkedCall(gl_, "WindowPos2iv", funcPtr, params__);
		}
void WindowPos2sv(GL gl_, ParameterTypeTuple!(fp_glWindowPos2sv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos2sv)(gl.extFuncs[extensionId__][38]);
			return checkedCall(gl_, "WindowPos2sv", funcPtr, params__);
		}
void WindowPos3d(GL gl_, ParameterTypeTuple!(fp_glWindowPos3d) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos3d)(gl.extFuncs[extensionId__][39]);
			return checkedCall(gl_, "WindowPos3d", funcPtr, params__);
		}
void WindowPos3f(GL gl_, ParameterTypeTuple!(fp_glWindowPos3f) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos3f)(gl.extFuncs[extensionId__][40]);
			return checkedCall(gl_, "WindowPos3f", funcPtr, params__);
		}
void WindowPos3i(GL gl_, ParameterTypeTuple!(fp_glWindowPos3i) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos3i)(gl.extFuncs[extensionId__][41]);
			return checkedCall(gl_, "WindowPos3i", funcPtr, params__);
		}
void WindowPos3s(GL gl_, ParameterTypeTuple!(fp_glWindowPos3s) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos3s)(gl.extFuncs[extensionId__][42]);
			return checkedCall(gl_, "WindowPos3s", funcPtr, params__);
		}
void WindowPos3dv(GL gl_, ParameterTypeTuple!(fp_glWindowPos3dv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos3dv)(gl.extFuncs[extensionId__][43]);
			return checkedCall(gl_, "WindowPos3dv", funcPtr, params__);
		}
void WindowPos3fv(GL gl_, ParameterTypeTuple!(fp_glWindowPos3fv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos3fv)(gl.extFuncs[extensionId__][44]);
			return checkedCall(gl_, "WindowPos3fv", funcPtr, params__);
		}
void WindowPos3iv(GL gl_, ParameterTypeTuple!(fp_glWindowPos3iv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos3iv)(gl.extFuncs[extensionId__][45]);
			return checkedCall(gl_, "WindowPos3iv", funcPtr, params__);
		}
void WindowPos3sv(GL gl_, ParameterTypeTuple!(fp_glWindowPos3sv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos3sv)(gl.extFuncs[extensionId__][46]);
			return checkedCall(gl_, "WindowPos3sv", funcPtr, params__);
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
		void*[] funcAddr = new void*[47];
		{
			if (!isOpenGLVersionSupported("1_4", '_')) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glBlendEquation"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glBlendColor"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glFogCoordf"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glFogCoordfv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glFogCoordd"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glFogCoorddv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glFogCoordPointer"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glMultiDrawArrays"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[8] = getExtensionFuncPtr(cast(char*)"glMultiDrawElements"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[9] = getExtensionFuncPtr(cast(char*)"glPointParameteri"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[10] = getExtensionFuncPtr(cast(char*)"glPointParameteriv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[11] = getExtensionFuncPtr(cast(char*)"glPointParameterf"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[12] = getExtensionFuncPtr(cast(char*)"glPointParameterfv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[13] = getExtensionFuncPtr(cast(char*)"glSecondaryColor3b"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[14] = getExtensionFuncPtr(cast(char*)"glSecondaryColor3bv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[15] = getExtensionFuncPtr(cast(char*)"glSecondaryColor3d"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[16] = getExtensionFuncPtr(cast(char*)"glSecondaryColor3dv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[17] = getExtensionFuncPtr(cast(char*)"glSecondaryColor3f"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[18] = getExtensionFuncPtr(cast(char*)"glSecondaryColor3fv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[19] = getExtensionFuncPtr(cast(char*)"glSecondaryColor3i"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[20] = getExtensionFuncPtr(cast(char*)"glSecondaryColor3iv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[21] = getExtensionFuncPtr(cast(char*)"glSecondaryColor3s"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[22] = getExtensionFuncPtr(cast(char*)"glSecondaryColor3sv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[23] = getExtensionFuncPtr(cast(char*)"glSecondaryColor3ub"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[24] = getExtensionFuncPtr(cast(char*)"glSecondaryColor3ubv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[25] = getExtensionFuncPtr(cast(char*)"glSecondaryColor3ui"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[26] = getExtensionFuncPtr(cast(char*)"glSecondaryColor3uiv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[27] = getExtensionFuncPtr(cast(char*)"glSecondaryColor3us"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[28] = getExtensionFuncPtr(cast(char*)"glSecondaryColor3usv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[29] = getExtensionFuncPtr(cast(char*)"glSecondaryColorPointer"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[30] = getExtensionFuncPtr(cast(char*)"glBlendFuncSeparate"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[31] = getExtensionFuncPtr(cast(char*)"glWindowPos2d"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[32] = getExtensionFuncPtr(cast(char*)"glWindowPos2f"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[33] = getExtensionFuncPtr(cast(char*)"glWindowPos2i"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[34] = getExtensionFuncPtr(cast(char*)"glWindowPos2s"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[35] = getExtensionFuncPtr(cast(char*)"glWindowPos2dv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[36] = getExtensionFuncPtr(cast(char*)"glWindowPos2fv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[37] = getExtensionFuncPtr(cast(char*)"glWindowPos2iv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[38] = getExtensionFuncPtr(cast(char*)"glWindowPos2sv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[39] = getExtensionFuncPtr(cast(char*)"glWindowPos3d"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[40] = getExtensionFuncPtr(cast(char*)"glWindowPos3f"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[41] = getExtensionFuncPtr(cast(char*)"glWindowPos3i"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[42] = getExtensionFuncPtr(cast(char*)"glWindowPos3s"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[43] = getExtensionFuncPtr(cast(char*)"glWindowPos3dv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[44] = getExtensionFuncPtr(cast(char*)"glWindowPos3fv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[45] = getExtensionFuncPtr(cast(char*)"glWindowPos3iv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[46] = getExtensionFuncPtr(cast(char*)"glWindowPos3sv"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
