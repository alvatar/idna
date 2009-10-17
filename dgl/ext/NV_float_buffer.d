module dgl.ext.NV_float_buffer;
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



private ushort extensionId__ = 0;
alias extensionId__ NV_float_buffer;

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
			const GLenum GL_FLOAT_R_NV = 0x8880;
			const GLenum GL_FLOAT_RG_NV = 0x8881;
			const GLenum GL_FLOAT_RGB_NV = 0x8882;
			const GLenum GL_FLOAT_RGBA_NV = 0x8883;
			const GLenum GL_FLOAT_R16_NV = 0x8884;
			const GLenum GL_FLOAT_R32_NV = 0x8885;
			const GLenum GL_FLOAT_RG16_NV = 0x8886;
			const GLenum GL_FLOAT_RG32_NV = 0x8887;
			const GLenum GL_FLOAT_RGB16_NV = 0x8888;
			const GLenum GL_FLOAT_RGB32_NV = 0x8889;
			const GLenum GL_FLOAT_RGBA16_NV = 0x888A;
			const GLenum GL_FLOAT_RGBA32_NV = 0x888B;
			const GLenum GL_TEXTURE_FLOAT_COMPONENTS_NV = 0x888C;
			const GLenum GL_FLOAT_CLEAR_COLOR_VALUE_NV = 0x888D;
			const GLenum GL_FLOAT_RGBA_MODE_NV = 0x888E;
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
			if (!extStr.containsPattern("GL_NV_float_buffer")) { funcAddr[0] = null; return funcAddr; }
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
