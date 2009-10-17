module dgl.ext.ARB_framebuffer_object;
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



private ushort extensionId__ = 141;
alias extensionId__ ARB_framebuffer_object;

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
			const GLenum GL_INVALID_FRAMEBUFFER_OPERATION = 0x0506;
			const GLenum GL_FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING = 0x8210;
			const GLenum GL_FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE = 0x8211;
			const GLenum GL_FRAMEBUFFER_ATTACHMENT_RED_SIZE = 0x8212;
			const GLenum GL_FRAMEBUFFER_ATTACHMENT_GREEN_SIZE = 0x8213;
			const GLenum GL_FRAMEBUFFER_ATTACHMENT_BLUE_SIZE = 0x8214;
			const GLenum GL_FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE = 0x8215;
			const GLenum GL_FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE = 0x8216;
			const GLenum GL_FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE = 0x8217;
			const GLenum GL_FRAMEBUFFER_DEFAULT = 0x8218;
			const GLenum GL_FRAMEBUFFER_UNDEFINED = 0x8219;
			const GLenum GL_DEPTH_STENCIL_ATTACHMENT = 0x821A;
			const GLenum GL_INDEX = 0x8222;
			const GLenum GL_MAX_RENDERBUFFER_SIZE = 0x84E8;
			const GLenum GL_DEPTH_STENCIL = 0x84F9;
			const GLenum GL_UNSIGNED_INT_24_8 = 0x84FA;
			const GLenum GL_DEPTH24_STENCIL8 = 0x88F0;
			const GLenum GL_TEXTURE_STENCIL_SIZE = 0x88F1;
			const GLenum GL_UNSIGNED_NORMALIZED = 0x8C17;
			const GLenum GL_SRGB = 0x8C40;
			const GLenum GL_DRAW_FRAMEBUFFER_BINDING = 0x8CA6;
			const GLenum GL_FRAMEBUFFER_BINDING = 0x8CA6;
			const GLenum GL_RENDERBUFFER_BINDING = 0x8CA7;
			const GLenum GL_READ_FRAMEBUFFER = 0x8CA8;
			const GLenum GL_DRAW_FRAMEBUFFER = 0x8CA9;
			const GLenum GL_READ_FRAMEBUFFER_BINDING = 0x8CAA;
			const GLenum GL_RENDERBUFFER_SAMPLES = 0x8CAB;
			const GLenum GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE = 0x8CD0;
			const GLenum GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME = 0x8CD1;
			const GLenum GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL = 0x8CD2;
			const GLenum GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE = 0x8CD3;
			const GLenum GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER = 0x8CD4;
			const GLenum GL_FRAMEBUFFER_COMPLETE = 0x8CD5;
			const GLenum GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT = 0x8CD6;
			const GLenum GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT = 0x8CD7;
			const GLenum GL_FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER = 0x8CDB;
			const GLenum GL_FRAMEBUFFER_INCOMPLETE_READ_BUFFER = 0x8CDC;
			const GLenum GL_FRAMEBUFFER_UNSUPPORTED = 0x8CDD;
			const GLenum GL_MAX_COLOR_ATTACHMENTS = 0x8CDF;
			const GLenum GL_COLOR_ATTACHMENT0 = 0x8CE0;
			const GLenum GL_COLOR_ATTACHMENT1 = 0x8CE1;
			const GLenum GL_COLOR_ATTACHMENT2 = 0x8CE2;
			const GLenum GL_COLOR_ATTACHMENT3 = 0x8CE3;
			const GLenum GL_COLOR_ATTACHMENT4 = 0x8CE4;
			const GLenum GL_COLOR_ATTACHMENT5 = 0x8CE5;
			const GLenum GL_COLOR_ATTACHMENT6 = 0x8CE6;
			const GLenum GL_COLOR_ATTACHMENT7 = 0x8CE7;
			const GLenum GL_COLOR_ATTACHMENT8 = 0x8CE8;
			const GLenum GL_COLOR_ATTACHMENT9 = 0x8CE9;
			const GLenum GL_COLOR_ATTACHMENT10 = 0x8CEA;
			const GLenum GL_COLOR_ATTACHMENT11 = 0x8CEB;
			const GLenum GL_COLOR_ATTACHMENT12 = 0x8CEC;
			const GLenum GL_COLOR_ATTACHMENT13 = 0x8CED;
			const GLenum GL_COLOR_ATTACHMENT14 = 0x8CEE;
			const GLenum GL_COLOR_ATTACHMENT15 = 0x8CEF;
			const GLenum GL_DEPTH_ATTACHMENT = 0x8D00;
			const GLenum GL_STENCIL_ATTACHMENT = 0x8D20;
			const GLenum GL_FRAMEBUFFER = 0x8D40;
			const GLenum GL_RENDERBUFFER = 0x8D41;
			const GLenum GL_RENDERBUFFER_WIDTH = 0x8D42;
			const GLenum GL_RENDERBUFFER_HEIGHT = 0x8D43;
			const GLenum GL_RENDERBUFFER_INTERNAL_FORMAT = 0x8D44;
			const GLenum GL_STENCIL_INDEX1 = 0x8D46;
			const GLenum GL_STENCIL_INDEX4 = 0x8D47;
			const GLenum GL_STENCIL_INDEX8 = 0x8D48;
			const GLenum GL_STENCIL_INDEX16 = 0x8D49;
			const GLenum GL_RENDERBUFFER_RED_SIZE = 0x8D50;
			const GLenum GL_RENDERBUFFER_GREEN_SIZE = 0x8D51;
			const GLenum GL_RENDERBUFFER_BLUE_SIZE = 0x8D52;
			const GLenum GL_RENDERBUFFER_ALPHA_SIZE = 0x8D53;
			const GLenum GL_RENDERBUFFER_DEPTH_SIZE = 0x8D54;
			const GLenum GL_RENDERBUFFER_STENCIL_SIZE = 0x8D55;
			const GLenum GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE = 0x8D56;
			const GLenum GL_MAX_SAMPLES = 0x8D57;
	}
	private {
		extern (System) {
			alias void function (GLenum target, GLuint framebuffer)	fp_glBindFramebuffer;
			alias void function (GLenum target, GLuint renderbuffer)	fp_glBindRenderbuffer;
			alias void function (GLint srcX0, GLint srcY0, GLint srcX1, GLint srcY1, GLint dstX0, GLint dstY0, GLint dstX1, GLint dstY1, GLbitfield mask, GLenum filter)	fp_glBlitFramebuffer;
			alias GLenum function (GLenum target)	fp_glCheckFramebufferStatus;
			alias void function (GLsizei n,  GLuint* framebuffers)	fp_glDeleteFramebuffers;
			alias void function (GLsizei n,  GLuint* renderbuffers)	fp_glDeleteRenderbuffers;
			alias void function (GLenum target, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer)	fp_glFramebufferRenderbuffer;
			alias void function (GLenum target,GLenum attachment, GLuint texture,GLint level,GLint layer)	fp_glFramebufferTexturLayer;
			alias void function (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level)	fp_glFramebufferTexture1D;
			alias void function (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level)	fp_glFramebufferTexture2D;
			alias void function (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level, GLint layer)	fp_glFramebufferTexture3D;
			alias void function (GLsizei n, GLuint* framebuffers)	fp_glGenFramebuffers;
			alias void function (GLsizei n, GLuint* renderbuffers)	fp_glGenRenderbuffers;
			alias void function (GLenum target)	fp_glGenerateMipmap;
			alias void function (GLenum target, GLenum attachment, GLenum pname, GLint* params)	fp_glGetFramebufferAttachmentParameteriv;
			alias void function (GLenum target, GLenum pname, GLint* params)	fp_glGetRenderbufferParameteriv;
			alias GLboolean function (GLuint framebuffer)	fp_glIsFramebuffer;
			alias GLboolean function (GLuint renderbuffer)	fp_glIsRenderbuffer;
			alias void function (GLenum target, GLenum internalformat, GLsizei width, GLsizei height)	fp_glRenderbufferStorage;
			alias void function (GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height)	fp_glRenderbufferStorageMultisample;
		}
	}
	public {
void BindFramebuffer(GL gl_, ParameterTypeTuple!(fp_glBindFramebuffer) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBindFramebuffer)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "BindFramebuffer", funcPtr, params__);
		}
void BindRenderbuffer(GL gl_, ParameterTypeTuple!(fp_glBindRenderbuffer) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBindRenderbuffer)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "BindRenderbuffer", funcPtr, params__);
		}
void BlitFramebuffer(GL gl_, ParameterTypeTuple!(fp_glBlitFramebuffer) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBlitFramebuffer)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "BlitFramebuffer", funcPtr, params__);
		}
GLenum CheckFramebufferStatus(GL gl_, ParameterTypeTuple!(fp_glCheckFramebufferStatus) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCheckFramebufferStatus)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "CheckFramebufferStatus", funcPtr, params__);
		}
void DeleteFramebuffers(GL gl_, ParameterTypeTuple!(fp_glDeleteFramebuffers) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDeleteFramebuffers)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "DeleteFramebuffers", funcPtr, params__);
		}
void DeleteRenderbuffers(GL gl_, ParameterTypeTuple!(fp_glDeleteRenderbuffers) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDeleteRenderbuffers)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "DeleteRenderbuffers", funcPtr, params__);
		}
void FramebufferRenderbuffer(GL gl_, ParameterTypeTuple!(fp_glFramebufferRenderbuffer) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFramebufferRenderbuffer)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "FramebufferRenderbuffer", funcPtr, params__);
		}
void FramebufferTexturLayer(GL gl_, ParameterTypeTuple!(fp_glFramebufferTexturLayer) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFramebufferTexturLayer)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "FramebufferTexturLayer", funcPtr, params__);
		}
void FramebufferTexture1D(GL gl_, ParameterTypeTuple!(fp_glFramebufferTexture1D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFramebufferTexture1D)(gl.extFuncs[extensionId__][8]);
			return checkedCall(gl_, "FramebufferTexture1D", funcPtr, params__);
		}
void FramebufferTexture2D(GL gl_, ParameterTypeTuple!(fp_glFramebufferTexture2D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFramebufferTexture2D)(gl.extFuncs[extensionId__][9]);
			return checkedCall(gl_, "FramebufferTexture2D", funcPtr, params__);
		}
void FramebufferTexture3D(GL gl_, ParameterTypeTuple!(fp_glFramebufferTexture3D) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFramebufferTexture3D)(gl.extFuncs[extensionId__][10]);
			return checkedCall(gl_, "FramebufferTexture3D", funcPtr, params__);
		}
void GenFramebuffers(GL gl_, ParameterTypeTuple!(fp_glGenFramebuffers) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGenFramebuffers)(gl.extFuncs[extensionId__][11]);
			return checkedCall(gl_, "GenFramebuffers", funcPtr, params__);
		}
void GenRenderbuffers(GL gl_, ParameterTypeTuple!(fp_glGenRenderbuffers) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGenRenderbuffers)(gl.extFuncs[extensionId__][12]);
			return checkedCall(gl_, "GenRenderbuffers", funcPtr, params__);
		}
void GenerateMipmap(GL gl_, ParameterTypeTuple!(fp_glGenerateMipmap) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGenerateMipmap)(gl.extFuncs[extensionId__][13]);
			return checkedCall(gl_, "GenerateMipmap", funcPtr, params__);
		}
void GetFramebufferAttachmentParameteriv(GL gl_, ParameterTypeTuple!(fp_glGetFramebufferAttachmentParameteriv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetFramebufferAttachmentParameteriv)(gl.extFuncs[extensionId__][14]);
			return checkedCall(gl_, "GetFramebufferAttachmentParameteriv", funcPtr, params__);
		}
void GetRenderbufferParameteriv(GL gl_, ParameterTypeTuple!(fp_glGetRenderbufferParameteriv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetRenderbufferParameteriv)(gl.extFuncs[extensionId__][15]);
			return checkedCall(gl_, "GetRenderbufferParameteriv", funcPtr, params__);
		}
GLboolean IsFramebuffer(GL gl_, ParameterTypeTuple!(fp_glIsFramebuffer) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glIsFramebuffer)(gl.extFuncs[extensionId__][16]);
			return checkedCall(gl_, "IsFramebuffer", funcPtr, params__);
		}
GLboolean IsRenderbuffer(GL gl_, ParameterTypeTuple!(fp_glIsRenderbuffer) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glIsRenderbuffer)(gl.extFuncs[extensionId__][17]);
			return checkedCall(gl_, "IsRenderbuffer", funcPtr, params__);
		}
void RenderbufferStorage(GL gl_, ParameterTypeTuple!(fp_glRenderbufferStorage) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glRenderbufferStorage)(gl.extFuncs[extensionId__][18]);
			return checkedCall(gl_, "RenderbufferStorage", funcPtr, params__);
		}
void RenderbufferStorageMultisample(GL gl_, ParameterTypeTuple!(fp_glRenderbufferStorageMultisample) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glRenderbufferStorageMultisample)(gl.extFuncs[extensionId__][19]);
			return checkedCall(gl_, "RenderbufferStorageMultisample", funcPtr, params__);
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
		void*[] funcAddr = new void*[20];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_ARB_framebuffer_object")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glBindFramebuffer"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glBindRenderbuffer"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glBlitFramebuffer"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glCheckFramebufferStatus"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glDeleteFramebuffers"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glDeleteRenderbuffers"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glFramebufferRenderbuffer"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glFramebufferTexturLayer"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[8] = getExtensionFuncPtr(cast(char*)"glFramebufferTexture1D"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[9] = getExtensionFuncPtr(cast(char*)"glFramebufferTexture2D"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[10] = getExtensionFuncPtr(cast(char*)"glFramebufferTexture3D"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[11] = getExtensionFuncPtr(cast(char*)"glGenFramebuffers"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[12] = getExtensionFuncPtr(cast(char*)"glGenRenderbuffers"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[13] = getExtensionFuncPtr(cast(char*)"glGenerateMipmap"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[14] = getExtensionFuncPtr(cast(char*)"glGetFramebufferAttachmentParameteriv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[15] = getExtensionFuncPtr(cast(char*)"glGetRenderbufferParameteriv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[16] = getExtensionFuncPtr(cast(char*)"glIsFramebuffer"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[17] = getExtensionFuncPtr(cast(char*)"glIsRenderbuffer"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[18] = getExtensionFuncPtr(cast(char*)"glRenderbufferStorage"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[19] = getExtensionFuncPtr(cast(char*)"glRenderbufferStorageMultisample"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
