module dgl.ext.APPLE_vertex_array_object;
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



private ushort extensionId__ = 220;
alias extensionId__ APPLE_vertex_array_object;

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
			const GLenum GL_VERTEX_ARRAY_BINDING_APPLE = 0x85B5;
	}
	private {
		extern (System) {
			alias void function (GLuint array)	fp_glBindVertexArrayAPPLE;
			alias void function (GLsizei n,  GLuint* arrays)	fp_glDeleteVertexArraysAPPLE;
			alias void function (GLsizei n,  GLuint* arrays)	fp_glGenVertexArraysAPPLE;
			alias GLboolean function (GLuint array)	fp_glIsVertexArrayAPPLE;
		}
	}
	public {
void BindVertexArray(GL gl_, ParameterTypeTuple!(fp_glBindVertexArrayAPPLE) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBindVertexArrayAPPLE)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "BindVertexArray", funcPtr, params__);
		}
void DeleteVertexArrays(GL gl_, ParameterTypeTuple!(fp_glDeleteVertexArraysAPPLE) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDeleteVertexArraysAPPLE)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "DeleteVertexArrays", funcPtr, params__);
		}
void GenVertexArrays(GL gl_, ParameterTypeTuple!(fp_glGenVertexArraysAPPLE) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGenVertexArraysAPPLE)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "GenVertexArrays", funcPtr, params__);
		}
GLboolean IsVertexArray(GL gl_, ParameterTypeTuple!(fp_glIsVertexArrayAPPLE) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glIsVertexArrayAPPLE)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "IsVertexArray", funcPtr, params__);
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
			if (!extStr.containsPattern("GL_APPLE_vertex_array_object")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glBindVertexArrayAPPLE"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glDeleteVertexArraysAPPLE"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glGenVertexArraysAPPLE"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glIsVertexArrayAPPLE"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
