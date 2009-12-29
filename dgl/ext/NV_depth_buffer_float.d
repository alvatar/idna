module dgl.ext.NV_depth_buffer_float;
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



private ushort extensionId__ = 0;
alias extensionId__ NV_depth_buffer_float;

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
			const GLenum GL_DEPTH_COMPONENT32F_NV = 0x8DAB;
			const GLenum GL_DEPTH32F_STENCIL8_NV = 0x8DAC;
			const GLenum GL_FLOAT_32_UNSIGNED_INT_24_8_REV_NV = 0x8DAD;
			const GLenum GL_DEPTH_BUFFER_FLOAT_MODE_NV = 0x8DAF;
	}
	private {
		extern (System) {
			alias void function (GLdouble zNear, GLdouble zFar)	fp_glDepthRangedNV;
			alias void function (GLdouble depth)	fp_glClearDepthdNV;
			alias void function (GLdouble zmin_, GLdouble zmax)	fp_glDepthBoundsdNV;
		}
	}
	public {
void DepthRanged(GL gl_, ParameterTypeTuple!(fp_glDepthRangedNV) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDepthRangedNV)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "DepthRanged", funcPtr, params__);
		}
void ClearDepthd(GL gl_, ParameterTypeTuple!(fp_glClearDepthdNV) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glClearDepthdNV)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "ClearDepthd", funcPtr, params__);
		}
void DepthBoundsd(GL gl_, ParameterTypeTuple!(fp_glDepthBoundsdNV) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDepthBoundsdNV)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "DepthBoundsd", funcPtr, params__);
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
		void*[] funcAddr = new void*[3];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_NV_depth_buffer_float")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glDepthRangedNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glClearDepthdNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glDepthBoundsdNV"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
