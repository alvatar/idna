module dgl.ext.NV_occlusion_query;
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



private ushort extensionId__ = 244;
alias extensionId__ NV_occlusion_query;

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
			const GLenum GL_PIXEL_COUNTER_BITS_NV = 0x8864;
			const GLenum GL_CURRENT_OCCLUSION_QUERY_ID_NV = 0x8865;
			const GLenum GL_PIXEL_COUNT_NV = 0x8866;
			const GLenum GL_PIXEL_COUNT_AVAILABLE_NV = 0x8867;
	}
	private {
		extern (System) {
			alias void function (GLuint id)	fp_glBeginOcclusionQueryNV;
			alias void function (GLsizei n,  GLuint* ids)	fp_glDeleteOcclusionQueriesNV;
			alias void function ()	fp_glEndOcclusionQueryNV;
			alias void function (GLsizei n, GLuint* ids)	fp_glGenOcclusionQueriesNV;
			alias void function (GLuint id, GLenum pname, GLint* params)	fp_glGetOcclusionQueryivNV;
			alias void function (GLuint id, GLenum pname, GLuint* params)	fp_glGetOcclusionQueryuivNV;
			alias GLboolean function (GLuint id)	fp_glIsOcclusionQueryNV;
		}
	}
	public {
void BeginOcclusionQuery(GL gl_, ParameterTypeTuple!(fp_glBeginOcclusionQueryNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBeginOcclusionQueryNV)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "BeginOcclusionQuery", funcPtr, params__);
		}
void DeleteOcclusionQueries(GL gl_, ParameterTypeTuple!(fp_glDeleteOcclusionQueriesNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDeleteOcclusionQueriesNV)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "DeleteOcclusionQueries", funcPtr, params__);
		}
void EndOcclusionQuery(GL gl_, ParameterTypeTuple!(fp_glEndOcclusionQueryNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glEndOcclusionQueryNV)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "EndOcclusionQuery", funcPtr, params__);
		}
void GenOcclusionQueries(GL gl_, ParameterTypeTuple!(fp_glGenOcclusionQueriesNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGenOcclusionQueriesNV)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "GenOcclusionQueries", funcPtr, params__);
		}
void GetOcclusionQueryiv(GL gl_, ParameterTypeTuple!(fp_glGetOcclusionQueryivNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetOcclusionQueryivNV)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "GetOcclusionQueryiv", funcPtr, params__);
		}
void GetOcclusionQueryuiv(GL gl_, ParameterTypeTuple!(fp_glGetOcclusionQueryuivNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetOcclusionQueryuivNV)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "GetOcclusionQueryuiv", funcPtr, params__);
		}
GLboolean IsOcclusionQuery(GL gl_, ParameterTypeTuple!(fp_glIsOcclusionQueryNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glIsOcclusionQueryNV)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "IsOcclusionQuery", funcPtr, params__);
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
			if (!extStr.containsPattern("GL_NV_occlusion_query")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glBeginOcclusionQueryNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glDeleteOcclusionQueriesNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glEndOcclusionQueryNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glGenOcclusionQueriesNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glGetOcclusionQueryivNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glGetOcclusionQueryuivNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glIsOcclusionQueryNV"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
