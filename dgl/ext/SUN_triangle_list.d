module dgl.ext.SUN_triangle_list;
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



private ushort extensionId__ = 351;
alias extensionId__ SUN_triangle_list;

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
			const GLenum GL_RESTART_SUN = 0x01;
			const GLenum GL_REPLACE_MIDDLE_SUN = 0x02;
			const GLenum GL_REPLACE_OLDEST_SUN = 0x03;
			const GLenum GL_TRIANGLE_LIST_SUN = 0x81D7;
			const GLenum GL_REPLACEMENT_CODE_SUN = 0x81D8;
			const GLenum GL_REPLACEMENT_CODE_ARRAY_SUN = 0x85C0;
			const GLenum GL_REPLACEMENT_CODE_ARRAY_TYPE_SUN = 0x85C1;
			const GLenum GL_REPLACEMENT_CODE_ARRAY_STRIDE_SUN = 0x85C2;
			const GLenum GL_REPLACEMENT_CODE_ARRAY_POINTER_SUN = 0x85C3;
			const GLenum GL_R1UI_V3F_SUN = 0x85C4;
			const GLenum GL_R1UI_C4UB_V3F_SUN = 0x85C5;
			const GLenum GL_R1UI_C3F_V3F_SUN = 0x85C6;
			const GLenum GL_R1UI_N3F_V3F_SUN = 0x85C7;
			const GLenum GL_R1UI_C4F_N3F_V3F_SUN = 0x85C8;
			const GLenum GL_R1UI_T2F_V3F_SUN = 0x85C9;
			const GLenum GL_R1UI_T2F_N3F_V3F_SUN = 0x85CA;
			const GLenum GL_R1UI_T2F_C4F_N3F_V3F_SUN = 0x85CB;
	}
	private {
		extern (System) {
			alias void function (GLenum type, GLsizei stride,  void* pointer)	fp_glReplacementCodePointerSUN;
			alias void function (GLubyte code)	fp_glReplacementCodeubSUN;
			alias void function ( GLubyte* code)	fp_glReplacementCodeubvSUN;
			alias void function (GLuint code)	fp_glReplacementCodeuiSUN;
			alias void function ( GLuint* code)	fp_glReplacementCodeuivSUN;
			alias void function (GLushort code)	fp_glReplacementCodeusSUN;
			alias void function ( GLushort* code)	fp_glReplacementCodeusvSUN;
		}
	}
	public {
void ReplacementCodePointer(GL gl_, ParameterTypeTuple!(fp_glReplacementCodePointerSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glReplacementCodePointerSUN)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "ReplacementCodePointer", funcPtr, params__);
		}
void ReplacementCodeub(GL gl_, ParameterTypeTuple!(fp_glReplacementCodeubSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glReplacementCodeubSUN)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "ReplacementCodeub", funcPtr, params__);
		}
void ReplacementCodeubv(GL gl_, ParameterTypeTuple!(fp_glReplacementCodeubvSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glReplacementCodeubvSUN)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "ReplacementCodeubv", funcPtr, params__);
		}
void ReplacementCodeui(GL gl_, ParameterTypeTuple!(fp_glReplacementCodeuiSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glReplacementCodeuiSUN)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "ReplacementCodeui", funcPtr, params__);
		}
void ReplacementCodeuiv(GL gl_, ParameterTypeTuple!(fp_glReplacementCodeuivSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glReplacementCodeuivSUN)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "ReplacementCodeuiv", funcPtr, params__);
		}
void ReplacementCodeus(GL gl_, ParameterTypeTuple!(fp_glReplacementCodeusSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glReplacementCodeusSUN)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "ReplacementCodeus", funcPtr, params__);
		}
void ReplacementCodeusv(GL gl_, ParameterTypeTuple!(fp_glReplacementCodeusvSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glReplacementCodeusvSUN)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "ReplacementCodeusv", funcPtr, params__);
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
			if (!extStr.containsPattern("GL_SUN_triangle_list")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glReplacementCodePointerSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glReplacementCodeubSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glReplacementCodeubvSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glReplacementCodeuiSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glReplacementCodeuivSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glReplacementCodeusSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glReplacementCodeusvSUN"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
