module dgl.ext.NV_present_video;
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



private ushort extensionId__ = 248;
alias extensionId__ NV_present_video;

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
			const GLenum GL_FRAME_NV = 0x8E26;
			const GLenum GL_FIELDS_NV = 0x8E27;
			const GLenum GL_CURRENT_TIME_NV = 0x8E28;
			const GLenum GL_NUM_FILL_STREAMS_NV = 0x8E29;
			const GLenum GL_PRESENT_TIME_NV = 0x8E2A;
			const GLenum GL_PRESENT_DURATION_NV = 0x8E2B;
	}
	private {
		extern (System) {
			alias void function (GLuint video_slot, GLenum pname, GLint64EXT* params)	fp_glGetVideoi64vNV;
			alias void function (GLuint video_slot, GLenum pname, GLint* params)	fp_glGetVideoivNV;
			alias void function (GLuint video_slot, GLenum pname, GLuint64EXT* params)	fp_glGetVideoui64vNV;
			alias void function (GLuint video_slot, GLenum pname, GLuint* params)	fp_glGetVideouivNV;
			alias void function (GLuint video_slot, GLuint64EXT minPresentTime, GLuint beginPresentTimeId, GLuint presentDurationId, GLenum type, GLenum target0, GLuint fill0, GLenum target1, GLuint fill1, GLenum target2, GLuint fill2, GLenum target3, GLuint fill3)	fp_glPresentFrameDualFillNV;
			alias void function (GLuint video_slot, GLuint64EXT minPresentTime, GLuint beginPresentTimeId, GLuint presentDurationId, GLenum type, GLenum target0, GLuint fill0, GLuint key0, GLenum target1, GLuint fill1, GLuint key1)	fp_glPresentFrameKeyedNV;
			alias void function (GLuint video_slot, GLenum pname,  GLint* params)	fp_glVideoParameterivNV;
		}
	}
	public {
void GetVideoi64v(GL gl_, ParameterTypeTuple!(fp_glGetVideoi64vNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetVideoi64vNV)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "GetVideoi64v", funcPtr, params__);
		}
void GetVideoiv(GL gl_, ParameterTypeTuple!(fp_glGetVideoivNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetVideoivNV)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "GetVideoiv", funcPtr, params__);
		}
void GetVideoui64v(GL gl_, ParameterTypeTuple!(fp_glGetVideoui64vNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetVideoui64vNV)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "GetVideoui64v", funcPtr, params__);
		}
void GetVideouiv(GL gl_, ParameterTypeTuple!(fp_glGetVideouivNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetVideouivNV)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "GetVideouiv", funcPtr, params__);
		}
void PresentFrameDualFill(GL gl_, ParameterTypeTuple!(fp_glPresentFrameDualFillNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glPresentFrameDualFillNV)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "PresentFrameDualFill", funcPtr, params__);
		}
void PresentFrameKeyed(GL gl_, ParameterTypeTuple!(fp_glPresentFrameKeyedNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glPresentFrameKeyedNV)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "PresentFrameKeyed", funcPtr, params__);
		}
void VideoParameteriv(GL gl_, ParameterTypeTuple!(fp_glVideoParameterivNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVideoParameterivNV)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "VideoParameteriv", funcPtr, params__);
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
			if (!extStr.containsPattern("GL_NV_present_video")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glGetVideoi64vNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glGetVideoivNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glGetVideoui64vNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glGetVideouivNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glPresentFrameDualFillNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glPresentFrameKeyedNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glVideoParameterivNV"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
