module dgl.ext.ARB_map_buffer_range;
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



private ushort extensionId__ = 92;
alias extensionId__ ARB_map_buffer_range;

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
			const GLenum GL_MAP_READ_BIT = 0x0001;
			const GLenum GL_MAP_WRITE_BIT = 0x0002;
			const GLenum GL_MAP_INVALIDATE_RANGE_BIT = 0x0004;
			const GLenum GL_MAP_INVALIDATE_BUFFER_BIT = 0x0008;
			const GLenum GL_MAP_FLUSH_EXPLICIT_BIT = 0x0010;
			const GLenum GL_MAP_UNSYNCHRONIZED_BIT = 0x0020;
	}
	private {
		extern (System) {
			alias void function (GLenum target, GLintptr offset, GLsizeiptr length)	fp_glFlushMappedBufferRange;
			alias GLvoid * function (GLenum target, GLintptr offset, GLsizeiptr length, GLbitfield access)	fp_glMapBufferRange;
		}
	}
	public {
void FlushMappedBufferRange(GL gl_, ParameterTypeTuple!(fp_glFlushMappedBufferRange) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFlushMappedBufferRange)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "FlushMappedBufferRange", funcPtr, params__);
		}
GLvoid * MapBufferRange(GL gl_, ParameterTypeTuple!(fp_glMapBufferRange) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMapBufferRange)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "MapBufferRange", funcPtr, params__);
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
			if (!extStr.containsPattern("GL_ARB_map_buffer_range")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glFlushMappedBufferRange"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glMapBufferRange"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
