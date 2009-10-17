module dgl.ext.SGI_color_table;
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



private ushort extensionId__ = 246;
alias extensionId__ SGI_color_table;
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
			const GLenum GL_COLOR_TABLE_SGI = 0x80D0;
			const GLenum GL_POST_CONVOLUTION_COLOR_TABLE_SGI = 0x80D1;
			const GLenum GL_POST_COLOR_MATRIX_COLOR_TABLE_SGI = 0x80D2;
			const GLenum GL_PROXY_COLOR_TABLE_SGI = 0x80D3;
			const GLenum GL_PROXY_POST_CONVOLUTION_COLOR_TABLE_SGI = 0x80D4;
			const GLenum GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE_SGI = 0x80D5;
			const GLenum GL_COLOR_TABLE_SCALE_SGI = 0x80D6;
			const GLenum GL_COLOR_TABLE_BIAS_SGI = 0x80D7;
			const GLenum GL_COLOR_TABLE_FORMAT_SGI = 0x80D8;
			const GLenum GL_COLOR_TABLE_WIDTH_SGI = 0x80D9;
			const GLenum GL_COLOR_TABLE_RED_SIZE_SGI = 0x80DA;
			const GLenum GL_COLOR_TABLE_GREEN_SIZE_SGI = 0x80DB;
			const GLenum GL_COLOR_TABLE_BLUE_SIZE_SGI = 0x80DC;
			const GLenum GL_COLOR_TABLE_ALPHA_SIZE_SGI = 0x80DD;
			const GLenum GL_COLOR_TABLE_LUMINANCE_SIZE_SGI = 0x80DE;
			const GLenum GL_COLOR_TABLE_INTENSITY_SIZE_SGI = 0x80DF;
	}
	private {
		extern (System) {
			alias void function (GLenum target, GLenum pname,  GLfloat* params)	fp_glColorTableParameterfvSGI;
			alias void function (GLenum target, GLenum pname,  GLint* params)	fp_glColorTableParameterivSGI;
			alias void function (GLenum target, GLenum internalformat, GLsizei width, GLenum format, GLenum type,  void* table)	fp_glColorTableSGI;
			alias void function (GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width)	fp_glCopyColorTableSGI;
			alias void function (GLenum target, GLenum pname, GLfloat* params)	fp_glGetColorTableParameterfvSGI;
			alias void function (GLenum target, GLenum pname, GLint* params)	fp_glGetColorTableParameterivSGI;
			alias void function (GLenum target, GLenum format, GLenum type, void* table)	fp_glGetColorTableSGI;
		}
	}
	public {
void ColorTableParameterfv(GL gl_, ParameterTypeTuple!(fp_glColorTableParameterfvSGI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glColorTableParameterfvSGI)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "ColorTableParameterfv", funcPtr, params__);
		}
void ColorTableParameteriv(GL gl_, ParameterTypeTuple!(fp_glColorTableParameterivSGI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glColorTableParameterivSGI)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "ColorTableParameteriv", funcPtr, params__);
		}
void ColorTable(GL gl_, ParameterTypeTuple!(fp_glColorTableSGI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glColorTableSGI)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "ColorTable", funcPtr, params__);
		}
void CopyColorTable(GL gl_, ParameterTypeTuple!(fp_glCopyColorTableSGI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCopyColorTableSGI)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "CopyColorTable", funcPtr, params__);
		}
void GetColorTableParameterfv(GL gl_, ParameterTypeTuple!(fp_glGetColorTableParameterfvSGI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetColorTableParameterfvSGI)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "GetColorTableParameterfv", funcPtr, params__);
		}
void GetColorTableParameteriv(GL gl_, ParameterTypeTuple!(fp_glGetColorTableParameterivSGI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetColorTableParameterivSGI)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "GetColorTableParameteriv", funcPtr, params__);
		}
void GetColorTable(GL gl_, ParameterTypeTuple!(fp_glGetColorTableSGI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetColorTableSGI)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "GetColorTable", funcPtr, params__);
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
		void*[] funcAddr = new void*[7];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_SGI_color_table")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glColorTableParameterfvSGI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glColorTableParameterivSGI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glColorTableSGI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glCopyColorTableSGI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glGetColorTableParameterfvSGI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glGetColorTableParameterivSGI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glGetColorTableSGI"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
