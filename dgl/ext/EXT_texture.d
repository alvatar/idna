module dgl.ext.EXT_texture;
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



private ushort extensionId__ = 82;
alias extensionId__ EXT_texture;

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
			const GLenum GL_ALPHA4_EXT = 0x803B;
			const GLenum GL_ALPHA8_EXT = 0x803C;
			const GLenum GL_ALPHA12_EXT = 0x803D;
			const GLenum GL_ALPHA16_EXT = 0x803E;
			const GLenum GL_LUMINANCE4_EXT = 0x803F;
			const GLenum GL_LUMINANCE8_EXT = 0x8040;
			const GLenum GL_LUMINANCE12_EXT = 0x8041;
			const GLenum GL_LUMINANCE16_EXT = 0x8042;
			const GLenum GL_LUMINANCE4_ALPHA4_EXT = 0x8043;
			const GLenum GL_LUMINANCE6_ALPHA2_EXT = 0x8044;
			const GLenum GL_LUMINANCE8_ALPHA8_EXT = 0x8045;
			const GLenum GL_LUMINANCE12_ALPHA4_EXT = 0x8046;
			const GLenum GL_LUMINANCE12_ALPHA12_EXT = 0x8047;
			const GLenum GL_LUMINANCE16_ALPHA16_EXT = 0x8048;
			const GLenum GL_INTENSITY_EXT = 0x8049;
			const GLenum GL_INTENSITY4_EXT = 0x804A;
			const GLenum GL_INTENSITY8_EXT = 0x804B;
			const GLenum GL_INTENSITY12_EXT = 0x804C;
			const GLenum GL_INTENSITY16_EXT = 0x804D;
			const GLenum GL_RGB2_EXT = 0x804E;
			const GLenum GL_RGB4_EXT = 0x804F;
			const GLenum GL_RGB5_EXT = 0x8050;
			const GLenum GL_RGB8_EXT = 0x8051;
			const GLenum GL_RGB10_EXT = 0x8052;
			const GLenum GL_RGB12_EXT = 0x8053;
			const GLenum GL_RGB16_EXT = 0x8054;
			const GLenum GL_RGBA2_EXT = 0x8055;
			const GLenum GL_RGBA4_EXT = 0x8056;
			const GLenum GL_RGB5_A1_EXT = 0x8057;
			const GLenum GL_RGBA8_EXT = 0x8058;
			const GLenum GL_RGB10_A2_EXT = 0x8059;
			const GLenum GL_RGBA12_EXT = 0x805A;
			const GLenum GL_RGBA16_EXT = 0x805B;
			const GLenum GL_TEXTURE_RED_SIZE_EXT = 0x805C;
			const GLenum GL_TEXTURE_GREEN_SIZE_EXT = 0x805D;
			const GLenum GL_TEXTURE_BLUE_SIZE_EXT = 0x805E;
			const GLenum GL_TEXTURE_ALPHA_SIZE_EXT = 0x805F;
			const GLenum GL_TEXTURE_LUMINANCE_SIZE_EXT = 0x8060;
			const GLenum GL_TEXTURE_INTENSITY_SIZE_EXT = 0x8061;
			const GLenum GL_REPLACE_EXT = 0x8062;
			const GLenum GL_PROXY_TEXTURE_1D_EXT = 0x8063;
			const GLenum GL_PROXY_TEXTURE_2D_EXT = 0x8064;
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
				
				version (DogExtSupportAsserts) {
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
			if (!extStr.containsPattern("GL_EXT_texture")) { funcAddr[0] = null; return funcAddr; }
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
