module dgl.ext.ATI_element_array;
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



private ushort extensionId__ = 396;
alias extensionId__ ATI_element_array;

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
			const GLenum GL_ELEMENT_ARRAY_ATI = 0x8768;
			const GLenum GL_ELEMENT_ARRAY_TYPE_ATI = 0x8769;
			const GLenum GL_ELEMENT_ARRAY_POINTER_ATI = 0x876A;
	}
	private {
		extern (System) {
			alias void function (GLenum mode, GLsizei count)	fp_glDrawElementArrayATI;
			alias void function (GLenum mode, GLuint start, GLuint end, GLsizei count)	fp_glDrawRangeElementArrayATI;
			alias void function (GLenum type,  void* pointer)	fp_glElementPointerATI;
		}
	}
	public {
void DrawElementArray(GL gl_, ParameterTypeTuple!(fp_glDrawElementArrayATI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDrawElementArrayATI)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "DrawElementArray", funcPtr, params__);
		}
void DrawRangeElementArray(GL gl_, ParameterTypeTuple!(fp_glDrawRangeElementArrayATI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDrawRangeElementArrayATI)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "DrawRangeElementArray", funcPtr, params__);
		}
void ElementPointer(GL gl_, ParameterTypeTuple!(fp_glElementPointerATI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glElementPointerATI)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "ElementPointer", funcPtr, params__);
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
			if (!extStr.containsPattern("GL_ATI_element_array")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glDrawElementArrayATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glDrawRangeElementArrayATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glElementPointerATI"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
