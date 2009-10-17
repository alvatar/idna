module dgl.ext.ARB_geometry_shader4;
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



private ushort extensionId__ = 364;
alias extensionId__ ARB_geometry_shader4;

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
			const GLenum GL_LINES_ADJACENCY_ARB = 0xA;
			const GLenum GL_LINE_STRIP_ADJACENCY_ARB = 0xB;
			const GLenum GL_TRIANGLES_ADJACENCY_ARB = 0xC;
			const GLenum GL_TRIANGLE_STRIP_ADJACENCY_ARB = 0xD;
			const GLenum GL_PROGRAM_POINT_SIZE_ARB = 0x8642;
			const GLenum GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS_ARB = 0x8C29;
			const GLenum GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER = 0x8CD4;
			const GLenum GL_FRAMEBUFFER_ATTACHMENT_LAYERED_ARB = 0x8DA7;
			const GLenum GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS_ARB = 0x8DA8;
			const GLenum GL_FRAMEBUFFER_INCOMPLETE_LAYER_COUNT_ARB = 0x8DA9;
			const GLenum GL_GEOMETRY_SHADER_ARB = 0x8DD9;
			const GLenum GL_GEOMETRY_VERTICES_OUT_ARB = 0x8DDA;
			const GLenum GL_GEOMETRY_INPUT_TYPE_ARB = 0x8DDB;
			const GLenum GL_GEOMETRY_OUTPUT_TYPE_ARB = 0x8DDC;
			const GLenum GL_MAX_GEOMETRY_VARYING_COMPONENTS_ARB = 0x8DDD;
			const GLenum GL_MAX_VERTEX_VARYING_COMPONENTS_ARB = 0x8DDE;
			const GLenum GL_MAX_GEOMETRY_UNIFORM_COMPONENTS_ARB = 0x8DDF;
			const GLenum GL_MAX_GEOMETRY_OUTPUT_VERTICES_ARB = 0x8DE0;
			const GLenum GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS_ARB = 0x8DE1;
	}
	private {
		extern (System) {
			alias void function (GLenum target, GLenum attachment, GLuint texture, GLint level)	fp_glFramebufferTextureARB;
			alias void function (GLenum target, GLenum attachment, GLuint texture, GLint level, GLenum face)	fp_glFramebufferTextureFaceARB;
			alias void function (GLenum target, GLenum attachment, GLuint texture, GLint level, GLint layer)	fp_glFramebufferTextureLayerARB;
			alias void function (GLuint program, GLenum pname, GLint value)	fp_glProgramParameteriARB;
		}
	}
	public {
void FramebufferTexture(GL gl_, ParameterTypeTuple!(fp_glFramebufferTextureARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFramebufferTextureARB)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "FramebufferTexture", funcPtr, params__);
		}
void FramebufferTextureFace(GL gl_, ParameterTypeTuple!(fp_glFramebufferTextureFaceARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFramebufferTextureFaceARB)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "FramebufferTextureFace", funcPtr, params__);
		}
void FramebufferTextureLayer(GL gl_, ParameterTypeTuple!(fp_glFramebufferTextureLayerARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFramebufferTextureLayerARB)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "FramebufferTextureLayer", funcPtr, params__);
		}
void ProgramParameteri(GL gl_, ParameterTypeTuple!(fp_glProgramParameteriARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramParameteriARB)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "ProgramParameteri", funcPtr, params__);
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
				
				version (DogExtSupportAsserts) {
					gl.extEnabled.length = extensionId__ + 1;
				}
			}
			gl.extFuncs[extensionId__] = loadFunctions__(gl_);
			
			return gl.extFuncs[extensionId__][0] !is null;
		}
	}
	private void*[] loadFunctions__(GL gl) {
		void*[] funcAddr = new void*[4];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_ARB_geometry_shader4")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glFramebufferTextureARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glFramebufferTextureFaceARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glFramebufferTextureLayerARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glProgramParameteriARB"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
