module dgl.ext.ATI_pn_triangles;
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



private ushort extensionId__ = 88;
alias extensionId__ ATI_pn_triangles;

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
			const GLenum GL_PN_TRIANGLES_ATI = 0x87F0;
			const GLenum GL_MAX_PN_TRIANGLES_TESSELATION_LEVEL_ATI = 0x87F1;
			const GLenum GL_PN_TRIANGLES_POINT_MODE_ATI = 0x87F2;
			const GLenum GL_PN_TRIANGLES_NORMAL_MODE_ATI = 0x87F3;
			const GLenum GL_PN_TRIANGLES_TESSELATION_LEVEL_ATI = 0x87F4;
			const GLenum GL_PN_TRIANGLES_POINT_MODE_LINEAR_ATI = 0x87F5;
			const GLenum GL_PN_TRIANGLES_POINT_MODE_CUBIC_ATI = 0x87F6;
			const GLenum GL_PN_TRIANGLES_NORMAL_MODE_LINEAR_ATI = 0x87F7;
			const GLenum GL_PN_TRIANGLES_NORMAL_MODE_QUADRATIC_ATI = 0x87F8;
	}
	private {
		extern (System) {
			alias void function (GLenum pname, GLint param)	fp_glPNTrianglesiATI;
			alias void function (GLenum pname, GLfloat param)	fp_glPNTrianglesfATI;
		}
	}
	public {
void PNTrianglesi(GL gl_, ParameterTypeTuple!(fp_glPNTrianglesiATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glPNTrianglesiATI)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "PNTrianglesi", funcPtr, params__);
		}
void PNTrianglesf(GL gl_, ParameterTypeTuple!(fp_glPNTrianglesfATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glPNTrianglesfATI)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "PNTrianglesf", funcPtr, params__);
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
		void*[] funcAddr = new void*[2];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_ATI_pn_triangles")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glPNTrianglesiATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glPNTrianglesfATI"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
