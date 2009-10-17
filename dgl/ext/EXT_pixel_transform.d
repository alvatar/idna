module dgl.ext.EXT_pixel_transform;
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



private ushort extensionId__ = 235;
alias extensionId__ EXT_pixel_transform;

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
			const GLenum GL_PIXEL_TRANSFORM_2D_EXT = 0x8330;
			const GLenum GL_PIXEL_MAG_FILTER_EXT = 0x8331;
			const GLenum GL_PIXEL_MIN_FILTER_EXT = 0x8332;
			const GLenum GL_PIXEL_CUBIC_WEIGHT_EXT = 0x8333;
			const GLenum GL_CUBIC_EXT = 0x8334;
			const GLenum GL_AVERAGE_EXT = 0x8335;
			const GLenum GL_PIXEL_TRANSFORM_2D_STACK_DEPTH_EXT = 0x8336;
			const GLenum GL_MAX_PIXEL_TRANSFORM_2D_STACK_DEPTH_EXT = 0x8337;
			const GLenum GL_PIXEL_TRANSFORM_2D_MATRIX_EXT = 0x8338;
	}
	private {
		extern (System) {
			alias void function (GLenum target, GLenum pname,  GLfloat* params)	fp_glGetPixelTransformParameterfvEXT;
			alias void function (GLenum target, GLenum pname,  GLint* params)	fp_glGetPixelTransformParameterivEXT;
			alias void function (GLenum target, GLenum pname,  GLfloat param)	fp_glPixelTransformParameterfEXT;
			alias void function (GLenum target, GLenum pname,  GLfloat* params)	fp_glPixelTransformParameterfvEXT;
			alias void function (GLenum target, GLenum pname,  GLint param)	fp_glPixelTransformParameteriEXT;
			alias void function (GLenum target, GLenum pname,  GLint* params)	fp_glPixelTransformParameterivEXT;
		}
	}
	public {
void GetPixelTransformParameterfv(GL gl_, ParameterTypeTuple!(fp_glGetPixelTransformParameterfvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetPixelTransformParameterfvEXT)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "GetPixelTransformParameterfv", funcPtr, params__);
		}
void GetPixelTransformParameteriv(GL gl_, ParameterTypeTuple!(fp_glGetPixelTransformParameterivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetPixelTransformParameterivEXT)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "GetPixelTransformParameteriv", funcPtr, params__);
		}
void PixelTransformParameterf(GL gl_, ParameterTypeTuple!(fp_glPixelTransformParameterfEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glPixelTransformParameterfEXT)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "PixelTransformParameterf", funcPtr, params__);
		}
void PixelTransformParameterfv(GL gl_, ParameterTypeTuple!(fp_glPixelTransformParameterfvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glPixelTransformParameterfvEXT)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "PixelTransformParameterfv", funcPtr, params__);
		}
void PixelTransformParameteri(GL gl_, ParameterTypeTuple!(fp_glPixelTransformParameteriEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glPixelTransformParameteriEXT)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "PixelTransformParameteri", funcPtr, params__);
		}
void PixelTransformParameteriv(GL gl_, ParameterTypeTuple!(fp_glPixelTransformParameterivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glPixelTransformParameterivEXT)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "PixelTransformParameteriv", funcPtr, params__);
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
			if (!extStr.containsPattern("GL_EXT_pixel_transform")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glGetPixelTransformParameterfvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glGetPixelTransformParameterivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glPixelTransformParameterfEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glPixelTransformParameterfvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glPixelTransformParameteriEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glPixelTransformParameterivEXT"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
