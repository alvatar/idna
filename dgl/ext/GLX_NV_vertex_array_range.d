module dgl.ext.GLX_NV_vertex_array_range;
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



private ushort extensionId__ = 74;
alias extensionId__ GLX_NV_vertex_array_range;

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

version (Posix) {
	public {
	}
	private {
		extern (System) {
			alias void * function (GLsizei size, GLfloat readFrequency, GLfloat writeFrequency, GLfloat priority)	fp_glXAllocateMemoryNV;
			alias void function (void *pointer)	fp_glXFreeMemoryNV;
		}
	}
	public {
void * XAllocateMemory(GL gl_, ParameterTypeTuple!(fp_glXAllocateMemoryNV) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXAllocateMemoryNV)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "XAllocateMemory", funcPtr, params__);
		}
void XFreeMemory(GL gl_, ParameterTypeTuple!(fp_glXFreeMemoryNV) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXFreeMemoryNV)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "XFreeMemory", funcPtr, params__);
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
			if (!extStr.containsPattern("GLX_NV_vertex_array_range")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glXAllocateMemoryNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glXFreeMemoryNV"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
