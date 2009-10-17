module dgl.ext.ATI_fragment_shader;
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



private ushort extensionId__ = 371;
alias extensionId__ ATI_fragment_shader;

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
			const GLenum GL_RED_BIT_ATI = 0x00000001;
			const GLenum GL_2X_BIT_ATI = 0x00000001;
			const GLenum GL_4X_BIT_ATI = 0x00000002;
			const GLenum GL_GREEN_BIT_ATI = 0x00000002;
			const GLenum GL_COMP_BIT_ATI = 0x00000002;
			const GLenum GL_BLUE_BIT_ATI = 0x00000004;
			const GLenum GL_8X_BIT_ATI = 0x00000004;
			const GLenum GL_NEGATE_BIT_ATI = 0x00000004;
			const GLenum GL_BIAS_BIT_ATI = 0x00000008;
			const GLenum GL_HALF_BIT_ATI = 0x00000008;
			const GLenum GL_QUARTER_BIT_ATI = 0x00000010;
			const GLenum GL_EIGHTH_BIT_ATI = 0x00000020;
			const GLenum GL_SATURATE_BIT_ATI = 0x00000040;
			const GLenum GL_FRAGMENT_SHADER_ATI = 0x8920;
			const GLenum GL_REG_0_ATI = 0x8921;
			const GLenum GL_REG_1_ATI = 0x8922;
			const GLenum GL_REG_2_ATI = 0x8923;
			const GLenum GL_REG_3_ATI = 0x8924;
			const GLenum GL_REG_4_ATI = 0x8925;
			const GLenum GL_REG_5_ATI = 0x8926;
			const GLenum GL_CON_0_ATI = 0x8941;
			const GLenum GL_CON_1_ATI = 0x8942;
			const GLenum GL_CON_2_ATI = 0x8943;
			const GLenum GL_CON_3_ATI = 0x8944;
			const GLenum GL_CON_4_ATI = 0x8945;
			const GLenum GL_CON_5_ATI = 0x8946;
			const GLenum GL_CON_6_ATI = 0x8947;
			const GLenum GL_CON_7_ATI = 0x8948;
			const GLenum GL_MOV_ATI = 0x8961;
			const GLenum GL_ADD_ATI = 0x8963;
			const GLenum GL_MUL_ATI = 0x8964;
			const GLenum GL_SUB_ATI = 0x8965;
			const GLenum GL_DOT3_ATI = 0x8966;
			const GLenum GL_DOT4_ATI = 0x8967;
			const GLenum GL_MAD_ATI = 0x8968;
			const GLenum GL_LERP_ATI = 0x8969;
			const GLenum GL_CND_ATI = 0x896A;
			const GLenum GL_CND0_ATI = 0x896B;
			const GLenum GL_DOT2_ADD_ATI = 0x896C;
			const GLenum GL_SECONDARY_INTERPOLATOR_ATI = 0x896D;
			const GLenum GL_SWIZZLE_STR_ATI = 0x8976;
			const GLenum GL_SWIZZLE_STQ_ATI = 0x8977;
			const GLenum GL_SWIZZLE_STR_DR_ATI = 0x8978;
			const GLenum GL_SWIZZLE_STQ_DQ_ATI = 0x8979;
			const GLenum GL_NUM_FRAGMENT_REGISTERS_ATI = 0x896E;
			const GLenum GL_NUM_FRAGMENT_CONSTANTS_ATI = 0x896F;
			const GLenum GL_NUM_PASSES_ATI = 0x8970;
			const GLenum GL_NUM_INSTRUCTIONS_PER_PASS_ATI = 0x8971;
			const GLenum GL_NUM_INSTRUCTIONS_TOTAL_ATI = 0x8972;
			const GLenum GL_NUM_INPUT_INTERPOLATOR_COMPONENTS_ATI = 0x8973;
			const GLenum GL_NUM_LOOPBACK_COMPONENTS_ATI = 0x8974;
			const GLenum GL_COLOR_ALPHA_PAIRING_ATI = 0x8975;
			const GLenum GL_SWIZZLE_STRQ_ATI = 0x897A;
			const GLenum GL_SWIZZLE_STRQ_DQ_ATI = 0x897B;
	}
	private {
		extern (System) {
			alias void function (GLenum op, GLuint dst, GLuint dstMod, GLuint arg1, GLuint arg1Rep, GLuint arg1Mod)	fp_glAlphaFragmentOp1ATI;
			alias void function (GLenum op, GLuint dst, GLuint dstMod, GLuint arg1, GLuint arg1Rep, GLuint arg1Mod, GLuint arg2, GLuint arg2Rep, GLuint arg2Mod)	fp_glAlphaFragmentOp2ATI;
			alias void function (GLenum op, GLuint dst, GLuint dstMod, GLuint arg1, GLuint arg1Rep, GLuint arg1Mod, GLuint arg2, GLuint arg2Rep, GLuint arg2Mod, GLuint arg3, GLuint arg3Rep, GLuint arg3Mod)	fp_glAlphaFragmentOp3ATI;
			alias void function ()	fp_glBeginFragmentShaderATI;
			alias void function (GLuint id)	fp_glBindFragmentShaderATI;
			alias void function (GLenum op, GLuint dst, GLuint dstMask, GLuint dstMod, GLuint arg1, GLuint arg1Rep, GLuint arg1Mod)	fp_glColorFragmentOp1ATI;
			alias void function (GLenum op, GLuint dst, GLuint dstMask, GLuint dstMod, GLuint arg1, GLuint arg1Rep, GLuint arg1Mod, GLuint arg2, GLuint arg2Rep, GLuint arg2Mod)	fp_glColorFragmentOp2ATI;
			alias void function (GLenum op, GLuint dst, GLuint dstMask, GLuint dstMod, GLuint arg1, GLuint arg1Rep, GLuint arg1Mod, GLuint arg2, GLuint arg2Rep, GLuint arg2Mod, GLuint arg3, GLuint arg3Rep, GLuint arg3Mod)	fp_glColorFragmentOp3ATI;
			alias void function (GLuint id)	fp_glDeleteFragmentShaderATI;
			alias void function ()	fp_glEndFragmentShaderATI;
			alias GLuint function (GLuint range)	fp_glGenFragmentShadersATI;
			alias void function (GLuint dst, GLuint coord, GLenum swizzle)	fp_glPassTexCoordATI;
			alias void function (GLuint dst, GLuint interp, GLenum swizzle)	fp_glSampleMapATI;
			alias void function (GLuint dst,  GLfloat* value)	fp_glSetFragmentShaderConstantATI;
		}
	}
	public {
void AlphaFragmentOp1(GL gl_, ParameterTypeTuple!(fp_glAlphaFragmentOp1ATI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glAlphaFragmentOp1ATI)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "AlphaFragmentOp1", funcPtr, params__);
		}
void AlphaFragmentOp2(GL gl_, ParameterTypeTuple!(fp_glAlphaFragmentOp2ATI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glAlphaFragmentOp2ATI)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "AlphaFragmentOp2", funcPtr, params__);
		}
void AlphaFragmentOp3(GL gl_, ParameterTypeTuple!(fp_glAlphaFragmentOp3ATI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glAlphaFragmentOp3ATI)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "AlphaFragmentOp3", funcPtr, params__);
		}
void BeginFragmentShader(GL gl_, ParameterTypeTuple!(fp_glBeginFragmentShaderATI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBeginFragmentShaderATI)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "BeginFragmentShader", funcPtr, params__);
		}
void BindFragmentShader(GL gl_, ParameterTypeTuple!(fp_glBindFragmentShaderATI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBindFragmentShaderATI)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "BindFragmentShader", funcPtr, params__);
		}
void ColorFragmentOp1(GL gl_, ParameterTypeTuple!(fp_glColorFragmentOp1ATI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glColorFragmentOp1ATI)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "ColorFragmentOp1", funcPtr, params__);
		}
void ColorFragmentOp2(GL gl_, ParameterTypeTuple!(fp_glColorFragmentOp2ATI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glColorFragmentOp2ATI)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "ColorFragmentOp2", funcPtr, params__);
		}
void ColorFragmentOp3(GL gl_, ParameterTypeTuple!(fp_glColorFragmentOp3ATI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glColorFragmentOp3ATI)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "ColorFragmentOp3", funcPtr, params__);
		}
void DeleteFragmentShader(GL gl_, ParameterTypeTuple!(fp_glDeleteFragmentShaderATI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDeleteFragmentShaderATI)(gl.extFuncs[extensionId__][8]);
			return checkedCall(gl_, "DeleteFragmentShader", funcPtr, params__);
		}
void EndFragmentShader(GL gl_, ParameterTypeTuple!(fp_glEndFragmentShaderATI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glEndFragmentShaderATI)(gl.extFuncs[extensionId__][9]);
			return checkedCall(gl_, "EndFragmentShader", funcPtr, params__);
		}
GLuint GenFragmentShaders(GL gl_, ParameterTypeTuple!(fp_glGenFragmentShadersATI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGenFragmentShadersATI)(gl.extFuncs[extensionId__][10]);
			return checkedCall(gl_, "GenFragmentShaders", funcPtr, params__);
		}
void PassTexCoord(GL gl_, ParameterTypeTuple!(fp_glPassTexCoordATI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glPassTexCoordATI)(gl.extFuncs[extensionId__][11]);
			return checkedCall(gl_, "PassTexCoord", funcPtr, params__);
		}
void SampleMap(GL gl_, ParameterTypeTuple!(fp_glSampleMapATI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSampleMapATI)(gl.extFuncs[extensionId__][12]);
			return checkedCall(gl_, "SampleMap", funcPtr, params__);
		}
void SetFragmentShaderConstant(GL gl_, ParameterTypeTuple!(fp_glSetFragmentShaderConstantATI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSetFragmentShaderConstantATI)(gl.extFuncs[extensionId__][13]);
			return checkedCall(gl_, "SetFragmentShaderConstant", funcPtr, params__);
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
		void*[] funcAddr = new void*[14];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_ATI_fragment_shader")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glAlphaFragmentOp1ATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glAlphaFragmentOp2ATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glAlphaFragmentOp3ATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glBeginFragmentShaderATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glBindFragmentShaderATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glColorFragmentOp1ATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glColorFragmentOp2ATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glColorFragmentOp3ATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[8] = getExtensionFuncPtr(cast(char*)"glDeleteFragmentShaderATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[9] = getExtensionFuncPtr(cast(char*)"glEndFragmentShaderATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[10] = getExtensionFuncPtr(cast(char*)"glGenFragmentShadersATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[11] = getExtensionFuncPtr(cast(char*)"glPassTexCoordATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[12] = getExtensionFuncPtr(cast(char*)"glSampleMapATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[13] = getExtensionFuncPtr(cast(char*)"glSetFragmentShaderConstantATI"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
