module dgl.ext.EXT_vertex_shader;
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



private ushort extensionId__ = 441;
alias extensionId__ EXT_vertex_shader;

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
			const GLenum GL_VERTEX_SHADER_EXT = 0x8780;
			const GLenum GL_VERTEX_SHADER_BINDING_EXT = 0x8781;
			const GLenum GL_OP_INDEX_EXT = 0x8782;
			const GLenum GL_OP_NEGATE_EXT = 0x8783;
			const GLenum GL_OP_DOT3_EXT = 0x8784;
			const GLenum GL_OP_DOT4_EXT = 0x8785;
			const GLenum GL_OP_MUL_EXT = 0x8786;
			const GLenum GL_OP_ADD_EXT = 0x8787;
			const GLenum GL_OP_MADD_EXT = 0x8788;
			const GLenum GL_OP_FRAC_EXT = 0x8789;
			const GLenum GL_OP_MAX_EXT = 0x878A;
			const GLenum GL_OP_MIN_EXT = 0x878B;
			const GLenum GL_OP_SET_GE_EXT = 0x878C;
			const GLenum GL_OP_SET_LT_EXT = 0x878D;
			const GLenum GL_OP_CLAMP_EXT = 0x878E;
			const GLenum GL_OP_FLOOR_EXT = 0x878F;
			const GLenum GL_OP_ROUND_EXT = 0x8790;
			const GLenum GL_OP_EXP_BASE_2_EXT = 0x8791;
			const GLenum GL_OP_LOG_BASE_2_EXT = 0x8792;
			const GLenum GL_OP_POWER_EXT = 0x8793;
			const GLenum GL_OP_RECIP_EXT = 0x8794;
			const GLenum GL_OP_RECIP_SQRT_EXT = 0x8795;
			const GLenum GL_OP_SUB_EXT = 0x8796;
			const GLenum GL_OP_CROSS_PRODUCT_EXT = 0x8797;
			const GLenum GL_OP_MULTIPLY_MATRIX_EXT = 0x8798;
			const GLenum GL_OP_MOV_EXT = 0x8799;
			const GLenum GL_OUTPUT_VERTEX_EXT = 0x879A;
			const GLenum GL_OUTPUT_COLOR0_EXT = 0x879B;
			const GLenum GL_OUTPUT_COLOR1_EXT = 0x879C;
			const GLenum GL_OUTPUT_TEXTURE_COORD0_EXT = 0x879D;
			const GLenum GL_OUTPUT_TEXTURE_COORD1_EXT = 0x879E;
			const GLenum GL_OUTPUT_TEXTURE_COORD2_EXT = 0x879F;
			const GLenum GL_OUTPUT_TEXTURE_COORD3_EXT = 0x87A0;
			const GLenum GL_OUTPUT_TEXTURE_COORD4_EXT = 0x87A1;
			const GLenum GL_OUTPUT_TEXTURE_COORD5_EXT = 0x87A2;
			const GLenum GL_OUTPUT_TEXTURE_COORD6_EXT = 0x87A3;
			const GLenum GL_OUTPUT_TEXTURE_COORD7_EXT = 0x87A4;
			const GLenum GL_OUTPUT_TEXTURE_COORD8_EXT = 0x87A5;
			const GLenum GL_OUTPUT_TEXTURE_COORD9_EXT = 0x87A6;
			const GLenum GL_OUTPUT_TEXTURE_COORD10_EXT = 0x87A7;
			const GLenum GL_OUTPUT_TEXTURE_COORD11_EXT = 0x87A8;
			const GLenum GL_OUTPUT_TEXTURE_COORD12_EXT = 0x87A9;
			const GLenum GL_OUTPUT_TEXTURE_COORD13_EXT = 0x87AA;
			const GLenum GL_OUTPUT_TEXTURE_COORD14_EXT = 0x87AB;
			const GLenum GL_OUTPUT_TEXTURE_COORD15_EXT = 0x87AC;
			const GLenum GL_OUTPUT_TEXTURE_COORD16_EXT = 0x87AD;
			const GLenum GL_OUTPUT_TEXTURE_COORD17_EXT = 0x87AE;
			const GLenum GL_OUTPUT_TEXTURE_COORD18_EXT = 0x87AF;
			const GLenum GL_OUTPUT_TEXTURE_COORD19_EXT = 0x87B0;
			const GLenum GL_OUTPUT_TEXTURE_COORD20_EXT = 0x87B1;
			const GLenum GL_OUTPUT_TEXTURE_COORD21_EXT = 0x87B2;
			const GLenum GL_OUTPUT_TEXTURE_COORD22_EXT = 0x87B3;
			const GLenum GL_OUTPUT_TEXTURE_COORD23_EXT = 0x87B4;
			const GLenum GL_OUTPUT_TEXTURE_COORD24_EXT = 0x87B5;
			const GLenum GL_OUTPUT_TEXTURE_COORD25_EXT = 0x87B6;
			const GLenum GL_OUTPUT_TEXTURE_COORD26_EXT = 0x87B7;
			const GLenum GL_OUTPUT_TEXTURE_COORD27_EXT = 0x87B8;
			const GLenum GL_OUTPUT_TEXTURE_COORD28_EXT = 0x87B9;
			const GLenum GL_OUTPUT_TEXTURE_COORD29_EXT = 0x87BA;
			const GLenum GL_OUTPUT_TEXTURE_COORD30_EXT = 0x87BB;
			const GLenum GL_OUTPUT_TEXTURE_COORD31_EXT = 0x87BC;
			const GLenum GL_OUTPUT_FOG_EXT = 0x87BD;
			const GLenum GL_SCALAR_EXT = 0x87BE;
			const GLenum GL_VECTOR_EXT = 0x87BF;
			const GLenum GL_MATRIX_EXT = 0x87C0;
			const GLenum GL_VARIANT_EXT = 0x87C1;
			const GLenum GL_INVARIANT_EXT = 0x87C2;
			const GLenum GL_LOCAL_CONSTANT_EXT = 0x87C3;
			const GLenum GL_LOCAL_EXT = 0x87C4;
			const GLenum GL_MAX_VERTEX_SHADER_INSTRUCTIONS_EXT = 0x87C5;
			const GLenum GL_MAX_VERTEX_SHADER_VARIANTS_EXT = 0x87C6;
			const GLenum GL_MAX_VERTEX_SHADER_INVARIANTS_EXT = 0x87C7;
			const GLenum GL_MAX_VERTEX_SHADER_LOCAL_CONSTANTS_EXT = 0x87C8;
			const GLenum GL_MAX_VERTEX_SHADER_LOCALS_EXT = 0x87C9;
			const GLenum GL_MAX_OPTIMIZED_VERTEX_SHADER_INSTRUCTIONS_EXT = 0x87CA;
			const GLenum GL_MAX_OPTIMIZED_VERTEX_SHADER_VARIANTS_EXT = 0x87CB;
			const GLenum GL_MAX_OPTIMIZED_VERTEX_SHADER_INVARIANTS_EXT = 0x87CC;
			const GLenum GL_MAX_OPTIMIZED_VERTEX_SHADER_LOCAL_CONSTANTS_EXT = 0x87CD;
			const GLenum GL_MAX_OPTIMIZED_VERTEX_SHADER_LOCALS_EXT = 0x87CE;
			const GLenum GL_VERTEX_SHADER_INSTRUCTIONS_EXT = 0x87CF;
			const GLenum GL_VERTEX_SHADER_VARIANTS_EXT = 0x87D0;
			const GLenum GL_VERTEX_SHADER_INVARIANTS_EXT = 0x87D1;
			const GLenum GL_VERTEX_SHADER_LOCAL_CONSTANTS_EXT = 0x87D2;
			const GLenum GL_VERTEX_SHADER_LOCALS_EXT = 0x87D3;
			const GLenum GL_VERTEX_SHADER_OPTIMIZED_EXT = 0x87D4;
			const GLenum GL_X_EXT = 0x87D5;
			const GLenum GL_Y_EXT = 0x87D6;
			const GLenum GL_Z_EXT = 0x87D7;
			const GLenum GL_W_EXT = 0x87D8;
			const GLenum GL_NEGATIVE_X_EXT = 0x87D9;
			const GLenum GL_NEGATIVE_Y_EXT = 0x87DA;
			const GLenum GL_NEGATIVE_Z_EXT = 0x87DB;
			const GLenum GL_NEGATIVE_W_EXT = 0x87DC;
			const GLenum GL_ZERO_EXT = 0x87DD;
			const GLenum GL_ONE_EXT = 0x87DE;
			const GLenum GL_NEGATIVE_ONE_EXT = 0x87DF;
			const GLenum GL_NORMALIZED_RANGE_EXT = 0x87E0;
			const GLenum GL_FULL_RANGE_EXT = 0x87E1;
			const GLenum GL_CURRENT_VERTEX_EXT = 0x87E2;
			const GLenum GL_MVP_MATRIX_EXT = 0x87E3;
			const GLenum GL_VARIANT_VALUE_EXT = 0x87E4;
			const GLenum GL_VARIANT_DATATYPE_EXT = 0x87E5;
			const GLenum GL_VARIANT_ARRAY_STRIDE_EXT = 0x87E6;
			const GLenum GL_VARIANT_ARRAY_TYPE_EXT = 0x87E7;
			const GLenum GL_VARIANT_ARRAY_EXT = 0x87E8;
			const GLenum GL_VARIANT_ARRAY_POINTER_EXT = 0x87E9;
			const GLenum GL_INVARIANT_VALUE_EXT = 0x87EA;
			const GLenum GL_INVARIANT_DATATYPE_EXT = 0x87EB;
			const GLenum GL_LOCAL_CONSTANT_VALUE_EXT = 0x87EC;
			const GLenum GL_LOCAL_CONSTANT_DATATYPE_EXT = 0x87ED;
	}
	private {
		extern (System) {
			alias void function ()	fp_glBeginVertexShaderEXT;
			alias void function ()	fp_glEndVertexShaderEXT;
			alias void function (GLuint id)	fp_glBindVertexShaderEXT;
			alias GLuint function (GLuint range)	fp_glGenVertexShadersEXT;
			alias void function (GLuint id)	fp_glDeleteVertexShaderEXT;
			alias void function (GLenum op, GLuint res, GLuint arg1)	fp_glShaderOp1EXT;
			alias void function (GLenum op, GLuint res, GLuint arg1, GLuint arg2)	fp_glShaderOp2EXT;
			alias void function (GLenum op, GLuint res, GLuint arg1, GLuint arg2, GLuint arg3)	fp_glShaderOp3EXT;
			alias void function (GLuint res, GLuint in_, GLenum outX, GLenum outY, GLenum outZ, GLenum outW)	fp_glSwizzleEXT;
			alias void function (GLuint res, GLuint in_, GLenum outX, GLenum outY, GLenum outZ, GLenum outW)	fp_glWriteMaskEXT;
			alias void function (GLuint res, GLuint src, GLuint num)	fp_glInsertComponentEXT;
			alias void function (GLuint res, GLuint src, GLuint num)	fp_glExtractComponentEXT;
			alias GLuint function (GLenum dataType, GLenum storageType, GLenum range, GLuint components)	fp_glGenSymbolsEXT;
			alias void function (GLuint id, GLenum type, GLvoid *addr)	fp_glSetInvariantEXT;
			alias void function (GLuint id, GLenum type, GLvoid *addr)	fp_glSetLocalConstantEXT;
			alias void function (GLuint id, GLbyte *addr)	fp_glVariantbvEXT;
			alias void function (GLuint id, GLshort *addr)	fp_glVariantsvEXT;
			alias void function (GLuint id, GLint *addr)	fp_glVariantivEXT;
			alias void function (GLuint id, GLfloat *addr)	fp_glVariantfvEXT;
			alias void function (GLuint id, GLdouble *addr)	fp_glVariantdvEXT;
			alias void function (GLuint id, GLubyte *addr)	fp_glVariantubvEXT;
			alias void function (GLuint id, GLushort *addr)	fp_glVariantusvEXT;
			alias void function (GLuint id, GLuint *addr)	fp_glVariantuivEXT;
			alias void function (GLuint id, GLenum type, GLuint stride, GLvoid *addr)	fp_glVariantPointerEXT;
			alias void function (GLuint id)	fp_glEnableVariantClientStateEXT;
			alias void function (GLuint id)	fp_glDisableVariantClientStateEXT;
			alias GLuint function (GLenum light, GLenum value)	fp_glBindLightParameterEXT;
			alias GLuint function (GLenum face, GLenum value)	fp_glBindMaterialParameterEXT;
			alias GLuint function (GLenum unit, GLenum coord, GLenum value)	fp_glBindTexGenParameterEXT;
			alias GLuint function (GLenum unit, GLenum value)	fp_glBindTextureUnitParameterEXT;
			alias GLuint function (GLenum value)	fp_glBindParameterEXT;
			alias GLboolean function (GLuint id, GLenum cap)	fp_glIsVariantEnabledEXT;
			alias void function (GLuint id, GLenum value, GLboolean *data)	fp_glGetVariantBooleanvEXT;
			alias void function (GLuint id, GLenum value, GLint *data)	fp_glGetVariantIntegervEXT;
			alias void function (GLuint id, GLenum value, GLfloat *data)	fp_glGetVariantFloatvEXT;
			alias void function (GLuint id, GLenum value, GLvoid **data)	fp_glGetVariantPointervEXT;
			alias void function (GLuint id, GLenum value, GLboolean *data)	fp_glGetInvariantBooleanvEXT;
			alias void function (GLuint id, GLenum value, GLint *data)	fp_glGetInvariantIntegervEXT;
			alias void function (GLuint id, GLenum value, GLfloat *data)	fp_glGetInvariantFloatvEXT;
			alias void function (GLuint id, GLenum value, GLboolean *data)	fp_glGetLocalConstantBooleanvEXT;
			alias void function (GLuint id, GLenum value, GLint *data)	fp_glGetLocalConstantIntegervEXT;
			alias void function (GLuint id, GLenum value, GLfloat *data)	fp_glGetLocalConstantFloatvEXT;
		}
	}
	public {
void BeginVertexShader(GL gl_, ParameterTypeTuple!(fp_glBeginVertexShaderEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBeginVertexShaderEXT)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "BeginVertexShader", funcPtr, params__);
		}
void EndVertexShader(GL gl_, ParameterTypeTuple!(fp_glEndVertexShaderEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glEndVertexShaderEXT)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "EndVertexShader", funcPtr, params__);
		}
void BindVertexShader(GL gl_, ParameterTypeTuple!(fp_glBindVertexShaderEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBindVertexShaderEXT)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "BindVertexShader", funcPtr, params__);
		}
GLuint GenVertexShaders(GL gl_, ParameterTypeTuple!(fp_glGenVertexShadersEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGenVertexShadersEXT)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "GenVertexShaders", funcPtr, params__);
		}
void DeleteVertexShader(GL gl_, ParameterTypeTuple!(fp_glDeleteVertexShaderEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDeleteVertexShaderEXT)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "DeleteVertexShader", funcPtr, params__);
		}
void ShaderOp1(GL gl_, ParameterTypeTuple!(fp_glShaderOp1EXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glShaderOp1EXT)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "ShaderOp1", funcPtr, params__);
		}
void ShaderOp2(GL gl_, ParameterTypeTuple!(fp_glShaderOp2EXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glShaderOp2EXT)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "ShaderOp2", funcPtr, params__);
		}
void ShaderOp3(GL gl_, ParameterTypeTuple!(fp_glShaderOp3EXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glShaderOp3EXT)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "ShaderOp3", funcPtr, params__);
		}
void Swizzle(GL gl_, ParameterTypeTuple!(fp_glSwizzleEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSwizzleEXT)(gl.extFuncs[extensionId__][8]);
			return checkedCall(gl_, "Swizzle", funcPtr, params__);
		}
void WriteMask(GL gl_, ParameterTypeTuple!(fp_glWriteMaskEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glWriteMaskEXT)(gl.extFuncs[extensionId__][9]);
			return checkedCall(gl_, "WriteMask", funcPtr, params__);
		}
void InsertComponent(GL gl_, ParameterTypeTuple!(fp_glInsertComponentEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glInsertComponentEXT)(gl.extFuncs[extensionId__][10]);
			return checkedCall(gl_, "InsertComponent", funcPtr, params__);
		}
void ExtractComponent(GL gl_, ParameterTypeTuple!(fp_glExtractComponentEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glExtractComponentEXT)(gl.extFuncs[extensionId__][11]);
			return checkedCall(gl_, "ExtractComponent", funcPtr, params__);
		}
GLuint GenSymbols(GL gl_, ParameterTypeTuple!(fp_glGenSymbolsEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGenSymbolsEXT)(gl.extFuncs[extensionId__][12]);
			return checkedCall(gl_, "GenSymbols", funcPtr, params__);
		}
void SetInvariant(GL gl_, ParameterTypeTuple!(fp_glSetInvariantEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSetInvariantEXT)(gl.extFuncs[extensionId__][13]);
			return checkedCall(gl_, "SetInvariant", funcPtr, params__);
		}
void SetLocalConstant(GL gl_, ParameterTypeTuple!(fp_glSetLocalConstantEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSetLocalConstantEXT)(gl.extFuncs[extensionId__][14]);
			return checkedCall(gl_, "SetLocalConstant", funcPtr, params__);
		}
void Variantbv(GL gl_, ParameterTypeTuple!(fp_glVariantbvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVariantbvEXT)(gl.extFuncs[extensionId__][15]);
			return checkedCall(gl_, "Variantbv", funcPtr, params__);
		}
void Variantsv(GL gl_, ParameterTypeTuple!(fp_glVariantsvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVariantsvEXT)(gl.extFuncs[extensionId__][16]);
			return checkedCall(gl_, "Variantsv", funcPtr, params__);
		}
void Variantiv(GL gl_, ParameterTypeTuple!(fp_glVariantivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVariantivEXT)(gl.extFuncs[extensionId__][17]);
			return checkedCall(gl_, "Variantiv", funcPtr, params__);
		}
void Variantfv(GL gl_, ParameterTypeTuple!(fp_glVariantfvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVariantfvEXT)(gl.extFuncs[extensionId__][18]);
			return checkedCall(gl_, "Variantfv", funcPtr, params__);
		}
void Variantdv(GL gl_, ParameterTypeTuple!(fp_glVariantdvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVariantdvEXT)(gl.extFuncs[extensionId__][19]);
			return checkedCall(gl_, "Variantdv", funcPtr, params__);
		}
void Variantubv(GL gl_, ParameterTypeTuple!(fp_glVariantubvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVariantubvEXT)(gl.extFuncs[extensionId__][20]);
			return checkedCall(gl_, "Variantubv", funcPtr, params__);
		}
void Variantusv(GL gl_, ParameterTypeTuple!(fp_glVariantusvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVariantusvEXT)(gl.extFuncs[extensionId__][21]);
			return checkedCall(gl_, "Variantusv", funcPtr, params__);
		}
void Variantuiv(GL gl_, ParameterTypeTuple!(fp_glVariantuivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVariantuivEXT)(gl.extFuncs[extensionId__][22]);
			return checkedCall(gl_, "Variantuiv", funcPtr, params__);
		}
void VariantPointer(GL gl_, ParameterTypeTuple!(fp_glVariantPointerEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVariantPointerEXT)(gl.extFuncs[extensionId__][23]);
			return checkedCall(gl_, "VariantPointer", funcPtr, params__);
		}
void EnableVariantClientState(GL gl_, ParameterTypeTuple!(fp_glEnableVariantClientStateEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glEnableVariantClientStateEXT)(gl.extFuncs[extensionId__][24]);
			return checkedCall(gl_, "EnableVariantClientState", funcPtr, params__);
		}
void DisableVariantClientState(GL gl_, ParameterTypeTuple!(fp_glDisableVariantClientStateEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDisableVariantClientStateEXT)(gl.extFuncs[extensionId__][25]);
			return checkedCall(gl_, "DisableVariantClientState", funcPtr, params__);
		}
GLuint BindLightParameter(GL gl_, ParameterTypeTuple!(fp_glBindLightParameterEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBindLightParameterEXT)(gl.extFuncs[extensionId__][26]);
			return checkedCall(gl_, "BindLightParameter", funcPtr, params__);
		}
GLuint BindMaterialParameter(GL gl_, ParameterTypeTuple!(fp_glBindMaterialParameterEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBindMaterialParameterEXT)(gl.extFuncs[extensionId__][27]);
			return checkedCall(gl_, "BindMaterialParameter", funcPtr, params__);
		}
GLuint BindTexGenParameter(GL gl_, ParameterTypeTuple!(fp_glBindTexGenParameterEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBindTexGenParameterEXT)(gl.extFuncs[extensionId__][28]);
			return checkedCall(gl_, "BindTexGenParameter", funcPtr, params__);
		}
GLuint BindTextureUnitParameter(GL gl_, ParameterTypeTuple!(fp_glBindTextureUnitParameterEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBindTextureUnitParameterEXT)(gl.extFuncs[extensionId__][29]);
			return checkedCall(gl_, "BindTextureUnitParameter", funcPtr, params__);
		}
GLuint BindParameter(GL gl_, ParameterTypeTuple!(fp_glBindParameterEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBindParameterEXT)(gl.extFuncs[extensionId__][30]);
			return checkedCall(gl_, "BindParameter", funcPtr, params__);
		}
GLboolean IsVariantEnabled(GL gl_, ParameterTypeTuple!(fp_glIsVariantEnabledEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glIsVariantEnabledEXT)(gl.extFuncs[extensionId__][31]);
			return checkedCall(gl_, "IsVariantEnabled", funcPtr, params__);
		}
void GetVariantBooleanv(GL gl_, ParameterTypeTuple!(fp_glGetVariantBooleanvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetVariantBooleanvEXT)(gl.extFuncs[extensionId__][32]);
			return checkedCall(gl_, "GetVariantBooleanv", funcPtr, params__);
		}
void GetVariantIntegerv(GL gl_, ParameterTypeTuple!(fp_glGetVariantIntegervEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetVariantIntegervEXT)(gl.extFuncs[extensionId__][33]);
			return checkedCall(gl_, "GetVariantIntegerv", funcPtr, params__);
		}
void GetVariantFloatv(GL gl_, ParameterTypeTuple!(fp_glGetVariantFloatvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetVariantFloatvEXT)(gl.extFuncs[extensionId__][34]);
			return checkedCall(gl_, "GetVariantFloatv", funcPtr, params__);
		}
void GetVariantPointerv(GL gl_, ParameterTypeTuple!(fp_glGetVariantPointervEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetVariantPointervEXT)(gl.extFuncs[extensionId__][35]);
			return checkedCall(gl_, "GetVariantPointerv", funcPtr, params__);
		}
void GetInvariantBooleanv(GL gl_, ParameterTypeTuple!(fp_glGetInvariantBooleanvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetInvariantBooleanvEXT)(gl.extFuncs[extensionId__][36]);
			return checkedCall(gl_, "GetInvariantBooleanv", funcPtr, params__);
		}
void GetInvariantIntegerv(GL gl_, ParameterTypeTuple!(fp_glGetInvariantIntegervEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetInvariantIntegervEXT)(gl.extFuncs[extensionId__][37]);
			return checkedCall(gl_, "GetInvariantIntegerv", funcPtr, params__);
		}
void GetInvariantFloatv(GL gl_, ParameterTypeTuple!(fp_glGetInvariantFloatvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetInvariantFloatvEXT)(gl.extFuncs[extensionId__][38]);
			return checkedCall(gl_, "GetInvariantFloatv", funcPtr, params__);
		}
void GetLocalConstantBooleanv(GL gl_, ParameterTypeTuple!(fp_glGetLocalConstantBooleanvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetLocalConstantBooleanvEXT)(gl.extFuncs[extensionId__][39]);
			return checkedCall(gl_, "GetLocalConstantBooleanv", funcPtr, params__);
		}
void GetLocalConstantIntegerv(GL gl_, ParameterTypeTuple!(fp_glGetLocalConstantIntegervEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetLocalConstantIntegervEXT)(gl.extFuncs[extensionId__][40]);
			return checkedCall(gl_, "GetLocalConstantIntegerv", funcPtr, params__);
		}
void GetLocalConstantFloatv(GL gl_, ParameterTypeTuple!(fp_glGetLocalConstantFloatvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetLocalConstantFloatvEXT)(gl.extFuncs[extensionId__][41]);
			return checkedCall(gl_, "GetLocalConstantFloatv", funcPtr, params__);
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
		void*[] funcAddr = new void*[42];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_EXT_vertex_shader")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glBeginVertexShaderEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glEndVertexShaderEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glBindVertexShaderEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glGenVertexShadersEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glDeleteVertexShaderEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glShaderOp1EXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glShaderOp2EXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glShaderOp3EXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[8] = getExtensionFuncPtr(cast(char*)"glSwizzleEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[9] = getExtensionFuncPtr(cast(char*)"glWriteMaskEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[10] = getExtensionFuncPtr(cast(char*)"glInsertComponentEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[11] = getExtensionFuncPtr(cast(char*)"glExtractComponentEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[12] = getExtensionFuncPtr(cast(char*)"glGenSymbolsEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[13] = getExtensionFuncPtr(cast(char*)"glSetInvariantEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[14] = getExtensionFuncPtr(cast(char*)"glSetLocalConstantEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[15] = getExtensionFuncPtr(cast(char*)"glVariantbvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[16] = getExtensionFuncPtr(cast(char*)"glVariantsvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[17] = getExtensionFuncPtr(cast(char*)"glVariantivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[18] = getExtensionFuncPtr(cast(char*)"glVariantfvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[19] = getExtensionFuncPtr(cast(char*)"glVariantdvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[20] = getExtensionFuncPtr(cast(char*)"glVariantubvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[21] = getExtensionFuncPtr(cast(char*)"glVariantusvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[22] = getExtensionFuncPtr(cast(char*)"glVariantuivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[23] = getExtensionFuncPtr(cast(char*)"glVariantPointerEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[24] = getExtensionFuncPtr(cast(char*)"glEnableVariantClientStateEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[25] = getExtensionFuncPtr(cast(char*)"glDisableVariantClientStateEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[26] = getExtensionFuncPtr(cast(char*)"glBindLightParameterEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[27] = getExtensionFuncPtr(cast(char*)"glBindMaterialParameterEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[28] = getExtensionFuncPtr(cast(char*)"glBindTexGenParameterEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[29] = getExtensionFuncPtr(cast(char*)"glBindTextureUnitParameterEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[30] = getExtensionFuncPtr(cast(char*)"glBindParameterEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[31] = getExtensionFuncPtr(cast(char*)"glIsVariantEnabledEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[32] = getExtensionFuncPtr(cast(char*)"glGetVariantBooleanvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[33] = getExtensionFuncPtr(cast(char*)"glGetVariantIntegervEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[34] = getExtensionFuncPtr(cast(char*)"glGetVariantFloatvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[35] = getExtensionFuncPtr(cast(char*)"glGetVariantPointervEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[36] = getExtensionFuncPtr(cast(char*)"glGetInvariantBooleanvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[37] = getExtensionFuncPtr(cast(char*)"glGetInvariantIntegervEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[38] = getExtensionFuncPtr(cast(char*)"glGetInvariantFloatvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[39] = getExtensionFuncPtr(cast(char*)"glGetLocalConstantBooleanvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[40] = getExtensionFuncPtr(cast(char*)"glGetLocalConstantIntegervEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[41] = getExtensionFuncPtr(cast(char*)"glGetLocalConstantFloatvEXT"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
