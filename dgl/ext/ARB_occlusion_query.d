module dgl.ext.ARB_occlusion_query;
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



private ushort extensionId__ = 348;
alias extensionId__ ARB_occlusion_query;

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
			const GLenum GL_QUERY_COUNTER_BITS_ARB = 0x8864;
			const GLenum GL_CURRENT_QUERY_ARB = 0x8865;
			const GLenum GL_QUERY_RESULT_ARB = 0x8866;
			const GLenum GL_QUERY_RESULT_AVAILABLE_ARB = 0x8867;
			const GLenum GL_SAMPLES_PASSED_ARB = 0x8914;
	}
	private {
		extern (System) {
			alias void function (GLenum target, GLuint id)	fp_glBeginQueryARB;
			alias void function (GLsizei n,  GLuint* ids)	fp_glDeleteQueriesARB;
			alias void function (GLenum target)	fp_glEndQueryARB;
			alias void function (GLsizei n, GLuint* ids)	fp_glGenQueriesARB;
			alias void function (GLuint id, GLenum pname, GLint* params)	fp_glGetQueryObjectivARB;
			alias void function (GLuint id, GLenum pname, GLuint* params)	fp_glGetQueryObjectuivARB;
			alias void function (GLenum target, GLenum pname, GLint* params)	fp_glGetQueryivARB;
			alias GLboolean function (GLuint id)	fp_glIsQueryARB;
		}
	}
	public {
void BeginQuery(GL gl_, ParameterTypeTuple!(fp_glBeginQueryARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBeginQueryARB)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "BeginQuery", funcPtr, params__);
		}
void DeleteQueries(GL gl_, ParameterTypeTuple!(fp_glDeleteQueriesARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDeleteQueriesARB)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "DeleteQueries", funcPtr, params__);
		}
void EndQuery(GL gl_, ParameterTypeTuple!(fp_glEndQueryARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glEndQueryARB)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "EndQuery", funcPtr, params__);
		}
void GenQueries(GL gl_, ParameterTypeTuple!(fp_glGenQueriesARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGenQueriesARB)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "GenQueries", funcPtr, params__);
		}
void GetQueryObjectiv(GL gl_, ParameterTypeTuple!(fp_glGetQueryObjectivARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetQueryObjectivARB)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "GetQueryObjectiv", funcPtr, params__);
		}
void GetQueryObjectuiv(GL gl_, ParameterTypeTuple!(fp_glGetQueryObjectuivARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetQueryObjectuivARB)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "GetQueryObjectuiv", funcPtr, params__);
		}
void GetQueryiv(GL gl_, ParameterTypeTuple!(fp_glGetQueryivARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetQueryivARB)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "GetQueryiv", funcPtr, params__);
		}
GLboolean IsQuery(GL gl_, ParameterTypeTuple!(fp_glIsQueryARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glIsQueryARB)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "IsQuery", funcPtr, params__);
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
			if (!extStr.containsPattern("GL_ARB_occlusion_query")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glBeginQueryARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glDeleteQueriesARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glEndQueryARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glGenQueriesARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glGetQueryObjectivARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glGetQueryObjectuivARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glGetQueryivARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glIsQueryARB"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
