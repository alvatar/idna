module dgl.ext.APPLE_texture_range;
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



private ushort extensionId__ = 71;
alias extensionId__ APPLE_texture_range;

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
			const GLenum GL_TEXTURE_STORAGE_HINT_APPLE = 0x85BC;
			const GLenum GL_STORAGE_PRIVATE_APPLE = 0x85BD;
			const GLenum GL_STORAGE_CACHED_APPLE = 0x85BE;
			const GLenum GL_STORAGE_SHARED_APPLE = 0x85BF;
			const GLenum GL_TEXTURE_RANGE_LENGTH_APPLE = 0x85B7;
			const GLenum GL_TEXTURE_RANGE_POINTER_APPLE = 0x85B8;
	}
	private {
		extern (System) {
			alias void function (GLenum target, GLsizei length, GLvoid *pointer)	fp_glTextureRangeAPPLE;
			alias void function (GLenum target, GLenum pname, GLvoid **params)	fp_glGetTexParameterPointervAPPLE;
		}
	}
	public {
void TextureRange(GL gl_, ParameterTypeTuple!(fp_glTextureRangeAPPLE) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTextureRangeAPPLE)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "TextureRange", funcPtr, params__);
		}
void GetTexParameterPointerv(GL gl_, ParameterTypeTuple!(fp_glGetTexParameterPointervAPPLE) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetTexParameterPointervAPPLE)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "GetTexParameterPointerv", funcPtr, params__);
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
			if (!extStr.containsPattern("GL_APPLE_texture_range")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glTextureRangeAPPLE"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glGetTexParameterPointervAPPLE"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
