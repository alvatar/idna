module dgl.ext.INTEL_parallel_arrays;
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



private ushort extensionId__ = 26;
alias extensionId__ INTEL_parallel_arrays;

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
			const GLenum GL_PARALLEL_ARRAYS_INTEL = 0x83F4;
			const GLenum GL_VERTEX_ARRAY_PARALLEL_POINTERS_INTEL = 0x83F5;
			const GLenum GL_NORMAL_ARRAY_PARALLEL_POINTERS_INTEL = 0x83F6;
			const GLenum GL_COLOR_ARRAY_PARALLEL_POINTERS_INTEL = 0x83F7;
			const GLenum GL_TEXTURE_COORD_ARRAY_PARALLEL_POINTERS_INTEL = 0x83F8;
	}
	private {
		extern (System) {
			alias void function (GLint size, GLenum type,  void** pointer)	fp_glColorPointervINTEL;
			alias void function (GLenum type,  void** pointer)	fp_glNormalPointervINTEL;
			alias void function (GLint size, GLenum type,  void** pointer)	fp_glTexCoordPointervINTEL;
			alias void function (GLint size, GLenum type,  void** pointer)	fp_glVertexPointervINTEL;
		}
	}
	public {
void ColorPointerv(GL gl_, ParameterTypeTuple!(fp_glColorPointervINTEL) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glColorPointervINTEL)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "ColorPointerv", funcPtr, params__);
		}
void NormalPointerv(GL gl_, ParameterTypeTuple!(fp_glNormalPointervINTEL) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNormalPointervINTEL)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "NormalPointerv", funcPtr, params__);
		}
void TexCoordPointerv(GL gl_, ParameterTypeTuple!(fp_glTexCoordPointervINTEL) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTexCoordPointervINTEL)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "TexCoordPointerv", funcPtr, params__);
		}
void VertexPointerv(GL gl_, ParameterTypeTuple!(fp_glVertexPointervINTEL) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexPointervINTEL)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "VertexPointerv", funcPtr, params__);
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
			if (!extStr.containsPattern("GL_INTEL_parallel_arrays")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glColorPointervINTEL"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glNormalPointervINTEL"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glTexCoordPointervINTEL"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glVertexPointervINTEL"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
