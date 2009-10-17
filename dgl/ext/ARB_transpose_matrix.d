module dgl.ext.ARB_transpose_matrix;
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



private ushort extensionId__ = 307;
alias extensionId__ ARB_transpose_matrix;

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
			const GLenum GL_TRANSPOSE_MODELVIEW_MATRIX_ARB = 0x84E3;
			const GLenum GL_TRANSPOSE_PROJECTION_MATRIX_ARB = 0x84E4;
			const GLenum GL_TRANSPOSE_TEXTURE_MATRIX_ARB = 0x84E5;
			const GLenum GL_TRANSPOSE_COLOR_MATRIX_ARB = 0x84E6;
	}
	private {
		extern (System) {
			alias void function (GLfloat m[16])	fp_glLoadTransposeMatrixfARB;
			alias void function (GLdouble m[16])	fp_glLoadTransposeMatrixdARB;
			alias void function (GLfloat m[16])	fp_glMultTransposeMatrixfARB;
			alias void function (GLdouble m[16])	fp_glMultTransposeMatrixdARB;
		}
	}
	public {
void LoadTransposeMatrixf(GL gl_, ParameterTypeTuple!(fp_glLoadTransposeMatrixfARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glLoadTransposeMatrixfARB)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "LoadTransposeMatrixf", funcPtr, params__);
		}
void LoadTransposeMatrixd(GL gl_, ParameterTypeTuple!(fp_glLoadTransposeMatrixdARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glLoadTransposeMatrixdARB)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "LoadTransposeMatrixd", funcPtr, params__);
		}
void MultTransposeMatrixf(GL gl_, ParameterTypeTuple!(fp_glMultTransposeMatrixfARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultTransposeMatrixfARB)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "MultTransposeMatrixf", funcPtr, params__);
		}
void MultTransposeMatrixd(GL gl_, ParameterTypeTuple!(fp_glMultTransposeMatrixdARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultTransposeMatrixdARB)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "MultTransposeMatrixd", funcPtr, params__);
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
		void*[] funcAddr = new void*[4];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_ARB_transpose_matrix")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glLoadTransposeMatrixfARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glLoadTransposeMatrixdARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glMultTransposeMatrixfARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glMultTransposeMatrixdARB"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
