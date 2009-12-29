module dgl.ext.VERSION_3_0;
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



private ushort extensionId__ = 49;
alias extensionId__ VERSION_3_0;

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
			const GLenum GL_MAJOR_VERSION = 0x821B;
			const GLenum GL_MINOR_VERSION = 0x821C;
			const GLenum GL_NUM_EXTENSIONS = 0x821D;
			const GLenum GL_CONTEXT_FLAGS = 0x821E;
			const GLenum GL_DEPTH_BUFFER = 0x8223;
			const GLenum GL_STENCIL_BUFFER = 0x8224;
			const GLenum GL_COMPRESSED_RED = 0x8225;
			const GLenum GL_COMPRESSED_RG = 0x8226;
			const GLenum GL_CONTEXT_FLAG_FORWARD_COMPATIBLE_BIT = 0x0001;
			const GLenum GL_RGBA32F = 0x8814;
			const GLenum GL_RGB32F = 0x8815;
			const GLenum GL_RGBA16F = 0x881A;
			const GLenum GL_RGB16F = 0x881B;
			const GLenum GL_VERTEX_ATTRIB_ARRAY_INTEGER = 0x88FD;
			const GLenum GL_MAX_ARRAY_TEXTURE_LAYERS = 0x88FF;
			const GLenum GL_MIN_PROGRAM_TEXEL_OFFSET = 0x8904;
			const GLenum GL_MAX_PROGRAM_TEXEL_OFFSET = 0x8905;
			const GLenum GL_CLAMP_VERTEX_COLOR = 0x891A;
			const GLenum GL_CLAMP_FRAGMENT_COLOR = 0x891B;
			const GLenum GL_CLAMP_READ_COLOR = 0x891C;
			const GLenum GL_FIXED_ONLY = 0x891D;
			const GLenum GL_TEXTURE_RED_TYPE = 0x8C10;
			const GLenum GL_TEXTURE_GREEN_TYPE = 0x8C11;
			const GLenum GL_TEXTURE_BLUE_TYPE = 0x8C12;
			const GLenum GL_TEXTURE_ALPHA_TYPE = 0x8C13;
			const GLenum GL_TEXTURE_LUMINANCE_TYPE = 0x8C14;
			const GLenum GL_TEXTURE_INTENSITY_TYPE = 0x8C15;
			const GLenum GL_TEXTURE_DEPTH_TYPE = 0x8C16;
			const GLenum GL_UNSIGNED_NORMALIZED = 0x8C17;
			const GLenum GL_TEXTURE_1D_ARRAY = 0x8C18;
			const GLenum GL_PROXY_TEXTURE_1D_ARRAY = 0x8C19;
			const GLenum GL_TEXTURE_2D_ARRAY = 0x8C1A;
			const GLenum GL_PROXY_TEXTURE_2D_ARRAY = 0x8C1B;
			const GLenum GL_TEXTURE_BINDING_1D_ARRAY = 0x8C1C;
			const GLenum GL_TEXTURE_BINDING_2D_ARRAY = 0x8C1D;
			const GLenum GL_R11F_G11F_B10F = 0x8C3A;
			const GLenum GL_UNSIGNED_INT_10F_11F_11F_REV = 0x8C3B;
			const GLenum GL_RGB9_E5 = 0x8C3D;
			const GLenum GL_UNSIGNED_INT_5_9_9_9_REV = 0x8C3E;
			const GLenum GL_TEXTURE_SHARED_SIZE = 0x8C3F;
			const GLenum GL_TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH = 0x8C76;
			const GLenum GL_TRANSFORM_FEEDBACK_BUFFER_MODE = 0x8C7F;
			const GLenum GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS = 0x8C80;
			const GLenum GL_TRANSFORM_FEEDBACK_VARYINGS = 0x8C83;
			const GLenum GL_TRANSFORM_FEEDBACK_BUFFER_START = 0x8C84;
			const GLenum GL_TRANSFORM_FEEDBACK_BUFFER_SIZE = 0x8C85;
			const GLenum GL_PRIMITIVES_GENERATED = 0x8C87;
			const GLenum GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN = 0x8C88;
			const GLenum GL_RASTERIZER_DISCARD = 0x8C89;
			const GLenum GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS = 0x8C8A;
			const GLenum GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS = 0x8C8B;
			const GLenum GL_INTERLEAVED_ATTRIBS = 0x8C8C;
			const GLenum GL_SEPARATE_ATTRIBS = 0x8C8D;
			const GLenum GL_TRANSFORM_FEEDBACK_BUFFER = 0x8C8E;
			const GLenum GL_TRANSFORM_FEEDBACK_BUFFER_BINDING = 0x8C8F;
			const GLenum GL_RGBA32UI = 0x8D70;
			const GLenum GL_RGB32UI = 0x8D71;
			const GLenum GL_RGBA16UI = 0x8D76;
			const GLenum GL_RGB16UI = 0x8D77;
			const GLenum GL_RGBA8UI = 0x8D7C;
			const GLenum GL_RGB8UI = 0x8D7D;
			const GLenum GL_RGBA32I = 0x8D82;
			const GLenum GL_RGB32I = 0x8D83;
			const GLenum GL_RGBA16I = 0x8D88;
			const GLenum GL_RGB16I = 0x8D89;
			const GLenum GL_RGBA8I = 0x8D8E;
			const GLenum GL_RGB8I = 0x8D8F;
			const GLenum GL_RED_INTEGER = 0x8D94;
			const GLenum GL_GREEN_INTEGER = 0x8D95;
			const GLenum GL_BLUE_INTEGER = 0x8D96;
			const GLenum GL_ALPHA_INTEGER = 0x8D97;
			const GLenum GL_RGB_INTEGER = 0x8D98;
			const GLenum GL_RGBA_INTEGER = 0x8D99;
			const GLenum GL_BGR_INTEGER = 0x8D9A;
			const GLenum GL_BGRA_INTEGER = 0x8D9B;
			const GLenum GL_SAMPLER_1D_ARRAY = 0x8DC0;
			const GLenum GL_SAMPLER_2D_ARRAY = 0x8DC1;
			const GLenum GL_SAMPLER_1D_ARRAY_SHADOW = 0x8DC3;
			const GLenum GL_SAMPLER_2D_ARRAY_SHADOW = 0x8DC4;
			const GLenum GL_SAMPLER_CUBE_SHADOW = 0x8DC5;
			const GLenum GL_UNSIGNED_INT_VEC2 = 0x8DC6;
			const GLenum GL_UNSIGNED_INT_VEC3 = 0x8DC7;
			const GLenum GL_UNSIGNED_INT_VEC4 = 0x8DC8;
			const GLenum GL_INT_SAMPLER_1D = 0x8DC9;
			const GLenum GL_INT_SAMPLER_2D = 0x8DCA;
			const GLenum GL_INT_SAMPLER_3D = 0x8DCB;
			const GLenum GL_INT_SAMPLER_CUBE = 0x8DCC;
			const GLenum GL_INT_SAMPLER_1D_ARRAY = 0x8DCE;
			const GLenum GL_INT_SAMPLER_2D_ARRAY = 0x8DCF;
			const GLenum GL_UNSIGNED_INT_SAMPLER_1D = 0x8DD1;
			const GLenum GL_UNSIGNED_INT_SAMPLER_2D = 0x8DD2;
			const GLenum GL_UNSIGNED_INT_SAMPLER_3D = 0x8DD3;
			const GLenum GL_UNSIGNED_INT_SAMPLER_CUBE = 0x8DD4;
			const GLenum GL_UNSIGNED_INT_SAMPLER_1D_ARRAY = 0x8DD6;
			const GLenum GL_UNSIGNED_INT_SAMPLER_2D_ARRAY = 0x8DD7;
			const GLenum GL_QUERY_WAIT = 0x8E13;
			const GLenum GL_QUERY_NO_WAIT = 0x8E14;
			const GLenum GL_QUERY_BY_REGION_WAIT = 0x8E15;
			const GLenum GL_QUERY_BY_REGION_NO_WAIT = 0x8E16;
	}
	private {
		extern (System) {
			alias void function (GLuint, GLboolean, GLboolean, GLboolean, GLboolean)	fp_glColorMaski;
			alias void function (GLenum, GLuint, GLboolean*)	fp_glGetBooleani_v;
			alias void function (GLenum, GLuint)	fp_glEnablei;
			alias void function (GLenum, GLuint)	fp_glDisablei;
			alias GLboolean function (GLenum, GLuint)	fp_glIsEnabledi;
			alias void function (GLenum)	fp_glBeginTransformFeedback;
			alias void function ()	fp_glEndTransformFeedback;
			alias void function (GLuint, GLsizei,  GLchar **, GLenum)	fp_glTransformFeedbackVaryings;
			alias void function (GLuint, GLuint, GLint*)	fp_glGetTransformFeedbackVarying;
			alias void function (GLenum, GLenum)	fp_glClampColor;
			alias void function (GLuint, GLenum)	fp_glBeginConditionalRender;
			alias void function ()	fp_glEndConditionalRender;
			alias void function (GLuint, GLint)	fp_glVertexAttribI1i;
			alias void function (GLuint, GLint, GLint)	fp_glVertexAttribI2i;
			alias void function (GLuint, GLint, GLint, GLint)	fp_glVertexAttribI3i;
			alias void function (GLuint, GLint, GLint, GLint, GLint)	fp_glVertexAttribI4i;
			alias void function (GLuint, GLuint)	fp_glVertexAttribI1ui;
			alias void function (GLuint, GLuint, GLuint)	fp_glVertexAttribI2ui;
			alias void function (GLuint, GLuint, GLuint, GLuint)	fp_glVertexAttribI3ui;
			alias void function (GLuint, GLuint, GLuint, GLuint, GLuint)	fp_glVertexAttribI4ui;
			alias void function (GLuint,  GLint*)	fp_glVertexAttribI1iv;
			alias void function (GLuint,  GLint*)	fp_glVertexAttribI2iv;
			alias void function (GLuint,  GLint*)	fp_glVertexAttribI3iv;
			alias void function (GLuint,  GLint*)	fp_glVertexAttribI4iv;
			alias void function (GLuint,  GLuint*)	fp_glVertexAttribI1uiv;
			alias void function (GLuint,  GLuint*)	fp_glVertexAttribI2uiv;
			alias void function (GLuint,  GLuint*)	fp_glVertexAttribI3uiv;
			alias void function (GLuint,  GLuint*)	fp_glVertexAttribI4uiv;
			alias void function (GLuint,  GLbyte*)	fp_glVertexAttribI4bv;
			alias void function (GLuint,  GLshort*)	fp_glVertexAttribI4sv;
			alias void function (GLuint,  GLubyte*)	fp_glVertexAttribI4ubv;
			alias void function (GLuint,  GLushort*)	fp_glVertexAttribI4usv;
			alias void function (GLuint, GLint, GLenum, GLsizei,  GLvoid*)	fp_glVertexAttribIPointer;
			alias void function (GLuint, GLenum, GLint*)	fp_glGetVertexAttribIiv;
			alias void function (GLuint, GLenum, GLuint*)	fp_glGetVertexAttribIuiv;
			alias void function (GLuint, GLint, GLuint*)	fp_glGetUniformuiv;
			alias void function (GLuint, GLuint,  GLchar*)	fp_glBindFragDataLocation;
			alias GLint function (GLuint,  GLchar*)	fp_glGetFragDataLocation;
			alias void function (GLint, GLuint)	fp_glUniform1ui;
			alias void function (GLint, GLuint, GLuint)	fp_glUniform2ui;
			alias void function (GLint, GLuint, GLuint, GLuint)	fp_glUniform3ui;
			alias void function (GLint, GLuint, GLuint, GLuint, GLuint)	fp_glUniform4ui;
			alias void function (GLint, GLsizei,  GLuint*)	fp_glUniform1uiv;
			alias void function (GLint, GLsizei,  GLuint*)	fp_glUniform2uiv;
			alias void function (GLint, GLsizei,  GLuint*)	fp_glUniform3uiv;
			alias void function (GLint, GLsizei,  GLuint*)	fp_glUniform4uiv;
			alias void function (GLenum, GLenum,  GLint*)	fp_glTexParameterIiv;
			alias void function (GLenum, GLenum,  GLuint*)	fp_glTexParameterIuiv;
			alias void function (GLenum, GLenum, GLint*)	fp_glGetTexParameterIiv;
			alias void function (GLenum, GLenum, GLuint*)	fp_glGetTexParameterIuiv;
			alias void function (GLenum, GLint,  GLint*)	fp_glClearBufferiv;
			alias void function (GLenum, GLint,  GLuint*)	fp_glClearBufferuiv;
			alias void function (GLenum, GLint,  GLfloat*)	fp_glClearBufferfv;
			alias void function (GLenum, GLint, GLfloat, GLint)	fp_glClearBufferfi;
			alias GLubyte* function (GLenum, GLuint)	fp_glGetStringi;
		}
	}
	public {
void ColorMaski(GL gl_, ParameterTypeTuple!(fp_glColorMaski) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glColorMaski)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "ColorMaski", funcPtr, params__);
		}
void GetBooleani_v(GL gl_, ParameterTypeTuple!(fp_glGetBooleani_v) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetBooleani_v)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "GetBooleani_v", funcPtr, params__);
		}
void Enablei(GL gl_, ParameterTypeTuple!(fp_glEnablei) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glEnablei)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "Enablei", funcPtr, params__);
		}
void Disablei(GL gl_, ParameterTypeTuple!(fp_glDisablei) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDisablei)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "Disablei", funcPtr, params__);
		}
GLboolean IsEnabledi(GL gl_, ParameterTypeTuple!(fp_glIsEnabledi) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glIsEnabledi)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "IsEnabledi", funcPtr, params__);
		}
void BeginTransformFeedback(GL gl_, ParameterTypeTuple!(fp_glBeginTransformFeedback) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBeginTransformFeedback)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "BeginTransformFeedback", funcPtr, params__);
		}
void EndTransformFeedback(GL gl_, ParameterTypeTuple!(fp_glEndTransformFeedback) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glEndTransformFeedback)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "EndTransformFeedback", funcPtr, params__);
		}
void TransformFeedbackVaryings(GL gl_, ParameterTypeTuple!(fp_glTransformFeedbackVaryings) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTransformFeedbackVaryings)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "TransformFeedbackVaryings", funcPtr, params__);
		}
void GetTransformFeedbackVarying(GL gl_, ParameterTypeTuple!(fp_glGetTransformFeedbackVarying) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetTransformFeedbackVarying)(gl.extFuncs[extensionId__][8]);
			return checkedCall(gl_, "GetTransformFeedbackVarying", funcPtr, params__);
		}
void ClampColor(GL gl_, ParameterTypeTuple!(fp_glClampColor) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glClampColor)(gl.extFuncs[extensionId__][9]);
			return checkedCall(gl_, "ClampColor", funcPtr, params__);
		}
void BeginConditionalRender(GL gl_, ParameterTypeTuple!(fp_glBeginConditionalRender) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBeginConditionalRender)(gl.extFuncs[extensionId__][10]);
			return checkedCall(gl_, "BeginConditionalRender", funcPtr, params__);
		}
void EndConditionalRender(GL gl_, ParameterTypeTuple!(fp_glEndConditionalRender) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glEndConditionalRender)(gl.extFuncs[extensionId__][11]);
			return checkedCall(gl_, "EndConditionalRender", funcPtr, params__);
		}
void VertexAttribI1i(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI1i) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI1i)(gl.extFuncs[extensionId__][12]);
			return checkedCall(gl_, "VertexAttribI1i", funcPtr, params__);
		}
void VertexAttribI2i(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI2i) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI2i)(gl.extFuncs[extensionId__][13]);
			return checkedCall(gl_, "VertexAttribI2i", funcPtr, params__);
		}
void VertexAttribI3i(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI3i) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI3i)(gl.extFuncs[extensionId__][14]);
			return checkedCall(gl_, "VertexAttribI3i", funcPtr, params__);
		}
void VertexAttribI4i(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI4i) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI4i)(gl.extFuncs[extensionId__][15]);
			return checkedCall(gl_, "VertexAttribI4i", funcPtr, params__);
		}
void VertexAttribI1ui(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI1ui) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI1ui)(gl.extFuncs[extensionId__][16]);
			return checkedCall(gl_, "VertexAttribI1ui", funcPtr, params__);
		}
void VertexAttribI2ui(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI2ui) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI2ui)(gl.extFuncs[extensionId__][17]);
			return checkedCall(gl_, "VertexAttribI2ui", funcPtr, params__);
		}
void VertexAttribI3ui(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI3ui) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI3ui)(gl.extFuncs[extensionId__][18]);
			return checkedCall(gl_, "VertexAttribI3ui", funcPtr, params__);
		}
void VertexAttribI4ui(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI4ui) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI4ui)(gl.extFuncs[extensionId__][19]);
			return checkedCall(gl_, "VertexAttribI4ui", funcPtr, params__);
		}
void VertexAttribI1iv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI1iv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI1iv)(gl.extFuncs[extensionId__][20]);
			return checkedCall(gl_, "VertexAttribI1iv", funcPtr, params__);
		}
void VertexAttribI2iv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI2iv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI2iv)(gl.extFuncs[extensionId__][21]);
			return checkedCall(gl_, "VertexAttribI2iv", funcPtr, params__);
		}
void VertexAttribI3iv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI3iv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI3iv)(gl.extFuncs[extensionId__][22]);
			return checkedCall(gl_, "VertexAttribI3iv", funcPtr, params__);
		}
void VertexAttribI4iv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI4iv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI4iv)(gl.extFuncs[extensionId__][23]);
			return checkedCall(gl_, "VertexAttribI4iv", funcPtr, params__);
		}
void VertexAttribI1uiv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI1uiv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI1uiv)(gl.extFuncs[extensionId__][24]);
			return checkedCall(gl_, "VertexAttribI1uiv", funcPtr, params__);
		}
void VertexAttribI2uiv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI2uiv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI2uiv)(gl.extFuncs[extensionId__][25]);
			return checkedCall(gl_, "VertexAttribI2uiv", funcPtr, params__);
		}
void VertexAttribI3uiv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI3uiv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI3uiv)(gl.extFuncs[extensionId__][26]);
			return checkedCall(gl_, "VertexAttribI3uiv", funcPtr, params__);
		}
void VertexAttribI4uiv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI4uiv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI4uiv)(gl.extFuncs[extensionId__][27]);
			return checkedCall(gl_, "VertexAttribI4uiv", funcPtr, params__);
		}
void VertexAttribI4bv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI4bv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI4bv)(gl.extFuncs[extensionId__][28]);
			return checkedCall(gl_, "VertexAttribI4bv", funcPtr, params__);
		}
void VertexAttribI4sv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI4sv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI4sv)(gl.extFuncs[extensionId__][29]);
			return checkedCall(gl_, "VertexAttribI4sv", funcPtr, params__);
		}
void VertexAttribI4ubv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI4ubv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI4ubv)(gl.extFuncs[extensionId__][30]);
			return checkedCall(gl_, "VertexAttribI4ubv", funcPtr, params__);
		}
void VertexAttribI4usv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribI4usv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribI4usv)(gl.extFuncs[extensionId__][31]);
			return checkedCall(gl_, "VertexAttribI4usv", funcPtr, params__);
		}
void VertexAttribIPointer(GL gl_, ParameterTypeTuple!(fp_glVertexAttribIPointer) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribIPointer)(gl.extFuncs[extensionId__][32]);
			return checkedCall(gl_, "VertexAttribIPointer", funcPtr, params__);
		}
void GetVertexAttribIiv(GL gl_, ParameterTypeTuple!(fp_glGetVertexAttribIiv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetVertexAttribIiv)(gl.extFuncs[extensionId__][33]);
			return checkedCall(gl_, "GetVertexAttribIiv", funcPtr, params__);
		}
void GetVertexAttribIuiv(GL gl_, ParameterTypeTuple!(fp_glGetVertexAttribIuiv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetVertexAttribIuiv)(gl.extFuncs[extensionId__][34]);
			return checkedCall(gl_, "GetVertexAttribIuiv", funcPtr, params__);
		}
void GetUniformuiv(GL gl_, ParameterTypeTuple!(fp_glGetUniformuiv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetUniformuiv)(gl.extFuncs[extensionId__][35]);
			return checkedCall(gl_, "GetUniformuiv", funcPtr, params__);
		}
void BindFragDataLocation(GL gl_, ParameterTypeTuple!(fp_glBindFragDataLocation) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBindFragDataLocation)(gl.extFuncs[extensionId__][36]);
			return checkedCall(gl_, "BindFragDataLocation", funcPtr, params__);
		}
GLint GetFragDataLocation(GL gl_, ParameterTypeTuple!(fp_glGetFragDataLocation) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetFragDataLocation)(gl.extFuncs[extensionId__][37]);
			return checkedCall(gl_, "GetFragDataLocation", funcPtr, params__);
		}
void Uniform1ui(GL gl_, ParameterTypeTuple!(fp_glUniform1ui) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform1ui)(gl.extFuncs[extensionId__][38]);
			return checkedCall(gl_, "Uniform1ui", funcPtr, params__);
		}
void Uniform2ui(GL gl_, ParameterTypeTuple!(fp_glUniform2ui) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform2ui)(gl.extFuncs[extensionId__][39]);
			return checkedCall(gl_, "Uniform2ui", funcPtr, params__);
		}
void Uniform3ui(GL gl_, ParameterTypeTuple!(fp_glUniform3ui) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform3ui)(gl.extFuncs[extensionId__][40]);
			return checkedCall(gl_, "Uniform3ui", funcPtr, params__);
		}
void Uniform4ui(GL gl_, ParameterTypeTuple!(fp_glUniform4ui) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform4ui)(gl.extFuncs[extensionId__][41]);
			return checkedCall(gl_, "Uniform4ui", funcPtr, params__);
		}
void Uniform1uiv(GL gl_, ParameterTypeTuple!(fp_glUniform1uiv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform1uiv)(gl.extFuncs[extensionId__][42]);
			return checkedCall(gl_, "Uniform1uiv", funcPtr, params__);
		}
void Uniform2uiv(GL gl_, ParameterTypeTuple!(fp_glUniform2uiv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform2uiv)(gl.extFuncs[extensionId__][43]);
			return checkedCall(gl_, "Uniform2uiv", funcPtr, params__);
		}
void Uniform3uiv(GL gl_, ParameterTypeTuple!(fp_glUniform3uiv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform3uiv)(gl.extFuncs[extensionId__][44]);
			return checkedCall(gl_, "Uniform3uiv", funcPtr, params__);
		}
void Uniform4uiv(GL gl_, ParameterTypeTuple!(fp_glUniform4uiv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniform4uiv)(gl.extFuncs[extensionId__][45]);
			return checkedCall(gl_, "Uniform4uiv", funcPtr, params__);
		}
void TexParameterIiv(GL gl_, ParameterTypeTuple!(fp_glTexParameterIiv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTexParameterIiv)(gl.extFuncs[extensionId__][46]);
			return checkedCall(gl_, "TexParameterIiv", funcPtr, params__);
		}
void TexParameterIuiv(GL gl_, ParameterTypeTuple!(fp_glTexParameterIuiv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTexParameterIuiv)(gl.extFuncs[extensionId__][47]);
			return checkedCall(gl_, "TexParameterIuiv", funcPtr, params__);
		}
void GetTexParameterIiv(GL gl_, ParameterTypeTuple!(fp_glGetTexParameterIiv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetTexParameterIiv)(gl.extFuncs[extensionId__][48]);
			return checkedCall(gl_, "GetTexParameterIiv", funcPtr, params__);
		}
void GetTexParameterIuiv(GL gl_, ParameterTypeTuple!(fp_glGetTexParameterIuiv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetTexParameterIuiv)(gl.extFuncs[extensionId__][49]);
			return checkedCall(gl_, "GetTexParameterIuiv", funcPtr, params__);
		}
void ClearBufferiv(GL gl_, ParameterTypeTuple!(fp_glClearBufferiv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glClearBufferiv)(gl.extFuncs[extensionId__][50]);
			return checkedCall(gl_, "ClearBufferiv", funcPtr, params__);
		}
void ClearBufferuiv(GL gl_, ParameterTypeTuple!(fp_glClearBufferuiv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glClearBufferuiv)(gl.extFuncs[extensionId__][51]);
			return checkedCall(gl_, "ClearBufferuiv", funcPtr, params__);
		}
void ClearBufferfv(GL gl_, ParameterTypeTuple!(fp_glClearBufferfv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glClearBufferfv)(gl.extFuncs[extensionId__][52]);
			return checkedCall(gl_, "ClearBufferfv", funcPtr, params__);
		}
void ClearBufferfi(GL gl_, ParameterTypeTuple!(fp_glClearBufferfi) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glClearBufferfi)(gl.extFuncs[extensionId__][53]);
			return checkedCall(gl_, "ClearBufferfi", funcPtr, params__);
		}
GLubyte* GetStringi(GL gl_, ParameterTypeTuple!(fp_glGetStringi) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetStringi)(gl.extFuncs[extensionId__][54]);
			return checkedCall(gl_, "GetStringi", funcPtr, params__);
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
		void*[] funcAddr = new void*[55];
		{
			if (!isOpenGLVersionSupported("3_0", '_')) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glColorMaski"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glGetBooleani_v"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glEnablei"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glDisablei"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glIsEnabledi"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glBeginTransformFeedback"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glEndTransformFeedback"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glTransformFeedbackVaryings"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[8] = getExtensionFuncPtr(cast(char*)"glGetTransformFeedbackVarying"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[9] = getExtensionFuncPtr(cast(char*)"glClampColor"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[10] = getExtensionFuncPtr(cast(char*)"glBeginConditionalRender"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[11] = getExtensionFuncPtr(cast(char*)"glEndConditionalRender"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[12] = getExtensionFuncPtr(cast(char*)"glVertexAttribI1i"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[13] = getExtensionFuncPtr(cast(char*)"glVertexAttribI2i"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[14] = getExtensionFuncPtr(cast(char*)"glVertexAttribI3i"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[15] = getExtensionFuncPtr(cast(char*)"glVertexAttribI4i"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[16] = getExtensionFuncPtr(cast(char*)"glVertexAttribI1ui"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[17] = getExtensionFuncPtr(cast(char*)"glVertexAttribI2ui"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[18] = getExtensionFuncPtr(cast(char*)"glVertexAttribI3ui"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[19] = getExtensionFuncPtr(cast(char*)"glVertexAttribI4ui"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[20] = getExtensionFuncPtr(cast(char*)"glVertexAttribI1iv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[21] = getExtensionFuncPtr(cast(char*)"glVertexAttribI2iv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[22] = getExtensionFuncPtr(cast(char*)"glVertexAttribI3iv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[23] = getExtensionFuncPtr(cast(char*)"glVertexAttribI4iv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[24] = getExtensionFuncPtr(cast(char*)"glVertexAttribI1uiv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[25] = getExtensionFuncPtr(cast(char*)"glVertexAttribI2uiv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[26] = getExtensionFuncPtr(cast(char*)"glVertexAttribI3uiv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[27] = getExtensionFuncPtr(cast(char*)"glVertexAttribI4uiv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[28] = getExtensionFuncPtr(cast(char*)"glVertexAttribI4bv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[29] = getExtensionFuncPtr(cast(char*)"glVertexAttribI4sv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[30] = getExtensionFuncPtr(cast(char*)"glVertexAttribI4ubv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[31] = getExtensionFuncPtr(cast(char*)"glVertexAttribI4usv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[32] = getExtensionFuncPtr(cast(char*)"glVertexAttribIPointer"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[33] = getExtensionFuncPtr(cast(char*)"glGetVertexAttribIiv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[34] = getExtensionFuncPtr(cast(char*)"glGetVertexAttribIuiv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[35] = getExtensionFuncPtr(cast(char*)"glGetUniformuiv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[36] = getExtensionFuncPtr(cast(char*)"glBindFragDataLocation"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[37] = getExtensionFuncPtr(cast(char*)"glGetFragDataLocation"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[38] = getExtensionFuncPtr(cast(char*)"glUniform1ui"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[39] = getExtensionFuncPtr(cast(char*)"glUniform2ui"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[40] = getExtensionFuncPtr(cast(char*)"glUniform3ui"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[41] = getExtensionFuncPtr(cast(char*)"glUniform4ui"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[42] = getExtensionFuncPtr(cast(char*)"glUniform1uiv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[43] = getExtensionFuncPtr(cast(char*)"glUniform2uiv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[44] = getExtensionFuncPtr(cast(char*)"glUniform3uiv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[45] = getExtensionFuncPtr(cast(char*)"glUniform4uiv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[46] = getExtensionFuncPtr(cast(char*)"glTexParameterIiv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[47] = getExtensionFuncPtr(cast(char*)"glTexParameterIuiv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[48] = getExtensionFuncPtr(cast(char*)"glGetTexParameterIiv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[49] = getExtensionFuncPtr(cast(char*)"glGetTexParameterIuiv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[50] = getExtensionFuncPtr(cast(char*)"glClearBufferiv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[51] = getExtensionFuncPtr(cast(char*)"glClearBufferuiv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[52] = getExtensionFuncPtr(cast(char*)"glClearBufferfv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[53] = getExtensionFuncPtr(cast(char*)"glClearBufferfi"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[54] = getExtensionFuncPtr(cast(char*)"glGetStringi"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
