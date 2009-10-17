module dgl.ext.MESA_window_pos;
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



private ushort extensionId__ = 81;
alias extensionId__ MESA_window_pos;

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
	}
	private {
		extern (System) {
			alias void function (GLdouble x, GLdouble y)	fp_glWindowPos2dMESA;
			alias void function ( GLdouble* p)	fp_glWindowPos2dvMESA;
			alias void function (GLfloat x, GLfloat y)	fp_glWindowPos2fMESA;
			alias void function ( GLfloat* p)	fp_glWindowPos2fvMESA;
			alias void function (GLint x, GLint y)	fp_glWindowPos2iMESA;
			alias void function ( GLint* p)	fp_glWindowPos2ivMESA;
			alias void function (GLshort x, GLshort y)	fp_glWindowPos2sMESA;
			alias void function ( GLshort* p)	fp_glWindowPos2svMESA;
			alias void function (GLdouble x, GLdouble y, GLdouble z)	fp_glWindowPos3dMESA;
			alias void function ( GLdouble* p)	fp_glWindowPos3dvMESA;
			alias void function (GLfloat x, GLfloat y, GLfloat z)	fp_glWindowPos3fMESA;
			alias void function ( GLfloat* p)	fp_glWindowPos3fvMESA;
			alias void function (GLint x, GLint y, GLint z)	fp_glWindowPos3iMESA;
			alias void function ( GLint* p)	fp_glWindowPos3ivMESA;
			alias void function (GLshort x, GLshort y, GLshort z)	fp_glWindowPos3sMESA;
			alias void function ( GLshort* p)	fp_glWindowPos3svMESA;
			alias void function (GLdouble x, GLdouble y, GLdouble z, GLdouble)	fp_glWindowPos4dMESA;
			alias void function ( GLdouble* p)	fp_glWindowPos4dvMESA;
			alias void function (GLfloat x, GLfloat y, GLfloat z, GLfloat w)	fp_glWindowPos4fMESA;
			alias void function ( GLfloat* p)	fp_glWindowPos4fvMESA;
			alias void function (GLint x, GLint y, GLint z, GLint w)	fp_glWindowPos4iMESA;
			alias void function ( GLint* p)	fp_glWindowPos4ivMESA;
			alias void function (GLshort x, GLshort y, GLshort z, GLshort w)	fp_glWindowPos4sMESA;
			alias void function ( GLshort* p)	fp_glWindowPos4svMESA;
		}
	}
	public {
void WindowPos2d(GL gl_, ParameterTypeTuple!(fp_glWindowPos2dMESA) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos2dMESA)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "WindowPos2d", funcPtr, params__);
		}
void WindowPos2dv(GL gl_, ParameterTypeTuple!(fp_glWindowPos2dvMESA) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos2dvMESA)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "WindowPos2dv", funcPtr, params__);
		}
void WindowPos2f(GL gl_, ParameterTypeTuple!(fp_glWindowPos2fMESA) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos2fMESA)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "WindowPos2f", funcPtr, params__);
		}
void WindowPos2fv(GL gl_, ParameterTypeTuple!(fp_glWindowPos2fvMESA) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos2fvMESA)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "WindowPos2fv", funcPtr, params__);
		}
void WindowPos2i(GL gl_, ParameterTypeTuple!(fp_glWindowPos2iMESA) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos2iMESA)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "WindowPos2i", funcPtr, params__);
		}
void WindowPos2iv(GL gl_, ParameterTypeTuple!(fp_glWindowPos2ivMESA) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos2ivMESA)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "WindowPos2iv", funcPtr, params__);
		}
void WindowPos2s(GL gl_, ParameterTypeTuple!(fp_glWindowPos2sMESA) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos2sMESA)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "WindowPos2s", funcPtr, params__);
		}
void WindowPos2sv(GL gl_, ParameterTypeTuple!(fp_glWindowPos2svMESA) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos2svMESA)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "WindowPos2sv", funcPtr, params__);
		}
void WindowPos3d(GL gl_, ParameterTypeTuple!(fp_glWindowPos3dMESA) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos3dMESA)(gl.extFuncs[extensionId__][8]);
			return checkedCall(gl_, "WindowPos3d", funcPtr, params__);
		}
void WindowPos3dv(GL gl_, ParameterTypeTuple!(fp_glWindowPos3dvMESA) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos3dvMESA)(gl.extFuncs[extensionId__][9]);
			return checkedCall(gl_, "WindowPos3dv", funcPtr, params__);
		}
void WindowPos3f(GL gl_, ParameterTypeTuple!(fp_glWindowPos3fMESA) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos3fMESA)(gl.extFuncs[extensionId__][10]);
			return checkedCall(gl_, "WindowPos3f", funcPtr, params__);
		}
void WindowPos3fv(GL gl_, ParameterTypeTuple!(fp_glWindowPos3fvMESA) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos3fvMESA)(gl.extFuncs[extensionId__][11]);
			return checkedCall(gl_, "WindowPos3fv", funcPtr, params__);
		}
void WindowPos3i(GL gl_, ParameterTypeTuple!(fp_glWindowPos3iMESA) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos3iMESA)(gl.extFuncs[extensionId__][12]);
			return checkedCall(gl_, "WindowPos3i", funcPtr, params__);
		}
void WindowPos3iv(GL gl_, ParameterTypeTuple!(fp_glWindowPos3ivMESA) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos3ivMESA)(gl.extFuncs[extensionId__][13]);
			return checkedCall(gl_, "WindowPos3iv", funcPtr, params__);
		}
void WindowPos3s(GL gl_, ParameterTypeTuple!(fp_glWindowPos3sMESA) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos3sMESA)(gl.extFuncs[extensionId__][14]);
			return checkedCall(gl_, "WindowPos3s", funcPtr, params__);
		}
void WindowPos3sv(GL gl_, ParameterTypeTuple!(fp_glWindowPos3svMESA) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos3svMESA)(gl.extFuncs[extensionId__][15]);
			return checkedCall(gl_, "WindowPos3sv", funcPtr, params__);
		}
void WindowPos4d(GL gl_, ParameterTypeTuple!(fp_glWindowPos4dMESA) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos4dMESA)(gl.extFuncs[extensionId__][16]);
			return checkedCall(gl_, "WindowPos4d", funcPtr, params__);
		}
void WindowPos4dv(GL gl_, ParameterTypeTuple!(fp_glWindowPos4dvMESA) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos4dvMESA)(gl.extFuncs[extensionId__][17]);
			return checkedCall(gl_, "WindowPos4dv", funcPtr, params__);
		}
void WindowPos4f(GL gl_, ParameterTypeTuple!(fp_glWindowPos4fMESA) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos4fMESA)(gl.extFuncs[extensionId__][18]);
			return checkedCall(gl_, "WindowPos4f", funcPtr, params__);
		}
void WindowPos4fv(GL gl_, ParameterTypeTuple!(fp_glWindowPos4fvMESA) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos4fvMESA)(gl.extFuncs[extensionId__][19]);
			return checkedCall(gl_, "WindowPos4fv", funcPtr, params__);
		}
void WindowPos4i(GL gl_, ParameterTypeTuple!(fp_glWindowPos4iMESA) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos4iMESA)(gl.extFuncs[extensionId__][20]);
			return checkedCall(gl_, "WindowPos4i", funcPtr, params__);
		}
void WindowPos4iv(GL gl_, ParameterTypeTuple!(fp_glWindowPos4ivMESA) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos4ivMESA)(gl.extFuncs[extensionId__][21]);
			return checkedCall(gl_, "WindowPos4iv", funcPtr, params__);
		}
void WindowPos4s(GL gl_, ParameterTypeTuple!(fp_glWindowPos4sMESA) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos4sMESA)(gl.extFuncs[extensionId__][22]);
			return checkedCall(gl_, "WindowPos4s", funcPtr, params__);
		}
void WindowPos4sv(GL gl_, ParameterTypeTuple!(fp_glWindowPos4svMESA) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos4svMESA)(gl.extFuncs[extensionId__][23]);
			return checkedCall(gl_, "WindowPos4sv", funcPtr, params__);
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
		void*[] funcAddr = new void*[24];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_MESA_window_pos")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glWindowPos2dMESA"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glWindowPos2dvMESA"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glWindowPos2fMESA"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glWindowPos2fvMESA"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glWindowPos2iMESA"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glWindowPos2ivMESA"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glWindowPos2sMESA"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glWindowPos2svMESA"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[8] = getExtensionFuncPtr(cast(char*)"glWindowPos3dMESA"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[9] = getExtensionFuncPtr(cast(char*)"glWindowPos3dvMESA"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[10] = getExtensionFuncPtr(cast(char*)"glWindowPos3fMESA"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[11] = getExtensionFuncPtr(cast(char*)"glWindowPos3fvMESA"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[12] = getExtensionFuncPtr(cast(char*)"glWindowPos3iMESA"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[13] = getExtensionFuncPtr(cast(char*)"glWindowPos3ivMESA"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[14] = getExtensionFuncPtr(cast(char*)"glWindowPos3sMESA"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[15] = getExtensionFuncPtr(cast(char*)"glWindowPos3svMESA"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[16] = getExtensionFuncPtr(cast(char*)"glWindowPos4dMESA"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[17] = getExtensionFuncPtr(cast(char*)"glWindowPos4dvMESA"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[18] = getExtensionFuncPtr(cast(char*)"glWindowPos4fMESA"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[19] = getExtensionFuncPtr(cast(char*)"glWindowPos4fvMESA"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[20] = getExtensionFuncPtr(cast(char*)"glWindowPos4iMESA"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[21] = getExtensionFuncPtr(cast(char*)"glWindowPos4ivMESA"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[22] = getExtensionFuncPtr(cast(char*)"glWindowPos4sMESA"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[23] = getExtensionFuncPtr(cast(char*)"glWindowPos4svMESA"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
