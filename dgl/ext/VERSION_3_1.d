module dgl.ext.VERSION_3_1;
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



private ushort extensionId__ = 77;
alias extensionId__ VERSION_3_1;

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
			const GLenum GL_SAMPLER_2D_RECT = 0x8B63;
			const GLenum GL_SAMPLER_2D_RECT_SHADOW = 0x8B64;
			const GLenum GL_SAMPLER_BUFFER = 0x8DC2;
			const GLenum GL_INT_SAMPLER_2D_RECT = 0x8DCD;
			const GLenum GL_INT_SAMPLER_BUFFER = 0x8DD0;
			const GLenum GL_UNSIGNED_INT_SAMPLER_2D_RECT = 0x8DD5;
			const GLenum GL_UNSIGNED_INT_SAMPLER_BUFFER = 0x8DD8;
			const GLenum GL_TEXTURE_BUFFER = 0x8C2A;
			const GLenum GL_MAX_TEXTURE_BUFFER_SIZE = 0x8C2B;
			const GLenum GL_TEXTURE_BINDING_BUFFER = 0x8C2C;
			const GLenum GL_TEXTURE_BUFFER_DATA_STORE_BINDING = 0x8C2D;
			const GLenum GL_TEXTURE_BUFFER_FORMAT = 0x8C2E;
			const GLenum GL_TEXTURE_RECTANGLE = 0x84F5;
			const GLenum GL_TEXTURE_BINDING_RECTANGLE = 0x84F6;
			const GLenum GL_PROXY_TEXTURE_RECTANGLE = 0x84F7;
			const GLenum GL_MAX_RECTANGLE_TEXTURE_SIZE = 0x84F8;
			const GLenum GL_RED_SNORM = 0x8F90;
			const GLenum GL_RG_SNORM = 0x8F91;
			const GLenum GL_RGB_SNORM = 0x8F92;
			const GLenum GL_RGBA_SNORM = 0x8F93;
			const GLenum GL_R8_SNORM = 0x8F94;
			const GLenum GL_RG8_SNORM = 0x8F95;
			const GLenum GL_RGB8_SNORM = 0x8F96;
			const GLenum GL_RGBA8_SNORM = 0x8F97;
			const GLenum GL_R16_SNORM = 0x8F98;
			const GLenum GL_RG16_SNORM = 0x8F99;
			const GLenum GL_RGB16_SNORM = 0x8F9A;
			const GLenum GL_RGBA16_SNORM = 0x8F9B;
			const GLenum GL_SIGNED_NORMALIZED = 0x8F9C;
			const GLenum GL_PRIMITIVE_RESTART = 0x8F9D;
			const GLenum GL_PRIMITIVE_RESTART_INDEX = 0x8F9E;
	}
	private {
		extern (System) {
			alias void function (GLenum, GLint, GLsizei, GLsizei)	fp_glDrawArraysInstanced;
			alias void function (GLenum, GLsizei, GLenum,  GLvoid*, GLsizei)	fp_glDrawElementsInstanced;
			alias void function (GLenum, GLenum, GLuint)	fp_glTexBuffer;
			alias void function (GLuint)	fp_glPrimitiveRestartIndex;
		}
	}
	public {
void DrawArraysInstanced(GL gl_, ParameterTypeTuple!(fp_glDrawArraysInstanced) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDrawArraysInstanced)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "DrawArraysInstanced", funcPtr, params__);
		}
void DrawElementsInstanced(GL gl_, ParameterTypeTuple!(fp_glDrawElementsInstanced) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDrawElementsInstanced)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "DrawElementsInstanced", funcPtr, params__);
		}
void TexBuffer(GL gl_, ParameterTypeTuple!(fp_glTexBuffer) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTexBuffer)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "TexBuffer", funcPtr, params__);
		}
void PrimitiveRestartIndex(GL gl_, ParameterTypeTuple!(fp_glPrimitiveRestartIndex) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glPrimitiveRestartIndex)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "PrimitiveRestartIndex", funcPtr, params__);
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
		void*[] funcAddr = new void*[4];
		{
			if (!isOpenGLVersionSupported("3_1", '_')) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glDrawArraysInstanced"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glDrawElementsInstanced"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glTexBuffer"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glPrimitiveRestartIndex"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
