module dgl.ext.EXT_histogram;
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



private ushort extensionId__ = 15;
alias extensionId__ EXT_histogram;
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
			const GLenum GL_HISTOGRAM_EXT = 0x8024;
			const GLenum GL_PROXY_HISTOGRAM_EXT = 0x8025;
			const GLenum GL_HISTOGRAM_WIDTH_EXT = 0x8026;
			const GLenum GL_HISTOGRAM_FORMAT_EXT = 0x8027;
			const GLenum GL_HISTOGRAM_RED_SIZE_EXT = 0x8028;
			const GLenum GL_HISTOGRAM_GREEN_SIZE_EXT = 0x8029;
			const GLenum GL_HISTOGRAM_BLUE_SIZE_EXT = 0x802A;
			const GLenum GL_HISTOGRAM_ALPHA_SIZE_EXT = 0x802B;
			const GLenum GL_HISTOGRAM_LUMINANCE_SIZE_EXT = 0x802C;
			const GLenum GL_HISTOGRAM_SINK_EXT = 0x802D;
			const GLenum GL_MINMAX_EXT = 0x802E;
			const GLenum GL_MINMAX_FORMAT_EXT = 0x802F;
			const GLenum GL_MINMAX_SINK_EXT = 0x8030;
	}
	private {
		extern (System) {
			alias void function (GLenum target, GLboolean reset, GLenum format, GLenum type, void* values)	fp_glGetHistogramEXT;
			alias void function (GLenum target, GLenum pname, GLfloat* params)	fp_glGetHistogramParameterfvEXT;
			alias void function (GLenum target, GLenum pname, GLint* params)	fp_glGetHistogramParameterivEXT;
			alias void function (GLenum target, GLboolean reset, GLenum format, GLenum type, void* values)	fp_glGetMinmaxEXT;
			alias void function (GLenum target, GLenum pname, GLfloat* params)	fp_glGetMinmaxParameterfvEXT;
			alias void function (GLenum target, GLenum pname, GLint* params)	fp_glGetMinmaxParameterivEXT;
			alias void function (GLenum target, GLsizei width, GLenum internalformat, GLboolean sink)	fp_glHistogramEXT;
			alias void function (GLenum target, GLenum internalformat, GLboolean sink)	fp_glMinmaxEXT;
			alias void function (GLenum target)	fp_glResetHistogramEXT;
			alias void function (GLenum target)	fp_glResetMinmaxEXT;
		}
	}
	public {
void GetHistogram(GL gl_, ParameterTypeTuple!(fp_glGetHistogramEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetHistogramEXT)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "GetHistogram", funcPtr, params__);
		}
void GetHistogramParameterfv(GL gl_, ParameterTypeTuple!(fp_glGetHistogramParameterfvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetHistogramParameterfvEXT)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "GetHistogramParameterfv", funcPtr, params__);
		}
void GetHistogramParameteriv(GL gl_, ParameterTypeTuple!(fp_glGetHistogramParameterivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetHistogramParameterivEXT)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "GetHistogramParameteriv", funcPtr, params__);
		}
void GetMinmax(GL gl_, ParameterTypeTuple!(fp_glGetMinmaxEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetMinmaxEXT)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "GetMinmax", funcPtr, params__);
		}
void GetMinmaxParameterfv(GL gl_, ParameterTypeTuple!(fp_glGetMinmaxParameterfvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetMinmaxParameterfvEXT)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "GetMinmaxParameterfv", funcPtr, params__);
		}
void GetMinmaxParameteriv(GL gl_, ParameterTypeTuple!(fp_glGetMinmaxParameterivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetMinmaxParameterivEXT)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "GetMinmaxParameteriv", funcPtr, params__);
		}
void Histogram(GL gl_, ParameterTypeTuple!(fp_glHistogramEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glHistogramEXT)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "Histogram", funcPtr, params__);
		}
void Minmax(GL gl_, ParameterTypeTuple!(fp_glMinmaxEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMinmaxEXT)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "Minmax", funcPtr, params__);
		}
void ResetHistogram(GL gl_, ParameterTypeTuple!(fp_glResetHistogramEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glResetHistogramEXT)(gl.extFuncs[extensionId__][8]);
			return checkedCall(gl_, "ResetHistogram", funcPtr, params__);
		}
void ResetMinmax(GL gl_, ParameterTypeTuple!(fp_glResetMinmaxEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glResetMinmaxEXT)(gl.extFuncs[extensionId__][9]);
			return checkedCall(gl_, "ResetMinmax", funcPtr, params__);
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
		void*[] funcAddr = new void*[10];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_EXT_histogram")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glGetHistogramEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glGetHistogramParameterfvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glGetHistogramParameterivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glGetMinmaxEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glGetMinmaxParameterfvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glGetMinmaxParameterivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glHistogramEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glMinmaxEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[8] = getExtensionFuncPtr(cast(char*)"glResetHistogramEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[9] = getExtensionFuncPtr(cast(char*)"glResetMinmaxEXT"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
