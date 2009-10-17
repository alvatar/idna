module dgl.ext.ARB_draw_buffers;
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



private ushort extensionId__ = 121;
alias extensionId__ ARB_draw_buffers;

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
			const GLenum GL_MAX_DRAW_BUFFERS_ARB = 0x8824;
			const GLenum GL_DRAW_BUFFER0_ARB = 0x8825;
			const GLenum GL_DRAW_BUFFER1_ARB = 0x8826;
			const GLenum GL_DRAW_BUFFER2_ARB = 0x8827;
			const GLenum GL_DRAW_BUFFER3_ARB = 0x8828;
			const GLenum GL_DRAW_BUFFER4_ARB = 0x8829;
			const GLenum GL_DRAW_BUFFER5_ARB = 0x882A;
			const GLenum GL_DRAW_BUFFER6_ARB = 0x882B;
			const GLenum GL_DRAW_BUFFER7_ARB = 0x882C;
			const GLenum GL_DRAW_BUFFER8_ARB = 0x882D;
			const GLenum GL_DRAW_BUFFER9_ARB = 0x882E;
			const GLenum GL_DRAW_BUFFER10_ARB = 0x882F;
			const GLenum GL_DRAW_BUFFER11_ARB = 0x8830;
			const GLenum GL_DRAW_BUFFER12_ARB = 0x8831;
			const GLenum GL_DRAW_BUFFER13_ARB = 0x8832;
			const GLenum GL_DRAW_BUFFER14_ARB = 0x8833;
			const GLenum GL_DRAW_BUFFER15_ARB = 0x8834;
	}
	private {
		extern (System) {
			alias void function (GLsizei n,  GLenum* bufs)	fp_glDrawBuffersARB;
		}
	}
	public {
void DrawBuffers(GL gl_, ParameterTypeTuple!(fp_glDrawBuffersARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDrawBuffersARB)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "DrawBuffers", funcPtr, params__);
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
			if (!extStr.containsPattern("GL_ARB_draw_buffers")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glDrawBuffersARB"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
