module dgl.ext.NV_register_combiners;
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



private ushort extensionId__ = 99;
alias extensionId__ NV_register_combiners;

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
			const GLenum GL_REGISTER_COMBINERS_NV = 0x8522;
			const GLenum GL_VARIABLE_A_NV = 0x8523;
			const GLenum GL_VARIABLE_B_NV = 0x8524;
			const GLenum GL_VARIABLE_C_NV = 0x8525;
			const GLenum GL_VARIABLE_D_NV = 0x8526;
			const GLenum GL_VARIABLE_E_NV = 0x8527;
			const GLenum GL_VARIABLE_F_NV = 0x8528;
			const GLenum GL_VARIABLE_G_NV = 0x8529;
			const GLenum GL_CONSTANT_COLOR0_NV = 0x852A;
			const GLenum GL_CONSTANT_COLOR1_NV = 0x852B;
			const GLenum GL_PRIMARY_COLOR_NV = 0x852C;
			const GLenum GL_SECONDARY_COLOR_NV = 0x852D;
			const GLenum GL_SPARE0_NV = 0x852E;
			const GLenum GL_SPARE1_NV = 0x852F;
			const GLenum GL_DISCARD_NV = 0x8530;
			const GLenum GL_E_TIMES_F_NV = 0x8531;
			const GLenum GL_SPARE0_PLUS_SECONDARY_COLOR_NV = 0x8532;
			const GLenum GL_UNSIGNED_IDENTITY_NV = 0x8536;
			const GLenum GL_UNSIGNED_INVERT_NV = 0x8537;
			const GLenum GL_EXPAND_NORMAL_NV = 0x8538;
			const GLenum GL_EXPAND_NEGATE_NV = 0x8539;
			const GLenum GL_HALF_BIAS_NORMAL_NV = 0x853A;
			const GLenum GL_HALF_BIAS_NEGATE_NV = 0x853B;
			const GLenum GL_SIGNED_IDENTITY_NV = 0x853C;
			const GLenum GL_SIGNED_NEGATE_NV = 0x853D;
			const GLenum GL_SCALE_BY_TWO_NV = 0x853E;
			const GLenum GL_SCALE_BY_FOUR_NV = 0x853F;
			const GLenum GL_SCALE_BY_ONE_HALF_NV = 0x8540;
			const GLenum GL_BIAS_BY_NEGATIVE_ONE_HALF_NV = 0x8541;
			const GLenum GL_COMBINER_INPUT_NV = 0x8542;
			const GLenum GL_COMBINER_MAPPING_NV = 0x8543;
			const GLenum GL_COMBINER_COMPONENT_USAGE_NV = 0x8544;
			const GLenum GL_COMBINER_AB_DOT_PRODUCT_NV = 0x8545;
			const GLenum GL_COMBINER_CD_DOT_PRODUCT_NV = 0x8546;
			const GLenum GL_COMBINER_MUX_SUM_NV = 0x8547;
			const GLenum GL_COMBINER_SCALE_NV = 0x8548;
			const GLenum GL_COMBINER_BIAS_NV = 0x8549;
			const GLenum GL_COMBINER_AB_OUTPUT_NV = 0x854A;
			const GLenum GL_COMBINER_CD_OUTPUT_NV = 0x854B;
			const GLenum GL_COMBINER_SUM_OUTPUT_NV = 0x854C;
			const GLenum GL_MAX_GENERAL_COMBINERS_NV = 0x854D;
			const GLenum GL_NUM_GENERAL_COMBINERS_NV = 0x854E;
			const GLenum GL_COLOR_SUM_CLAMP_NV = 0x854F;
			const GLenum GL_COMBINER0_NV = 0x8550;
			const GLenum GL_COMBINER1_NV = 0x8551;
			const GLenum GL_COMBINER2_NV = 0x8552;
			const GLenum GL_COMBINER3_NV = 0x8553;
			const GLenum GL_COMBINER4_NV = 0x8554;
			const GLenum GL_COMBINER5_NV = 0x8555;
			const GLenum GL_COMBINER6_NV = 0x8556;
			const GLenum GL_COMBINER7_NV = 0x8557;
	}
	private {
		extern (System) {
			alias void function (GLenum stage, GLenum portion, GLenum variable, GLenum input, GLenum mapping, GLenum componentUsage)	fp_glCombinerInputNV;
			alias void function (GLenum stage, GLenum portion, GLenum abOutput, GLenum cdOutput, GLenum sumOutput, GLenum scale, GLenum bias, GLboolean abDotProduct, GLboolean cdDotProduct, GLboolean muxSum)	fp_glCombinerOutputNV;
			alias void function (GLenum pname, GLfloat param)	fp_glCombinerParameterfNV;
			alias void function (GLenum pname,  GLfloat* params)	fp_glCombinerParameterfvNV;
			alias void function (GLenum pname, GLint param)	fp_glCombinerParameteriNV;
			alias void function (GLenum pname,  GLint* params)	fp_glCombinerParameterivNV;
			alias void function (GLenum variable, GLenum input, GLenum mapping, GLenum componentUsage)	fp_glFinalCombinerInputNV;
			alias void function (GLenum stage, GLenum portion, GLenum variable, GLenum pname, GLfloat* params)	fp_glGetCombinerInputParameterfvNV;
			alias void function (GLenum stage, GLenum portion, GLenum variable, GLenum pname, GLint* params)	fp_glGetCombinerInputParameterivNV;
			alias void function (GLenum stage, GLenum portion, GLenum pname, GLfloat* params)	fp_glGetCombinerOutputParameterfvNV;
			alias void function (GLenum stage, GLenum portion, GLenum pname, GLint* params)	fp_glGetCombinerOutputParameterivNV;
			alias void function (GLenum variable, GLenum pname, GLfloat* params)	fp_glGetFinalCombinerInputParameterfvNV;
			alias void function (GLenum variable, GLenum pname, GLint* params)	fp_glGetFinalCombinerInputParameterivNV;
		}
	}
	public {
void CombinerInput(GL gl_, ParameterTypeTuple!(fp_glCombinerInputNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCombinerInputNV)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "CombinerInput", funcPtr, params__);
		}
void CombinerOutput(GL gl_, ParameterTypeTuple!(fp_glCombinerOutputNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCombinerOutputNV)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "CombinerOutput", funcPtr, params__);
		}
void CombinerParameterf(GL gl_, ParameterTypeTuple!(fp_glCombinerParameterfNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCombinerParameterfNV)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "CombinerParameterf", funcPtr, params__);
		}
void CombinerParameterfv(GL gl_, ParameterTypeTuple!(fp_glCombinerParameterfvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCombinerParameterfvNV)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "CombinerParameterfv", funcPtr, params__);
		}
void CombinerParameteri(GL gl_, ParameterTypeTuple!(fp_glCombinerParameteriNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCombinerParameteriNV)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "CombinerParameteri", funcPtr, params__);
		}
void CombinerParameteriv(GL gl_, ParameterTypeTuple!(fp_glCombinerParameterivNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glCombinerParameterivNV)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "CombinerParameteriv", funcPtr, params__);
		}
void FinalCombinerInput(GL gl_, ParameterTypeTuple!(fp_glFinalCombinerInputNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFinalCombinerInputNV)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "FinalCombinerInput", funcPtr, params__);
		}
void GetCombinerInputParameterfv(GL gl_, ParameterTypeTuple!(fp_glGetCombinerInputParameterfvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetCombinerInputParameterfvNV)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "GetCombinerInputParameterfv", funcPtr, params__);
		}
void GetCombinerInputParameteriv(GL gl_, ParameterTypeTuple!(fp_glGetCombinerInputParameterivNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetCombinerInputParameterivNV)(gl.extFuncs[extensionId__][8]);
			return checkedCall(gl_, "GetCombinerInputParameteriv", funcPtr, params__);
		}
void GetCombinerOutputParameterfv(GL gl_, ParameterTypeTuple!(fp_glGetCombinerOutputParameterfvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetCombinerOutputParameterfvNV)(gl.extFuncs[extensionId__][9]);
			return checkedCall(gl_, "GetCombinerOutputParameterfv", funcPtr, params__);
		}
void GetCombinerOutputParameteriv(GL gl_, ParameterTypeTuple!(fp_glGetCombinerOutputParameterivNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetCombinerOutputParameterivNV)(gl.extFuncs[extensionId__][10]);
			return checkedCall(gl_, "GetCombinerOutputParameteriv", funcPtr, params__);
		}
void GetFinalCombinerInputParameterfv(GL gl_, ParameterTypeTuple!(fp_glGetFinalCombinerInputParameterfvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetFinalCombinerInputParameterfvNV)(gl.extFuncs[extensionId__][11]);
			return checkedCall(gl_, "GetFinalCombinerInputParameterfv", funcPtr, params__);
		}
void GetFinalCombinerInputParameteriv(GL gl_, ParameterTypeTuple!(fp_glGetFinalCombinerInputParameterivNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetFinalCombinerInputParameterivNV)(gl.extFuncs[extensionId__][12]);
			return checkedCall(gl_, "GetFinalCombinerInputParameteriv", funcPtr, params__);
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
		void*[] funcAddr = new void*[13];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_NV_register_combiners")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glCombinerInputNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glCombinerOutputNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glCombinerParameterfNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glCombinerParameterfvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glCombinerParameteriNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glCombinerParameterivNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glFinalCombinerInputNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glGetCombinerInputParameterfvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[8] = getExtensionFuncPtr(cast(char*)"glGetCombinerInputParameterivNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[9] = getExtensionFuncPtr(cast(char*)"glGetCombinerOutputParameterfvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[10] = getExtensionFuncPtr(cast(char*)"glGetCombinerOutputParameterivNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[11] = getExtensionFuncPtr(cast(char*)"glGetFinalCombinerInputParameterfvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[12] = getExtensionFuncPtr(cast(char*)"glGetFinalCombinerInputParameterivNV"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
