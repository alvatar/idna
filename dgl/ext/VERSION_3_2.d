module dgl.ext.VERSION_3_2;
import dgl.opengl;
import dgl.glext;

version( D_Version2 ) {
	import std.string : containsPattern = count;
	import std.conv;
} else {
	import tango.text.Util : containsPattern;
	import tango.stdc.stringz : fromStringz;
	alias char[] string;
}



private ushort extensionId__ = 83;
alias extensionId__ VERSION_3_2;

	version (DglNoExtSupportAsserts) {
	} else {
		version = DglExtSupportAsserts;
	}
	
	static this() {
		if (__extSupportCheckingFuncs.length <= extensionId__) {
			__extSupportCheckingFuncs.length = extensionId__ + 1;
		}
		__extSupportCheckingFuncs[extensionId__] = &__supported;
	}

version (all) {
	public {
			const GLenum GL_CONTEXT_CORE_PROFILE_BIT = 0x00000001;
			const GLenum GL_CONTEXT_COMPATIBILITY_PROFILE_BIT = 0x00000002;
			const GLenum GL_LINES_ADJACENCY = 0x000A;
			const GLenum GL_LINE_STRIP_ADJACENCY = 0x000B;
			const GLenum GL_TRIANGLES_ADJACENCY = 0x000C;
			const GLenum GL_TRIANGLE_STRIP_ADJACENCY = 0x000D;
			const GLenum GL_PROGRAM_POINT_SIZE = 0x8642;
			const GLenum GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS = 0x8C29;
			const GLenum GL_FRAMEBUFFER_ATTACHMENT_LAYERED = 0x8DA7;
			const GLenum GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS = 0x8DA8;
			const GLenum GL_GEOMETRY_SHADER = 0x8DD9;
			const GLenum GL_GEOMETRY_VERTICES_OUT = 0x8916;
			const GLenum GL_GEOMETRY_INPUT_TYPE = 0x8917;
			const GLenum GL_GEOMETRY_OUTPUT_TYPE = 0x8918;
			const GLenum GL_MAX_GEOMETRY_UNIFORM_COMPONENTS = 0x8DDF;
			const GLenum GL_MAX_GEOMETRY_OUTPUT_VERTICES = 0x8DE0;
			const GLenum GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS = 0x8DE1;
			const GLenum GL_MAX_VERTEX_OUTPUT_COMPONENTS = 0x9122;
			const GLenum GL_MAX_GEOMETRY_INPUT_COMPONENTS = 0x9123;
			const GLenum GL_MAX_GEOMETRY_OUTPUT_COMPONENTS = 0x9124;
			const GLenum GL_MAX_FRAGMENT_INPUT_COMPONENTS = 0x9125;
			const GLenum GL_CONTEXT_PROFILE_MASK = 0x9126;
	}
	private {
		extern (System) {
			alias void function (GLenum, GLuint, GLint64 *)	fp_glGetInteger64i_v;
			alias void function (GLenum, GLenum, GLint64 *)	fp_glGetBufferParameteri64v;
			alias void function (GLenum, GLenum, GLuint, GLint)	fp_glFramebufferTexture;
		}
	}
	public {
void GetInteger64i_v(GL gl_, ParameterTypeTuple!(fp_glGetInteger64i_v) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetInteger64i_v)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "GetInteger64i_v", funcPtr, params__);
		}
void GetBufferParameteri64v(GL gl_, ParameterTypeTuple!(fp_glGetBufferParameteri64v) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetBufferParameteri64v)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "GetBufferParameteri64v", funcPtr, params__);
		}
void FramebufferTexture(GL gl_, ParameterTypeTuple!(fp_glFramebufferTexture) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFramebufferTexture)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "FramebufferTexture", funcPtr, params__);
		}
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
				
				version (DglExtSupportAsserts) {
					gl.extEnabled.length = extensionId__ + 1;
				}
			}
			gl.extFuncs[extensionId__] = loadFunctions__(gl_);
			
			return gl.extFuncs[extensionId__][0] !is null;
		}
	}
	private void*[] loadFunctions__(GL gl) {
		void*[] funcAddr = new void*[3];
		{
			if (!isOpenGLVersionSupported("3_2", '_')) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glGetInteger64i_v"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glGetBufferParameteri64v"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glFramebufferTexture"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
