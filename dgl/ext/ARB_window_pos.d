module dgl.ext.ARB_window_pos;
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



private ushort extensionId__ = 14;
alias extensionId__ ARB_window_pos;

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
			alias void function (GLdouble x, GLdouble y)	fp_glWindowPos2dARB;
			alias void function ( GLdouble* p)	fp_glWindowPos2dvARB;
			alias void function (GLfloat x, GLfloat y)	fp_glWindowPos2fARB;
			alias void function ( GLfloat* p)	fp_glWindowPos2fvARB;
			alias void function (GLint x, GLint y)	fp_glWindowPos2iARB;
			alias void function ( GLint* p)	fp_glWindowPos2ivARB;
			alias void function (GLshort x, GLshort y)	fp_glWindowPos2sARB;
			alias void function ( GLshort* p)	fp_glWindowPos2svARB;
			alias void function (GLdouble x, GLdouble y, GLdouble z)	fp_glWindowPos3dARB;
			alias void function ( GLdouble* p)	fp_glWindowPos3dvARB;
			alias void function (GLfloat x, GLfloat y, GLfloat z)	fp_glWindowPos3fARB;
			alias void function ( GLfloat* p)	fp_glWindowPos3fvARB;
			alias void function (GLint x, GLint y, GLint z)	fp_glWindowPos3iARB;
			alias void function ( GLint* p)	fp_glWindowPos3ivARB;
			alias void function (GLshort x, GLshort y, GLshort z)	fp_glWindowPos3sARB;
			alias void function ( GLshort* p)	fp_glWindowPos3svARB;
		}
	}
	public {
void WindowPos2d(GL gl_, ParameterTypeTuple!(fp_glWindowPos2dARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos2dARB)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "WindowPos2d", funcPtr, params__);
		}
void WindowPos2dv(GL gl_, ParameterTypeTuple!(fp_glWindowPos2dvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos2dvARB)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "WindowPos2dv", funcPtr, params__);
		}
void WindowPos2f(GL gl_, ParameterTypeTuple!(fp_glWindowPos2fARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos2fARB)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "WindowPos2f", funcPtr, params__);
		}
void WindowPos2fv(GL gl_, ParameterTypeTuple!(fp_glWindowPos2fvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos2fvARB)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "WindowPos2fv", funcPtr, params__);
		}
void WindowPos2i(GL gl_, ParameterTypeTuple!(fp_glWindowPos2iARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos2iARB)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "WindowPos2i", funcPtr, params__);
		}
void WindowPos2iv(GL gl_, ParameterTypeTuple!(fp_glWindowPos2ivARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos2ivARB)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "WindowPos2iv", funcPtr, params__);
		}
void WindowPos2s(GL gl_, ParameterTypeTuple!(fp_glWindowPos2sARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos2sARB)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "WindowPos2s", funcPtr, params__);
		}
void WindowPos2sv(GL gl_, ParameterTypeTuple!(fp_glWindowPos2svARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos2svARB)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "WindowPos2sv", funcPtr, params__);
		}
void WindowPos3d(GL gl_, ParameterTypeTuple!(fp_glWindowPos3dARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos3dARB)(gl.extFuncs[extensionId__][8]);
			return checkedCall(gl_, "WindowPos3d", funcPtr, params__);
		}
void WindowPos3dv(GL gl_, ParameterTypeTuple!(fp_glWindowPos3dvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos3dvARB)(gl.extFuncs[extensionId__][9]);
			return checkedCall(gl_, "WindowPos3dv", funcPtr, params__);
		}
void WindowPos3f(GL gl_, ParameterTypeTuple!(fp_glWindowPos3fARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos3fARB)(gl.extFuncs[extensionId__][10]);
			return checkedCall(gl_, "WindowPos3f", funcPtr, params__);
		}
void WindowPos3fv(GL gl_, ParameterTypeTuple!(fp_glWindowPos3fvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos3fvARB)(gl.extFuncs[extensionId__][11]);
			return checkedCall(gl_, "WindowPos3fv", funcPtr, params__);
		}
void WindowPos3i(GL gl_, ParameterTypeTuple!(fp_glWindowPos3iARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos3iARB)(gl.extFuncs[extensionId__][12]);
			return checkedCall(gl_, "WindowPos3i", funcPtr, params__);
		}
void WindowPos3iv(GL gl_, ParameterTypeTuple!(fp_glWindowPos3ivARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos3ivARB)(gl.extFuncs[extensionId__][13]);
			return checkedCall(gl_, "WindowPos3iv", funcPtr, params__);
		}
void WindowPos3s(GL gl_, ParameterTypeTuple!(fp_glWindowPos3sARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos3sARB)(gl.extFuncs[extensionId__][14]);
			return checkedCall(gl_, "WindowPos3s", funcPtr, params__);
		}
void WindowPos3sv(GL gl_, ParameterTypeTuple!(fp_glWindowPos3svARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWindowPos3svARB)(gl.extFuncs[extensionId__][15]);
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
		void*[] funcAddr = new void*[16];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_ARB_window_pos")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glWindowPos2dARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glWindowPos2dvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glWindowPos2fARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glWindowPos2fvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glWindowPos2iARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glWindowPos2ivARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glWindowPos2sARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glWindowPos2svARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[8] = getExtensionFuncPtr(cast(char*)"glWindowPos3dARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[9] = getExtensionFuncPtr(cast(char*)"glWindowPos3dvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[10] = getExtensionFuncPtr(cast(char*)"glWindowPos3fARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[11] = getExtensionFuncPtr(cast(char*)"glWindowPos3fvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[12] = getExtensionFuncPtr(cast(char*)"glWindowPos3iARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[13] = getExtensionFuncPtr(cast(char*)"glWindowPos3ivARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[14] = getExtensionFuncPtr(cast(char*)"glWindowPos3sARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[15] = getExtensionFuncPtr(cast(char*)"glWindowPos3svARB"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
