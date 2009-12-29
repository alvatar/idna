module dgl.ext.EXT_texture_cube_map;
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



private ushort extensionId__ = 5;
alias extensionId__ EXT_texture_cube_map;

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
			const GLenum GL_NORMAL_MAP_EXT = 0x8511;
			const GLenum GL_REFLECTION_MAP_EXT = 0x8512;
			const GLenum GL_TEXTURE_CUBE_MAP_EXT = 0x8513;
			const GLenum GL_TEXTURE_BINDING_CUBE_MAP_EXT = 0x8514;
			const GLenum GL_TEXTURE_CUBE_MAP_POSITIVE_X_EXT = 0x8515;
			const GLenum GL_TEXTURE_CUBE_MAP_NEGATIVE_X_EXT = 0x8516;
			const GLenum GL_TEXTURE_CUBE_MAP_POSITIVE_Y_EXT = 0x8517;
			const GLenum GL_TEXTURE_CUBE_MAP_NEGATIVE_Y_EXT = 0x8518;
			const GLenum GL_TEXTURE_CUBE_MAP_POSITIVE_Z_EXT = 0x8519;
			const GLenum GL_TEXTURE_CUBE_MAP_NEGATIVE_Z_EXT = 0x851A;
			const GLenum GL_PROXY_TEXTURE_CUBE_MAP_EXT = 0x851B;
			const GLenum GL_MAX_CUBE_MAP_TEXTURE_SIZE_EXT = 0x851C;
	}
	private {
		extern (System) {
		}
	}
	public {
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
		void*[] funcAddr = new void*[1];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_EXT_texture_cube_map")) { funcAddr[0] = null; return funcAddr; }
		}
		funcAddr[0] = cast(void*)&gl;
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
