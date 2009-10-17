module dgl.ext.GLX_NV_video_output;
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



private ushort extensionId__ = 97;
alias extensionId__ GLX_NV_video_output;

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

version (Posix) {
	public {
			const GLenum GLX_VIDEO_OUT_COLOR_NV = 0x20C3;
			const GLenum GLX_VIDEO_OUT_ALPHA_NV = 0x20C4;
			const GLenum GLX_VIDEO_OUT_DEPTH_NV = 0x20C5;
			const GLenum GLX_VIDEO_OUT_COLOR_AND_ALPHA_NV = 0x20C6;
			const GLenum GLX_VIDEO_OUT_COLOR_AND_DEPTH_NV = 0x20C7;
			const GLenum GLX_VIDEO_OUT_FRAME_NV = 0x20C8;
			const GLenum GLX_VIDEO_OUT_FIELD_1_NV = 0x20C9;
			const GLenum GLX_VIDEO_OUT_FIELD_2_NV = 0x20CA;
			const GLenum GLX_VIDEO_OUT_STACKED_FIELDS_1_2_NV = 0x20CB;
			const GLenum GLX_VIDEO_OUT_STACKED_FIELDS_2_1_NV = 0x20CC;
	}
	private {
		extern (System) {
			alias int function (Display* dpy, GLXVideoDeviceNV VideoDevice, GLXPbuffer pbuf, int iVideoBuffer)	fp_glXBindVideoImageNV;
			alias int function (Display* dpy, int screen, int numVideoDevices, GLXVideoDeviceNV *pVideoDevice)	fp_glXGetVideoDeviceNV;
			alias int function (Display* dpy, int screen, GLXVideoDeviceNV VideoDevice, uint *pulCounterOutputPbuffer, uint *pulCounterOutputVideo)	fp_glXGetVideoInfoNV;
			alias int function (Display* dpy, int screen, GLXVideoDeviceNV VideoDevice)	fp_glXReleaseVideoDeviceNV;
			alias int function (Display* dpy, GLXPbuffer pbuf)	fp_glXReleaseVideoImageNV;
			alias int function (Display* dpy, GLXPbuffer pbuf, int iBufferType, uint *pulCounterPbuffer, GLboolean bBlock)	fp_glXSendPbufferToVideoNV;
		}
	}
	public {
int XBindVideoImage(GL gl_, ParameterTypeTuple!(fp_glXBindVideoImageNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXBindVideoImageNV)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "XBindVideoImage", funcPtr, params__);
		}
int XGetVideoDevice(GL gl_, ParameterTypeTuple!(fp_glXGetVideoDeviceNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXGetVideoDeviceNV)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "XGetVideoDevice", funcPtr, params__);
		}
int XGetVideoInfo(GL gl_, ParameterTypeTuple!(fp_glXGetVideoInfoNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXGetVideoInfoNV)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "XGetVideoInfo", funcPtr, params__);
		}
int XReleaseVideoDevice(GL gl_, ParameterTypeTuple!(fp_glXReleaseVideoDeviceNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXReleaseVideoDeviceNV)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "XReleaseVideoDevice", funcPtr, params__);
		}
int XReleaseVideoImage(GL gl_, ParameterTypeTuple!(fp_glXReleaseVideoImageNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXReleaseVideoImageNV)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "XReleaseVideoImage", funcPtr, params__);
		}
int XSendPbufferToVideo(GL gl_, ParameterTypeTuple!(fp_glXSendPbufferToVideoNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXSendPbufferToVideoNV)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "XSendPbufferToVideo", funcPtr, params__);
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
		void*[] funcAddr = new void*[6];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GLX_NV_video_output")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glXBindVideoImageNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glXGetVideoDeviceNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glXGetVideoInfoNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glXReleaseVideoDeviceNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glXReleaseVideoImageNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glXSendPbufferToVideoNV"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
