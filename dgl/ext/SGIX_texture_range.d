module dgl.ext.SGIX_texture_range;
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



private ushort extensionId__ = 329;
alias extensionId__ SGIX_texture_range;

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
			const GLenum GL_RGB_SIGNED_SGIX = 0x85E0;
			const GLenum GL_RGBA_SIGNED_SGIX = 0x85E1;
			const GLenum GL_ALPHA_SIGNED_SGIX = 0x85E2;
			const GLenum GL_LUMINANCE_SIGNED_SGIX = 0x85E3;
			const GLenum GL_INTENSITY_SIGNED_SGIX = 0x85E4;
			const GLenum GL_LUMINANCE_ALPHA_SIGNED_SGIX = 0x85E5;
			const GLenum GL_RGB16_SIGNED_SGIX = 0x85E6;
			const GLenum GL_RGBA16_SIGNED_SGIX = 0x85E7;
			const GLenum GL_ALPHA16_SIGNED_SGIX = 0x85E8;
			const GLenum GL_LUMINANCE16_SIGNED_SGIX = 0x85E9;
			const GLenum GL_INTENSITY16_SIGNED_SGIX = 0x85EA;
			const GLenum GL_LUMINANCE16_ALPHA16_SIGNED_SGIX = 0x85EB;
			const GLenum GL_RGB_EXTENDED_RANGE_SGIX = 0x85EC;
			const GLenum GL_RGBA_EXTENDED_RANGE_SGIX = 0x85ED;
			const GLenum GL_ALPHA_EXTENDED_RANGE_SGIX = 0x85EE;
			const GLenum GL_LUMINANCE_EXTENDED_RANGE_SGIX = 0x85EF;
			const GLenum GL_INTENSITY_EXTENDED_RANGE_SGIX = 0x85F0;
			const GLenum GL_LUMINANCE_ALPHA_EXTENDED_RANGE_SGIX = 0x85F1;
			const GLenum GL_RGB16_EXTENDED_RANGE_SGIX = 0x85F2;
			const GLenum GL_RGBA16_EXTENDED_RANGE_SGIX = 0x85F3;
			const GLenum GL_ALPHA16_EXTENDED_RANGE_SGIX = 0x85F4;
			const GLenum GL_LUMINANCE16_EXTENDED_RANGE_SGIX = 0x85F5;
			const GLenum GL_INTENSITY16_EXTENDED_RANGE_SGIX = 0x85F6;
			const GLenum GL_LUMINANCE16_ALPHA16_EXTENDED_RANGE_SGIX = 0x85F7;
			const GLenum GL_MIN_LUMINANCE_SGIS = 0x85F8;
			const GLenum GL_MAX_LUMINANCE_SGIS = 0x85F9;
			const GLenum GL_MIN_INTENSITY_SGIS = 0x85FA;
			const GLenum GL_MAX_INTENSITY_SGIS = 0x85FB;
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
			if (!extStr.containsPattern("GL_SGIX_texture_range")) { funcAddr[0] = null; return funcAddr; }
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
