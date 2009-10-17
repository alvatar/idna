module dgl.ext.ARB_vertex_blend;
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



private ushort extensionId__ = 472;
alias extensionId__ ARB_vertex_blend;

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
			const GLenum GL_MAX_VERTEX_UNITS_ARB = 0x86A4;
			const GLenum GL_ACTIVE_VERTEX_UNITS_ARB = 0x86A5;
			const GLenum GL_WEIGHT_SUM_UNITY_ARB = 0x86A6;
			const GLenum GL_VERTEX_BLEND_ARB = 0x86A7;
			const GLenum GL_CURRENT_WEIGHT_ARB = 0x86A8;
			const GLenum GL_WEIGHT_ARRAY_TYPE_ARB = 0x86A9;
			const GLenum GL_WEIGHT_ARRAY_STRIDE_ARB = 0x86AA;
			const GLenum GL_WEIGHT_ARRAY_SIZE_ARB = 0x86AB;
			const GLenum GL_WEIGHT_ARRAY_POINTER_ARB = 0x86AC;
			const GLenum GL_WEIGHT_ARRAY_ARB = 0x86AD;
			const GLenum GL_MODELVIEW0_ARB = 0x1700;
			const GLenum GL_MODELVIEW1_ARB = 0x850A;
			const GLenum GL_MODELVIEW2_ARB = 0x8722;
			const GLenum GL_MODELVIEW3_ARB = 0x8723;
			const GLenum GL_MODELVIEW4_ARB = 0x8724;
			const GLenum GL_MODELVIEW5_ARB = 0x8725;
			const GLenum GL_MODELVIEW6_ARB = 0x8726;
			const GLenum GL_MODELVIEW7_ARB = 0x8727;
			const GLenum GL_MODELVIEW8_ARB = 0x8728;
			const GLenum GL_MODELVIEW9_ARB = 0x8729;
			const GLenum GL_MODELVIEW10_ARB = 0x872A;
			const GLenum GL_MODELVIEW11_ARB = 0x872B;
			const GLenum GL_MODELVIEW12_ARB = 0x872C;
			const GLenum GL_MODELVIEW13_ARB = 0x872D;
			const GLenum GL_MODELVIEW14_ARB = 0x872E;
			const GLenum GL_MODELVIEW15_ARB = 0x872F;
			const GLenum GL_MODELVIEW16_ARB = 0x8730;
			const GLenum GL_MODELVIEW17_ARB = 0x8731;
			const GLenum GL_MODELVIEW18_ARB = 0x8732;
			const GLenum GL_MODELVIEW19_ARB = 0x8733;
			const GLenum GL_MODELVIEW20_ARB = 0x8734;
			const GLenum GL_MODELVIEW21_ARB = 0x8735;
			const GLenum GL_MODELVIEW22_ARB = 0x8736;
			const GLenum GL_MODELVIEW23_ARB = 0x8737;
			const GLenum GL_MODELVIEW24_ARB = 0x8738;
			const GLenum GL_MODELVIEW25_ARB = 0x8739;
			const GLenum GL_MODELVIEW26_ARB = 0x873A;
			const GLenum GL_MODELVIEW27_ARB = 0x873B;
			const GLenum GL_MODELVIEW28_ARB = 0x873C;
			const GLenum GL_MODELVIEW29_ARB = 0x873D;
			const GLenum GL_MODELVIEW30_ARB = 0x873E;
			const GLenum GL_MODELVIEW31_ARB = 0x873F;
	}
	private {
		extern (System) {
			alias void function (GLint size, GLbyte *weights)	fp_glWeightbvARB;
			alias void function (GLint size, GLshort *weights)	fp_glWeightsvARB;
			alias void function (GLint size, GLint *weights)	fp_glWeightivARB;
			alias void function (GLint size, GLfloat *weights)	fp_glWeightfvARB;
			alias void function (GLint size, GLdouble *weights)	fp_glWeightdvARB;
			alias void function (GLint size, GLubyte *weights)	fp_glWeightubvARB;
			alias void function (GLint size, GLushort *weights)	fp_glWeightusvARB;
			alias void function (GLint size, GLuint *weights)	fp_glWeightuivARB;
			alias void function (GLint size, GLenum type, GLsizei stride, GLvoid *pointer)	fp_glWeightPointerARB;
			alias void function (GLint count)	fp_glVertexBlendARB;
		}
	}
	public {
void Weightbv(GL gl_, ParameterTypeTuple!(fp_glWeightbvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWeightbvARB)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "Weightbv", funcPtr, params__);
		}
void Weightsv(GL gl_, ParameterTypeTuple!(fp_glWeightsvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWeightsvARB)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "Weightsv", funcPtr, params__);
		}
void Weightiv(GL gl_, ParameterTypeTuple!(fp_glWeightivARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWeightivARB)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "Weightiv", funcPtr, params__);
		}
void Weightfv(GL gl_, ParameterTypeTuple!(fp_glWeightfvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWeightfvARB)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "Weightfv", funcPtr, params__);
		}
void Weightdv(GL gl_, ParameterTypeTuple!(fp_glWeightdvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWeightdvARB)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "Weightdv", funcPtr, params__);
		}
void Weightubv(GL gl_, ParameterTypeTuple!(fp_glWeightubvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWeightubvARB)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "Weightubv", funcPtr, params__);
		}
void Weightusv(GL gl_, ParameterTypeTuple!(fp_glWeightusvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWeightusvARB)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "Weightusv", funcPtr, params__);
		}
void Weightuiv(GL gl_, ParameterTypeTuple!(fp_glWeightuivARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWeightuivARB)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "Weightuiv", funcPtr, params__);
		}
void WeightPointer(GL gl_, ParameterTypeTuple!(fp_glWeightPointerARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWeightPointerARB)(gl.extFuncs[extensionId__][8]);
			return checkedCall(gl_, "WeightPointer", funcPtr, params__);
		}
void VertexBlend(GL gl_, ParameterTypeTuple!(fp_glVertexBlendARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexBlendARB)(gl.extFuncs[extensionId__][9]);
			return checkedCall(gl_, "VertexBlend", funcPtr, params__);
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
		void*[] funcAddr = new void*[10];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_ARB_vertex_blend")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glWeightbvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glWeightsvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glWeightivARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glWeightfvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glWeightdvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glWeightubvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glWeightusvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glWeightuivARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[8] = getExtensionFuncPtr(cast(char*)"glWeightPointerARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[9] = getExtensionFuncPtr(cast(char*)"glVertexBlendARB"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
