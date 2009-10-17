module dgl.ext.APPLE_float_pixels;
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



private ushort extensionId__ = 460;
alias extensionId__ APPLE_float_pixels;

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
			const GLenum GL_HALF_APPLE = 0x140B;
			const GLenum GL_COLOR_FLOAT_APPLE = 0x8A0F;
			const GLenum GL_RGBA_FLOAT32_APPLE = 0x8814;
			const GLenum GL_RGB_FLOAT32_APPLE = 0x8815;
			const GLenum GL_ALPHA_FLOAT32_APPLE = 0x8816;
			const GLenum GL_INTENSITY_FLOAT32_APPLE = 0x8817;
			const GLenum GL_LUMINANCE_FLOAT32_APPLE = 0x8818;
			const GLenum GL_LUMINANCE_ALPHA_FLOAT32_APPLE = 0x8819;
			const GLenum GL_RGBA_FLOAT16_APPLE = 0x881A;
			const GLenum GL_RGB_FLOAT16_APPLE = 0x881B;
			const GLenum GL_ALPHA_FLOAT16_APPLE = 0x881C;
			const GLenum GL_INTENSITY_FLOAT16_APPLE = 0x881D;
			const GLenum GL_LUMINANCE_FLOAT16_APPLE = 0x881E;
			const GLenum GL_LUMINANCE_ALPHA_FLOAT16_APPLE = 0x881F;
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
			if (!extStr.containsPattern("GL_APPLE_float_pixels")) { funcAddr[0] = null; return funcAddr; }
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
