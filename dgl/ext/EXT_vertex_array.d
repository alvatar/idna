module dgl.ext.EXT_vertex_array;
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



private ushort extensionId__ = 163;
alias extensionId__ EXT_vertex_array;

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
			const GLenum GL_DOUBLE_EXT = 0x140A;
			const GLenum GL_VERTEX_ARRAY_EXT = 0x8074;
			const GLenum GL_NORMAL_ARRAY_EXT = 0x8075;
			const GLenum GL_COLOR_ARRAY_EXT = 0x8076;
			const GLenum GL_INDEX_ARRAY_EXT = 0x8077;
			const GLenum GL_TEXTURE_COORD_ARRAY_EXT = 0x8078;
			const GLenum GL_EDGE_FLAG_ARRAY_EXT = 0x8079;
			const GLenum GL_VERTEX_ARRAY_SIZE_EXT = 0x807A;
			const GLenum GL_VERTEX_ARRAY_TYPE_EXT = 0x807B;
			const GLenum GL_VERTEX_ARRAY_STRIDE_EXT = 0x807C;
			const GLenum GL_VERTEX_ARRAY_COUNT_EXT = 0x807D;
			const GLenum GL_NORMAL_ARRAY_TYPE_EXT = 0x807E;
			const GLenum GL_NORMAL_ARRAY_STRIDE_EXT = 0x807F;
			const GLenum GL_NORMAL_ARRAY_COUNT_EXT = 0x8080;
			const GLenum GL_COLOR_ARRAY_SIZE_EXT = 0x8081;
			const GLenum GL_COLOR_ARRAY_TYPE_EXT = 0x8082;
			const GLenum GL_COLOR_ARRAY_STRIDE_EXT = 0x8083;
			const GLenum GL_COLOR_ARRAY_COUNT_EXT = 0x8084;
			const GLenum GL_INDEX_ARRAY_TYPE_EXT = 0x8085;
			const GLenum GL_INDEX_ARRAY_STRIDE_EXT = 0x8086;
			const GLenum GL_INDEX_ARRAY_COUNT_EXT = 0x8087;
			const GLenum GL_TEXTURE_COORD_ARRAY_SIZE_EXT = 0x8088;
			const GLenum GL_TEXTURE_COORD_ARRAY_TYPE_EXT = 0x8089;
			const GLenum GL_TEXTURE_COORD_ARRAY_STRIDE_EXT = 0x808A;
			const GLenum GL_TEXTURE_COORD_ARRAY_COUNT_EXT = 0x808B;
			const GLenum GL_EDGE_FLAG_ARRAY_STRIDE_EXT = 0x808C;
			const GLenum GL_EDGE_FLAG_ARRAY_COUNT_EXT = 0x808D;
			const GLenum GL_VERTEX_ARRAY_POINTER_EXT = 0x808E;
			const GLenum GL_NORMAL_ARRAY_POINTER_EXT = 0x808F;
			const GLenum GL_COLOR_ARRAY_POINTER_EXT = 0x8090;
			const GLenum GL_INDEX_ARRAY_POINTER_EXT = 0x8091;
			const GLenum GL_TEXTURE_COORD_ARRAY_POINTER_EXT = 0x8092;
			const GLenum GL_EDGE_FLAG_ARRAY_POINTER_EXT = 0x8093;
	}
	private {
		extern (System) {
			alias void function (GLint i)	fp_glArrayElementEXT;
			alias void function (GLint size, GLenum type, GLsizei stride, GLsizei count,  void* pointer)	fp_glColorPointerEXT;
			alias void function (GLenum mode, GLint first, GLsizei count)	fp_glDrawArraysEXT;
			alias void function (GLsizei stride, GLsizei count,  GLboolean* pointer)	fp_glEdgeFlagPointerEXT;
			alias void function (GLenum pname, void** params)	fp_glGetPointervEXT;
			alias void function (GLenum type, GLsizei stride, GLsizei count,  void* pointer)	fp_glIndexPointerEXT;
			alias void function (GLenum type, GLsizei stride, GLsizei count,  void* pointer)	fp_glNormalPointerEXT;
			alias void function (GLint size, GLenum type, GLsizei stride, GLsizei count,  void* pointer)	fp_glTexCoordPointerEXT;
			alias void function (GLint size, GLenum type, GLsizei stride, GLsizei count,  void* pointer)	fp_glVertexPointerEXT;
		}
	}
	public {
void ArrayElement(GL gl_, ParameterTypeTuple!(fp_glArrayElementEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glArrayElementEXT)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "ArrayElement", funcPtr, params__);
		}
void ColorPointer(GL gl_, ParameterTypeTuple!(fp_glColorPointerEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glColorPointerEXT)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "ColorPointer", funcPtr, params__);
		}
void DrawArrays(GL gl_, ParameterTypeTuple!(fp_glDrawArraysEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDrawArraysEXT)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "DrawArrays", funcPtr, params__);
		}
void EdgeFlagPointer(GL gl_, ParameterTypeTuple!(fp_glEdgeFlagPointerEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glEdgeFlagPointerEXT)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "EdgeFlagPointer", funcPtr, params__);
		}
void GetPointerv(GL gl_, ParameterTypeTuple!(fp_glGetPointervEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetPointervEXT)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "GetPointerv", funcPtr, params__);
		}
void IndexPointer(GL gl_, ParameterTypeTuple!(fp_glIndexPointerEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glIndexPointerEXT)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "IndexPointer", funcPtr, params__);
		}
void NormalPointer(GL gl_, ParameterTypeTuple!(fp_glNormalPointerEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNormalPointerEXT)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "NormalPointer", funcPtr, params__);
		}
void TexCoordPointer(GL gl_, ParameterTypeTuple!(fp_glTexCoordPointerEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTexCoordPointerEXT)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "TexCoordPointer", funcPtr, params__);
		}
void VertexPointer(GL gl_, ParameterTypeTuple!(fp_glVertexPointerEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexPointerEXT)(gl.extFuncs[extensionId__][8]);
			return checkedCall(gl_, "VertexPointer", funcPtr, params__);
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
			if (!extStr.containsPattern("GL_EXT_vertex_array")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glArrayElementEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glColorPointerEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glDrawArraysEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glEdgeFlagPointerEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glGetPointervEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glIndexPointerEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glNormalPointerEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glTexCoordPointerEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[8] = getExtensionFuncPtr(cast(char*)"glVertexPointerEXT"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
