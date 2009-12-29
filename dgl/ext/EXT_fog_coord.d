module dgl.ext.EXT_fog_coord;
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



private ushort extensionId__ = 81;
alias extensionId__ EXT_fog_coord;

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
			const GLenum GL_FOG_COORDINATE_SOURCE_EXT = 0x8450;
			const GLenum GL_FOG_COORDINATE_EXT = 0x8451;
			const GLenum GL_FRAGMENT_DEPTH_EXT = 0x8452;
			const GLenum GL_CURRENT_FOG_COORDINATE_EXT = 0x8453;
			const GLenum GL_FOG_COORDINATE_ARRAY_TYPE_EXT = 0x8454;
			const GLenum GL_FOG_COORDINATE_ARRAY_STRIDE_EXT = 0x8455;
			const GLenum GL_FOG_COORDINATE_ARRAY_POINTER_EXT = 0x8456;
			const GLenum GL_FOG_COORDINATE_ARRAY_EXT = 0x8457;
	}
	private {
		extern (System) {
			alias void function (GLfloat coord)	fp_glFogCoordfEXT;
			alias void function ( GLfloat *coord)	fp_glFogCoordfvEXT;
			alias void function (GLdouble coord)	fp_glFogCoorddEXT;
			alias void function ( GLdouble *coord)	fp_glFogCoorddvEXT;
			alias void function (GLenum type, GLsizei stride,  GLvoid *pointer)	fp_glFogCoordPointerEXT;
		}
	}
	public {
void FogCoordf(GL gl_, ParameterTypeTuple!(fp_glFogCoordfEXT) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFogCoordfEXT)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "FogCoordf", funcPtr, params__);
		}
void FogCoordfv(GL gl_, ParameterTypeTuple!(fp_glFogCoordfvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFogCoordfvEXT)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "FogCoordfv", funcPtr, params__);
		}
void FogCoordd(GL gl_, ParameterTypeTuple!(fp_glFogCoorddEXT) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFogCoorddEXT)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "FogCoordd", funcPtr, params__);
		}
void FogCoorddv(GL gl_, ParameterTypeTuple!(fp_glFogCoorddvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFogCoorddvEXT)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "FogCoorddv", funcPtr, params__);
		}
void FogCoordPointer(GL gl_, ParameterTypeTuple!(fp_glFogCoordPointerEXT) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFogCoordPointerEXT)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "FogCoordPointer", funcPtr, params__);
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
		void*[] funcAddr = new void*[5];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_EXT_fog_coord")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glFogCoordfEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glFogCoordfvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glFogCoorddEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glFogCoorddvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glFogCoordPointerEXT"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
