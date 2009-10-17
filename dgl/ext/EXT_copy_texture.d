module dgl.ext.EXT_copy_texture;
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



private ushort extensionId__ = 66;
alias extensionId__ EXT_copy_texture;
import dgl.ext.EXT_texture;

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
			alias void function (GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLint border)	fp_glCopyTexImage1DEXT;
			alias void function (GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height, GLint border)	fp_glCopyTexImage2DEXT;
			alias void function (GLenum target, GLint level, GLint xoffset, GLint x, GLint y, GLsizei width)	fp_glCopyTexSubImage1DEXT;
			alias void function (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height)	fp_glCopyTexSubImage2DEXT;
			alias void function (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height)	fp_glCopyTexSubImage3DEXT;
		}
	}
	public {
void CopyTexImage1D(GL gl_, ParameterTypeTuple!(fp_glCopyTexImage1DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCopyTexImage1DEXT)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "CopyTexImage1D", funcPtr, params__);
		}
void CopyTexImage2D(GL gl_, ParameterTypeTuple!(fp_glCopyTexImage2DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCopyTexImage2DEXT)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "CopyTexImage2D", funcPtr, params__);
		}
void CopyTexSubImage1D(GL gl_, ParameterTypeTuple!(fp_glCopyTexSubImage1DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCopyTexSubImage1DEXT)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "CopyTexSubImage1D", funcPtr, params__);
		}
void CopyTexSubImage2D(GL gl_, ParameterTypeTuple!(fp_glCopyTexSubImage2DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCopyTexSubImage2DEXT)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "CopyTexSubImage2D", funcPtr, params__);
		}
void CopyTexSubImage3D(GL gl_, ParameterTypeTuple!(fp_glCopyTexSubImage3DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCopyTexSubImage3DEXT)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "CopyTexSubImage3D", funcPtr, params__);
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
		void*[] funcAddr = new void*[5];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_EXT_copy_texture")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glCopyTexImage1DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glCopyTexImage2DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glCopyTexSubImage1DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glCopyTexSubImage2DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glCopyTexSubImage3DEXT"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
