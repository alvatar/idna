module dgl.ext.NV_pixel_data_range;
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



private ushort extensionId__ = 90;
alias extensionId__ NV_pixel_data_range;

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
			const GLenum GL_WRITE_PIXEL_DATA_RANGE_NV = 0x8878;
			const GLenum GL_READ_PIXEL_DATA_RANGE_NV = 0x8879;
			const GLenum GL_WRITE_PIXEL_DATA_RANGE_LENGTH_NV = 0x887A;
			const GLenum GL_READ_PIXEL_DATA_RANGE_LENGTH_NV = 0x887B;
			const GLenum GL_WRITE_PIXEL_DATA_RANGE_POINTER_NV = 0x887C;
			const GLenum GL_READ_PIXEL_DATA_RANGE_POINTER_NV = 0x887D;
	}
	private {
		extern (System) {
			alias void function (GLenum target)	fp_glFlushPixelDataRangeNV;
			alias void function (GLenum target, GLsizei length, void* pointer)	fp_glPixelDataRangeNV;
		}
	}
	public {
void FlushPixelDataRange(GL gl_, ParameterTypeTuple!(fp_glFlushPixelDataRangeNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFlushPixelDataRangeNV)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "FlushPixelDataRange", funcPtr, params__);
		}
void PixelDataRange(GL gl_, ParameterTypeTuple!(fp_glPixelDataRangeNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glPixelDataRangeNV)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "PixelDataRange", funcPtr, params__);
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
			if (!extStr.containsPattern("GL_NV_pixel_data_range")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glFlushPixelDataRangeNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glPixelDataRangeNV"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
