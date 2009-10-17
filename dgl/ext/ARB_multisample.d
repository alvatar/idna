module dgl.ext.ARB_multisample;
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



private ushort extensionId__ = 125;
alias extensionId__ ARB_multisample;
import dgl.ext.WGL_EXT_extensions_string;
import dgl.ext.WGL_EXT_pixel_format;

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
			const GLenum GL_MULTISAMPLE_ARB = 0x809D;
			const GLenum GL_SAMPLE_ALPHA_TO_COVERAGE_ARB = 0x809E;
			const GLenum GL_SAMPLE_ALPHA_TO_ONE_ARB = 0x809F;
			const GLenum GL_SAMPLE_COVERAGE_ARB = 0x80A0;
			const GLenum GL_SAMPLE_BUFFERS_ARB = 0x80A8;
			const GLenum GL_SAMPLES_ARB = 0x80A9;
			const GLenum GL_SAMPLE_COVERAGE_VALUE_ARB = 0x80AA;
			const GLenum GL_SAMPLE_COVERAGE_INVERT_ARB = 0x80AB;
			const GLenum GL_MULTISAMPLE_BIT_ARB = 0x20000000;
	}
	private {
		extern (System) {
			alias void function (GLclampf value, GLboolean invert)	fp_glSampleCoverageARB;
		}
	}
	public {
void SampleCoverage(GL gl_, ParameterTypeTuple!(fp_glSampleCoverageARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSampleCoverageARB)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "SampleCoverage", funcPtr, params__);
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
		void*[] funcAddr = new void*[1];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_ARB_multisample")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glSampleCoverageARB"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
