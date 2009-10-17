module dgl.ext.APPLE_fence;
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



private ushort extensionId__ = 62;
alias extensionId__ APPLE_fence;

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
			const GLenum GL_DRAW_PIXELS_APPLE = 0x8A0A;
			const GLenum GL_FENCE_APPLE = 0x8A0B;
	}
	private {
		extern (System) {
			alias void function (GLsizei n,  GLuint* fences)	fp_glDeleteFencesAPPLE;
			alias void function (GLuint fence)	fp_glFinishFenceAPPLE;
			alias void function (GLenum object, GLint name)	fp_glFinishObjectAPPLE;
			alias void function (GLsizei n, GLuint* fences)	fp_glGenFencesAPPLE;
			alias GLboolean function (GLuint fence)	fp_glIsFenceAPPLE;
			alias void function (GLuint fence)	fp_glSetFenceAPPLE;
			alias GLboolean function (GLuint fence)	fp_glTestFenceAPPLE;
			alias GLboolean function (GLenum object, GLuint name)	fp_glTestObjectAPPLE;
		}
	}
	public {
void DeleteFences(GL gl_, ParameterTypeTuple!(fp_glDeleteFencesAPPLE) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDeleteFencesAPPLE)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "DeleteFences", funcPtr, params__);
		}
void FinishFence(GL gl_, ParameterTypeTuple!(fp_glFinishFenceAPPLE) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFinishFenceAPPLE)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "FinishFence", funcPtr, params__);
		}
void FinishObject(GL gl_, ParameterTypeTuple!(fp_glFinishObjectAPPLE) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFinishObjectAPPLE)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "FinishObject", funcPtr, params__);
		}
void GenFences(GL gl_, ParameterTypeTuple!(fp_glGenFencesAPPLE) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGenFencesAPPLE)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "GenFences", funcPtr, params__);
		}
GLboolean IsFence(GL gl_, ParameterTypeTuple!(fp_glIsFenceAPPLE) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glIsFenceAPPLE)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "IsFence", funcPtr, params__);
		}
void SetFence(GL gl_, ParameterTypeTuple!(fp_glSetFenceAPPLE) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSetFenceAPPLE)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "SetFence", funcPtr, params__);
		}
GLboolean TestFence(GL gl_, ParameterTypeTuple!(fp_glTestFenceAPPLE) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTestFenceAPPLE)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "TestFence", funcPtr, params__);
		}
GLboolean TestObject(GL gl_, ParameterTypeTuple!(fp_glTestObjectAPPLE) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTestObjectAPPLE)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "TestObject", funcPtr, params__);
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
			if (!extStr.containsPattern("GL_APPLE_fence")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glDeleteFencesAPPLE"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glFinishFenceAPPLE"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glFinishObjectAPPLE"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glGenFencesAPPLE"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glIsFenceAPPLE"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glSetFenceAPPLE"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glTestFenceAPPLE"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glTestObjectAPPLE"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
