module dgl.ext.NV_vertex_array_range;
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



private ushort extensionId__ = 7;
alias extensionId__ NV_vertex_array_range;

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
			const GLenum GL_VERTEX_ARRAY_RANGE_NV = 0x851D;
			const GLenum GL_VERTEX_ARRAY_RANGE_LENGTH_NV = 0x851E;
			const GLenum GL_VERTEX_ARRAY_RANGE_VALID_NV = 0x851F;
			const GLenum GL_MAX_VERTEX_ARRAY_RANGE_ELEMENT_NV = 0x8520;
			const GLenum GL_VERTEX_ARRAY_RANGE_POINTER_NV = 0x8521;
	}
	private {
		extern (System) {
			alias void function ()	fp_glFlushVertexArrayRangeNV;
			alias void function (GLsizei length, void* pointer)	fp_glVertexArrayRangeNV;
		}
	}
	public {
void FlushVertexArrayRange(GL gl_, ParameterTypeTuple!(fp_glFlushVertexArrayRangeNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFlushVertexArrayRangeNV)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "FlushVertexArrayRange", funcPtr, params__);
		}
void VertexArrayRange(GL gl_, ParameterTypeTuple!(fp_glVertexArrayRangeNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexArrayRangeNV)(gl.extFuncs[extensionId__][1]);
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
		void*[] funcAddr = new void*[2];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_NV_vertex_array_range")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glFlushVertexArrayRangeNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glVertexArrayRangeNV"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
