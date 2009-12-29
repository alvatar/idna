module dgl.ext.EXT_timer_query;
import dgl.opengl;
import dgl.glext;

version( D_Version2 ) {
	import std.string : containsPattern = count;
	import std.conv;
} else {
	import tango.text.Util : containsPattern;
	import tango.stdc.stringz : fromStringz;
	alias char[] string;
}



private ushort extensionId__ = 7;
alias extensionId__ EXT_timer_query;

	version (DglNoExtSupportAsserts) {
	} else {
		version = DglExtSupportAsserts;
	}
	
	static this() {
		if (__extSupportCheckingFuncs.length <= extensionId__) {
			__extSupportCheckingFuncs.length = extensionId__ + 1;
		}
		__extSupportCheckingFuncs[extensionId__] = &__supported;
	}

version (all) {
	public {
			const GLenum GL_TIME_ELAPSED_EXT = 0x88BF;
	}
	private {
		extern (System) {
			alias void function (GLuint id, GLenum pname, GLint64EXT *params)	fp_glGetQueryObjecti64vEXT;
			alias void function (GLuint id, GLenum pname, GLuint64EXT *params)	fp_glGetQueryObjectui64vEXT;
		}
	}
	public {
void GetQueryObjecti64v(GL gl_, ParameterTypeTuple!(fp_glGetQueryObjecti64vEXT) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetQueryObjecti64vEXT)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "GetQueryObjecti64v", funcPtr, params__);
		}
void GetQueryObjectui64v(GL gl_, ParameterTypeTuple!(fp_glGetQueryObjectui64vEXT) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetQueryObjectui64vEXT)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "GetQueryObjectui64v", funcPtr, params__);
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
				
				version (DglExtSupportAsserts) {
					gl.extEnabled.length = extensionId__ + 1;
				}
			}
			gl.extFuncs[extensionId__] = loadFunctions__(gl_);
			
			return gl.extFuncs[extensionId__][0] !is null;
		}
	}
	private void*[] loadFunctions__(GL gl) {
		void*[] funcAddr = new void*[2];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_EXT_timer_query")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glGetQueryObjecti64vEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glGetQueryObjectui64vEXT"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
