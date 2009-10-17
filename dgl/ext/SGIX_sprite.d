module dgl.ext.SGIX_sprite;
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



private ushort extensionId__ = 166;
alias extensionId__ SGIX_sprite;

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
			alias void function (GLenum pname, GLfloat param)	fp_glSpriteParameterfSGIX;
			alias void function (GLenum pname, GLfloat* params)	fp_glSpriteParameterfvSGIX;
			alias void function (GLenum pname, GLint param)	fp_glSpriteParameteriSGIX;
			alias void function (GLenum pname, GLint* params)	fp_glSpriteParameterivSGIX;
		}
	}
	public {
void SpriteParameterf(GL gl_, ParameterTypeTuple!(fp_glSpriteParameterfSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSpriteParameterfSGIX)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "SpriteParameterf", funcPtr, params__);
		}
void SpriteParameterfv(GL gl_, ParameterTypeTuple!(fp_glSpriteParameterfvSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSpriteParameterfvSGIX)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "SpriteParameterfv", funcPtr, params__);
		}
void SpriteParameteri(GL gl_, ParameterTypeTuple!(fp_glSpriteParameteriSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSpriteParameteriSGIX)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "SpriteParameteri", funcPtr, params__);
		}
void SpriteParameteriv(GL gl_, ParameterTypeTuple!(fp_glSpriteParameterivSGIX) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSpriteParameterivSGIX)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "SpriteParameteriv", funcPtr, params__);
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
			if (!extStr.containsPattern("GL_SGIX_sprite")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glSpriteParameterfSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glSpriteParameterfvSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glSpriteParameteriSGIX"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glSpriteParameterivSGIX"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
