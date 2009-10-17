module dgl.ext.ARB_texture_float;
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



private ushort extensionId__ = 276;
alias extensionId__ ARB_texture_float;

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
			const GLenum GL_RGBA32F_ARB = 0x8814;
			const GLenum GL_RGB32F_ARB = 0x8815;
			const GLenum GL_ALPHA32F_ARB = 0x8816;
			const GLenum GL_INTENSITY32F_ARB = 0x8817;
			const GLenum GL_LUMINANCE32F_ARB = 0x8818;
			const GLenum GL_LUMINANCE_ALPHA32F_ARB = 0x8819;
			const GLenum GL_RGBA16F_ARB = 0x881A;
			const GLenum GL_RGB16F_ARB = 0x881B;
			const GLenum GL_ALPHA16F_ARB = 0x881C;
			const GLenum GL_INTENSITY16F_ARB = 0x881D;
			const GLenum GL_LUMINANCE16F_ARB = 0x881E;
			const GLenum GL_LUMINANCE_ALPHA16F_ARB = 0x881F;
			const GLenum GL_TEXTURE_RED_TYPE_ARB = 0x8C10;
			const GLenum GL_TEXTURE_GREEN_TYPE_ARB = 0x8C11;
			const GLenum GL_TEXTURE_BLUE_TYPE_ARB = 0x8C12;
			const GLenum GL_TEXTURE_ALPHA_TYPE_ARB = 0x8C13;
			const GLenum GL_TEXTURE_LUMINANCE_TYPE_ARB = 0x8C14;
			const GLenum GL_TEXTURE_INTENSITY_TYPE_ARB = 0x8C15;
			const GLenum GL_TEXTURE_DEPTH_TYPE_ARB = 0x8C16;
			const GLenum GL_UNSIGNED_NORMALIZED_ARB = 0x8C17;
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
			if (!extStr.containsPattern("GL_ARB_texture_float")) { funcAddr[0] = null; return funcAddr; }
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
