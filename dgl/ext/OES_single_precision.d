module dgl.ext.OES_single_precision;
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



private ushort extensionId__ = 153;
alias extensionId__ OES_single_precision;

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
			alias void function (GLclampd depth)	fp_glClearDepthfOES;
			alias void function (GLenum plane,  GLfloat* equation)	fp_glClipPlanefOES;
			alias void function (GLclampf n, GLclampf f)	fp_glDepthRangefOES;
			alias void function (GLfloat l, GLfloat r, GLfloat b, GLfloat t, GLfloat n, GLfloat f)	fp_glFrustumfOES;
			alias void function (GLenum plane, GLfloat* equation)	fp_glGetClipPlanefOES;
			alias void function (GLfloat l, GLfloat r, GLfloat b, GLfloat t, GLfloat n, GLfloat f)	fp_glOrthofOES;
		}
	}
	public {
void ClearDepthf(GL gl_, ParameterTypeTuple!(fp_glClearDepthfOES) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glClearDepthfOES)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "ClearDepthf", funcPtr, params__);
		}
void ClipPlanef(GL gl_, ParameterTypeTuple!(fp_glClipPlanefOES) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glClipPlanefOES)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "ClipPlanef", funcPtr, params__);
		}
void DepthRangef(GL gl_, ParameterTypeTuple!(fp_glDepthRangefOES) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDepthRangefOES)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "DepthRangef", funcPtr, params__);
		}
void Frustumf(GL gl_, ParameterTypeTuple!(fp_glFrustumfOES) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFrustumfOES)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "Frustumf", funcPtr, params__);
		}
void GetClipPlanef(GL gl_, ParameterTypeTuple!(fp_glGetClipPlanefOES) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetClipPlanefOES)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "GetClipPlanef", funcPtr, params__);
		}
void Orthof(GL gl_, ParameterTypeTuple!(fp_glOrthofOES) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glOrthofOES)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "Orthof", funcPtr, params__);
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
			if (!extStr.containsPattern("GL_OES_single_precision")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glClearDepthfOES"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glClipPlanefOES"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glDepthRangefOES"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glFrustumfOES"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glGetClipPlanefOES"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glOrthofOES"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
