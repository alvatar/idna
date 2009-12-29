module dgl.ext.EXT_texture_integer;
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



private ushort extensionId__ = 21;
alias extensionId__ EXT_texture_integer;

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
			const GLenum GL_RGBA32UI_EXT = 0x8D70;
			const GLenum GL_RGB32UI_EXT = 0x8D71;
			const GLenum GL_ALPHA32UI_EXT = 0x8D72;
			const GLenum GL_INTENSITY32UI_EXT = 0x8D73;
			const GLenum GL_LUMINANCE32UI_EXT = 0x8D74;
			const GLenum GL_LUMINANCE_ALPHA32UI_EXT = 0x8D75;
			const GLenum GL_RGBA16UI_EXT = 0x8D76;
			const GLenum GL_RGB16UI_EXT = 0x8D77;
			const GLenum GL_ALPHA16UI_EXT = 0x8D78;
			const GLenum GL_INTENSITY16UI_EXT = 0x8D79;
			const GLenum GL_LUMINANCE16UI_EXT = 0x8D7A;
			const GLenum GL_LUMINANCE_ALPHA16UI_EXT = 0x8D7B;
			const GLenum GL_RGBA8UI_EXT = 0x8D7C;
			const GLenum GL_RGB8UI_EXT = 0x8D7D;
			const GLenum GL_ALPHA8UI_EXT = 0x8D7E;
			const GLenum GL_INTENSITY8UI_EXT = 0x8D7F;
			const GLenum GL_LUMINANCE8UI_EXT = 0x8D80;
			const GLenum GL_LUMINANCE_ALPHA8UI_EXT = 0x8D81;
			const GLenum GL_RGBA32I_EXT = 0x8D82;
			const GLenum GL_RGB32I_EXT = 0x8D83;
			const GLenum GL_ALPHA32I_EXT = 0x8D84;
			const GLenum GL_INTENSITY32I_EXT = 0x8D85;
			const GLenum GL_LUMINANCE32I_EXT = 0x8D86;
			const GLenum GL_LUMINANCE_ALPHA32I_EXT = 0x8D87;
			const GLenum GL_RGBA16I_EXT = 0x8D88;
			const GLenum GL_RGB16I_EXT = 0x8D89;
			const GLenum GL_ALPHA16I_EXT = 0x8D8A;
			const GLenum GL_INTENSITY16I_EXT = 0x8D8B;
			const GLenum GL_LUMINANCE16I_EXT = 0x8D8C;
			const GLenum GL_LUMINANCE_ALPHA16I_EXT = 0x8D8D;
			const GLenum GL_RGBA8I_EXT = 0x8D8E;
			const GLenum GL_RGB8I_EXT = 0x8D8F;
			const GLenum GL_ALPHA8I_EXT = 0x8D90;
			const GLenum GL_INTENSITY8I_EXT = 0x8D91;
			const GLenum GL_LUMINANCE8I_EXT = 0x8D92;
			const GLenum GL_LUMINANCE_ALPHA8I_EXT = 0x8D93;
			const GLenum GL_RED_INTEGER_EXT = 0x8D94;
			const GLenum GL_GREEN_INTEGER_EXT = 0x8D95;
			const GLenum GL_BLUE_INTEGER_EXT = 0x8D96;
			const GLenum GL_ALPHA_INTEGER_EXT = 0x8D97;
			const GLenum GL_RGB_INTEGER_EXT = 0x8D98;
			const GLenum GL_RGBA_INTEGER_EXT = 0x8D99;
			const GLenum GL_BGR_INTEGER_EXT = 0x8D9A;
			const GLenum GL_BGRA_INTEGER_EXT = 0x8D9B;
			const GLenum GL_LUMINANCE_INTEGER_EXT = 0x8D9C;
			const GLenum GL_LUMINANCE_ALPHA_INTEGER_EXT = 0x8D9D;
			const GLenum GL_RGBA_INTEGER_MODE_EXT = 0x8D9E;
	}
	private {
		extern (System) {
			alias void function (GLenum target, GLenum pname,  GLint *params)	fp_glTexParameterIivEXT;
			alias void function (GLenum target, GLenum pname,  GLuint *params)	fp_glTexParameterIuivEXT;
			alias void function (GLenum target, GLenum pname, GLint *params)	fp_glGetTexParameterIivEXT;
			alias void function (GLenum target, GLenum pname, GLuint *params)	fp_glGetTexParameterIuivEXT;
			alias void function (GLint red, GLint green, GLint blue, GLint alpha)	fp_glClearColorIiEXT;
			alias void function (GLuint red, GLuint green, GLuint blue, GLuint alpha)	fp_glClearColorIuiEXT;
		}
	}
	public {
void TexParameterIiv(GL gl_, ParameterTypeTuple!(fp_glTexParameterIivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTexParameterIivEXT)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "TexParameterIiv", funcPtr, params__);
		}
void TexParameterIuiv(GL gl_, ParameterTypeTuple!(fp_glTexParameterIuivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTexParameterIuivEXT)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "TexParameterIuiv", funcPtr, params__);
		}
void GetTexParameterIiv(GL gl_, ParameterTypeTuple!(fp_glGetTexParameterIivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetTexParameterIivEXT)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "GetTexParameterIiv", funcPtr, params__);
		}
void GetTexParameterIuiv(GL gl_, ParameterTypeTuple!(fp_glGetTexParameterIuivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetTexParameterIuivEXT)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "GetTexParameterIuiv", funcPtr, params__);
		}
void ClearColorIi(GL gl_, ParameterTypeTuple!(fp_glClearColorIiEXT) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glClearColorIiEXT)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "ClearColorIi", funcPtr, params__);
		}
void ClearColorIui(GL gl_, ParameterTypeTuple!(fp_glClearColorIuiEXT) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glClearColorIuiEXT)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "ClearColorIui", funcPtr, params__);
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
		void*[] funcAddr = new void*[6];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_EXT_texture_integer")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glTexParameterIivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glTexParameterIuivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glGetTexParameterIivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glGetTexParameterIuivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glClearColorIiEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glClearColorIuiEXT"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
