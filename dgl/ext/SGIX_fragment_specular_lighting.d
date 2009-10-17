module dgl.ext.SGIX_fragment_specular_lighting;
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



private ushort extensionId__ = 242;
alias extensionId__ SGIX_fragment_specular_lighting;

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
			alias void function (GLenum face, GLenum mode)	fp_glFragmentColorMaterialSGIX;
			alias void function (GLenum pname, GLfloat param)	fp_glFragmentLightModelfSGIX;
			alias void function (GLenum pname, GLfloat* params)	fp_glFragmentLightModelfvSGIX;
			alias void function (GLenum pname, GLint param)	fp_glFragmentLightModeliSGIX;
			alias void function (GLenum pname, GLint* params)	fp_glFragmentLightModelivSGIX;
			alias void function (GLenum light, GLenum pname, GLfloat param)	fp_glFragmentLightfSGIX;
			alias void function (GLenum light, GLenum pname, GLfloat* params)	fp_glFragmentLightfvSGIX;
			alias void function (GLenum light, GLenum pname, GLint param)	fp_glFragmentLightiSGIX;
			alias void function (GLenum light, GLenum pname, GLint* params)	fp_glFragmentLightivSGIX;
			alias void function (GLenum face, GLenum pname,  GLfloat param)	fp_glFragmentMaterialfSGIX;
			alias void function (GLenum face, GLenum pname,  GLfloat* params)	fp_glFragmentMaterialfvSGIX;
			alias void function (GLenum face, GLenum pname,  GLint param)	fp_glFragmentMaterialiSGIX;
			alias void function (GLenum face, GLenum pname,  GLint* params)	fp_glFragmentMaterialivSGIX;
			alias void function (GLenum light, GLenum value, GLfloat* data)	fp_glGetFragmentLightfvSGIX;
			alias void function (GLenum light, GLenum value, GLint* data)	fp_glGetFragmentLightivSGIX;
			alias void function (GLenum face, GLenum pname,  GLfloat* data)	fp_glGetFragmentMaterialfvSGIX;
			alias void function (GLenum face, GLenum pname,  GLint* data)	fp_glGetFragmentMaterialivSGIX;
		}
	}
	public {
void FragmentColorMaterial(GL gl_, ParameterTypeTuple!(fp_glFragmentColorMaterialSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFragmentColorMaterialSGIX)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "FragmentColorMaterial", funcPtr, params__);
		}
void FragmentLightModelf(GL gl_, ParameterTypeTuple!(fp_glFragmentLightModelfSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFragmentLightModelfSGIX)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "FragmentLightModelf", funcPtr, params__);
		}
void FragmentLightModelfv(GL gl_, ParameterTypeTuple!(fp_glFragmentLightModelfvSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFragmentLightModelfvSGIX)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "FragmentLightModelfv", funcPtr, params__);
		}
void FragmentLightModeli(GL gl_, ParameterTypeTuple!(fp_glFragmentLightModeliSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFragmentLightModeliSGIX)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "FragmentLightModeli", funcPtr, params__);
		}
void FragmentLightModeliv(GL gl_, ParameterTypeTuple!(fp_glFragmentLightModelivSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFragmentLightModelivSGIX)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "FragmentLightModeliv", funcPtr, params__);
		}
void FragmentLightf(GL gl_, ParameterTypeTuple!(fp_glFragmentLightfSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFragmentLightfSGIX)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "FragmentLightf", funcPtr, params__);
		}
void FragmentLightfv(GL gl_, ParameterTypeTuple!(fp_glFragmentLightfvSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFragmentLightfvSGIX)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "FragmentLightfv", funcPtr, params__);
		}
void FragmentLighti(GL gl_, ParameterTypeTuple!(fp_glFragmentLightiSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFragmentLightiSGIX)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "FragmentLighti", funcPtr, params__);
		}
void FragmentLightiv(GL gl_, ParameterTypeTuple!(fp_glFragmentLightivSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFragmentLightivSGIX)(gl.extFuncs[extensionId__][8]);
			return checkedCall(gl_, "FragmentLightiv", funcPtr, params__);
		}
void FragmentMaterialf(GL gl_, ParameterTypeTuple!(fp_glFragmentMaterialfSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFragmentMaterialfSGIX)(gl.extFuncs[extensionId__][9]);
			return checkedCall(gl_, "FragmentMaterialf", funcPtr, params__);
		}
void FragmentMaterialfv(GL gl_, ParameterTypeTuple!(fp_glFragmentMaterialfvSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFragmentMaterialfvSGIX)(gl.extFuncs[extensionId__][10]);
			return checkedCall(gl_, "FragmentMaterialfv", funcPtr, params__);
		}
void FragmentMateriali(GL gl_, ParameterTypeTuple!(fp_glFragmentMaterialiSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFragmentMaterialiSGIX)(gl.extFuncs[extensionId__][11]);
			return checkedCall(gl_, "FragmentMateriali", funcPtr, params__);
		}
void FragmentMaterialiv(GL gl_, ParameterTypeTuple!(fp_glFragmentMaterialivSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFragmentMaterialivSGIX)(gl.extFuncs[extensionId__][12]);
			return checkedCall(gl_, "FragmentMaterialiv", funcPtr, params__);
		}
void GetFragmentLightfv(GL gl_, ParameterTypeTuple!(fp_glGetFragmentLightfvSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetFragmentLightfvSGIX)(gl.extFuncs[extensionId__][13]);
			return checkedCall(gl_, "GetFragmentLightfv", funcPtr, params__);
		}
void GetFragmentLightiv(GL gl_, ParameterTypeTuple!(fp_glGetFragmentLightivSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetFragmentLightivSGIX)(gl.extFuncs[extensionId__][14]);
			return checkedCall(gl_, "GetFragmentLightiv", funcPtr, params__);
		}
void GetFragmentMaterialfv(GL gl_, ParameterTypeTuple!(fp_glGetFragmentMaterialfvSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetFragmentMaterialfvSGIX)(gl.extFuncs[extensionId__][15]);
			return checkedCall(gl_, "GetFragmentMaterialfv", funcPtr, params__);
		}
void GetFragmentMaterialiv(GL gl_, ParameterTypeTuple!(fp_glGetFragmentMaterialivSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetFragmentMaterialivSGIX)(gl.extFuncs[extensionId__][16]);
			return checkedCall(gl_, "GetFragmentMaterialiv", funcPtr, params__);
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
			if (!extStr.containsPattern("GL_SGIX_fragment_specular_lighting")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glFragmentColorMaterialSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glFragmentLightModelfSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glFragmentLightModelfvSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glFragmentLightModeliSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glFragmentLightModelivSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glFragmentLightfSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glFragmentLightfvSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glFragmentLightiSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[8] = getExtensionFuncPtr(cast(char*)"glFragmentLightivSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[9] = getExtensionFuncPtr(cast(char*)"glFragmentMaterialfSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[10] = getExtensionFuncPtr(cast(char*)"glFragmentMaterialfvSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[11] = getExtensionFuncPtr(cast(char*)"glFragmentMaterialiSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[12] = getExtensionFuncPtr(cast(char*)"glFragmentMaterialivSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[13] = getExtensionFuncPtr(cast(char*)"glGetFragmentLightfvSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[14] = getExtensionFuncPtr(cast(char*)"glGetFragmentLightivSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[15] = getExtensionFuncPtr(cast(char*)"glGetFragmentMaterialfvSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[16] = getExtensionFuncPtr(cast(char*)"glGetFragmentMaterialivSGIX"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
