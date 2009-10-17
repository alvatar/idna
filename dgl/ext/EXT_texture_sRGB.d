module dgl.ext.EXT_texture_sRGB;
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



private ushort extensionId__ = 269;
alias extensionId__ EXT_texture_sRGB;

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
			const GLenum GL_SRGB_EXT = 0x8C40;
			const GLenum GL_SRGB8_EXT = 0x8C41;
			const GLenum GL_SRGB_ALPHA_EXT = 0x8C42;
			const GLenum GL_SRGB8_ALPHA8_EXT = 0x8C43;
			const GLenum GL_SLUMINANCE_ALPHA_EXT = 0x8C44;
			const GLenum GL_SLUMINANCE8_ALPHA8_EXT = 0x8C45;
			const GLenum GL_SLUMINANCE_EXT = 0x8C46;
			const GLenum GL_SLUMINANCE8_EXT = 0x8C47;
			const GLenum GL_COMPRESSED_SRGB_EXT = 0x8C48;
			const GLenum GL_COMPRESSED_SRGB_ALPHA_EXT = 0x8C49;
			const GLenum GL_COMPRESSED_SLUMINANCE_EXT = 0x8C4A;
			const GLenum GL_COMPRESSED_SLUMINANCE_ALPHA_EXT = 0x8C4B;
			const GLenum GL_COMPRESSED_SRGB_S3TC_DXT1_EXT = 0x8C4C;
			const GLenum GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT1_EXT = 0x8C4D;
			const GLenum GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT3_EXT = 0x8C4E;
			const GLenum GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT5_EXT = 0x8C4F;
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
			if (!extStr.containsPattern("GL_EXT_texture_sRGB")) { funcAddr[0] = null; return funcAddr; }
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
