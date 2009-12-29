module dgl.ext.NV_transform_feedback;
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



private ushort extensionId__ = 80;
alias extensionId__ NV_transform_feedback;

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
			const GLenum GL_BACK_PRIMARY_COLOR_NV = 0x8C77;
			const GLenum GL_BACK_SECONDARY_COLOR_NV = 0x8C78;
			const GLenum GL_TEXTURE_COORD_NV = 0x8C79;
			const GLenum GL_CLIP_DISTANCE_NV = 0x8C7A;
			const GLenum GL_VERTEX_ID_NV = 0x8C7B;
			const GLenum GL_PRIMITIVE_ID_NV = 0x8C7C;
			const GLenum GL_GENERIC_ATTRIB_NV = 0x8C7D;
			const GLenum GL_TRANSFORM_FEEDBACK_ATTRIBS_NV = 0x8C7E;
			const GLenum GL_TRANSFORM_FEEDBACK_BUFFER_MODE_NV = 0x8C7F;
			const GLenum GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS_NV = 0x8C80;
			const GLenum GL_ACTIVE_VARYINGS_NV = 0x8C81;
			const GLenum GL_ACTIVE_VARYING_MAX_LENGTH_NV = 0x8C82;
			const GLenum GL_TRANSFORM_FEEDBACK_VARYINGS_NV = 0x8C83;
			const GLenum GL_TRANSFORM_FEEDBACK_BUFFER_START_NV = 0x8C84;
			const GLenum GL_TRANSFORM_FEEDBACK_BUFFER_SIZE_NV = 0x8C85;
			const GLenum GL_TRANSFORM_FEEDBACK_RECORD_NV = 0x8C86;
			const GLenum GL_PRIMITIVES_GENERATED_NV = 0x8C87;
			const GLenum GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN_NV = 0x8C88;
			const GLenum GL_RASTERIZER_DISCARD_NV = 0x8C89;
			const GLenum GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS_NV = 0x8C8A;
			const GLenum GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS_NV = 0x8C8B;
			const GLenum GL_INTERLEAVED_ATTRIBS_NV = 0x8C8C;
			const GLenum GL_SEPARATE_ATTRIBS_NV = 0x8C8D;
			const GLenum GL_TRANSFORM_FEEDBACK_BUFFER_NV = 0x8C8E;
			const GLenum GL_TRANSFORM_FEEDBACK_BUFFER_BINDING_NV = 0x8C8F;
	}
	private {
		extern (System) {
			alias void function (GLenum primitiveMode)	fp_glBeginTransformFeedbackNV;
			alias void function ()	fp_glEndTransformFeedbackNV;
			alias void function (GLuint count,  GLint *attribs, GLenum bufferMode)	fp_glTransformFeedbackAttribsNV;
			alias void function (GLenum target, GLuint index, GLuint buffer, GLintptr offset, GLsizeiptr size)	fp_glBindBufferRangeNV;
			alias void function (GLenum target, GLuint index, GLuint buffer, GLintptr offset)	fp_glBindBufferOffsetNV;
			alias void function (GLenum target, GLuint index, GLuint buffer)	fp_glBindBufferBaseNV;
			alias void function (GLuint program, GLsizei count,  GLint *locations, GLenum bufferMode)	fp_glTransformFeedbackVaryingsNV;
			alias void function (GLuint program,  GLchar *name)	fp_glActiveVaryingNV;
			alias GLint function (GLuint program,  GLchar *name)	fp_glGetVaryingLocationNV;
			alias void function (GLuint program, GLuint index, GLsizei bufSize, GLsizei *length, GLsizei *size, GLenum *type, GLchar *name)	fp_glGetActiveVaryingNV;
			alias void function (GLuint program, GLuint index, GLint *location)	fp_glGetTransformFeedbackVaryingNV;
		}
	}
	public {
void BeginTransformFeedback(GL gl_, ParameterTypeTuple!(fp_glBeginTransformFeedbackNV) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBeginTransformFeedbackNV)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "BeginTransformFeedback", funcPtr, params__);
		}
void EndTransformFeedback(GL gl_, ParameterTypeTuple!(fp_glEndTransformFeedbackNV) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glEndTransformFeedbackNV)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "EndTransformFeedback", funcPtr, params__);
		}
void TransformFeedbackAttribs(GL gl_, ParameterTypeTuple!(fp_glTransformFeedbackAttribsNV) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTransformFeedbackAttribsNV)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "TransformFeedbackAttribs", funcPtr, params__);
		}
void BindBufferRange(GL gl_, ParameterTypeTuple!(fp_glBindBufferRangeNV) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBindBufferRangeNV)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "BindBufferRange", funcPtr, params__);
		}
void BindBufferOffset(GL gl_, ParameterTypeTuple!(fp_glBindBufferOffsetNV) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBindBufferOffsetNV)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "BindBufferOffset", funcPtr, params__);
		}
void BindBufferBase(GL gl_, ParameterTypeTuple!(fp_glBindBufferBaseNV) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBindBufferBaseNV)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "BindBufferBase", funcPtr, params__);
		}
void TransformFeedbackVaryings(GL gl_, ParameterTypeTuple!(fp_glTransformFeedbackVaryingsNV) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTransformFeedbackVaryingsNV)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "TransformFeedbackVaryings", funcPtr, params__);
		}
void ActiveVarying(GL gl_, ParameterTypeTuple!(fp_glActiveVaryingNV) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glActiveVaryingNV)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "ActiveVarying", funcPtr, params__);
		}
GLint GetVaryingLocation(GL gl_, ParameterTypeTuple!(fp_glGetVaryingLocationNV) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetVaryingLocationNV)(gl.extFuncs[extensionId__][8]);
			return checkedCall(gl_, "GetVaryingLocation", funcPtr, params__);
		}
void GetActiveVarying(GL gl_, ParameterTypeTuple!(fp_glGetActiveVaryingNV) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetActiveVaryingNV)(gl.extFuncs[extensionId__][9]);
			return checkedCall(gl_, "GetActiveVarying", funcPtr, params__);
		}
void GetTransformFeedbackVarying(GL gl_, ParameterTypeTuple!(fp_glGetTransformFeedbackVaryingNV) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetTransformFeedbackVaryingNV)(gl.extFuncs[extensionId__][10]);
			return checkedCall(gl_, "GetTransformFeedbackVarying", funcPtr, params__);
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
		void*[] funcAddr = new void*[11];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_NV_transform_feedback")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glBeginTransformFeedbackNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glEndTransformFeedbackNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glTransformFeedbackAttribsNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glBindBufferRangeNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glBindBufferOffsetNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glBindBufferBaseNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glTransformFeedbackVaryingsNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glActiveVaryingNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[8] = getExtensionFuncPtr(cast(char*)"glGetVaryingLocationNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[9] = getExtensionFuncPtr(cast(char*)"glGetActiveVaryingNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[10] = getExtensionFuncPtr(cast(char*)"glGetTransformFeedbackVaryingNV"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
