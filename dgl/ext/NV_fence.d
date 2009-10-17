module dgl.ext.NV_fence;
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



private ushort extensionId__ = 328;
alias extensionId__ NV_fence;

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
			const GLenum GL_ALL_COMPLETED_NV = 0x84F2;
			const GLenum GL_FENCE_STATUS_NV = 0x84F3;
			const GLenum GL_FENCE_CONDITION_NV = 0x84F4;
	}
	private {
		extern (System) {
			alias void function (GLsizei n,  GLuint* fences)	fp_glDeleteFencesNV;
			alias void function (GLuint fence)	fp_glFinishFenceNV;
			alias void function (GLsizei n, GLuint* fences)	fp_glGenFencesNV;
			alias void function (GLuint fence, GLenum pname, GLint* params)	fp_glGetFenceivNV;
			alias GLboolean function (GLuint fence)	fp_glIsFenceNV;
			alias void function (GLuint fence, GLenum condition)	fp_glSetFenceNV;
			alias GLboolean function (GLuint fence)	fp_glTestFenceNV;
		}
	}
	public {
void DeleteFences(GL gl_, ParameterTypeTuple!(fp_glDeleteFencesNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDeleteFencesNV)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "DeleteFences", funcPtr, params__);
		}
void FinishFence(GL gl_, ParameterTypeTuple!(fp_glFinishFenceNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFinishFenceNV)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "FinishFence", funcPtr, params__);
		}
void GenFences(GL gl_, ParameterTypeTuple!(fp_glGenFencesNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGenFencesNV)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "GenFences", funcPtr, params__);
		}
void GetFenceiv(GL gl_, ParameterTypeTuple!(fp_glGetFenceivNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetFenceivNV)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "GetFenceiv", funcPtr, params__);
		}
GLboolean IsFence(GL gl_, ParameterTypeTuple!(fp_glIsFenceNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glIsFenceNV)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "IsFence", funcPtr, params__);
		}
void SetFence(GL gl_, ParameterTypeTuple!(fp_glSetFenceNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSetFenceNV)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "SetFence", funcPtr, params__);
		}
GLboolean TestFence(GL gl_, ParameterTypeTuple!(fp_glTestFenceNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTestFenceNV)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "TestFence", funcPtr, params__);
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
			if (!extStr.containsPattern("GL_NV_fence")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glDeleteFencesNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glFinishFenceNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glGenFencesNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glGetFenceivNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glIsFenceNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glSetFenceNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glTestFenceNV"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
