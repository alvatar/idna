module dgl.ext.SUN_global_alpha;
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



private ushort extensionId__ = 169;
alias extensionId__ SUN_global_alpha;

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
			const GLenum GL_GLOBAL_ALPHA_SUN = 0x81D9;
			const GLenum GL_GLOBAL_ALPHA_FACTOR_SUN = 0x81DA;
	}
	private {
		extern (System) {
			alias void function (GLbyte factor)	fp_glGlobalAlphaFactorbSUN;
			alias void function (GLdouble factor)	fp_glGlobalAlphaFactordSUN;
			alias void function (GLfloat factor)	fp_glGlobalAlphaFactorfSUN;
			alias void function (GLint factor)	fp_glGlobalAlphaFactoriSUN;
			alias void function (GLshort factor)	fp_glGlobalAlphaFactorsSUN;
			alias void function (GLubyte factor)	fp_glGlobalAlphaFactorubSUN;
			alias void function (GLuint factor)	fp_glGlobalAlphaFactoruiSUN;
			alias void function (GLushort factor)	fp_glGlobalAlphaFactorusSUN;
		}
	}
	public {
void GlobalAlphaFactorb(GL gl_, ParameterTypeTuple!(fp_glGlobalAlphaFactorbSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGlobalAlphaFactorbSUN)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "GlobalAlphaFactorb", funcPtr, params__);
		}
void GlobalAlphaFactord(GL gl_, ParameterTypeTuple!(fp_glGlobalAlphaFactordSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGlobalAlphaFactordSUN)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "GlobalAlphaFactord", funcPtr, params__);
		}
void GlobalAlphaFactorf(GL gl_, ParameterTypeTuple!(fp_glGlobalAlphaFactorfSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGlobalAlphaFactorfSUN)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "GlobalAlphaFactorf", funcPtr, params__);
		}
void GlobalAlphaFactori(GL gl_, ParameterTypeTuple!(fp_glGlobalAlphaFactoriSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGlobalAlphaFactoriSUN)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "GlobalAlphaFactori", funcPtr, params__);
		}
void GlobalAlphaFactors(GL gl_, ParameterTypeTuple!(fp_glGlobalAlphaFactorsSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGlobalAlphaFactorsSUN)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "GlobalAlphaFactors", funcPtr, params__);
		}
void GlobalAlphaFactorub(GL gl_, ParameterTypeTuple!(fp_glGlobalAlphaFactorubSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGlobalAlphaFactorubSUN)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "GlobalAlphaFactorub", funcPtr, params__);
		}
void GlobalAlphaFactorui(GL gl_, ParameterTypeTuple!(fp_glGlobalAlphaFactoruiSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGlobalAlphaFactoruiSUN)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "GlobalAlphaFactorui", funcPtr, params__);
		}
void GlobalAlphaFactorus(GL gl_, ParameterTypeTuple!(fp_glGlobalAlphaFactorusSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGlobalAlphaFactorusSUN)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "GlobalAlphaFactorus", funcPtr, params__);
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
		void*[] funcAddr = new void*[8];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_SUN_global_alpha")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glGlobalAlphaFactorbSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glGlobalAlphaFactordSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glGlobalAlphaFactorfSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glGlobalAlphaFactoriSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glGlobalAlphaFactorsSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glGlobalAlphaFactorubSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glGlobalAlphaFactoruiSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glGlobalAlphaFactorusSUN"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
