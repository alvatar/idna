module dgl.ext.IBM_vertex_array_lists;
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



private ushort extensionId__ = 162;
alias extensionId__ IBM_vertex_array_lists;

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
			const GLenum GL_VERTEX_ARRAY_LIST_IBM = 103070;
			const GLenum GL_NORMAL_ARRAY_LIST_IBM = 103071;
			const GLenum GL_COLOR_ARRAY_LIST_IBM = 103072;
			const GLenum GL_INDEX_ARRAY_LIST_IBM = 103073;
			const GLenum GL_TEXTURE_COORD_ARRAY_LIST_IBM = 103074;
			const GLenum GL_EDGE_FLAG_ARRAY_LIST_IBM = 103075;
			const GLenum GL_FOG_COORDINATE_ARRAY_LIST_IBM = 103076;
			const GLenum GL_SECONDARY_COLOR_ARRAY_LIST_IBM = 103077;
			const GLenum GL_VERTEX_ARRAY_LIST_STRIDE_IBM = 103080;
			const GLenum GL_NORMAL_ARRAY_LIST_STRIDE_IBM = 103081;
			const GLenum GL_COLOR_ARRAY_LIST_STRIDE_IBM = 103082;
			const GLenum GL_INDEX_ARRAY_LIST_STRIDE_IBM = 103083;
			const GLenum GL_TEXTURE_COORD_ARRAY_LIST_STRIDE_IBM = 103084;
			const GLenum GL_EDGE_FLAG_ARRAY_LIST_STRIDE_IBM = 103085;
			const GLenum GL_FOG_COORDINATE_ARRAY_LIST_STRIDE_IBM = 103086;
			const GLenum GL_SECONDARY_COLOR_ARRAY_LIST_STRIDE_IBM = 103087;
	}
	private {
		extern (System) {
			alias void function (GLint size, GLenum type, GLint stride,  GLvoid ** pointer, GLint ptrstride)	fp_glColorPointerListIBM;
			alias void function (GLint stride,  GLboolean ** pointer, GLint ptrstride)	fp_glEdgeFlagPointerListIBM;
			alias void function (GLenum type, GLint stride,  GLvoid ** pointer, GLint ptrstride)	fp_glFogCoordPointerListIBM;
			alias void function (GLenum type, GLint stride,  GLvoid ** pointer, GLint ptrstride)	fp_glIndexPointerListIBM;
			alias void function (GLenum type, GLint stride,  GLvoid ** pointer, GLint ptrstride)	fp_glNormalPointerListIBM;
			alias void function (GLint size, GLenum type, GLint stride,  GLvoid ** pointer, GLint ptrstride)	fp_glSecondaryColorPointerListIBM;
			alias void function (GLint size, GLenum type, GLint stride,  GLvoid ** pointer, GLint ptrstride)	fp_glTexCoordPointerListIBM;
			alias void function (GLint size, GLenum type, GLint stride,  GLvoid ** pointer, GLint ptrstride)	fp_glVertexPointerListIBM;
		}
	}
	public {
void ColorPointerList(GL gl_, ParameterTypeTuple!(fp_glColorPointerListIBM) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glColorPointerListIBM)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "ColorPointerList", funcPtr, params__);
		}
void EdgeFlagPointerList(GL gl_, ParameterTypeTuple!(fp_glEdgeFlagPointerListIBM) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glEdgeFlagPointerListIBM)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "EdgeFlagPointerList", funcPtr, params__);
		}
void FogCoordPointerList(GL gl_, ParameterTypeTuple!(fp_glFogCoordPointerListIBM) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFogCoordPointerListIBM)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "FogCoordPointerList", funcPtr, params__);
		}
void IndexPointerList(GL gl_, ParameterTypeTuple!(fp_glIndexPointerListIBM) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glIndexPointerListIBM)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "IndexPointerList", funcPtr, params__);
		}
void NormalPointerList(GL gl_, ParameterTypeTuple!(fp_glNormalPointerListIBM) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNormalPointerListIBM)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "NormalPointerList", funcPtr, params__);
		}
void SecondaryColorPointerList(GL gl_, ParameterTypeTuple!(fp_glSecondaryColorPointerListIBM) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSecondaryColorPointerListIBM)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "SecondaryColorPointerList", funcPtr, params__);
		}
void TexCoordPointerList(GL gl_, ParameterTypeTuple!(fp_glTexCoordPointerListIBM) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTexCoordPointerListIBM)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "TexCoordPointerList", funcPtr, params__);
		}
void VertexPointerList(GL gl_, ParameterTypeTuple!(fp_glVertexPointerListIBM) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexPointerListIBM)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "VertexPointerList", funcPtr, params__);
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
		void*[] funcAddr = new void*[8];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_IBM_vertex_array_lists")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glColorPointerListIBM"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glEdgeFlagPointerListIBM"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glFogCoordPointerListIBM"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glIndexPointerListIBM"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glNormalPointerListIBM"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glSecondaryColorPointerListIBM"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glTexCoordPointerListIBM"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glVertexPointerListIBM"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
