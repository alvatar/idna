module dgl.ext.ATI_separate_stencil;
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



private ushort extensionId__ = 32;
alias extensionId__ ATI_separate_stencil;

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
			const GLenum GL_STENCIL_BACK_FUNC_ATI = 0x8800;
			const GLenum GL_STENCIL_BACK_FAIL_ATI = 0x8801;
			const GLenum GL_STENCIL_BACK_PASS_DEPTH_FAIL_ATI = 0x8802;
			const GLenum GL_STENCIL_BACK_PASS_DEPTH_PASS_ATI = 0x8803;
	}
	private {
		extern (System) {
			alias void function (GLenum face, GLenum sfail, GLenum dpfail, GLenum dppass)	fp_glStencilOpSeparateATI;
			alias void function (GLenum frontfunc, GLenum backfunc, GLint ref_, GLuint mask)	fp_glStencilFuncSeparateATI;
		}
	}
	public {
void StencilOpSeparate(GL gl_, ParameterTypeTuple!(fp_glStencilOpSeparateATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glStencilOpSeparateATI)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "StencilOpSeparate", funcPtr, params__);
		}
void StencilFuncSeparate(GL gl_, ParameterTypeTuple!(fp_glStencilFuncSeparateATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glStencilFuncSeparateATI)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "StencilFuncSeparate", funcPtr, params__);
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
			if (!extStr.containsPattern("GL_ATI_separate_stencil")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glStencilOpSeparateATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glStencilFuncSeparateATI"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
