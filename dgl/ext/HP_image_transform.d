module dgl.ext.HP_image_transform;
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



private ushort extensionId__ = 228;
alias extensionId__ HP_image_transform;
import dgl.ext.EXT_texture;
import dgl.ext.SGI_color_table;

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
	}
	private {
		extern (System) {
			alias void function (GLenum target, GLenum pname,  GLfloat* params)	fp_glGetImageTransformParameterfvHP;
			alias void function (GLenum target, GLenum pname,  GLint* params)	fp_glGetImageTransformParameterivHP;
			alias void function (GLenum target, GLenum pname,  GLfloat param)	fp_glImageTransformParameterfHP;
			alias void function (GLenum target, GLenum pname,  GLfloat* params)	fp_glImageTransformParameterfvHP;
			alias void function (GLenum target, GLenum pname,  GLint param)	fp_glImageTransformParameteriHP;
			alias void function (GLenum target, GLenum pname,  GLint* params)	fp_glImageTransformParameterivHP;
		}
	}
	public {
void GetImageTransformParameterfv(GL gl_, ParameterTypeTuple!(fp_glGetImageTransformParameterfvHP) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetImageTransformParameterfvHP)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "GetImageTransformParameterfv", funcPtr, params__);
		}
void GetImageTransformParameteriv(GL gl_, ParameterTypeTuple!(fp_glGetImageTransformParameterivHP) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetImageTransformParameterivHP)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "GetImageTransformParameteriv", funcPtr, params__);
		}
void ImageTransformParameterf(GL gl_, ParameterTypeTuple!(fp_glImageTransformParameterfHP) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glImageTransformParameterfHP)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "ImageTransformParameterf", funcPtr, params__);
		}
void ImageTransformParameterfv(GL gl_, ParameterTypeTuple!(fp_glImageTransformParameterfvHP) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glImageTransformParameterfvHP)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "ImageTransformParameterfv", funcPtr, params__);
		}
void ImageTransformParameteri(GL gl_, ParameterTypeTuple!(fp_glImageTransformParameteriHP) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glImageTransformParameteriHP)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "ImageTransformParameteri", funcPtr, params__);
		}
void ImageTransformParameteriv(GL gl_, ParameterTypeTuple!(fp_glImageTransformParameterivHP) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glImageTransformParameterivHP)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "ImageTransformParameteriv", funcPtr, params__);
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
			if (!extStr.containsPattern("GL_HP_image_transform")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glGetImageTransformParameterfvHP"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glGetImageTransformParameterivHP"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glImageTransformParameterfHP"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glImageTransformParameterfvHP"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glImageTransformParameteriHP"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glImageTransformParameterivHP"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
