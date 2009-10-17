module dgl.ext.EXT_framebuffer_object;
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



private ushort extensionId__ = 232;
alias extensionId__ EXT_framebuffer_object;

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
			const GLenum GL_INVALID_FRAMEBUFFER_OPERATION_EXT = 0x0506;
			const GLenum GL_MAX_RENDERBUFFER_SIZE_EXT = 0x84E8;
			const GLenum GL_FRAMEBUFFER_BINDING_EXT = 0x8CA6;
			const GLenum GL_RENDERBUFFER_BINDING_EXT = 0x8CA7;
			const GLenum GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE_EXT = 0x8CD0;
			const GLenum GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME_EXT = 0x8CD1;
			const GLenum GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL_EXT = 0x8CD2;
			const GLenum GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE_EXT = 0x8CD3;
			const GLenum GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_3D_ZOFFSET_EXT = 0x8CD4;
			const GLenum GL_FRAMEBUFFER_COMPLETE_EXT = 0x8CD5;
			const GLenum GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT_EXT = 0x8CD6;
			const GLenum GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT_EXT = 0x8CD7;
			const GLenum GL_FRAMEBUFFER_INCOMPLETE_DIMENSIONS_EXT = 0x8CD9;
			const GLenum GL_FRAMEBUFFER_INCOMPLETE_FORMATS_EXT = 0x8CDA;
			const GLenum GL_FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER_EXT = 0x8CDB;
			const GLenum GL_FRAMEBUFFER_INCOMPLETE_READ_BUFFER_EXT = 0x8CDC;
			const GLenum GL_FRAMEBUFFER_UNSUPPORTED_EXT = 0x8CDD;
			const GLenum GL_MAX_COLOR_ATTACHMENTS_EXT = 0x8CDF;
			const GLenum GL_COLOR_ATTACHMENT0_EXT = 0x8CE0;
			const GLenum GL_COLOR_ATTACHMENT1_EXT = 0x8CE1;
			const GLenum GL_COLOR_ATTACHMENT2_EXT = 0x8CE2;
			const GLenum GL_COLOR_ATTACHMENT3_EXT = 0x8CE3;
			const GLenum GL_COLOR_ATTACHMENT4_EXT = 0x8CE4;
			const GLenum GL_COLOR_ATTACHMENT5_EXT = 0x8CE5;
			const GLenum GL_COLOR_ATTACHMENT6_EXT = 0x8CE6;
			const GLenum GL_COLOR_ATTACHMENT7_EXT = 0x8CE7;
			const GLenum GL_COLOR_ATTACHMENT8_EXT = 0x8CE8;
			const GLenum GL_COLOR_ATTACHMENT9_EXT = 0x8CE9;
			const GLenum GL_COLOR_ATTACHMENT10_EXT = 0x8CEA;
			const GLenum GL_COLOR_ATTACHMENT11_EXT = 0x8CEB;
			const GLenum GL_COLOR_ATTACHMENT12_EXT = 0x8CEC;
			const GLenum GL_COLOR_ATTACHMENT13_EXT = 0x8CED;
			const GLenum GL_COLOR_ATTACHMENT14_EXT = 0x8CEE;
			const GLenum GL_COLOR_ATTACHMENT15_EXT = 0x8CEF;
			const GLenum GL_DEPTH_ATTACHMENT_EXT = 0x8D00;
			const GLenum GL_STENCIL_ATTACHMENT_EXT = 0x8D20;
			const GLenum GL_FRAMEBUFFER_EXT = 0x8D40;
			const GLenum GL_RENDERBUFFER_EXT = 0x8D41;
			const GLenum GL_RENDERBUFFER_WIDTH_EXT = 0x8D42;
			const GLenum GL_RENDERBUFFER_HEIGHT_EXT = 0x8D43;
			const GLenum GL_RENDERBUFFER_INTERNAL_FORMAT_EXT = 0x8D44;
			const GLenum GL_STENCIL_INDEX1_EXT = 0x8D46;
			const GLenum GL_STENCIL_INDEX4_EXT = 0x8D47;
			const GLenum GL_STENCIL_INDEX8_EXT = 0x8D48;
			const GLenum GL_STENCIL_INDEX16_EXT = 0x8D49;
			const GLenum GL_RENDERBUFFER_RED_SIZE_EXT = 0x8D50;
			const GLenum GL_RENDERBUFFER_GREEN_SIZE_EXT = 0x8D51;
			const GLenum GL_RENDERBUFFER_BLUE_SIZE_EXT = 0x8D52;
			const GLenum GL_RENDERBUFFER_ALPHA_SIZE_EXT = 0x8D53;
			const GLenum GL_RENDERBUFFER_DEPTH_SIZE_EXT = 0x8D54;
			const GLenum GL_RENDERBUFFER_STENCIL_SIZE_EXT = 0x8D55;
	}
	private {
		extern (System) {
			alias void function (GLenum target, GLuint framebuffer)	fp_glBindFramebufferEXT;
			alias void function (GLenum target, GLuint renderbuffer)	fp_glBindRenderbufferEXT;
			alias GLenum function (GLenum target)	fp_glCheckFramebufferStatusEXT;
			alias void function (GLsizei n,  GLuint* framebuffers)	fp_glDeleteFramebuffersEXT;
			alias void function (GLsizei n,  GLuint* renderbuffers)	fp_glDeleteRenderbuffersEXT;
			alias void function (GLenum target, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer)	fp_glFramebufferRenderbufferEXT;
			alias void function (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level)	fp_glFramebufferTexture1DEXT;
			alias void function (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level)	fp_glFramebufferTexture2DEXT;
			alias void function (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level, GLint zoffset)	fp_glFramebufferTexture3DEXT;
			alias void function (GLsizei n, GLuint* framebuffers)	fp_glGenFramebuffersEXT;
			alias void function (GLsizei n, GLuint* renderbuffers)	fp_glGenRenderbuffersEXT;
			alias void function (GLenum target)	fp_glGenerateMipmapEXT;
			alias void function (GLenum target, GLenum attachment, GLenum pname, GLint* params)	fp_glGetFramebufferAttachmentParameterivEXT;
			alias void function (GLenum target, GLenum pname, GLint* params)	fp_glGetRenderbufferParameterivEXT;
			alias GLboolean function (GLuint framebuffer)	fp_glIsFramebufferEXT;
			alias GLboolean function (GLuint renderbuffer)	fp_glIsRenderbufferEXT;
			alias void function (GLenum target, GLenum internalformat, GLsizei width, GLsizei height)	fp_glRenderbufferStorageEXT;
		}
	}
	public {
void BindFramebuffer(GL gl_, ParameterTypeTuple!(fp_glBindFramebufferEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBindFramebufferEXT)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "BindFramebuffer", funcPtr, params__);
		}
void BindRenderbuffer(GL gl_, ParameterTypeTuple!(fp_glBindRenderbufferEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBindRenderbufferEXT)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "BindRenderbuffer", funcPtr, params__);
		}
GLenum CheckFramebufferStatus(GL gl_, ParameterTypeTuple!(fp_glCheckFramebufferStatusEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCheckFramebufferStatusEXT)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "CheckFramebufferStatus", funcPtr, params__);
		}
void DeleteFramebuffers(GL gl_, ParameterTypeTuple!(fp_glDeleteFramebuffersEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDeleteFramebuffersEXT)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "DeleteFramebuffers", funcPtr, params__);
		}
void DeleteRenderbuffers(GL gl_, ParameterTypeTuple!(fp_glDeleteRenderbuffersEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDeleteRenderbuffersEXT)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "DeleteRenderbuffers", funcPtr, params__);
		}
void FramebufferRenderbuffer(GL gl_, ParameterTypeTuple!(fp_glFramebufferRenderbufferEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFramebufferRenderbufferEXT)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "FramebufferRenderbuffer", funcPtr, params__);
		}
void FramebufferTexture1D(GL gl_, ParameterTypeTuple!(fp_glFramebufferTexture1DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFramebufferTexture1DEXT)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "FramebufferTexture1D", funcPtr, params__);
		}
void FramebufferTexture2D(GL gl_, ParameterTypeTuple!(fp_glFramebufferTexture2DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFramebufferTexture2DEXT)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "FramebufferTexture2D", funcPtr, params__);
		}
void FramebufferTexture3D(GL gl_, ParameterTypeTuple!(fp_glFramebufferTexture3DEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFramebufferTexture3DEXT)(gl.extFuncs[extensionId__][8]);
			return checkedCall(gl_, "FramebufferTexture3D", funcPtr, params__);
		}
void GenFramebuffers(GL gl_, ParameterTypeTuple!(fp_glGenFramebuffersEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGenFramebuffersEXT)(gl.extFuncs[extensionId__][9]);
			return checkedCall(gl_, "GenFramebuffers", funcPtr, params__);
		}
void GenRenderbuffers(GL gl_, ParameterTypeTuple!(fp_glGenRenderbuffersEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGenRenderbuffersEXT)(gl.extFuncs[extensionId__][10]);
			return checkedCall(gl_, "GenRenderbuffers", funcPtr, params__);
		}
void GenerateMipmap(GL gl_, ParameterTypeTuple!(fp_glGenerateMipmapEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGenerateMipmapEXT)(gl.extFuncs[extensionId__][11]);
			return checkedCall(gl_, "GenerateMipmap", funcPtr, params__);
		}
void GetFramebufferAttachmentParameteriv(GL gl_, ParameterTypeTuple!(fp_glGetFramebufferAttachmentParameterivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetFramebufferAttachmentParameterivEXT)(gl.extFuncs[extensionId__][12]);
			return checkedCall(gl_, "GetFramebufferAttachmentParameteriv", funcPtr, params__);
		}
void GetRenderbufferParameteriv(GL gl_, ParameterTypeTuple!(fp_glGetRenderbufferParameterivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetRenderbufferParameterivEXT)(gl.extFuncs[extensionId__][13]);
			return checkedCall(gl_, "GetRenderbufferParameteriv", funcPtr, params__);
		}
GLboolean IsFramebuffer(GL gl_, ParameterTypeTuple!(fp_glIsFramebufferEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glIsFramebufferEXT)(gl.extFuncs[extensionId__][14]);
			return checkedCall(gl_, "IsFramebuffer", funcPtr, params__);
		}
GLboolean IsRenderbuffer(GL gl_, ParameterTypeTuple!(fp_glIsRenderbufferEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glIsRenderbufferEXT)(gl.extFuncs[extensionId__][15]);
			return checkedCall(gl_, "IsRenderbuffer", funcPtr, params__);
		}
void RenderbufferStorage(GL gl_, ParameterTypeTuple!(fp_glRenderbufferStorageEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glRenderbufferStorageEXT)(gl.extFuncs[extensionId__][16]);
			return checkedCall(gl_, "RenderbufferStorage", funcPtr, params__);
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
		void*[] funcAddr = new void*[17];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_EXT_framebuffer_object")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glBindFramebufferEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glBindRenderbufferEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glCheckFramebufferStatusEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glDeleteFramebuffersEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glDeleteRenderbuffersEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glFramebufferRenderbufferEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glFramebufferTexture1DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glFramebufferTexture2DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[8] = getExtensionFuncPtr(cast(char*)"glFramebufferTexture3DEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[9] = getExtensionFuncPtr(cast(char*)"glGenFramebuffersEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[10] = getExtensionFuncPtr(cast(char*)"glGenRenderbuffersEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[11] = getExtensionFuncPtr(cast(char*)"glGenerateMipmapEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[12] = getExtensionFuncPtr(cast(char*)"glGetFramebufferAttachmentParameterivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[13] = getExtensionFuncPtr(cast(char*)"glGetRenderbufferParameterivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[14] = getExtensionFuncPtr(cast(char*)"glIsFramebufferEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[15] = getExtensionFuncPtr(cast(char*)"glIsRenderbufferEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[16] = getExtensionFuncPtr(cast(char*)"glRenderbufferStorageEXT"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
