module dgl.ext.EXT_convolution;
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



private ushort extensionId__ = 320;
alias extensionId__ EXT_convolution;
import dgl.ext.EXT_texture;

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
			const GLenum GL_CONVOLUTION_1D_EXT = 0x8010;
			const GLenum GL_CONVOLUTION_2D_EXT = 0x8011;
			const GLenum GL_SEPARABLE_2D_EXT = 0x8012;
			const GLenum GL_CONVOLUTION_BORDER_MODE_EXT = 0x8013;
			const GLenum GL_CONVOLUTION_FILTER_SCALE_EXT = 0x8014;
			const GLenum GL_CONVOLUTION_FILTER_BIAS_EXT = 0x8015;
			const GLenum GL_REDUCE_EXT = 0x8016;
			const GLenum GL_CONVOLUTION_FORMAT_EXT = 0x8017;
			const GLenum GL_CONVOLUTION_WIDTH_EXT = 0x8018;
			const GLenum GL_CONVOLUTION_HEIGHT_EXT = 0x8019;
			const GLenum GL_MAX_CONVOLUTION_WIDTH_EXT = 0x801A;
			const GLenum GL_MAX_CONVOLUTION_HEIGHT_EXT = 0x801B;
			const GLenum GL_POST_CONVOLUTION_RED_SCALE_EXT = 0x801C;
			const GLenum GL_POST_CONVOLUTION_GREEN_SCALE_EXT = 0x801D;
			const GLenum GL_POST_CONVOLUTION_BLUE_SCALE_EXT = 0x801E;
			const GLenum GL_POST_CONVOLUTION_ALPHA_SCALE_EXT = 0x801F;
			const GLenum GL_POST_CONVOLUTION_RED_BIAS_EXT = 0x8020;
			const GLenum GL_POST_CONVOLUTION_GREEN_BIAS_EXT = 0x8021;
			const GLenum GL_POST_CONVOLUTION_BLUE_BIAS_EXT = 0x8022;
			const GLenum GL_POST_CONVOLUTION_ALPHA_BIAS_EXT = 0x8023;
	}
	private {
		extern (System) {
			alias void function (GLenum target, GLenum internalformat, GLsizei width, GLenum format, GLenum type,  void* image)	fp_glConvolutionFilter1DEXT;
			alias void function (GLenum target, GLenum internalformat, GLsizei width, GLsizei height, GLenum format, GLenum type,  void* image)	fp_glConvolutionFilter2DEXT;
			alias void function (GLenum target, GLenum pname, GLfloat param)	fp_glConvolutionParameterfEXT;
			alias void function (GLenum target, GLenum pname,  GLfloat* params)	fp_glConvolutionParameterfvEXT;
			alias void function (GLenum target, GLenum pname, GLint param)	fp_glConvolutionParameteriEXT;
			alias void function (GLenum target, GLenum pname,  GLint* params)	fp_glConvolutionParameterivEXT;
			alias void function (GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width)	fp_glCopyConvolutionFilter1DEXT;
			alias void function (GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height)	fp_glCopyConvolutionFilter2DEXT;
			alias void function (GLenum target, GLenum format, GLenum type, void* image)	fp_glGetConvolutionFilterEXT;
			alias void function (GLenum target, GLenum pname, GLfloat* params)	fp_glGetConvolutionParameterfvEXT;
			alias void function (GLenum target, GLenum pname, GLint* params)	fp_glGetConvolutionParameterivEXT;
			alias void function (GLenum target, GLenum format, GLenum type, void* row, void* column, void* span)	fp_glGetSeparableFilterEXT;
			alias void function (GLenum target, GLenum internalformat, GLsizei width, GLsizei height, GLenum format, GLenum type,  void* row,  void* column)	fp_glSeparableFilter2DEXT;
		}
	}
	public {
void ConvolutionFilter1D(GL gl_, ParameterTypeTuple!(fp_glConvolutionFilter1DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glConvolutionFilter1DEXT)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "ConvolutionFilter1D", funcPtr, params__);
		}
void ConvolutionFilter2D(GL gl_, ParameterTypeTuple!(fp_glConvolutionFilter2DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glConvolutionFilter2DEXT)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "ConvolutionFilter2D", funcPtr, params__);
		}
void ConvolutionParameterf(GL gl_, ParameterTypeTuple!(fp_glConvolutionParameterfEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glConvolutionParameterfEXT)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "ConvolutionParameterf", funcPtr, params__);
		}
void ConvolutionParameterfv(GL gl_, ParameterTypeTuple!(fp_glConvolutionParameterfvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glConvolutionParameterfvEXT)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "ConvolutionParameterfv", funcPtr, params__);
		}
void ConvolutionParameteri(GL gl_, ParameterTypeTuple!(fp_glConvolutionParameteriEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glConvolutionParameteriEXT)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "ConvolutionParameteri", funcPtr, params__);
		}
void ConvolutionParameteriv(GL gl_, ParameterTypeTuple!(fp_glConvolutionParameterivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glConvolutionParameterivEXT)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "ConvolutionParameteriv", funcPtr, params__);
		}
void CopyConvolutionFilter1D(GL gl_, ParameterTypeTuple!(fp_glCopyConvolutionFilter1DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCopyConvolutionFilter1DEXT)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "CopyConvolutionFilter1D", funcPtr, params__);
		}
void CopyConvolutionFilter2D(GL gl_, ParameterTypeTuple!(fp_glCopyConvolutionFilter2DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCopyConvolutionFilter2DEXT)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "CopyConvolutionFilter2D", funcPtr, params__);
		}
void GetConvolutionFilter(GL gl_, ParameterTypeTuple!(fp_glGetConvolutionFilterEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetConvolutionFilterEXT)(gl.extFuncs[extensionId__][8]);
			return checkedCall(gl_, "GetConvolutionFilter", funcPtr, params__);
		}
void GetConvolutionParameterfv(GL gl_, ParameterTypeTuple!(fp_glGetConvolutionParameterfvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetConvolutionParameterfvEXT)(gl.extFuncs[extensionId__][9]);
			return checkedCall(gl_, "GetConvolutionParameterfv", funcPtr, params__);
		}
void GetConvolutionParameteriv(GL gl_, ParameterTypeTuple!(fp_glGetConvolutionParameterivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetConvolutionParameterivEXT)(gl.extFuncs[extensionId__][10]);
			return checkedCall(gl_, "GetConvolutionParameteriv", funcPtr, params__);
		}
void GetSeparableFilter(GL gl_, ParameterTypeTuple!(fp_glGetSeparableFilterEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetSeparableFilterEXT)(gl.extFuncs[extensionId__][11]);
			return checkedCall(gl_, "GetSeparableFilter", funcPtr, params__);
		}
void SeparableFilter2D(GL gl_, ParameterTypeTuple!(fp_glSeparableFilter2DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSeparableFilter2DEXT)(gl.extFuncs[extensionId__][12]);
			return checkedCall(gl_, "SeparableFilter2D", funcPtr, params__);
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
		void*[] funcAddr = new void*[13];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_EXT_convolution")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glConvolutionFilter1DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glConvolutionFilter2DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glConvolutionParameterfEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glConvolutionParameterfvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glConvolutionParameteriEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glConvolutionParameterivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glCopyConvolutionFilter1DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glCopyConvolutionFilter2DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[8] = getExtensionFuncPtr(cast(char*)"glGetConvolutionFilterEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[9] = getExtensionFuncPtr(cast(char*)"glGetConvolutionParameterfvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[10] = getExtensionFuncPtr(cast(char*)"glGetConvolutionParameterivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[11] = getExtensionFuncPtr(cast(char*)"glGetSeparableFilterEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[12] = getExtensionFuncPtr(cast(char*)"glSeparableFilter2DEXT"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
