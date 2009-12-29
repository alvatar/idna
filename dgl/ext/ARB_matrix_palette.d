module dgl.ext.ARB_matrix_palette;
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



private ushort extensionId__ = 54;
alias extensionId__ ARB_matrix_palette;

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
			const GLenum GL_MATRIX_PALETTE_ARB = 0x8840;
			const GLenum GL_MAX_MATRIX_PALETTE_STACK_DEPTH_ARB = 0x8841;
			const GLenum GL_MAX_PALETTE_MATRICES_ARB = 0x8842;
			const GLenum GL_CURRENT_PALETTE_MATRIX_ARB = 0x8843;
			const GLenum GL_MATRIX_INDEX_ARRAY_ARB = 0x8844;
			const GLenum GL_CURRENT_MATRIX_INDEX_ARB = 0x8845;
			const GLenum GL_MATRIX_INDEX_ARRAY_SIZE_ARB = 0x8846;
			const GLenum GL_MATRIX_INDEX_ARRAY_TYPE_ARB = 0x8847;
			const GLenum GL_MATRIX_INDEX_ARRAY_STRIDE_ARB = 0x8848;
			const GLenum GL_MATRIX_INDEX_ARRAY_POINTER_ARB = 0x8849;
	}
	private {
		extern (System) {
			alias void function (GLint index)	fp_glCurrentPaletteMatrixARB;
			alias void function (GLint size, GLenum type, GLsizei stride, GLvoid *pointer)	fp_glMatrixIndexPointerARB;
			alias void function (GLint size, GLubyte *indices)	fp_glMatrixIndexubvARB;
			alias void function (GLint size, GLushort *indices)	fp_glMatrixIndexusvARB;
			alias void function (GLint size, GLuint *indices)	fp_glMatrixIndexuivARB;
		}
	}
	public {
void CurrentPaletteMatrix(GL gl_, ParameterTypeTuple!(fp_glCurrentPaletteMatrixARB) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCurrentPaletteMatrixARB)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "CurrentPaletteMatrix", funcPtr, params__);
		}
void MatrixIndexPointer(GL gl_, ParameterTypeTuple!(fp_glMatrixIndexPointerARB) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMatrixIndexPointerARB)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "MatrixIndexPointer", funcPtr, params__);
		}
void MatrixIndexubv(GL gl_, ParameterTypeTuple!(fp_glMatrixIndexubvARB) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMatrixIndexubvARB)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "MatrixIndexubv", funcPtr, params__);
		}
void MatrixIndexusv(GL gl_, ParameterTypeTuple!(fp_glMatrixIndexusvARB) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMatrixIndexusvARB)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "MatrixIndexusv", funcPtr, params__);
		}
void MatrixIndexuiv(GL gl_, ParameterTypeTuple!(fp_glMatrixIndexuivARB) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMatrixIndexuivARB)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "MatrixIndexuiv", funcPtr, params__);
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
		void*[] funcAddr = new void*[5];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_ARB_matrix_palette")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glCurrentPaletteMatrixARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glMatrixIndexPointerARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glMatrixIndexubvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glMatrixIndexusvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glMatrixIndexuivARB"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
