module dgl.ext.EXT_paletted_texture;
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



private ushort extensionId__ = 164;
alias extensionId__ EXT_paletted_texture;

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
			const GLenum GL_TEXTURE_1D = 0x0DE0;
			const GLenum GL_TEXTURE_2D = 0x0DE1;
			const GLenum GL_PROXY_TEXTURE_1D = 0x8063;
			const GLenum GL_PROXY_TEXTURE_2D = 0x8064;
			const GLenum GL_TEXTURE_3D_EXT = 0x806F;
			const GLenum GL_PROXY_TEXTURE_3D_EXT = 0x8070;
			const GLenum GL_COLOR_TABLE_FORMAT_EXT = 0x80D8;
			const GLenum GL_COLOR_TABLE_WIDTH_EXT = 0x80D9;
			const GLenum GL_COLOR_TABLE_RED_SIZE_EXT = 0x80DA;
			const GLenum GL_COLOR_TABLE_GREEN_SIZE_EXT = 0x80DB;
			const GLenum GL_COLOR_TABLE_BLUE_SIZE_EXT = 0x80DC;
			const GLenum GL_COLOR_TABLE_ALPHA_SIZE_EXT = 0x80DD;
			const GLenum GL_COLOR_TABLE_LUMINANCE_SIZE_EXT = 0x80DE;
			const GLenum GL_COLOR_TABLE_INTENSITY_SIZE_EXT = 0x80DF;
			const GLenum GL_COLOR_INDEX1_EXT = 0x80E2;
			const GLenum GL_COLOR_INDEX2_EXT = 0x80E3;
			const GLenum GL_COLOR_INDEX4_EXT = 0x80E4;
			const GLenum GL_COLOR_INDEX8_EXT = 0x80E5;
			const GLenum GL_COLOR_INDEX12_EXT = 0x80E6;
			const GLenum GL_COLOR_INDEX16_EXT = 0x80E7;
			const GLenum GL_TEXTURE_INDEX_SIZE_EXT = 0x80ED;
			const GLenum GL_TEXTURE_CUBE_MAP_ARB = 0x8513;
			const GLenum GL_PROXY_TEXTURE_CUBE_MAP_ARB = 0x851B;
	}
	private {
		extern (System) {
			alias void function (GLenum target, GLenum internalFormat, GLsizei width, GLenum format, GLenum type,  void* data)	fp_glColorTableEXT;
			alias void function (GLenum target, GLenum format, GLenum type, void* data)	fp_glGetColorTableEXT;
			alias void function (GLenum target, GLenum pname, GLfloat* params)	fp_glGetColorTableParameterfvEXT;
			alias void function (GLenum target, GLenum pname, GLint* params)	fp_glGetColorTableParameterivEXT;
		}
	}
	public {
void ColorTable(GL gl_, ParameterTypeTuple!(fp_glColorTableEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glColorTableEXT)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "ColorTable", funcPtr, params__);
		}
void GetColorTable(GL gl_, ParameterTypeTuple!(fp_glGetColorTableEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetColorTableEXT)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "GetColorTable", funcPtr, params__);
		}
void GetColorTableParameterfv(GL gl_, ParameterTypeTuple!(fp_glGetColorTableParameterfvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetColorTableParameterfvEXT)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "GetColorTableParameterfv", funcPtr, params__);
		}
void GetColorTableParameteriv(GL gl_, ParameterTypeTuple!(fp_glGetColorTableParameterivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetColorTableParameterivEXT)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "GetColorTableParameteriv", funcPtr, params__);
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
			if (!extStr.containsPattern("GL_EXT_paletted_texture")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glColorTableEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glGetColorTableEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glGetColorTableParameterfvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glGetColorTableParameterivEXT"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
