module dgl.ext.ARB_texture_env_combine;
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



private ushort extensionId__ = 170;
alias extensionId__ ARB_texture_env_combine;

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
			const GLenum GL_SUBTRACT_ARB = 0x84E7;
			const GLenum GL_COMBINE_ARB = 0x8570;
			const GLenum GL_COMBINE_RGB_ARB = 0x8571;
			const GLenum GL_COMBINE_ALPHA_ARB = 0x8572;
			const GLenum GL_RGB_SCALE_ARB = 0x8573;
			const GLenum GL_ADD_SIGNED_ARB = 0x8574;
			const GLenum GL_INTERPOLATE_ARB = 0x8575;
			const GLenum GL_CONSTANT_ARB = 0x8576;
			const GLenum GL_PRIMARY_COLOR_ARB = 0x8577;
			const GLenum GL_PREVIOUS_ARB = 0x8578;
			const GLenum GL_SOURCE0_RGB_ARB = 0x8580;
			const GLenum GL_SOURCE1_RGB_ARB = 0x8581;
			const GLenum GL_SOURCE2_RGB_ARB = 0x8582;
			const GLenum GL_SOURCE0_ALPHA_ARB = 0x8588;
			const GLenum GL_SOURCE1_ALPHA_ARB = 0x8589;
			const GLenum GL_SOURCE2_ALPHA_ARB = 0x858A;
			const GLenum GL_OPERAND0_RGB_ARB = 0x8590;
			const GLenum GL_OPERAND1_RGB_ARB = 0x8591;
			const GLenum GL_OPERAND2_RGB_ARB = 0x8592;
			const GLenum GL_OPERAND0_ALPHA_ARB = 0x8598;
			const GLenum GL_OPERAND1_ALPHA_ARB = 0x8599;
			const GLenum GL_OPERAND2_ALPHA_ARB = 0x859A;
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
			if (!extStr.containsPattern("GL_ARB_texture_env_combine")) { funcAddr[0] = null; return funcAddr; }
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
