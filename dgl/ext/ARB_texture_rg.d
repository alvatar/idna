module dgl.ext.ARB_texture_rg;
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



private ushort extensionId__ = 5;
alias extensionId__ ARB_texture_rg;

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
			const GLenum GL_RED = 0x1903;
			const GLenum GL_RG = 0x8227;
			const GLenum GL_RG_INTEGER = 0x8228;
			const GLenum GL_R8 = 0x8229;
			const GLenum GL_R16 = 0x822A;
			const GLenum GL_RG8 = 0x822B;
			const GLenum GL_RG16 = 0x822C;
			const GLenum GL_R16F = 0x822D;
			const GLenum GL_R32F = 0x822E;
			const GLenum GL_RG16F = 0x822F;
			const GLenum GL_RG32F = 0x8230;
			const GLenum GL_R8I = 0x8231;
			const GLenum GL_R8UI = 0x8232;
			const GLenum GL_R16I = 0x8233;
			const GLenum GL_R16UI = 0x8234;
			const GLenum GL_R32I = 0x8235;
			const GLenum GL_R32UI = 0x8236;
			const GLenum GL_RG8I = 0x8237;
			const GLenum GL_RG8UI = 0x8238;
			const GLenum GL_RG16I = 0x8239;
			const GLenum GL_RG16UI = 0x823A;
			const GLenum GL_RG32I = 0x823B;
			const GLenum GL_RG32UI = 0x823C;
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
			if (!extStr.containsPattern("GL_ARB_texture_rg")) { funcAddr[0] = null; return funcAddr; }
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
