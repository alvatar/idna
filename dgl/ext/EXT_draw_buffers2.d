module dgl.ext.EXT_draw_buffers2;
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



private ushort extensionId__ = 131;
alias extensionId__ EXT_draw_buffers2;

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
	}
	private {
		extern (System) {
			alias void function (GLuint buf, GLboolean r, GLboolean g, GLboolean b, GLboolean a)	fp_glColorMaskIndexedEXT;
			alias void function (GLenum target, GLuint index)	fp_glDisableIndexedEXT;
			alias void function (GLenum target, GLuint index)	fp_glEnableIndexedEXT;
			alias void function (GLenum value, GLuint index, GLboolean* data)	fp_glGetBooleanIndexedvEXT;
			alias void function (GLenum value, GLuint index, GLint* data)	fp_glGetIntegerIndexedvEXT;
			alias GLboolean function (GLenum target, GLuint index)	fp_glIsEnabledIndexedEXT;
		}
	}
	public {
void ColorMaskIndexed(GL gl_, ParameterTypeTuple!(fp_glColorMaskIndexedEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glColorMaskIndexedEXT)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "ColorMaskIndexed", funcPtr, params__);
		}
void DisableIndexed(GL gl_, ParameterTypeTuple!(fp_glDisableIndexedEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDisableIndexedEXT)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "DisableIndexed", funcPtr, params__);
		}
void EnableIndexed(GL gl_, ParameterTypeTuple!(fp_glEnableIndexedEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glEnableIndexedEXT)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "EnableIndexed", funcPtr, params__);
		}
void GetBooleanIndexedv(GL gl_, ParameterTypeTuple!(fp_glGetBooleanIndexedvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetBooleanIndexedvEXT)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "GetBooleanIndexedv", funcPtr, params__);
		}
void GetIntegerIndexedv(GL gl_, ParameterTypeTuple!(fp_glGetIntegerIndexedvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetIntegerIndexedvEXT)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "GetIntegerIndexedv", funcPtr, params__);
		}
GLboolean IsEnabledIndexed(GL gl_, ParameterTypeTuple!(fp_glIsEnabledIndexedEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glIsEnabledIndexedEXT)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "IsEnabledIndexed", funcPtr, params__);
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
		void*[] funcAddr = new void*[6];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_EXT_draw_buffers2")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glColorMaskIndexedEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glDisableIndexedEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glEnableIndexedEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glGetBooleanIndexedvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glGetIntegerIndexedvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glIsEnabledIndexedEXT"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
