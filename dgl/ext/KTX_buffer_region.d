module dgl.ext.KTX_buffer_region;
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



private ushort extensionId__ = 465;
alias extensionId__ KTX_buffer_region;

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
			const GLenum GL_KTX_FRONT_REGION = 0x0;
			const GLenum GL_KTX_BACK_REGION = 0x1;
			const GLenum GL_KTX_Z_REGION = 0x2;
			const GLenum GL_KTX_STENCIL_REGION = 0x3;
	}
	private {
		extern (System) {
			alias GLuint function ()	fp_glBufferRegionEnabledEXT;
			alias GLuint function (GLenum region)	fp_glNewBufferRegionEXT;
			alias void function (GLenum region)	fp_glDeleteBufferRegionEXT;
			alias void function (GLuint region, GLint x, GLint y, GLsizei width, GLsizei height)	fp_glReadBufferRegionEXT;
			alias void function (GLuint region, GLint x, GLint y, GLsizei width, GLsizei height, GLint xDest, GLint yDest)	fp_glDrawBufferRegionEXT;
		}
	}
	public {
GLuint BufferRegionEnabled(GL gl_, ParameterTypeTuple!(fp_glBufferRegionEnabledEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBufferRegionEnabledEXT)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "BufferRegionEnabled", funcPtr, params__);
		}
GLuint NewBufferRegion(GL gl_, ParameterTypeTuple!(fp_glNewBufferRegionEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNewBufferRegionEXT)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "NewBufferRegion", funcPtr, params__);
		}
void DeleteBufferRegion(GL gl_, ParameterTypeTuple!(fp_glDeleteBufferRegionEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDeleteBufferRegionEXT)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "DeleteBufferRegion", funcPtr, params__);
		}
void ReadBufferRegion(GL gl_, ParameterTypeTuple!(fp_glReadBufferRegionEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glReadBufferRegionEXT)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "ReadBufferRegion", funcPtr, params__);
		}
void DrawBufferRegion(GL gl_, ParameterTypeTuple!(fp_glDrawBufferRegionEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDrawBufferRegionEXT)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "DrawBufferRegion", funcPtr, params__);
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
		void*[] funcAddr = new void*[5];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_KTX_buffer_region")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glBufferRegionEnabledEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glNewBufferRegionEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glDeleteBufferRegionEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glReadBufferRegionEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glDrawBufferRegionEXT"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
