module dgl.ext.EXT_secondary_color;
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



private ushort extensionId__ = 434;
alias extensionId__ EXT_secondary_color;

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
			const GLenum GL_COLOR_SUM_EXT = 0x8458;
			const GLenum GL_CURRENT_SECONDARY_COLOR_EXT = 0x8459;
			const GLenum GL_SECONDARY_COLOR_ARRAY_SIZE_EXT = 0x845A;
			const GLenum GL_SECONDARY_COLOR_ARRAY_TYPE_EXT = 0x845B;
			const GLenum GL_SECONDARY_COLOR_ARRAY_STRIDE_EXT = 0x845C;
			const GLenum GL_SECONDARY_COLOR_ARRAY_POINTER_EXT = 0x845D;
			const GLenum GL_SECONDARY_COLOR_ARRAY_EXT = 0x845E;
	}
	private {
		extern (System) {
			alias void function (GLbyte red, GLbyte green, GLbyte blue)	fp_glSecondaryColor3bEXT;
			alias void function ( GLbyte *v)	fp_glSecondaryColor3bvEXT;
			alias void function (GLdouble red, GLdouble green, GLdouble blue)	fp_glSecondaryColor3dEXT;
			alias void function ( GLdouble *v)	fp_glSecondaryColor3dvEXT;
			alias void function (GLfloat red, GLfloat green, GLfloat blue)	fp_glSecondaryColor3fEXT;
			alias void function ( GLfloat *v)	fp_glSecondaryColor3fvEXT;
			alias void function (GLint red, GLint green, GLint blue)	fp_glSecondaryColor3iEXT;
			alias void function ( GLint *v)	fp_glSecondaryColor3ivEXT;
			alias void function (GLshort red, GLshort green, GLshort blue)	fp_glSecondaryColor3sEXT;
			alias void function ( GLshort *v)	fp_glSecondaryColor3svEXT;
			alias void function (GLubyte red, GLubyte green, GLubyte blue)	fp_glSecondaryColor3ubEXT;
			alias void function ( GLubyte *v)	fp_glSecondaryColor3ubvEXT;
			alias void function (GLuint red, GLuint green, GLuint blue)	fp_glSecondaryColor3uiEXT;
			alias void function ( GLuint *v)	fp_glSecondaryColor3uivEXT;
			alias void function (GLushort red, GLushort green, GLushort blue)	fp_glSecondaryColor3usEXT;
			alias void function ( GLushort *v)	fp_glSecondaryColor3usvEXT;
			alias void function (GLint size, GLenum type, GLsizei stride, GLvoid *pointer)	fp_glSecondaryColorPointerEXT;
		}
	}
	public {
void SecondaryColor3b(GL gl_, ParameterTypeTuple!(fp_glSecondaryColor3bEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSecondaryColor3bEXT)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "SecondaryColor3b", funcPtr, params__);
		}
void SecondaryColor3bv(GL gl_, ParameterTypeTuple!(fp_glSecondaryColor3bvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSecondaryColor3bvEXT)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "SecondaryColor3bv", funcPtr, params__);
		}
void SecondaryColor3d(GL gl_, ParameterTypeTuple!(fp_glSecondaryColor3dEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSecondaryColor3dEXT)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "SecondaryColor3d", funcPtr, params__);
		}
void SecondaryColor3dv(GL gl_, ParameterTypeTuple!(fp_glSecondaryColor3dvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSecondaryColor3dvEXT)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "SecondaryColor3dv", funcPtr, params__);
		}
void SecondaryColor3f(GL gl_, ParameterTypeTuple!(fp_glSecondaryColor3fEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSecondaryColor3fEXT)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "SecondaryColor3f", funcPtr, params__);
		}
void SecondaryColor3fv(GL gl_, ParameterTypeTuple!(fp_glSecondaryColor3fvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSecondaryColor3fvEXT)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "SecondaryColor3fv", funcPtr, params__);
		}
void SecondaryColor3i(GL gl_, ParameterTypeTuple!(fp_glSecondaryColor3iEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSecondaryColor3iEXT)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "SecondaryColor3i", funcPtr, params__);
		}
void SecondaryColor3iv(GL gl_, ParameterTypeTuple!(fp_glSecondaryColor3ivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSecondaryColor3ivEXT)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "SecondaryColor3iv", funcPtr, params__);
		}
void SecondaryColor3s(GL gl_, ParameterTypeTuple!(fp_glSecondaryColor3sEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSecondaryColor3sEXT)(gl.extFuncs[extensionId__][8]);
			return checkedCall(gl_, "SecondaryColor3s", funcPtr, params__);
		}
void SecondaryColor3sv(GL gl_, ParameterTypeTuple!(fp_glSecondaryColor3svEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSecondaryColor3svEXT)(gl.extFuncs[extensionId__][9]);
			return checkedCall(gl_, "SecondaryColor3sv", funcPtr, params__);
		}
void SecondaryColor3ub(GL gl_, ParameterTypeTuple!(fp_glSecondaryColor3ubEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSecondaryColor3ubEXT)(gl.extFuncs[extensionId__][10]);
			return checkedCall(gl_, "SecondaryColor3ub", funcPtr, params__);
		}
void SecondaryColor3ubv(GL gl_, ParameterTypeTuple!(fp_glSecondaryColor3ubvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSecondaryColor3ubvEXT)(gl.extFuncs[extensionId__][11]);
			return checkedCall(gl_, "SecondaryColor3ubv", funcPtr, params__);
		}
void SecondaryColor3ui(GL gl_, ParameterTypeTuple!(fp_glSecondaryColor3uiEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSecondaryColor3uiEXT)(gl.extFuncs[extensionId__][12]);
			return checkedCall(gl_, "SecondaryColor3ui", funcPtr, params__);
		}
void SecondaryColor3uiv(GL gl_, ParameterTypeTuple!(fp_glSecondaryColor3uivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSecondaryColor3uivEXT)(gl.extFuncs[extensionId__][13]);
			return checkedCall(gl_, "SecondaryColor3uiv", funcPtr, params__);
		}
void SecondaryColor3us(GL gl_, ParameterTypeTuple!(fp_glSecondaryColor3usEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSecondaryColor3usEXT)(gl.extFuncs[extensionId__][14]);
			return checkedCall(gl_, "SecondaryColor3us", funcPtr, params__);
		}
void SecondaryColor3usv(GL gl_, ParameterTypeTuple!(fp_glSecondaryColor3usvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSecondaryColor3usvEXT)(gl.extFuncs[extensionId__][15]);
			return checkedCall(gl_, "SecondaryColor3usv", funcPtr, params__);
		}
void SecondaryColorPointer(GL gl_, ParameterTypeTuple!(fp_glSecondaryColorPointerEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSecondaryColorPointerEXT)(gl.extFuncs[extensionId__][16]);
			return checkedCall(gl_, "SecondaryColorPointer", funcPtr, params__);
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
		void*[] funcAddr = new void*[17];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_EXT_secondary_color")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glSecondaryColor3bEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glSecondaryColor3bvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glSecondaryColor3dEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glSecondaryColor3dvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glSecondaryColor3fEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glSecondaryColor3fvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glSecondaryColor3iEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glSecondaryColor3ivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[8] = getExtensionFuncPtr(cast(char*)"glSecondaryColor3sEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[9] = getExtensionFuncPtr(cast(char*)"glSecondaryColor3svEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[10] = getExtensionFuncPtr(cast(char*)"glSecondaryColor3ubEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[11] = getExtensionFuncPtr(cast(char*)"glSecondaryColor3ubvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[12] = getExtensionFuncPtr(cast(char*)"glSecondaryColor3uiEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[13] = getExtensionFuncPtr(cast(char*)"glSecondaryColor3uivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[14] = getExtensionFuncPtr(cast(char*)"glSecondaryColor3usEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[15] = getExtensionFuncPtr(cast(char*)"glSecondaryColor3usvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[16] = getExtensionFuncPtr(cast(char*)"glSecondaryColorPointerEXT"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
