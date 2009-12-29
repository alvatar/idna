module dgl.ext.VERSION_2_1;
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



private ushort extensionId__ = 46;
alias extensionId__ VERSION_2_1;

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
			const GLenum GL_CURRENT_RASTER_SECONDARY_COLOR = 0x845F;
			const GLenum GL_PIXEL_PACK_BUFFER = 0x88EB;
			const GLenum GL_PIXEL_UNPACK_BUFFER = 0x88EC;
			const GLenum GL_PIXEL_PACK_BUFFER_BINDING = 0x88ED;
			const GLenum GL_PIXEL_UNPACK_BUFFER_BINDING = 0x88EF;
			const GLenum GL_SRGB = 0x8C40;
			const GLenum GL_SRGB8 = 0x8C41;
			const GLenum GL_SRGB_ALPHA = 0x8C42;
			const GLenum GL_SRGB8_ALPHA8 = 0x8C43;
			const GLenum GL_SLUMINANCE_ALPHA = 0x8C44;
			const GLenum GL_SLUMINANCE8_ALPHA8 = 0x8C45;
			const GLenum GL_SLUMINANCE = 0x8C46;
			const GLenum GL_SLUMINANCE8 = 0x8C47;
			const GLenum GL_COMPRESSED_SRGB = 0x8C48;
			const GLenum GL_COMPRESSED_SRGB_ALPHA = 0x8C49;
			const GLenum GL_COMPRESSED_SLUMINANCE = 0x8C4A;
			const GLenum GL_COMPRESSED_SLUMINANCE_ALPHA = 0x8C4B;
	}
	private {
		extern (System) {
			alias void function (GLint location, GLsizei count, GLboolean transpose,  GLfloat *value)	fp_glUniformMatrix2x3fv;
			alias void function (GLint location, GLsizei count, GLboolean transpose,  GLfloat *value)	fp_glUniformMatrix3x2fv;
			alias void function (GLint location, GLsizei count, GLboolean transpose,  GLfloat *value)	fp_glUniformMatrix2x4fv;
			alias void function (GLint location, GLsizei count, GLboolean transpose,  GLfloat *value)	fp_glUniformMatrix4x2fv;
			alias void function (GLint location, GLsizei count, GLboolean transpose,  GLfloat *value)	fp_glUniformMatrix3x4fv;
			alias void function (GLint location, GLsizei count, GLboolean transpose,  GLfloat *value)	fp_glUniformMatrix4x3fv;
		}
	}
	public {
void UniformMatrix2x3fv(GL gl_, ParameterTypeTuple!(fp_glUniformMatrix2x3fv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniformMatrix2x3fv)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "UniformMatrix2x3fv", funcPtr, params__);
		}
void UniformMatrix3x2fv(GL gl_, ParameterTypeTuple!(fp_glUniformMatrix3x2fv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniformMatrix3x2fv)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "UniformMatrix3x2fv", funcPtr, params__);
		}
void UniformMatrix2x4fv(GL gl_, ParameterTypeTuple!(fp_glUniformMatrix2x4fv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniformMatrix2x4fv)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "UniformMatrix2x4fv", funcPtr, params__);
		}
void UniformMatrix4x2fv(GL gl_, ParameterTypeTuple!(fp_glUniformMatrix4x2fv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniformMatrix4x2fv)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "UniformMatrix4x2fv", funcPtr, params__);
		}
void UniformMatrix3x4fv(GL gl_, ParameterTypeTuple!(fp_glUniformMatrix3x4fv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniformMatrix3x4fv)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "UniformMatrix3x4fv", funcPtr, params__);
		}
void UniformMatrix4x3fv(GL gl_, ParameterTypeTuple!(fp_glUniformMatrix4x3fv) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniformMatrix4x3fv)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "UniformMatrix4x3fv", funcPtr, params__);
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
		void*[] funcAddr = new void*[6];
		{
			if (!isOpenGLVersionSupported("2_1", '_')) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glUniformMatrix2x3fv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glUniformMatrix3x2fv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glUniformMatrix2x4fv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glUniformMatrix4x2fv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glUniformMatrix3x4fv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glUniformMatrix4x3fv"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
