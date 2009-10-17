module dgl.ext.APPLE_vertex_array_range;
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



private ushort extensionId__ = 326;
alias extensionId__ APPLE_vertex_array_range;

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
			const GLenum GL_VERTEX_ARRAY_RANGE_APPLE = 0x851D;
			const GLenum GL_VERTEX_ARRAY_RANGE_LENGTH_APPLE = 0x851E;
			const GLenum GL_VERTEX_ARRAY_STORAGE_HINT_APPLE = 0x851F;
			const GLenum GL_MAX_VERTEX_ARRAY_RANGE_ELEMENT_APPLE = 0x8520;
			const GLenum GL_VERTEX_ARRAY_RANGE_POINTER_APPLE = 0x8521;
			const GLenum GL_STORAGE_CACHED_APPLE = 0x85BE;
			const GLenum GL_STORAGE_SHARED_APPLE = 0x85BF;
	}
	private {
		extern (System) {
			alias void function (GLsizei length, void* pointer)	fp_glFlushVertexArrayRangeAPPLE;
			alias void function (GLenum pname, GLint param)	fp_glVertexArrayParameteriAPPLE;
			alias void function (GLsizei length, void* pointer)	fp_glVertexArrayRangeAPPLE;
		}
	}
	public {
void FlushVertexArrayRange(GL gl_, ParameterTypeTuple!(fp_glFlushVertexArrayRangeAPPLE) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFlushVertexArrayRangeAPPLE)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "FlushVertexArrayRange", funcPtr, params__);
		}
void VertexArrayParameteri(GL gl_, ParameterTypeTuple!(fp_glVertexArrayParameteriAPPLE) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexArrayParameteriAPPLE)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "VertexArrayParameteri", funcPtr, params__);
		}
void VertexArrayRange(GL gl_, ParameterTypeTuple!(fp_glVertexArrayRangeAPPLE) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexArrayRangeAPPLE)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "VertexArrayRange", funcPtr, params__);
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
		void*[] funcAddr = new void*[3];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_APPLE_vertex_array_range")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glFlushVertexArrayRangeAPPLE"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glVertexArrayParameteriAPPLE"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glVertexArrayRangeAPPLE"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
