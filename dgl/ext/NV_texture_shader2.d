module dgl.ext.NV_texture_shader2;
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



private ushort extensionId__ = 389;
alias extensionId__ NV_texture_shader2;

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
			const GLenum GL_UNSIGNED_INT_S8_S8_8_8_NV = 0x86DA;
			const GLenum GL_UNSIGNED_INT_8_8_S8_S8_REV_NV = 0x86DB;
			const GLenum GL_DSDT_MAG_INTENSITY_NV = 0x86DC;
			const GLenum GL_DOT_PRODUCT_TEXTURE_3D_NV = 0x86EF;
			const GLenum GL_HILO_NV = 0x86F4;
			const GLenum GL_DSDT_NV = 0x86F5;
			const GLenum GL_DSDT_MAG_NV = 0x86F6;
			const GLenum GL_DSDT_MAG_VIB_NV = 0x86F7;
			const GLenum GL_HILO16_NV = 0x86F8;
			const GLenum GL_SIGNED_HILO_NV = 0x86F9;
			const GLenum GL_SIGNED_HILO16_NV = 0x86FA;
			const GLenum GL_SIGNED_RGBA_NV = 0x86FB;
			const GLenum GL_SIGNED_RGBA8_NV = 0x86FC;
			const GLenum GL_SIGNED_RGB_NV = 0x86FE;
			const GLenum GL_SIGNED_RGB8_NV = 0x86FF;
			const GLenum GL_SIGNED_LUMINANCE_NV = 0x8701;
			const GLenum GL_SIGNED_LUMINANCE8_NV = 0x8702;
			const GLenum GL_SIGNED_LUMINANCE_ALPHA_NV = 0x8703;
			const GLenum GL_SIGNED_LUMINANCE8_ALPHA8_NV = 0x8704;
			const GLenum GL_SIGNED_ALPHA_NV = 0x8705;
			const GLenum GL_SIGNED_ALPHA8_NV = 0x8706;
			const GLenum GL_SIGNED_INTENSITY_NV = 0x8707;
			const GLenum GL_SIGNED_INTENSITY8_NV = 0x8708;
			const GLenum GL_DSDT8_NV = 0x8709;
			const GLenum GL_DSDT8_MAG8_NV = 0x870A;
			const GLenum GL_DSDT8_MAG8_INTENSITY8_NV = 0x870B;
			const GLenum GL_SIGNED_RGB_UNSIGNED_ALPHA_NV = 0x870C;
			const GLenum GL_SIGNED_RGB8_UNSIGNED_ALPHA8_NV = 0x870D;
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
			if (!extStr.containsPattern("GL_NV_texture_shader2")) { funcAddr[0] = null; return funcAddr; }
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
