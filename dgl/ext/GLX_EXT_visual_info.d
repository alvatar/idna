module dgl.ext.GLX_EXT_visual_info;
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



private ushort extensionId__ = 167;
alias extensionId__ GLX_EXT_visual_info;

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

version (Posix) {
	public {
			const GLenum GLX_X_VISUAL_TYPE_EXT = 0x22;
			const GLenum GLX_TRANSPARENT_TYPE_EXT = 0x23;
			const GLenum GLX_TRANSPARENT_INDEX_VALUE_EXT = 0x24;
			const GLenum GLX_TRANSPARENT_RED_VALUE_EXT = 0x25;
			const GLenum GLX_TRANSPARENT_GREEN_VALUE_EXT = 0x26;
			const GLenum GLX_TRANSPARENT_BLUE_VALUE_EXT = 0x27;
			const GLenum GLX_TRANSPARENT_ALPHA_VALUE_EXT = 0x28;
			const GLenum GLX_NONE_EXT = 0x8000;
			const GLenum GLX_TRUE_COLOR_EXT = 0x8002;
			const GLenum GLX_DIRECT_COLOR_EXT = 0x8003;
			const GLenum GLX_PSEUDO_COLOR_EXT = 0x8004;
			const GLenum GLX_STATIC_COLOR_EXT = 0x8005;
			const GLenum GLX_GRAY_SCALE_EXT = 0x8006;
			const GLenum GLX_STATIC_GRAY_EXT = 0x8007;
			const GLenum GLX_TRANSPARENT_RGB_EXT = 0x8008;
			const GLenum GLX_TRANSPARENT_INDEX_EXT = 0x8009;
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
			if (!extStr.containsPattern("GLX_EXT_visual_info")) { funcAddr[0] = null; return funcAddr; }
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
