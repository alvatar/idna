module dgl.ext.EXT_geometry_shader4;
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



private ushort extensionId__ = 480;
alias extensionId__ EXT_geometry_shader4;

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
			const GLenum GL_GEOMETRY_SHADER_EXT = 0x8DD9;
			const GLenum GL_MAX_GEOMETRY_VARYING_COMPONENTS_EXT = 0x8DDD;
			const GLenum GL_MAX_VERTEX_VARYING_COMPONENTS_EXT = 0x8DDE;
			const GLenum GL_MAX_VARYING_COMPONENTS_EXT = 0x8B4B;
			const GLenum GL_MAX_GEOMETRY_UNIFORM_COMPONENTS_EXT = 0x8DDF;
			const GLenum GL_MAX_GEOMETRY_OUTPUT_VERTICES_EXT = 0x8DE0;
			const GLenum GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS_EXT = 0x8DE1;
			const GLenum GL_GEOMETRY_VERTICES_OUT_EXT = 0x8DDA;
			const GLenum GL_GEOMETRY_INPUT_TYPE_EXT = 0x8DDB;
			const GLenum GL_GEOMETRY_OUTPUT_TYPE_EXT = 0x8DDC;
			const GLenum GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS_EXT = 0x8C29;
			const GLenum GL_LINES_ADJACENCY_EXT = 0xA;
			const GLenum GL_LINE_STRIP_ADJACENCY_EXT = 0xB;
			const GLenum GL_TRIANGLES_ADJACENCY_EXT = 0xC;
			const GLenum GL_TRIANGLE_STRIP_ADJACENCY_EXT = 0xD;
			const GLenum GL_FRAMEBUFFER_ATTACHMENT_LAYERED_EXT = 0x8DA7;
			const GLenum GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS_EXT = 0x8DA8;
			const GLenum GL_FRAMEBUFFER_INCOMPLETE_LAYER_COUNT_EXT = 0x8DA9;
			const GLenum GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER_EXT = 0x8CD4;
			const GLenum GL_PROGRAM_POINT_SIZE_EXT = 0x8642;
	}
	private {
		extern (System) {
			alias void function (GLuint program, GLenum pname, GLint value)	fp_glProgramParameteriEXT;
			alias void function (GLenum target, GLenum attachment, GLuint texture, GLint level)	fp_glFramebufferTextureEXT;
			alias void function (GLenum target, GLenum attachment, GLuint texture, GLint level, GLint layer)	fp_glFramebufferTextureLayerEXT;
			alias void function (GLenum target, GLenum attachment, GLuint texture, GLint level, GLenum face)	fp_glFramebufferTextureFaceEXT;
		}
	}
	public {
void ProgramParameteri(GL gl_, ParameterTypeTuple!(fp_glProgramParameteriEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glProgramParameteriEXT)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "ProgramParameteri", funcPtr, params__);
		}
void FramebufferTexture(GL gl_, ParameterTypeTuple!(fp_glFramebufferTextureEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFramebufferTextureEXT)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "FramebufferTexture", funcPtr, params__);
		}
void FramebufferTextureLayer(GL gl_, ParameterTypeTuple!(fp_glFramebufferTextureLayerEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFramebufferTextureLayerEXT)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "FramebufferTextureLayer", funcPtr, params__);
		}
void FramebufferTextureFace(GL gl_, ParameterTypeTuple!(fp_glFramebufferTextureFaceEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFramebufferTextureFaceEXT)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "FramebufferTextureFace", funcPtr, params__);
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
			if (!extStr.containsPattern("GL_EXT_geometry_shader4")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glProgramParameteriEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glFramebufferTextureEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glFramebufferTextureLayerEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glFramebufferTextureFaceEXT"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
