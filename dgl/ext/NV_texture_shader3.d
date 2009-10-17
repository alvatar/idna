module dgl.ext.NV_texture_shader3;
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



private ushort extensionId__ = 393;
alias extensionId__ NV_texture_shader3;

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
			const GLenum GL_OFFSET_PROJECTIVE_TEXTURE_2D_NV = 0x8850;
			const GLenum GL_OFFSET_PROJECTIVE_TEXTURE_2D_SCALE_NV = 0x8851;
			const GLenum GL_OFFSET_PROJECTIVE_TEXTURE_RECTANGLE_NV = 0x8852;
			const GLenum GL_OFFSET_PROJECTIVE_TEXTURE_RECTANGLE_SCALE_NV = 0x8853;
			const GLenum GL_OFFSET_HILO_TEXTURE_2D_NV = 0x8854;
			const GLenum GL_OFFSET_HILO_TEXTURE_RECTANGLE_NV = 0x8855;
			const GLenum GL_OFFSET_HILO_PROJECTIVE_TEXTURE_2D_NV = 0x8856;
			const GLenum GL_OFFSET_HILO_PROJECTIVE_TEXTURE_RECTANGLE_NV = 0x8857;
			const GLenum GL_DEPENDENT_HILO_TEXTURE_2D_NV = 0x8858;
			const GLenum GL_DEPENDENT_RGB_TEXTURE_3D_NV = 0x8859;
			const GLenum GL_DEPENDENT_RGB_TEXTURE_CUBE_MAP_NV = 0x885A;
			const GLenum GL_DOT_PRODUCT_PASS_THROUGH_NV = 0x885B;
			const GLenum GL_DOT_PRODUCT_TEXTURE_1D_NV = 0x885C;
			const GLenum GL_DOT_PRODUCT_AFFINE_DEPTH_REPLACE_NV = 0x885D;
			const GLenum GL_HILO8_NV = 0x885E;
			const GLenum GL_SIGNED_HILO8_NV = 0x885F;
			const GLenum GL_FORCE_BLUE_TO_ONE_NV = 0x8860;
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
			if (!extStr.containsPattern("GL_NV_texture_shader3")) { funcAddr[0] = null; return funcAddr; }
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
