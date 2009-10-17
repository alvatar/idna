module dgl.ext.EXT_vertex_weighting;
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



private ushort extensionId__ = 143;
alias extensionId__ EXT_vertex_weighting;

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
			const GLenum GL_MODELVIEW0_STACK_DEPTH_EXT = 0x0BA3;
			const GLenum GL_MODELVIEW0_MATRIX_EXT = 0x0BA6;
			const GLenum GL_MODELVIEW0_EXT = 0x1700;
			const GLenum GL_MODELVIEW1_STACK_DEPTH_EXT = 0x8502;
			const GLenum GL_MODELVIEW1_MATRIX_EXT = 0x8506;
			const GLenum GL_VERTEX_WEIGHTING_EXT = 0x8509;
			const GLenum GL_MODELVIEW1_EXT = 0x850A;
			const GLenum GL_CURRENT_VERTEX_WEIGHT_EXT = 0x850B;
			const GLenum GL_VERTEX_WEIGHT_ARRAY_EXT = 0x850C;
			const GLenum GL_VERTEX_WEIGHT_ARRAY_SIZE_EXT = 0x850D;
			const GLenum GL_VERTEX_WEIGHT_ARRAY_TYPE_EXT = 0x850E;
			const GLenum GL_VERTEX_WEIGHT_ARRAY_STRIDE_EXT = 0x850F;
			const GLenum GL_VERTEX_WEIGHT_ARRAY_POINTER_EXT = 0x8510;
	}
	private {
		extern (System) {
			alias void function (GLint size, GLenum type, GLsizei stride, void* pointer)	fp_glVertexWeightPointerEXT;
			alias void function (GLfloat weight)	fp_glVertexWeightfEXT;
			alias void function (GLfloat* weight)	fp_glVertexWeightfvEXT;
		}
	}
	public {
void VertexWeightPointer(GL gl_, ParameterTypeTuple!(fp_glVertexWeightPointerEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexWeightPointerEXT)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "VertexWeightPointer", funcPtr, params__);
		}
void VertexWeightf(GL gl_, ParameterTypeTuple!(fp_glVertexWeightfEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexWeightfEXT)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "VertexWeightf", funcPtr, params__);
		}
void VertexWeightfv(GL gl_, ParameterTypeTuple!(fp_glVertexWeightfvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexWeightfvEXT)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "VertexWeightfv", funcPtr, params__);
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
		void*[] funcAddr = new void*[3];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_EXT_vertex_weighting")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glVertexWeightPointerEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glVertexWeightfEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glVertexWeightfvEXT"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
