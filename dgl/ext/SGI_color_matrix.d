module dgl.ext.SGI_color_matrix;
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



private ushort extensionId__ = 325;
alias extensionId__ SGI_color_matrix;

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
			const GLenum GL_COLOR_MATRIX_SGI = 0x80B1;
			const GLenum GL_COLOR_MATRIX_STACK_DEPTH_SGI = 0x80B2;
			const GLenum GL_MAX_COLOR_MATRIX_STACK_DEPTH_SGI = 0x80B3;
			const GLenum GL_POST_COLOR_MATRIX_RED_SCALE_SGI = 0x80B4;
			const GLenum GL_POST_COLOR_MATRIX_GREEN_SCALE_SGI = 0x80B5;
			const GLenum GL_POST_COLOR_MATRIX_BLUE_SCALE_SGI = 0x80B6;
			const GLenum GL_POST_COLOR_MATRIX_ALPHA_SCALE_SGI = 0x80B7;
			const GLenum GL_POST_COLOR_MATRIX_RED_BIAS_SGI = 0x80B8;
			const GLenum GL_POST_COLOR_MATRIX_GREEN_BIAS_SGI = 0x80B9;
			const GLenum GL_POST_COLOR_MATRIX_BLUE_BIAS_SGI = 0x80BA;
			const GLenum GL_POST_COLOR_MATRIX_ALPHA_BIAS_SGI = 0x80BB;
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
			if (!extStr.containsPattern("GL_SGI_color_matrix")) { funcAddr[0] = null; return funcAddr; }
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
