module dgl.ext.WGL_NV_video_output;
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



private ushort extensionId__ = 380;
alias extensionId__ WGL_NV_video_output;
import dgl.ext.WGL_ARB_pbuffer;
import dgl.ext.WGL_ARB_pixel_format;

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

version (Windows) {
	public {
			const GLenum WGL_BIND_TO_VIDEO_RGB_NV = 0x20C0;
			const GLenum WGL_BIND_TO_VIDEO_RGBA_NV = 0x20C1;
			const GLenum WGL_BIND_TO_VIDEO_RGB_AND_DEPTH_NV = 0x20C2;
			const GLenum WGL_VIDEO_OUT_COLOR_NV = 0x20C3;
			const GLenum WGL_VIDEO_OUT_ALPHA_NV = 0x20C4;
			const GLenum WGL_VIDEO_OUT_DEPTH_NV = 0x20C5;
			const GLenum WGL_VIDEO_OUT_COLOR_AND_ALPHA_NV = 0x20C6;
			const GLenum WGL_VIDEO_OUT_COLOR_AND_DEPTH_NV = 0x20C7;
			const GLenum WGL_VIDEO_OUT_FRAME = 0x20C8;
			const GLenum WGL_VIDEO_OUT_FIELD_1 = 0x20C9;
			const GLenum WGL_VIDEO_OUT_FIELD_2 = 0x20CA;
			const GLenum WGL_VIDEO_OUT_STACKED_FIELDS_1_2 = 0x20CB;
			const GLenum WGL_VIDEO_OUT_STACKED_FIELDS_2_1 = 0x20CC;
			typedef HANDLE HPVIDEODEV;
	}
	private {
		extern (System) {
			alias BOOL function (HPVIDEODEV hVideoDevice, HPBUFFERARB hPbuffer, int iVideoBuffer)	fp_wglBindVideoImageNV;
			alias BOOL function (HDC hDC, int numDevices, HPVIDEODEV* hVideoDevice)	fp_wglGetVideoDeviceNV;
			alias BOOL function (HPVIDEODEV hpVideoDevice, uint* pulCounterOutputPbuffer, uint *pulCounterOutputVideo)	fp_wglGetVideoInfoNV;
			alias BOOL function (HPVIDEODEV hVideoDevice)	fp_wglReleaseVideoDeviceNV;
			alias BOOL function (HPBUFFERARB hPbuffer, int iVideoBuffer)	fp_wglReleaseVideoImageNV;
			alias BOOL function (HPBUFFERARB hPbuffer, int iBufferType, uint* pulCounterPbuffer, BOOL bBlock)	fp_wglSendPbufferToVideoNV;
		}
	}
	public {
BOOL wglBindVideoImage(GL gl_, ParameterTypeTuple!(fp_wglBindVideoImageNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglBindVideoImageNV)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "wglBindVideoImage", funcPtr, params__);
		}
BOOL wglGetVideoDevice(GL gl_, ParameterTypeTuple!(fp_wglGetVideoDeviceNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglGetVideoDeviceNV)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "wglGetVideoDevice", funcPtr, params__);
		}
BOOL wglGetVideoInfo(GL gl_, ParameterTypeTuple!(fp_wglGetVideoInfoNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglGetVideoInfoNV)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "wglGetVideoInfo", funcPtr, params__);
		}
BOOL wglReleaseVideoDevice(GL gl_, ParameterTypeTuple!(fp_wglReleaseVideoDeviceNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglReleaseVideoDeviceNV)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "wglReleaseVideoDevice", funcPtr, params__);
		}
BOOL wglReleaseVideoImage(GL gl_, ParameterTypeTuple!(fp_wglReleaseVideoImageNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglReleaseVideoImageNV)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "wglReleaseVideoImage", funcPtr, params__);
		}
BOOL wglSendPbufferToVideo(GL gl_, ParameterTypeTuple!(fp_wglSendPbufferToVideoNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglSendPbufferToVideoNV)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "wglSendPbufferToVideo", funcPtr, params__);
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
import dgl.ext.WGL_EXT_extensions_string : wglGetExtensionsString, WGL_EXT_extensions_string;
	private void*[] loadFunctions__(GL gl) {
		void*[] funcAddr = new void*[6];
		{
			string extStr;
			gl.ext(WGL_EXT_extensions_string) in {
				char* extP = wglGetExtensionsString(gl);
				version( D_Version2 ) {
					if (extP !is null) extStr = to!(string)(extP);
				} else {
					if (extP !is null) extStr = fromStringz(extP);
				}
			};
			if (!extStr.containsPattern("WGL_NV_video_output")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"wglBindVideoImageNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"wglGetVideoDeviceNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"wglGetVideoInfoNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"wglReleaseVideoDeviceNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"wglReleaseVideoImageNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"wglSendPbufferToVideoNV"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
