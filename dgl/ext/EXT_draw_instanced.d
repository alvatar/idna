module dgl.ext.EXT_draw_instanced;
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



private ushort extensionId__ = 60;
alias extensionId__ EXT_draw_instanced;

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
	}
	private {
		extern (System) {
			alias void function (GLenum mode, GLint start, GLsizei count, GLsizei primcount)	fp_glDrawArraysInstancedEXT;
			alias void function (GLenum mode, GLsizei count, GLenum type,  GLvoid *indices, GLsizei primcount)	fp_glDrawElementsInstancedEXT;
		}
	}
	public {
void DrawArraysInstanced(GL gl_, ParameterTypeTuple!(fp_glDrawArraysInstancedEXT) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDrawArraysInstancedEXT)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "DrawArraysInstanced", funcPtr, params__);
		}
void DrawElementsInstanced(GL gl_, ParameterTypeTuple!(fp_glDrawElementsInstancedEXT) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDrawElementsInstancedEXT)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "DrawElementsInstanced", funcPtr, params__);
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
			if (!extStr.containsPattern("GL_EXT_draw_instanced")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glDrawArraysInstancedEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glDrawElementsInstancedEXT"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
