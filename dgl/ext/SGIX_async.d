module dgl.ext.SGIX_async;
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



private ushort extensionId__ = 195;
alias extensionId__ SGIX_async;

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
			const GLenum GL_ASYNC_MARKER_SGIX = 0x8329;
	}
	private {
		extern (System) {
			alias void function (GLuint marker)	fp_glAsyncMarkerSGIX;
			alias void function (GLuint marker, GLsizei range)	fp_glDeleteAsyncMarkersSGIX;
			alias GLint function (GLuint* markerp)	fp_glFinishAsyncSGIX;
			alias GLuint function (GLsizei range)	fp_glGenAsyncMarkersSGIX;
			alias GLboolean function (GLuint marker)	fp_glIsAsyncMarkerSGIX;
			alias GLint function (GLuint* markerp)	fp_glPollAsyncSGIX;
		}
	}
	public {
void AsyncMarker(GL gl_, ParameterTypeTuple!(fp_glAsyncMarkerSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glAsyncMarkerSGIX)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "AsyncMarker", funcPtr, params__);
		}
void DeleteAsyncMarkers(GL gl_, ParameterTypeTuple!(fp_glDeleteAsyncMarkersSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDeleteAsyncMarkersSGIX)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "DeleteAsyncMarkers", funcPtr, params__);
		}
GLint FinishAsync(GL gl_, ParameterTypeTuple!(fp_glFinishAsyncSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFinishAsyncSGIX)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "FinishAsync", funcPtr, params__);
		}
GLuint GenAsyncMarkers(GL gl_, ParameterTypeTuple!(fp_glGenAsyncMarkersSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGenAsyncMarkersSGIX)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "GenAsyncMarkers", funcPtr, params__);
		}
GLboolean IsAsyncMarker(GL gl_, ParameterTypeTuple!(fp_glIsAsyncMarkerSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glIsAsyncMarkerSGIX)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "IsAsyncMarker", funcPtr, params__);
		}
GLint PollAsync(GL gl_, ParameterTypeTuple!(fp_glPollAsyncSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glPollAsyncSGIX)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "PollAsync", funcPtr, params__);
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
		void*[] funcAddr = new void*[6];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_SGIX_async")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glAsyncMarkerSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glDeleteAsyncMarkersSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glFinishAsyncSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glGenAsyncMarkersSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glIsAsyncMarkerSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glPollAsyncSGIX"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
