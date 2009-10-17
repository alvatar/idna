module dgl.ext.EXT_transform_feedback;
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



private ushort extensionId__ = 33;
alias extensionId__ EXT_transform_feedback;

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
			const GLenum GL_TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH_EXT = 0x8C76;
			const GLenum GL_TRANSFORM_FEEDBACK_BUFFER_MODE_EXT = 0x8C7F;
			const GLenum GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS_EXT = 0x8C80;
			const GLenum GL_TRANSFORM_FEEDBACK_VARYINGS_EXT = 0x8C83;
			const GLenum GL_TRANSFORM_FEEDBACK_BUFFER_START_EXT = 0x8C84;
			const GLenum GL_TRANSFORM_FEEDBACK_BUFFER_SIZE_EXT = 0x8C85;
			const GLenum GL_PRIMITIVES_GENERATED_EXT = 0x8C87;
			const GLenum GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN_EXT = 0x8C88;
			const GLenum GL_RASTERIZER_DISCARD_EXT = 0x8C89;
			const GLenum GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS_EXT = 0x8C8A;
			const GLenum GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS_EXT = 0x8C8B;
			const GLenum GL_INTERLEAVED_ATTRIBS_EXT = 0x8C8C;
			const GLenum GL_SEPARATE_ATTRIBS_EXT = 0x8C8D;
			const GLenum GL_TRANSFORM_FEEDBACK_BUFFER_EXT = 0x8C8E;
			const GLenum GL_TRANSFORM_FEEDBACK_BUFFER_BINDING_EXT = 0x8C8F;
	}
	private {
		extern (System) {
			alias void function (GLenum primitiveMode)	fp_glBeginTransformFeedbackEXT;
			alias void function (GLenum target, GLuint index, GLuint buffer)	fp_glBindBufferBaseEXT;
			alias void function (GLenum target, GLuint index, GLuint buffer, GLintptr offset)	fp_glBindBufferOffsetEXT;
			alias void function (GLenum target, GLuint index, GLuint buffer, GLintptr offset, GLsizeiptr size)	fp_glBindBufferRangeEXT;
			alias void function ()	fp_glEndTransformFeedbackEXT;
			alias void function (GLuint program, GLuint index, GLsizei bufSize, GLsizei* length, GLsizei *size, GLenum *type, char *name)	fp_glGetTransformFeedbackVaryingEXT;
			alias void function (GLuint program, GLsizei count,  char ** varyings, GLenum bufferMode)	fp_glTransformFeedbackVaryingsEXT;
		}
	}
	public {
void BeginTransformFeedback(GL gl_, ParameterTypeTuple!(fp_glBeginTransformFeedbackEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBeginTransformFeedbackEXT)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "BeginTransformFeedback", funcPtr, params__);
		}
void BindBufferBase(GL gl_, ParameterTypeTuple!(fp_glBindBufferBaseEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBindBufferBaseEXT)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "BindBufferBase", funcPtr, params__);
		}
void BindBufferOffset(GL gl_, ParameterTypeTuple!(fp_glBindBufferOffsetEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBindBufferOffsetEXT)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "BindBufferOffset", funcPtr, params__);
		}
void BindBufferRange(GL gl_, ParameterTypeTuple!(fp_glBindBufferRangeEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBindBufferRangeEXT)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "BindBufferRange", funcPtr, params__);
		}
void EndTransformFeedback(GL gl_, ParameterTypeTuple!(fp_glEndTransformFeedbackEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glEndTransformFeedbackEXT)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "EndTransformFeedback", funcPtr, params__);
		}
void GetTransformFeedbackVarying(GL gl_, ParameterTypeTuple!(fp_glGetTransformFeedbackVaryingEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetTransformFeedbackVaryingEXT)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "GetTransformFeedbackVarying", funcPtr, params__);
		}
void TransformFeedbackVaryings(GL gl_, ParameterTypeTuple!(fp_glTransformFeedbackVaryingsEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTransformFeedbackVaryingsEXT)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "TransformFeedbackVaryings", funcPtr, params__);
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
		void*[] funcAddr = new void*[7];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_EXT_transform_feedback")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glBeginTransformFeedbackEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glBindBufferBaseEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glBindBufferOffsetEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glBindBufferRangeEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glEndTransformFeedbackEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glGetTransformFeedbackVaryingEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glTransformFeedbackVaryingsEXT"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
