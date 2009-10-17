module dgl.ext.ARB_imaging;
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



private ushort extensionId__ = 410;
alias extensionId__ ARB_imaging;

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
			const GLenum GL_CONSTANT_COLOR = 0x8001;
			const GLenum GL_ONE_MINUS_CONSTANT_COLOR = 0x8002;
			const GLenum GL_CONSTANT_ALPHA = 0x8003;
			const GLenum GL_ONE_MINUS_CONSTANT_ALPHA = 0x8004;
			const GLenum GL_BLEND_COLOR = 0x8005;
			const GLenum GL_FUNC_ADD = 0x8006;
			const GLenum GL_MIN = 0x8007;
			const GLenum GL_MAX = 0x8008;
			const GLenum GL_BLEND_EQUATION = 0x8009;
			const GLenum GL_FUNC_SUBTRACT = 0x800A;
			const GLenum GL_FUNC_REVERSE_SUBTRACT = 0x800B;
			const GLenum GL_CONVOLUTION_1D = 0x8010;
			const GLenum GL_CONVOLUTION_2D = 0x8011;
			const GLenum GL_SEPARABLE_2D = 0x8012;
			const GLenum GL_CONVOLUTION_BORDER_MODE = 0x8013;
			const GLenum GL_CONVOLUTION_FILTER_SCALE = 0x8014;
			const GLenum GL_CONVOLUTION_FILTER_BIAS = 0x8015;
			const GLenum GL_REDUCE = 0x8016;
			const GLenum GL_CONVOLUTION_FORMAT = 0x8017;
			const GLenum GL_CONVOLUTION_WIDTH = 0x8018;
			const GLenum GL_CONVOLUTION_HEIGHT = 0x8019;
			const GLenum GL_MAX_CONVOLUTION_WIDTH = 0x801A;
			const GLenum GL_MAX_CONVOLUTION_HEIGHT = 0x801B;
			const GLenum GL_POST_CONVOLUTION_RED_SCALE = 0x801C;
			const GLenum GL_POST_CONVOLUTION_GREEN_SCALE = 0x801D;
			const GLenum GL_POST_CONVOLUTION_BLUE_SCALE = 0x801E;
			const GLenum GL_POST_CONVOLUTION_ALPHA_SCALE = 0x801F;
			const GLenum GL_POST_CONVOLUTION_RED_BIAS = 0x8020;
			const GLenum GL_POST_CONVOLUTION_GREEN_BIAS = 0x8021;
			const GLenum GL_POST_CONVOLUTION_BLUE_BIAS = 0x8022;
			const GLenum GL_POST_CONVOLUTION_ALPHA_BIAS = 0x8023;
			const GLenum GL_HISTOGRAM = 0x8024;
			const GLenum GL_PROXY_HISTOGRAM = 0x8025;
			const GLenum GL_HISTOGRAM_WIDTH = 0x8026;
			const GLenum GL_HISTOGRAM_FORMAT = 0x8027;
			const GLenum GL_HISTOGRAM_RED_SIZE = 0x8028;
			const GLenum GL_HISTOGRAM_GREEN_SIZE = 0x8029;
			const GLenum GL_HISTOGRAM_BLUE_SIZE = 0x802A;
			const GLenum GL_HISTOGRAM_ALPHA_SIZE = 0x802B;
			const GLenum GL_HISTOGRAM_LUMINANCE_SIZE = 0x802C;
			const GLenum GL_HISTOGRAM_SINK = 0x802D;
			const GLenum GL_MINMAX = 0x802E;
			const GLenum GL_MINMAX_FORMAT = 0x802F;
			const GLenum GL_MINMAX_SINK = 0x8030;
			const GLenum GL_TABLE_TOO_LARGE = 0x8031;
			const GLenum GL_COLOR_MATRIX = 0x80B1;
			const GLenum GL_COLOR_MATRIX_STACK_DEPTH = 0x80B2;
			const GLenum GL_MAX_COLOR_MATRIX_STACK_DEPTH = 0x80B3;
			const GLenum GL_POST_COLOR_MATRIX_RED_SCALE = 0x80B4;
			const GLenum GL_POST_COLOR_MATRIX_GREEN_SCALE = 0x80B5;
			const GLenum GL_POST_COLOR_MATRIX_BLUE_SCALE = 0x80B6;
			const GLenum GL_POST_COLOR_MATRIX_ALPHA_SCALE = 0x80B7;
			const GLenum GL_POST_COLOR_MATRIX_RED_BIAS = 0x80B8;
			const GLenum GL_POST_COLOR_MATRIX_GREEN_BIAS = 0x80B9;
			const GLenum GL_POST_COLOR_MATRIX_BLUE_BIAS = 0x80BA;
			const GLenum GL_POST_COLOR_MATRIX_ALPHA_BIAS = 0x80BB;
			const GLenum GL_COLOR_TABLE = 0x80D0;
			const GLenum GL_POST_CONVOLUTION_COLOR_TABLE = 0x80D1;
			const GLenum GL_POST_COLOR_MATRIX_COLOR_TABLE = 0x80D2;
			const GLenum GL_PROXY_COLOR_TABLE = 0x80D3;
			const GLenum GL_PROXY_POST_CONVOLUTION_COLOR_TABLE = 0x80D4;
			const GLenum GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE = 0x80D5;
			const GLenum GL_COLOR_TABLE_SCALE = 0x80D6;
			const GLenum GL_COLOR_TABLE_BIAS = 0x80D7;
			const GLenum GL_COLOR_TABLE_FORMAT = 0x80D8;
			const GLenum GL_COLOR_TABLE_WIDTH = 0x80D9;
			const GLenum GL_COLOR_TABLE_RED_SIZE = 0x80DA;
			const GLenum GL_COLOR_TABLE_GREEN_SIZE = 0x80DB;
			const GLenum GL_COLOR_TABLE_BLUE_SIZE = 0x80DC;
			const GLenum GL_COLOR_TABLE_ALPHA_SIZE = 0x80DD;
			const GLenum GL_COLOR_TABLE_LUMINANCE_SIZE = 0x80DE;
			const GLenum GL_COLOR_TABLE_INTENSITY_SIZE = 0x80DF;
			const GLenum GL_IGNORE_BORDER = 0x8150;
			const GLenum GL_CONSTANT_BORDER = 0x8151;
			const GLenum GL_WRAP_BORDER = 0x8152;
			const GLenum GL_REPLICATE_BORDER = 0x8153;
			const GLenum GL_CONVOLUTION_BORDER_COLOR = 0x8154;
	}
	private {
		extern (System) {
			alias void function (GLenum target, GLenum internalformat, GLsizei width, GLenum format, GLenum type,  GLvoid *table)	fp_glColorTable;
			alias void function (GLenum target, GLsizei start, GLsizei count, GLenum format, GLenum type,  GLvoid *data)	fp_glColorSubTable;
			alias void function (GLenum target, GLenum pname,  GLint *params)	fp_glColorTableParameteriv;
			alias void function (GLenum target, GLenum pname,  GLfloat *params)	fp_glColorTableParameterfv;
			alias void function (GLenum target, GLsizei start, GLint x, GLint y, GLsizei width)	fp_glCopyColorSubTable;
			alias void function (GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width)	fp_glCopyColorTable;
			alias void function (GLenum target, GLenum format, GLenum type, GLvoid *table)	fp_glGetColorTable;
			alias void function (GLenum target, GLenum pname, GLfloat *params)	fp_glGetColorTableParameterfv;
			alias void function (GLenum target, GLenum pname, GLint *params)	fp_glGetColorTableParameteriv;
			alias void function (GLenum target, GLsizei width, GLenum internalformat, GLboolean sink)	fp_glHistogram;
			alias void function (GLenum target)	fp_glResetHistogram;
			alias void function (GLenum target, GLboolean reset, GLenum format, GLenum type, GLvoid *values)	fp_glGetHistogram;
			alias void function (GLenum target, GLenum pname, GLfloat *params)	fp_glGetHistogramParameterfv;
			alias void function (GLenum target, GLenum pname, GLint *params)	fp_glGetHistogramParameteriv;
			alias void function (GLenum target, GLenum internalformat, GLboolean sink)	fp_glMinmax;
			alias void function (GLenum target)	fp_glResetMinmax;
			alias void function (GLenum target, GLenum pname, GLfloat *params)	fp_glGetMinmaxParameterfv;
			alias void function (GLenum target, GLenum pname, GLint *params)	fp_glGetMinmaxParameteriv;
			alias void function (GLenum target, GLenum internalformat, GLsizei width, GLenum format, GLenum type,  GLvoid *image)	fp_glConvolutionFilter1D;
			alias void function (GLenum target, GLenum internalformat, GLsizei width, GLsizei height, GLenum format, GLenum type,  GLvoid *image)	fp_glConvolutionFilter2D;
			alias void function (GLenum target, GLenum pname, GLfloat params)	fp_glConvolutionParameterf;
			alias void function (GLenum target, GLenum pname,  GLfloat *params)	fp_glConvolutionParameterfv;
			alias void function (GLenum target, GLenum pname, GLint params)	fp_glConvolutionParameteri;
			alias void function (GLenum target, GLenum pname,  GLint *params)	fp_glConvolutionParameteriv;
			alias void function (GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width)	fp_glCopyConvolutionFilter1D;
			alias void function (GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height)	fp_glCopyConvolutionFilter2D;
			alias void function (GLenum target, GLenum format, GLenum type, GLvoid *image)	fp_glGetConvolutionFilter;
			alias void function (GLenum target, GLenum pname, GLfloat *params)	fp_glGetConvolutionParameterfv;
			alias void function (GLenum target, GLenum pname, GLint *params)	fp_glGetConvolutionParameteriv;
			alias void function (GLenum target, GLenum internalformat, GLsizei width, GLsizei height, GLenum format, GLenum type,  GLvoid *row,  GLvoid *column)	fp_glSeparableFilter2D;
			alias void function (GLenum target, GLenum format, GLenum type, GLvoid *row, GLvoid *column, GLvoid *span)	fp_glGetSeparableFilter;
			alias void function (GLenum target, GLboolean reset, GLenum format, GLenum types, GLvoid *values)	fp_glGetMinmax;
		}
	}
	public {
void ColorTable(GL gl_, ParameterTypeTuple!(fp_glColorTable) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glColorTable)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "ColorTable", funcPtr, params__);
		}
void ColorSubTable(GL gl_, ParameterTypeTuple!(fp_glColorSubTable) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glColorSubTable)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "ColorSubTable", funcPtr, params__);
		}
void ColorTableParameteriv(GL gl_, ParameterTypeTuple!(fp_glColorTableParameteriv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glColorTableParameteriv)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "ColorTableParameteriv", funcPtr, params__);
		}
void ColorTableParameterfv(GL gl_, ParameterTypeTuple!(fp_glColorTableParameterfv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glColorTableParameterfv)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "ColorTableParameterfv", funcPtr, params__);
		}
void CopyColorSubTable(GL gl_, ParameterTypeTuple!(fp_glCopyColorSubTable) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCopyColorSubTable)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "CopyColorSubTable", funcPtr, params__);
		}
void CopyColorTable(GL gl_, ParameterTypeTuple!(fp_glCopyColorTable) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCopyColorTable)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "CopyColorTable", funcPtr, params__);
		}
void GetColorTable(GL gl_, ParameterTypeTuple!(fp_glGetColorTable) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetColorTable)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "GetColorTable", funcPtr, params__);
		}
void GetColorTableParameterfv(GL gl_, ParameterTypeTuple!(fp_glGetColorTableParameterfv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetColorTableParameterfv)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "GetColorTableParameterfv", funcPtr, params__);
		}
void GetColorTableParameteriv(GL gl_, ParameterTypeTuple!(fp_glGetColorTableParameteriv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetColorTableParameteriv)(gl.extFuncs[extensionId__][8]);
			return checkedCall(gl_, "GetColorTableParameteriv", funcPtr, params__);
		}
void Histogram(GL gl_, ParameterTypeTuple!(fp_glHistogram) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glHistogram)(gl.extFuncs[extensionId__][9]);
			return checkedCall(gl_, "Histogram", funcPtr, params__);
		}
void ResetHistogram(GL gl_, ParameterTypeTuple!(fp_glResetHistogram) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glResetHistogram)(gl.extFuncs[extensionId__][10]);
			return checkedCall(gl_, "ResetHistogram", funcPtr, params__);
		}
void GetHistogram(GL gl_, ParameterTypeTuple!(fp_glGetHistogram) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetHistogram)(gl.extFuncs[extensionId__][11]);
			return checkedCall(gl_, "GetHistogram", funcPtr, params__);
		}
void GetHistogramParameterfv(GL gl_, ParameterTypeTuple!(fp_glGetHistogramParameterfv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetHistogramParameterfv)(gl.extFuncs[extensionId__][12]);
			return checkedCall(gl_, "GetHistogramParameterfv", funcPtr, params__);
		}
void GetHistogramParameteriv(GL gl_, ParameterTypeTuple!(fp_glGetHistogramParameteriv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetHistogramParameteriv)(gl.extFuncs[extensionId__][13]);
			return checkedCall(gl_, "GetHistogramParameteriv", funcPtr, params__);
		}
void Minmax(GL gl_, ParameterTypeTuple!(fp_glMinmax) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMinmax)(gl.extFuncs[extensionId__][14]);
			return checkedCall(gl_, "Minmax", funcPtr, params__);
		}
void ResetMinmax(GL gl_, ParameterTypeTuple!(fp_glResetMinmax) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glResetMinmax)(gl.extFuncs[extensionId__][15]);
			return checkedCall(gl_, "ResetMinmax", funcPtr, params__);
		}
void GetMinmaxParameterfv(GL gl_, ParameterTypeTuple!(fp_glGetMinmaxParameterfv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetMinmaxParameterfv)(gl.extFuncs[extensionId__][16]);
			return checkedCall(gl_, "GetMinmaxParameterfv", funcPtr, params__);
		}
void GetMinmaxParameteriv(GL gl_, ParameterTypeTuple!(fp_glGetMinmaxParameteriv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetMinmaxParameteriv)(gl.extFuncs[extensionId__][17]);
			return checkedCall(gl_, "GetMinmaxParameteriv", funcPtr, params__);
		}
void ConvolutionFilter1D(GL gl_, ParameterTypeTuple!(fp_glConvolutionFilter1D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glConvolutionFilter1D)(gl.extFuncs[extensionId__][18]);
			return checkedCall(gl_, "ConvolutionFilter1D", funcPtr, params__);
		}
void ConvolutionFilter2D(GL gl_, ParameterTypeTuple!(fp_glConvolutionFilter2D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glConvolutionFilter2D)(gl.extFuncs[extensionId__][19]);
			return checkedCall(gl_, "ConvolutionFilter2D", funcPtr, params__);
		}
void ConvolutionParameterf(GL gl_, ParameterTypeTuple!(fp_glConvolutionParameterf) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glConvolutionParameterf)(gl.extFuncs[extensionId__][20]);
			return checkedCall(gl_, "ConvolutionParameterf", funcPtr, params__);
		}
void ConvolutionParameterfv(GL gl_, ParameterTypeTuple!(fp_glConvolutionParameterfv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glConvolutionParameterfv)(gl.extFuncs[extensionId__][21]);
			return checkedCall(gl_, "ConvolutionParameterfv", funcPtr, params__);
		}
void ConvolutionParameteri(GL gl_, ParameterTypeTuple!(fp_glConvolutionParameteri) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glConvolutionParameteri)(gl.extFuncs[extensionId__][22]);
			return checkedCall(gl_, "ConvolutionParameteri", funcPtr, params__);
		}
void ConvolutionParameteriv(GL gl_, ParameterTypeTuple!(fp_glConvolutionParameteriv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glConvolutionParameteriv)(gl.extFuncs[extensionId__][23]);
			return checkedCall(gl_, "ConvolutionParameteriv", funcPtr, params__);
		}
void CopyConvolutionFilter1D(GL gl_, ParameterTypeTuple!(fp_glCopyConvolutionFilter1D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCopyConvolutionFilter1D)(gl.extFuncs[extensionId__][24]);
			return checkedCall(gl_, "CopyConvolutionFilter1D", funcPtr, params__);
		}
void CopyConvolutionFilter2D(GL gl_, ParameterTypeTuple!(fp_glCopyConvolutionFilter2D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCopyConvolutionFilter2D)(gl.extFuncs[extensionId__][25]);
			return checkedCall(gl_, "CopyConvolutionFilter2D", funcPtr, params__);
		}
void GetConvolutionFilter(GL gl_, ParameterTypeTuple!(fp_glGetConvolutionFilter) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetConvolutionFilter)(gl.extFuncs[extensionId__][26]);
			return checkedCall(gl_, "GetConvolutionFilter", funcPtr, params__);
		}
void GetConvolutionParameterfv(GL gl_, ParameterTypeTuple!(fp_glGetConvolutionParameterfv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetConvolutionParameterfv)(gl.extFuncs[extensionId__][27]);
			return checkedCall(gl_, "GetConvolutionParameterfv", funcPtr, params__);
		}
void GetConvolutionParameteriv(GL gl_, ParameterTypeTuple!(fp_glGetConvolutionParameteriv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetConvolutionParameteriv)(gl.extFuncs[extensionId__][28]);
			return checkedCall(gl_, "GetConvolutionParameteriv", funcPtr, params__);
		}
void SeparableFilter2D(GL gl_, ParameterTypeTuple!(fp_glSeparableFilter2D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSeparableFilter2D)(gl.extFuncs[extensionId__][29]);
			return checkedCall(gl_, "SeparableFilter2D", funcPtr, params__);
		}
void GetSeparableFilter(GL gl_, ParameterTypeTuple!(fp_glGetSeparableFilter) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetSeparableFilter)(gl.extFuncs[extensionId__][30]);
			return checkedCall(gl_, "GetSeparableFilter", funcPtr, params__);
		}
void GetMinmax(GL gl_, ParameterTypeTuple!(fp_glGetMinmax) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetMinmax)(gl.extFuncs[extensionId__][31]);
			return checkedCall(gl_, "GetMinmax", funcPtr, params__);
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
		void*[] funcAddr = new void*[32];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_ARB_imaging")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glColorTable"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glColorSubTable"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glColorTableParameteriv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glColorTableParameterfv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glCopyColorSubTable"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glCopyColorTable"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glGetColorTable"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glGetColorTableParameterfv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[8] = getExtensionFuncPtr(cast(char*)"glGetColorTableParameteriv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[9] = getExtensionFuncPtr(cast(char*)"glHistogram"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[10] = getExtensionFuncPtr(cast(char*)"glResetHistogram"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[11] = getExtensionFuncPtr(cast(char*)"glGetHistogram"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[12] = getExtensionFuncPtr(cast(char*)"glGetHistogramParameterfv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[13] = getExtensionFuncPtr(cast(char*)"glGetHistogramParameteriv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[14] = getExtensionFuncPtr(cast(char*)"glMinmax"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[15] = getExtensionFuncPtr(cast(char*)"glResetMinmax"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[16] = getExtensionFuncPtr(cast(char*)"glGetMinmaxParameterfv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[17] = getExtensionFuncPtr(cast(char*)"glGetMinmaxParameteriv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[18] = getExtensionFuncPtr(cast(char*)"glConvolutionFilter1D"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[19] = getExtensionFuncPtr(cast(char*)"glConvolutionFilter2D"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[20] = getExtensionFuncPtr(cast(char*)"glConvolutionParameterf"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[21] = getExtensionFuncPtr(cast(char*)"glConvolutionParameterfv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[22] = getExtensionFuncPtr(cast(char*)"glConvolutionParameteri"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[23] = getExtensionFuncPtr(cast(char*)"glConvolutionParameteriv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[24] = getExtensionFuncPtr(cast(char*)"glCopyConvolutionFilter1D"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[25] = getExtensionFuncPtr(cast(char*)"glCopyConvolutionFilter2D"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[26] = getExtensionFuncPtr(cast(char*)"glGetConvolutionFilter"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[27] = getExtensionFuncPtr(cast(char*)"glGetConvolutionParameterfv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[28] = getExtensionFuncPtr(cast(char*)"glGetConvolutionParameteriv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[29] = getExtensionFuncPtr(cast(char*)"glSeparableFilter2D"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[30] = getExtensionFuncPtr(cast(char*)"glGetSeparableFilter"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[31] = getExtensionFuncPtr(cast(char*)"glGetMinmax"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
