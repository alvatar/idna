module dgl.ext.ARB_fragment_program;
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



private ushort extensionId__ = 112;
alias extensionId__ ARB_fragment_program;

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
			const GLenum GL_FRAGMENT_PROGRAM_ARB = 0x8804;
			const GLenum GL_PROGRAM_ALU_INSTRUCTIONS_ARB = 0x8805;
			const GLenum GL_PROGRAM_TEX_INSTRUCTIONS_ARB = 0x8806;
			const GLenum GL_PROGRAM_TEX_INDIRECTIONS_ARB = 0x8807;
			const GLenum GL_PROGRAM_NATIVE_ALU_INSTRUCTIONS_ARB = 0x8808;
			const GLenum GL_PROGRAM_NATIVE_TEX_INSTRUCTIONS_ARB = 0x8809;
			const GLenum GL_PROGRAM_NATIVE_TEX_INDIRECTIONS_ARB = 0x880A;
			const GLenum GL_MAX_PROGRAM_ALU_INSTRUCTIONS_ARB = 0x880B;
			const GLenum GL_MAX_PROGRAM_TEX_INSTRUCTIONS_ARB = 0x880C;
			const GLenum GL_MAX_PROGRAM_TEX_INDIRECTIONS_ARB = 0x880D;
			const GLenum GL_MAX_PROGRAM_NATIVE_ALU_INSTRUCTIONS_ARB = 0x880E;
			const GLenum GL_MAX_PROGRAM_NATIVE_TEX_INSTRUCTIONS_ARB = 0x880F;
			const GLenum GL_MAX_PROGRAM_NATIVE_TEX_INDIRECTIONS_ARB = 0x8810;
			const GLenum GL_MAX_TEXTURE_COORDS_ARB = 0x8871;
			const GLenum GL_MAX_TEXTURE_IMAGE_UNITS_ARB = 0x8872;
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
			if (!extStr.containsPattern("GL_ARB_fragment_program")) { funcAddr[0] = null; return funcAddr; }
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
