module dgl.ext.NV_evaluators;
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



private ushort extensionId__ = 323;
alias extensionId__ NV_evaluators;

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
			const GLenum GL_EVAL_2D_NV = 0x86C0;
			const GLenum GL_EVAL_TRIANGULAR_2D_NV = 0x86C1;
			const GLenum GL_MAP_TESSELLATION_NV = 0x86C2;
			const GLenum GL_MAP_ATTRIB_U_ORDER_NV = 0x86C3;
			const GLenum GL_MAP_ATTRIB_V_ORDER_NV = 0x86C4;
			const GLenum GL_EVAL_FRACTIONAL_TESSELLATION_NV = 0x86C5;
			const GLenum GL_EVAL_VERTEX_ATTRIB0_NV = 0x86C6;
			const GLenum GL_EVAL_VERTEX_ATTRIB1_NV = 0x86C7;
			const GLenum GL_EVAL_VERTEX_ATTRIB2_NV = 0x86C8;
			const GLenum GL_EVAL_VERTEX_ATTRIB3_NV = 0x86C9;
			const GLenum GL_EVAL_VERTEX_ATTRIB4_NV = 0x86CA;
			const GLenum GL_EVAL_VERTEX_ATTRIB5_NV = 0x86CB;
			const GLenum GL_EVAL_VERTEX_ATTRIB6_NV = 0x86CC;
			const GLenum GL_EVAL_VERTEX_ATTRIB7_NV = 0x86CD;
			const GLenum GL_EVAL_VERTEX_ATTRIB8_NV = 0x86CE;
			const GLenum GL_EVAL_VERTEX_ATTRIB9_NV = 0x86CF;
			const GLenum GL_EVAL_VERTEX_ATTRIB10_NV = 0x86D0;
			const GLenum GL_EVAL_VERTEX_ATTRIB11_NV = 0x86D1;
			const GLenum GL_EVAL_VERTEX_ATTRIB12_NV = 0x86D2;
			const GLenum GL_EVAL_VERTEX_ATTRIB13_NV = 0x86D3;
			const GLenum GL_EVAL_VERTEX_ATTRIB14_NV = 0x86D4;
			const GLenum GL_EVAL_VERTEX_ATTRIB15_NV = 0x86D5;
			const GLenum GL_MAX_MAP_TESSELLATION_NV = 0x86D6;
			const GLenum GL_MAX_RATIONAL_EVAL_ORDER_NV = 0x86D7;
	}
	private {
		extern (System) {
			alias void function (GLenum target, GLenum mode)	fp_glEvalMapsNV;
			alias void function (GLenum target, GLuint index, GLenum pname, GLfloat* params)	fp_glGetMapAttribParameterfvNV;
			alias void function (GLenum target, GLuint index, GLenum pname, GLint* params)	fp_glGetMapAttribParameterivNV;
			alias void function (GLenum target, GLuint index, GLenum type, GLsizei ustride, GLsizei vstride, GLboolean packed, void* points)	fp_glGetMapControlPointsNV;
			alias void function (GLenum target, GLenum pname, GLfloat* params)	fp_glGetMapParameterfvNV;
			alias void function (GLenum target, GLenum pname, GLint* params)	fp_glGetMapParameterivNV;
			alias void function (GLenum target, GLuint index, GLenum type, GLsizei ustride, GLsizei vstride, GLint uorder, GLint vorder, GLboolean packed,  void* points)	fp_glMapControlPointsNV;
			alias void function (GLenum target, GLenum pname,  GLfloat* params)	fp_glMapParameterfvNV;
			alias void function (GLenum target, GLenum pname,  GLint* params)	fp_glMapParameterivNV;
		}
	}
	public {
void EvalMaps(GL gl_, ParameterTypeTuple!(fp_glEvalMapsNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glEvalMapsNV)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "EvalMaps", funcPtr, params__);
		}
void GetMapAttribParameterfv(GL gl_, ParameterTypeTuple!(fp_glGetMapAttribParameterfvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetMapAttribParameterfvNV)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "GetMapAttribParameterfv", funcPtr, params__);
		}
void GetMapAttribParameteriv(GL gl_, ParameterTypeTuple!(fp_glGetMapAttribParameterivNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetMapAttribParameterivNV)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "GetMapAttribParameteriv", funcPtr, params__);
		}
void GetMapControlPoints(GL gl_, ParameterTypeTuple!(fp_glGetMapControlPointsNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetMapControlPointsNV)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "GetMapControlPoints", funcPtr, params__);
		}
void GetMapParameterfv(GL gl_, ParameterTypeTuple!(fp_glGetMapParameterfvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetMapParameterfvNV)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "GetMapParameterfv", funcPtr, params__);
		}
void GetMapParameteriv(GL gl_, ParameterTypeTuple!(fp_glGetMapParameterivNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetMapParameterivNV)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "GetMapParameteriv", funcPtr, params__);
		}
void MapControlPoints(GL gl_, ParameterTypeTuple!(fp_glMapControlPointsNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMapControlPointsNV)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "MapControlPoints", funcPtr, params__);
		}
void MapParameterfv(GL gl_, ParameterTypeTuple!(fp_glMapParameterfvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMapParameterfvNV)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "MapParameterfv", funcPtr, params__);
		}
void MapParameteriv(GL gl_, ParameterTypeTuple!(fp_glMapParameterivNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMapParameterivNV)(gl.extFuncs[extensionId__][8]);
			return checkedCall(gl_, "MapParameteriv", funcPtr, params__);
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
		void*[] funcAddr = new void*[9];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_NV_evaluators")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glEvalMapsNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glGetMapAttribParameterfvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glGetMapAttribParameterivNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glGetMapControlPointsNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glGetMapParameterfvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glGetMapParameterivNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glMapControlPointsNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glMapParameterfvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[8] = getExtensionFuncPtr(cast(char*)"glMapParameterivNV"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
