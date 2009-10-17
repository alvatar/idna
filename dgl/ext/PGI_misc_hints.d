module dgl.ext.PGI_misc_hints;
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



private ushort extensionId__ = 48;
alias extensionId__ PGI_misc_hints;

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
			const GLenum GL_PREFER_DOUBLEBUFFER_HINT_PGI = 107000;
			const GLenum GL_CONSERVE_MEMORY_HINT_PGI = 107005;
			const GLenum GL_RECLAIM_MEMORY_HINT_PGI = 107006;
			const GLenum GL_NATIVE_GRAPHICS_HANDLE_PGI = 107010;
			const GLenum GL_NATIVE_GRAPHICS_BEGIN_HINT_PGI = 107011;
			const GLenum GL_NATIVE_GRAPHICS_END_HINT_PGI = 107012;
			const GLenum GL_ALWAYS_FAST_HINT_PGI = 107020;
			const GLenum GL_ALWAYS_SOFT_HINT_PGI = 107021;
			const GLenum GL_ALLOW_DRAW_OBJ_HINT_PGI = 107022;
			const GLenum GL_ALLOW_DRAW_WIN_HINT_PGI = 107023;
			const GLenum GL_ALLOW_DRAW_FRG_HINT_PGI = 107024;
			const GLenum GL_ALLOW_DRAW_MEM_HINT_PGI = 107025;
			const GLenum GL_STRICT_DEPTHFUNC_HINT_PGI = 107030;
			const GLenum GL_STRICT_LIGHTING_HINT_PGI = 107031;
			const GLenum GL_STRICT_SCISSOR_HINT_PGI = 107032;
			const GLenum GL_FULL_STIPPLE_HINT_PGI = 107033;
			const GLenum GL_CLIP_NEAR_HINT_PGI = 107040;
			const GLenum GL_CLIP_FAR_HINT_PGI = 107041;
			const GLenum GL_WIDE_LINE_HINT_PGI = 107042;
			const GLenum GL_BACK_NORMALS_HINT_PGI = 107043;
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
			if (!extStr.containsPattern("GL_PGI_misc_hints")) { funcAddr[0] = null; return funcAddr; }
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
