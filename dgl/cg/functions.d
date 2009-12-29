module dgl.cg.functions;

private {
	import dgl.cg.consts;
	import dgl.cg.functionptrs;
	import dgl.glconsts;
	import dgl.exceptions;

	version( D_Version2 ) {
		import std.traits : ParameterTypeTuple, ReturnTypeOf = ReturnType;
		import std.string : Format = format;
		import std.conv;
		template ParameterTupleOf(alias dg) {
			alias ParameterTypeTuple!(dg) ParameterTupleOf;
		}
	} else {
		import tango.core.Traits : ParameterTupleOf, ReturnTypeOf;
		import tango.text.convert.Format;
		import tango.stdc.stringz : fromStringz;
		alias char[] string;
	}
}



private ReturnTypeOf!(Func) checkedCall(Func, Params ...)(string fname, Func fp, Params p) {
	version (DglCgNoErrorChecking) {
		return fp(p);
	}
	else {
		assert (fp !is null, "the function pointer is null");
		
		alias ReturnTypeOf!(Func) RetT;
		static if (is(RetT == void)) {
			fp(p);
		} else {
			RetT res = fp(p);
		}
		
		assert (fp_cgGetError !is null, "fp_cgGetError is null");
		
		CGerror error;
		if (CG_NO_ERROR != (error = fp_cgGetError())) {
			string paramsStr = `(`; {
				foreach (i, x; p) {
					if (i != 0) paramsStr ~= `, `;
					
					try {
						static if (is(typeof(x) == char*)) {
							version( D_Version2 ) {
								paramsStr ~= x is null ? "null" : ('"' ~ to!(string)(x) ~ '"');
							} else {
								paramsStr ~= x is null ? "null" : ('"' ~ fromStringz(x) ~ '"');
							}
						} else {
							paramsStr ~= Format(`{}`, x);
						}
					} catch {
						paramsStr ~= `(error)`;
					}
				}
				paramsStr ~= `)`;
			}
			
			assert (fp_cgGetErrorString !is null, "fp_cgGetErrorString is null");
			char* errStr = cast(char*)fp_cgGetErrorString(error);
			
			version( D_Version2 ) {
				string str = errStr is null ? null : to!(string)(errStr);
			} else {
				string str = errStr is null ? null : fromStringz(errStr);
			}
			
			if (CG_COMPILER_ERROR == error) {
				static if (is(Params[0] == CGcontext)) {
					char* listing = cgGetLastListing(p[0]);
					if (listing !is null) {
						version( D_Version2 ) {
							str ~= "\nProgram listing:\n\n" ~ to!(string)(listing);
						} else {
							str ~= "\nProgram listing:\n\n" ~ fromStringz(listing);
						}
					}
				} else static if (is(Params[0] == CGeffect)) {
					char* listing = cgGetLastListing(cgGetEffectContext(p[0]));
					if (listing !is null) {
						version( D_Version2 ) {
							str ~= "\nProgram listing:\n\n" ~ to!(string)(listing);
						} else {
							str ~= "\nProgram listing:\n\n" ~ fromStringz(listing);
						}
					}
				} else {
					str ~= "\nUnable to get program listing :(";
				}
			}
			
			handleCgError(fname, str is null ? Format(`code 0x{0:x}`, cast(int)error) : str, paramsStr);
		}
		
		static if (!(is(RetT == void))) {
			return res;
		}
	}
}


void handleCgError(string fname, string errorStr, string paramsStr) {
	throw new Exception(`Cg error "` ~ errorStr ~ `" in ` ~ fname ~ paramsStr);
}






void loadCgFunctions_(void* function(char*) loadFuncFromLib) {
	*cast(void**)&fp_cgSetLockingPolicy = loadFuncFromLib(cast(char*)"cgSetLockingPolicy");;
	*cast(void**)&fp_cgGetLockingPolicy = loadFuncFromLib(cast(char*)"cgGetLockingPolicy");;
	*cast(void**)&fp_cgSetSemanticCasePolicy = loadFuncFromLib(cast(char*)"cgSetSemanticCasePolicy");;
	*cast(void**)&fp_cgGetSemanticCasePolicy = loadFuncFromLib(cast(char*)"cgGetSemanticCasePolicy");;

	/*** Context functions ***/

	*cast(void**)&fp_cgCreateContext = loadFuncFromLib(cast(char*)"cgCreateContext");; 
	*cast(void**)&fp_cgDestroyContext = loadFuncFromLib(cast(char*)"cgDestroyContext");; 
	*cast(void**)&fp_cgIsContext = loadFuncFromLib(cast(char*)"cgIsContext");;
	*cast(void**)&fp_cgGetLastListing = loadFuncFromLib(cast(char*)"cgGetLastListing");;
	*cast(void**)&fp_cgSetLastListing = loadFuncFromLib(cast(char*)"cgSetLastListing");;
	*cast(void**)&fp_cgSetAutoCompile = loadFuncFromLib(cast(char*)"cgSetAutoCompile");;
	*cast(void**)&fp_cgGetAutoCompile = loadFuncFromLib(cast(char*)"cgGetAutoCompile");;
	*cast(void**)&fp_cgSetParameterSettingMode = loadFuncFromLib(cast(char*)"cgSetParameterSettingMode");;
	*cast(void**)&fp_cgGetParameterSettingMode = loadFuncFromLib(cast(char*)"cgGetParameterSettingMode");;

	/*** Program functions ***/

	*cast(void**)&fp_cgCreateProgram = loadFuncFromLib(cast(char*)"cgCreateProgram");;
	*cast(void**)&fp_cgCreateProgramFromFile = loadFuncFromLib(cast(char*)"cgCreateProgramFromFile");;
	*cast(void**)&fp_cgCopyProgram = loadFuncFromLib(cast(char*)"cgCopyProgram");; 
	*cast(void**)&fp_cgDestroyProgram = loadFuncFromLib(cast(char*)"cgDestroyProgram");; 

	*cast(void**)&fp_cgGetFirstProgram = loadFuncFromLib(cast(char*)"cgGetFirstProgram");;
	*cast(void**)&fp_cgGetNextProgram = loadFuncFromLib(cast(char*)"cgGetNextProgram");;
	*cast(void**)&fp_cgGetProgramContext = loadFuncFromLib(cast(char*)"cgGetProgramContext");;
	*cast(void**)&fp_cgIsProgram = loadFuncFromLib(cast(char*)"cgIsProgram");; 

	*cast(void**)&fp_cgCompileProgram = loadFuncFromLib(cast(char*)"cgCompileProgram");; 
	*cast(void**)&fp_cgIsProgramCompiled = loadFuncFromLib(cast(char*)"cgIsProgramCompiled");; 
	*cast(void**)&fp_cgGetProgramString = loadFuncFromLib(cast(char*)"cgGetProgramString");; 
	*cast(void**)&fp_cgGetProgramProfile = loadFuncFromLib(cast(char*)"cgGetProgramProfile");; 
	*cast(void**)&fp_cgGetProgramOptions = loadFuncFromLib(cast(char*)"cgGetProgramOptions");;
	*cast(void**)&fp_cgSetProgramProfile = loadFuncFromLib(cast(char*)"cgSetProgramProfile");;
	*cast(void**)&fp_cgGetProgramInput = loadFuncFromLib(cast(char*)"cgGetProgramInput");;
	*cast(void**)&fp_cgGetProgramOutput = loadFuncFromLib(cast(char*)"cgGetProgramOutput");;
	*cast(void**)&fp_cgSetPassProgramParameters = loadFuncFromLib(cast(char*)"cgSetPassProgramParameters");;
	*cast(void**)&fp_cgUpdateProgramParameters = loadFuncFromLib(cast(char*)"cgUpdateProgramParameters");;

	/*** Parameter functions ***/

	*cast(void**)&fp_cgCreateParameter = loadFuncFromLib(cast(char*)"cgCreateParameter");;
	*cast(void**)&fp_cgCreateParameterArray = loadFuncFromLib(cast(char*)"cgCreateParameterArray");;
	*cast(void**)&fp_cgCreateParameterMultiDimArray = loadFuncFromLib(cast(char*)"cgCreateParameterMultiDimArray");;
	*cast(void**)&fp_cgDestroyParameter = loadFuncFromLib(cast(char*)"cgDestroyParameter");;
	*cast(void**)&fp_cgConnectParameter = loadFuncFromLib(cast(char*)"cgConnectParameter");;
	*cast(void**)&fp_cgDisconnectParameter = loadFuncFromLib(cast(char*)"cgDisconnectParameter");;
	*cast(void**)&fp_cgGetConnectedParameter = loadFuncFromLib(cast(char*)"cgGetConnectedParameter");;

	*cast(void**)&fp_cgGetNumConnectedToParameters = loadFuncFromLib(cast(char*)"cgGetNumConnectedToParameters");;
	*cast(void**)&fp_cgGetConnectedToParameter = loadFuncFromLib(cast(char*)"cgGetConnectedToParameter");;

	*cast(void**)&fp_cgGetNamedParameter = loadFuncFromLib(cast(char*)"cgGetNamedParameter");;
	*cast(void**)&fp_cgGetNamedProgramParameter = loadFuncFromLib(cast(char*)"cgGetNamedProgramParameter");;

	*cast(void**)&fp_cgGetFirstParameter = loadFuncFromLib(cast(char*)"cgGetFirstParameter");;
	*cast(void**)&fp_cgGetNextParameter = loadFuncFromLib(cast(char*)"cgGetNextParameter");;
	*cast(void**)&fp_cgGetFirstLeafParameter = loadFuncFromLib(cast(char*)"cgGetFirstLeafParameter");;
	*cast(void**)&fp_cgGetNextLeafParameter = loadFuncFromLib(cast(char*)"cgGetNextLeafParameter");;

	*cast(void**)&fp_cgGetFirstStructParameter = loadFuncFromLib(cast(char*)"cgGetFirstStructParameter");;
	*cast(void**)&fp_cgGetNamedStructParameter = loadFuncFromLib(cast(char*)"cgGetNamedStructParameter");;

	*cast(void**)&fp_cgGetFirstDependentParameter = loadFuncFromLib(cast(char*)"cgGetFirstDependentParameter");;

	*cast(void**)&fp_cgGetArrayParameter = loadFuncFromLib(cast(char*)"cgGetArrayParameter");;
	*cast(void**)&fp_cgGetArrayDimension = loadFuncFromLib(cast(char*)"cgGetArrayDimension");;
	*cast(void**)&fp_cgGetArrayType = loadFuncFromLib(cast(char*)"cgGetArrayType");;
	*cast(void**)&fp_cgGetArraySize = loadFuncFromLib(cast(char*)"cgGetArraySize");;
	*cast(void**)&fp_cgGetArrayTotalSize = loadFuncFromLib(cast(char*)"cgGetArrayTotalSize");;
	*cast(void**)&fp_cgSetArraySize = loadFuncFromLib(cast(char*)"cgSetArraySize");;
	*cast(void**)&fp_cgSetMultiDimArraySize = loadFuncFromLib(cast(char*)"cgSetMultiDimArraySize");;

	*cast(void**)&fp_cgGetParameterProgram = loadFuncFromLib(cast(char*)"cgGetParameterProgram");;
	*cast(void**)&fp_cgGetParameterContext = loadFuncFromLib(cast(char*)"cgGetParameterContext");;
	*cast(void**)&fp_cgIsParameter = loadFuncFromLib(cast(char*)"cgIsParameter");;
	*cast(void**)&fp_cgGetParameterName = loadFuncFromLib(cast(char*)"cgGetParameterName");;
	*cast(void**)&fp_cgGetParameterType = loadFuncFromLib(cast(char*)"cgGetParameterType");;
	*cast(void**)&fp_cgGetParameterBaseType = loadFuncFromLib(cast(char*)"cgGetParameterBaseType");;
	*cast(void**)&fp_cgGetParameterClass = loadFuncFromLib(cast(char*)"cgGetParameterClass");;
	*cast(void**)&fp_cgGetParameterRows = loadFuncFromLib(cast(char*)"cgGetParameterRows");;
	*cast(void**)&fp_cgGetParameterColumns = loadFuncFromLib(cast(char*)"cgGetParameterColumns");;
	*cast(void**)&fp_cgGetParameterNamedType = loadFuncFromLib(cast(char*)"cgGetParameterNamedType");;
	*cast(void**)&fp_cgGetParameterSemantic = loadFuncFromLib(cast(char*)"cgGetParameterSemantic");;
	*cast(void**)&fp_cgGetParameterResource = loadFuncFromLib(cast(char*)"cgGetParameterResource");;
	*cast(void**)&fp_cgGetParameterBaseResource = loadFuncFromLib(cast(char*)"cgGetParameterBaseResource");;
	*cast(void**)&fp_cgGetParameterResourceIndex = loadFuncFromLib(cast(char*)"cgGetParameterResourceIndex");;
	*cast(void**)&fp_cgGetParameterVariability = loadFuncFromLib(cast(char*)"cgGetParameterVariability");;
	*cast(void**)&fp_cgGetParameterDirection = loadFuncFromLib(cast(char*)"cgGetParameterDirection");;
	*cast(void**)&fp_cgIsParameterReferenced = loadFuncFromLib(cast(char*)"cgIsParameterReferenced");;
	*cast(void**)&fp_cgIsParameterUsed = loadFuncFromLib(cast(char*)"cgIsParameterUsed");;
	*cast(void**)&fp_cgGetParameterValues = loadFuncFromLib(cast(char*)"cgGetParameterValues");;
	*cast(void**)&fp_cgSetParameterValuedr = loadFuncFromLib(cast(char*)"cgSetParameterValuedr");;
	*cast(void**)&fp_cgSetParameterValuedc = loadFuncFromLib(cast(char*)"cgSetParameterValuedc");;
	*cast(void**)&fp_cgSetParameterValuefr = loadFuncFromLib(cast(char*)"cgSetParameterValuefr");;
	*cast(void**)&fp_cgSetParameterValuefc = loadFuncFromLib(cast(char*)"cgSetParameterValuefc");;
	*cast(void**)&fp_cgSetParameterValueir = loadFuncFromLib(cast(char*)"cgSetParameterValueir");;
	*cast(void**)&fp_cgSetParameterValueic = loadFuncFromLib(cast(char*)"cgSetParameterValueic");;
	*cast(void**)&fp_cgGetParameterValuedr = loadFuncFromLib(cast(char*)"cgGetParameterValuedr");;
	*cast(void**)&fp_cgGetParameterValuedc = loadFuncFromLib(cast(char*)"cgGetParameterValuedc");;
	*cast(void**)&fp_cgGetParameterValuefr = loadFuncFromLib(cast(char*)"cgGetParameterValuefr");;
	*cast(void**)&fp_cgGetParameterValuefc = loadFuncFromLib(cast(char*)"cgGetParameterValuefc");;
	*cast(void**)&fp_cgGetParameterValueir = loadFuncFromLib(cast(char*)"cgGetParameterValueir");;
	*cast(void**)&fp_cgGetParameterValueic = loadFuncFromLib(cast(char*)"cgGetParameterValueic");;
	*cast(void**)&fp_cgGetStringParameterValue = loadFuncFromLib(cast(char*)"cgGetStringParameterValue");;
	*cast(void**)&fp_cgSetStringParameterValue = loadFuncFromLib(cast(char*)"cgSetStringParameterValue");;

	*cast(void**)&fp_cgGetParameterOrdinalNumber = loadFuncFromLib(cast(char*)"cgGetParameterOrdinalNumber");;
	*cast(void**)&fp_cgIsParameterGlobal = loadFuncFromLib(cast(char*)"cgIsParameterGlobal");;
	*cast(void**)&fp_cgGetParameterIndex = loadFuncFromLib(cast(char*)"cgGetParameterIndex");;

	*cast(void**)&fp_cgSetParameterVariability = loadFuncFromLib(cast(char*)"cgSetParameterVariability");;
	*cast(void**)&fp_cgSetParameterSemantic = loadFuncFromLib(cast(char*)"cgSetParameterSemantic");;

	*cast(void**)&fp_cgSetParameter1f = loadFuncFromLib(cast(char*)"cgSetParameter1f");;
	*cast(void**)&fp_cgSetParameter2f = loadFuncFromLib(cast(char*)"cgSetParameter2f");;
	*cast(void**)&fp_cgSetParameter3f = loadFuncFromLib(cast(char*)"cgSetParameter3f");;
	*cast(void**)&fp_cgSetParameter4f = loadFuncFromLib(cast(char*)"cgSetParameter4f");;
	*cast(void**)&fp_cgSetParameter1d = loadFuncFromLib(cast(char*)"cgSetParameter1d");;
	*cast(void**)&fp_cgSetParameter2d = loadFuncFromLib(cast(char*)"cgSetParameter2d");;
	*cast(void**)&fp_cgSetParameter3d = loadFuncFromLib(cast(char*)"cgSetParameter3d");;
	*cast(void**)&fp_cgSetParameter4d = loadFuncFromLib(cast(char*)"cgSetParameter4d");;
	*cast(void**)&fp_cgSetParameter1i = loadFuncFromLib(cast(char*)"cgSetParameter1i");;
	*cast(void**)&fp_cgSetParameter2i = loadFuncFromLib(cast(char*)"cgSetParameter2i");;
	*cast(void**)&fp_cgSetParameter3i = loadFuncFromLib(cast(char*)"cgSetParameter3i");;
	*cast(void**)&fp_cgSetParameter4i = loadFuncFromLib(cast(char*)"cgSetParameter4i");;

	*cast(void**)&fp_cgSetParameter1iv = loadFuncFromLib(cast(char*)"cgSetParameter1iv");;
	*cast(void**)&fp_cgSetParameter2iv = loadFuncFromLib(cast(char*)"cgSetParameter2iv");;
	*cast(void**)&fp_cgSetParameter3iv = loadFuncFromLib(cast(char*)"cgSetParameter3iv");;
	*cast(void**)&fp_cgSetParameter4iv = loadFuncFromLib(cast(char*)"cgSetParameter4iv");;
	*cast(void**)&fp_cgSetParameter1fv = loadFuncFromLib(cast(char*)"cgSetParameter1fv");;
	*cast(void**)&fp_cgSetParameter2fv = loadFuncFromLib(cast(char*)"cgSetParameter2fv");;
	*cast(void**)&fp_cgSetParameter3fv = loadFuncFromLib(cast(char*)"cgSetParameter3fv");;
	*cast(void**)&fp_cgSetParameter4fv = loadFuncFromLib(cast(char*)"cgSetParameter4fv");;
	*cast(void**)&fp_cgSetParameter1dv = loadFuncFromLib(cast(char*)"cgSetParameter1dv");;
	*cast(void**)&fp_cgSetParameter2dv = loadFuncFromLib(cast(char*)"cgSetParameter2dv");;
	*cast(void**)&fp_cgSetParameter3dv = loadFuncFromLib(cast(char*)"cgSetParameter3dv");;
	*cast(void**)&fp_cgSetParameter4dv = loadFuncFromLib(cast(char*)"cgSetParameter4dv");;

	*cast(void**)&fp_cgSetMatrixParameterir = loadFuncFromLib(cast(char*)"cgSetMatrixParameterir");;
	*cast(void**)&fp_cgSetMatrixParameterdr = loadFuncFromLib(cast(char*)"cgSetMatrixParameterdr");;
	*cast(void**)&fp_cgSetMatrixParameterfr = loadFuncFromLib(cast(char*)"cgSetMatrixParameterfr");;
	*cast(void**)&fp_cgSetMatrixParameteric = loadFuncFromLib(cast(char*)"cgSetMatrixParameteric");;
	*cast(void**)&fp_cgSetMatrixParameterdc = loadFuncFromLib(cast(char*)"cgSetMatrixParameterdc");;
	*cast(void**)&fp_cgSetMatrixParameterfc = loadFuncFromLib(cast(char*)"cgSetMatrixParameterfc");;

	*cast(void**)&fp_cgGetMatrixParameterir = loadFuncFromLib(cast(char*)"cgGetMatrixParameterir");;
	*cast(void**)&fp_cgGetMatrixParameterdr = loadFuncFromLib(cast(char*)"cgGetMatrixParameterdr");;
	*cast(void**)&fp_cgGetMatrixParameterfr = loadFuncFromLib(cast(char*)"cgGetMatrixParameterfr");;
	*cast(void**)&fp_cgGetMatrixParameteric = loadFuncFromLib(cast(char*)"cgGetMatrixParameteric");;
	*cast(void**)&fp_cgGetMatrixParameterdc = loadFuncFromLib(cast(char*)"cgGetMatrixParameterdc");;
	*cast(void**)&fp_cgGetMatrixParameterfc = loadFuncFromLib(cast(char*)"cgGetMatrixParameterfc");;

	*cast(void**)&fp_cgGetNamedSubParameter = loadFuncFromLib(cast(char*)"cgGetNamedSubParameter");;

	/*** Type Functions ***/

	*cast(void**)&fp_cgGetTypeString = loadFuncFromLib(cast(char*)"cgGetTypeString");;
	*cast(void**)&fp_cgGetType = loadFuncFromLib(cast(char*)"cgGetType");;

	*cast(void**)&fp_cgGetNamedUserType = loadFuncFromLib(cast(char*)"cgGetNamedUserType");;

	*cast(void**)&fp_cgGetNumUserTypes = loadFuncFromLib(cast(char*)"cgGetNumUserTypes");;
	*cast(void**)&fp_cgGetUserType = loadFuncFromLib(cast(char*)"cgGetUserType");;

	*cast(void**)&fp_cgGetNumParentTypes = loadFuncFromLib(cast(char*)"cgGetNumParentTypes");;
	*cast(void**)&fp_cgGetParentType = loadFuncFromLib(cast(char*)"cgGetParentType");;

	*cast(void**)&fp_cgIsParentType = loadFuncFromLib(cast(char*)"cgIsParentType");;
	*cast(void**)&fp_cgIsInterfaceType = loadFuncFromLib(cast(char*)"cgIsInterfaceType");;

	/*** Resource Functions ***/

	*cast(void**)&fp_cgGetResourceString = loadFuncFromLib(cast(char*)"cgGetResourceString");;
	*cast(void**)&fp_cgGetResource = loadFuncFromLib(cast(char*)"cgGetResource");;

	/*** Enum Functions ***/

	*cast(void**)&fp_cgGetEnumString = loadFuncFromLib(cast(char*)"cgGetEnumString");;
	*cast(void**)&fp_cgGetEnum = loadFuncFromLib(cast(char*)"cgGetEnum");;

	/*** Profile Functions ***/

	*cast(void**)&fp_cgGetProfileString = loadFuncFromLib(cast(char*)"cgGetProfileString");;
	*cast(void**)&fp_cgGetProfile = loadFuncFromLib(cast(char*)"cgGetProfile");;

	/*** Error Functions ***/

	*cast(void**)&fp_cgGetError = loadFuncFromLib(cast(char*)"cgGetError");;
	*cast(void**)&fp_cgGetFirstError = loadFuncFromLib(cast(char*)"cgGetFirstError");;
	*cast(void**)&fp_cgGetErrorString = loadFuncFromLib(cast(char*)"cgGetErrorString");;
	*cast(void**)&fp_cgGetLastErrorString = loadFuncFromLib(cast(char*)"cgGetLastErrorString");;
	*cast(void**)&fp_cgSetErrorCallback = loadFuncFromLib(cast(char*)"cgSetErrorCallback");;
	*cast(void**)&fp_cgGetErrorCallback = loadFuncFromLib(cast(char*)"cgGetErrorCallback");;
	*cast(void**)&fp_cgSetErrorHandler = loadFuncFromLib(cast(char*)"cgSetErrorHandler");;
	*cast(void**)&fp_cgGetErrorHandler = loadFuncFromLib(cast(char*)"cgGetErrorHandler");;

	/*** Misc Functions ***/

	*cast(void**)&fp_cgGetString = loadFuncFromLib(cast(char*)"cgGetString");;


	/*** CgFX Functions ***/

	*cast(void**)&fp_cgCreateEffect = loadFuncFromLib(cast(char*)"cgCreateEffect");;
	*cast(void**)&fp_cgCreateEffectFromFile = loadFuncFromLib(cast(char*)"cgCreateEffectFromFile");;
	*cast(void**)&fp_cgCopyEffect = loadFuncFromLib(cast(char*)"cgCopyEffect");; 
	*cast(void**)&fp_cgDestroyEffect = loadFuncFromLib(cast(char*)"cgDestroyEffect");;
	*cast(void**)&fp_cgGetEffectContext = loadFuncFromLib(cast(char*)"cgGetEffectContext");;
	*cast(void**)&fp_cgIsEffect = loadFuncFromLib(cast(char*)"cgIsEffect");;

	*cast(void**)&fp_cgGetFirstEffect = loadFuncFromLib(cast(char*)"cgGetFirstEffect");;
	*cast(void**)&fp_cgGetNextEffect = loadFuncFromLib(cast(char*)"cgGetNextEffect");;

	*cast(void**)&fp_cgCreateProgramFromEffect = loadFuncFromLib(cast(char*)"cgCreateProgramFromEffect");;

	*cast(void**)&fp_cgGetFirstTechnique = loadFuncFromLib(cast(char*)"cgGetFirstTechnique");;
	*cast(void**)&fp_cgGetNextTechnique = loadFuncFromLib(cast(char*)"cgGetNextTechnique");;
	*cast(void**)&fp_cgGetNamedTechnique = loadFuncFromLib(cast(char*)"cgGetNamedTechnique");;
	*cast(void**)&fp_cgGetTechniqueName = loadFuncFromLib(cast(char*)"cgGetTechniqueName");;
	*cast(void**)&fp_cgIsTechnique = loadFuncFromLib(cast(char*)"cgIsTechnique");;
	*cast(void**)&fp_cgValidateTechnique = loadFuncFromLib(cast(char*)"cgValidateTechnique");;
	*cast(void**)&fp_cgIsTechniqueValidated = loadFuncFromLib(cast(char*)"cgIsTechniqueValidated");;
	*cast(void**)&fp_cgGetTechniqueEffect = loadFuncFromLib(cast(char*)"cgGetTechniqueEffect");;

	*cast(void**)&fp_cgGetFirstPass = loadFuncFromLib(cast(char*)"cgGetFirstPass");;
	*cast(void**)&fp_cgGetNamedPass = loadFuncFromLib(cast(char*)"cgGetNamedPass");;
	*cast(void**)&fp_cgGetNextPass = loadFuncFromLib(cast(char*)"cgGetNextPass");;
	*cast(void**)&fp_cgIsPass = loadFuncFromLib(cast(char*)"cgIsPass");;
	*cast(void**)&fp_cgGetPassName = loadFuncFromLib(cast(char*)"cgGetPassName");; 
	*cast(void**)&fp_cgGetPassTechnique = loadFuncFromLib(cast(char*)"cgGetPassTechnique");;

	*cast(void**)&fp_cgSetPassState = loadFuncFromLib(cast(char*)"cgSetPassState");;
	*cast(void**)&fp_cgResetPassState = loadFuncFromLib(cast(char*)"cgResetPassState");;

	*cast(void**)&fp_cgGetFirstStateAssignment = loadFuncFromLib(cast(char*)"cgGetFirstStateAssignment");;
	*cast(void**)&fp_cgGetNamedStateAssignment = loadFuncFromLib(cast(char*)"cgGetNamedStateAssignment");;
	*cast(void**)&fp_cgGetNextStateAssignment = loadFuncFromLib(cast(char*)"cgGetNextStateAssignment");;
	*cast(void**)&fp_cgIsStateAssignment = loadFuncFromLib(cast(char*)"cgIsStateAssignment");;
	*cast(void**)&fp_cgCallStateSetCallback = loadFuncFromLib(cast(char*)"cgCallStateSetCallback");;
	*cast(void**)&fp_cgCallStateValidateCallback = loadFuncFromLib(cast(char*)"cgCallStateValidateCallback");;
	*cast(void**)&fp_cgCallStateResetCallback = loadFuncFromLib(cast(char*)"cgCallStateResetCallback");;
	*cast(void**)&fp_cgGetStateAssignmentPass = loadFuncFromLib(cast(char*)"cgGetStateAssignmentPass");;
	*cast(void**)&fp_cgGetSamplerStateAssignmentParameter = loadFuncFromLib(cast(char*)"cgGetSamplerStateAssignmentParameter");;

	*cast(void**)&fp_cgGetFloatStateAssignmentValues = loadFuncFromLib(cast(char*)"cgGetFloatStateAssignmentValues");;
	*cast(void**)&fp_cgGetIntStateAssignmentValues = loadFuncFromLib(cast(char*)"cgGetIntStateAssignmentValues");;
	*cast(void**)&fp_cgGetBoolStateAssignmentValues = loadFuncFromLib(cast(char*)"cgGetBoolStateAssignmentValues");;
	*cast(void**)&fp_cgGetStringStateAssignmentValue = loadFuncFromLib(cast(char*)"cgGetStringStateAssignmentValue");;
	*cast(void**)&fp_cgGetProgramStateAssignmentValue = loadFuncFromLib(cast(char*)"cgGetProgramStateAssignmentValue");;
	*cast(void**)&fp_cgGetTextureStateAssignmentValue = loadFuncFromLib(cast(char*)"cgGetTextureStateAssignmentValue");;
	*cast(void**)&fp_cgGetSamplerStateAssignmentValue = loadFuncFromLib(cast(char*)"cgGetSamplerStateAssignmentValue");;
	*cast(void**)&fp_cgGetStateAssignmentIndex = loadFuncFromLib(cast(char*)"cgGetStateAssignmentIndex");;

	*cast(void**)&fp_cgGetNumDependentStateAssignmentParameters = loadFuncFromLib(cast(char*)"cgGetNumDependentStateAssignmentParameters");;
	*cast(void**)&fp_cgGetDependentStateAssignmentParameter = loadFuncFromLib(cast(char*)"cgGetDependentStateAssignmentParameter");;

	*cast(void**)&fp_cgGetConnectedStateAssignmentParameter = loadFuncFromLib(cast(char*)"cgGetConnectedStateAssignmentParameter");;

	*cast(void**)&fp_cgGetStateAssignmentState = loadFuncFromLib(cast(char*)"cgGetStateAssignmentState");;
	*cast(void**)&fp_cgGetSamplerStateAssignmentState = loadFuncFromLib(cast(char*)"cgGetSamplerStateAssignmentState");;

	*cast(void**)&fp_cgCreateState = loadFuncFromLib(cast(char*)"cgCreateState");;
	*cast(void**)&fp_cgCreateArrayState = loadFuncFromLib(cast(char*)"cgCreateArrayState");;
	*cast(void**)&fp_cgSetStateCallbacks = loadFuncFromLib(cast(char*)"cgSetStateCallbacks");;
	*cast(void**)&fp_cgGetStateSetCallback = loadFuncFromLib(cast(char*)"cgGetStateSetCallback");;
	*cast(void**)&fp_cgGetStateResetCallback = loadFuncFromLib(cast(char*)"cgGetStateResetCallback");;
	*cast(void**)&fp_cgGetStateValidateCallback = loadFuncFromLib(cast(char*)"cgGetStateValidateCallback");;
	*cast(void**)&fp_cgGetStateContext = loadFuncFromLib(cast(char*)"cgGetStateContext");;
	*cast(void**)&fp_cgGetStateType = loadFuncFromLib(cast(char*)"cgGetStateType");;
	*cast(void**)&fp_cgGetStateName = loadFuncFromLib(cast(char*)"cgGetStateName");;
	*cast(void**)&fp_cgGetNamedState = loadFuncFromLib(cast(char*)"cgGetNamedState");;
	*cast(void**)&fp_cgGetFirstState = loadFuncFromLib(cast(char*)"cgGetFirstState");;
	*cast(void**)&fp_cgGetNextState = loadFuncFromLib(cast(char*)"cgGetNextState");;
	*cast(void**)&fp_cgIsState = loadFuncFromLib(cast(char*)"cgIsState");;
	*cast(void**)&fp_cgAddStateEnumerant = loadFuncFromLib(cast(char*)"cgAddStateEnumerant");;

	*cast(void**)&fp_cgCreateSamplerState = loadFuncFromLib(cast(char*)"cgCreateSamplerState");;
	*cast(void**)&fp_cgCreateArraySamplerState = loadFuncFromLib(cast(char*)"cgCreateArraySamplerState");;
	*cast(void**)&fp_cgGetNamedSamplerState = loadFuncFromLib(cast(char*)"cgGetNamedSamplerState");;
	*cast(void**)&fp_cgGetFirstSamplerState = loadFuncFromLib(cast(char*)"cgGetFirstSamplerState");;

	*cast(void**)&fp_cgGetFirstSamplerStateAssignment = loadFuncFromLib(cast(char*)"cgGetFirstSamplerStateAssignment");;
	*cast(void**)&fp_cgGetNamedSamplerStateAssignment = loadFuncFromLib(cast(char*)"cgGetNamedSamplerStateAssignment");;
	*cast(void**)&fp_cgSetSamplerState = loadFuncFromLib(cast(char*)"cgSetSamplerState");;

	*cast(void**)&fp_cgGetNamedEffectParameter = loadFuncFromLib(cast(char*)"cgGetNamedEffectParameter");;
	*cast(void**)&fp_cgGetFirstLeafEffectParameter = loadFuncFromLib(cast(char*)"cgGetFirstLeafEffectParameter");;
	*cast(void**)&fp_cgGetFirstEffectParameter = loadFuncFromLib(cast(char*)"cgGetFirstEffectParameter");;
	*cast(void**)&fp_cgGetEffectParameterBySemantic = loadFuncFromLib(cast(char*)"cgGetEffectParameterBySemantic");;

	*cast(void**)&fp_cgGetFirstTechniqueAnnotation = loadFuncFromLib(cast(char*)"cgGetFirstTechniqueAnnotation");;
	*cast(void**)&fp_cgGetFirstPassAnnotation = loadFuncFromLib(cast(char*)"cgGetFirstPassAnnotation");;
	*cast(void**)&fp_cgGetFirstParameterAnnotation = loadFuncFromLib(cast(char*)"cgGetFirstParameterAnnotation");;
	*cast(void**)&fp_cgGetFirstProgramAnnotation = loadFuncFromLib(cast(char*)"cgGetFirstProgramAnnotation");;
	*cast(void**)&fp_cgGetFirstEffectAnnotation = loadFuncFromLib(cast(char*)"cgGetFirstEffectAnnotation");;
	*cast(void**)&fp_cgGetNextAnnotation = loadFuncFromLib(cast(char*)"cgGetNextAnnotation");;

	*cast(void**)&fp_cgGetNamedTechniqueAnnotation = loadFuncFromLib(cast(char*)"cgGetNamedTechniqueAnnotation");;
	*cast(void**)&fp_cgGetNamedPassAnnotation = loadFuncFromLib(cast(char*)"cgGetNamedPassAnnotation");;
	*cast(void**)&fp_cgGetNamedParameterAnnotation = loadFuncFromLib(cast(char*)"cgGetNamedParameterAnnotation");;
	*cast(void**)&fp_cgGetNamedProgramAnnotation = loadFuncFromLib(cast(char*)"cgGetNamedProgramAnnotation");;
	*cast(void**)&fp_cgGetNamedEffectAnnotation = loadFuncFromLib(cast(char*)"cgGetNamedEffectAnnotation");;

	*cast(void**)&fp_cgIsAnnotation = loadFuncFromLib(cast(char*)"cgIsAnnotation");;

	*cast(void**)&fp_cgGetAnnotationName = loadFuncFromLib(cast(char*)"cgGetAnnotationName");;
	*cast(void**)&fp_cgGetAnnotationType = loadFuncFromLib(cast(char*)"cgGetAnnotationType");;

	*cast(void**)&fp_cgGetFloatAnnotationValues = loadFuncFromLib(cast(char*)"cgGetFloatAnnotationValues");;
	*cast(void**)&fp_cgGetIntAnnotationValues = loadFuncFromLib(cast(char*)"cgGetIntAnnotationValues");;
	*cast(void**)&fp_cgGetStringAnnotationValue = loadFuncFromLib(cast(char*)"cgGetStringAnnotationValue");;
	*cast(void**)&fp_cgGetStringAnnotationValues = loadFuncFromLib(cast(char*)"cgGetStringAnnotationValues");;
	*cast(void**)&fp_cgGetBoolAnnotationValues = loadFuncFromLib(cast(char*)"cgGetBoolAnnotationValues");;
	*cast(void**)&fp_cgGetBooleanAnnotationValues = loadFuncFromLib(cast(char*)"cgGetBooleanAnnotationValues");;

	*cast(void**)&fp_cgGetNumDependentAnnotationParameters = loadFuncFromLib(cast(char*)"cgGetNumDependentAnnotationParameters");;
	*cast(void**)&fp_cgGetDependentAnnotationParameter = loadFuncFromLib(cast(char*)"cgGetDependentAnnotationParameter");;

	*cast(void**)&fp_cgEvaluateProgram = loadFuncFromLib(cast(char*)"cgEvaluateProgram");;

	/*** Cg 1.5 Additions ***/

	*cast(void**)&fp_cgSetEffectName = loadFuncFromLib(cast(char*)"cgSetEffectName");;
	*cast(void**)&fp_cgGetEffectName = loadFuncFromLib(cast(char*)"cgGetEffectName");;
	*cast(void**)&fp_cgGetNamedEffect = loadFuncFromLib(cast(char*)"cgGetNamedEffect");;
	*cast(void**)&fp_cgCreateEffectParameter = loadFuncFromLib(cast(char*)"cgCreateEffectParameter");;

	*cast(void**)&fp_cgCreateTechnique = loadFuncFromLib(cast(char*)"cgCreateTechnique");;

	*cast(void**)&fp_cgCreateEffectParameterArray = loadFuncFromLib(cast(char*)"cgCreateEffectParameterArray");; 
	*cast(void**)&fp_cgCreateEffectParameterMultiDimArray = loadFuncFromLib(cast(char*)"cgCreateEffectParameterMultiDimArray");; 

	*cast(void**)&fp_cgCreatePass = loadFuncFromLib(cast(char*)"cgCreatePass");;

	*cast(void**)&fp_cgCreateStateAssignment = loadFuncFromLib(cast(char*)"cgCreateStateAssignment");;
	*cast(void**)&fp_cgCreateStateAssignmentIndex = loadFuncFromLib(cast(char*)"cgCreateStateAssignmentIndex");;
	*cast(void**)&fp_cgCreateSamplerStateAssignment = loadFuncFromLib(cast(char*)"cgCreateSamplerStateAssignment");;

	*cast(void**)&fp_cgSetFloatStateAssignment = loadFuncFromLib(cast(char*)"cgSetFloatStateAssignment");;
	*cast(void**)&fp_cgSetIntStateAssignment = loadFuncFromLib(cast(char*)"cgSetIntStateAssignment");;
	*cast(void**)&fp_cgSetBoolStateAssignment = loadFuncFromLib(cast(char*)"cgSetBoolStateAssignment");;
	*cast(void**)&fp_cgSetStringStateAssignment = loadFuncFromLib(cast(char*)"cgSetStringStateAssignment");;
	*cast(void**)&fp_cgSetProgramStateAssignment = loadFuncFromLib(cast(char*)"cgSetProgramStateAssignment");;
	*cast(void**)&fp_cgSetSamplerStateAssignment = loadFuncFromLib(cast(char*)"cgSetSamplerStateAssignment");;
	*cast(void**)&fp_cgSetTextureStateAssignment = loadFuncFromLib(cast(char*)"cgSetTextureStateAssignment");;

	*cast(void**)&fp_cgSetFloatArrayStateAssignment = loadFuncFromLib(cast(char*)"cgSetFloatArrayStateAssignment");;
	*cast(void**)&fp_cgSetIntArrayStateAssignment = loadFuncFromLib(cast(char*)"cgSetIntArrayStateAssignment");;
	*cast(void**)&fp_cgSetBoolArrayStateAssignment = loadFuncFromLib(cast(char*)"cgSetBoolArrayStateAssignment");;

	*cast(void**)&fp_cgCreateTechniqueAnnotation = loadFuncFromLib(cast(char*)"cgCreateTechniqueAnnotation");;
	*cast(void**)&fp_cgCreatePassAnnotation = loadFuncFromLib(cast(char*)"cgCreatePassAnnotation");;
	*cast(void**)&fp_cgCreateParameterAnnotation = loadFuncFromLib(cast(char*)"cgCreateParameterAnnotation");;
	*cast(void**)&fp_cgCreateProgramAnnotation = loadFuncFromLib(cast(char*)"cgCreateProgramAnnotation");;
	*cast(void**)&fp_cgCreateEffectAnnotation = loadFuncFromLib(cast(char*)"cgCreateEffectAnnotation");;

	*cast(void**)&fp_cgSetIntAnnotation = loadFuncFromLib(cast(char*)"cgSetIntAnnotation");;
	*cast(void**)&fp_cgSetFloatAnnotation = loadFuncFromLib(cast(char*)"cgSetFloatAnnotation");;
	*cast(void**)&fp_cgSetBoolAnnotation = loadFuncFromLib(cast(char*)"cgSetBoolAnnotation");;
	*cast(void**)&fp_cgSetStringAnnotation = loadFuncFromLib(cast(char*)"cgSetStringAnnotation");;

	*cast(void**)&fp_cgGetStateEnumerantName = loadFuncFromLib(cast(char*)"cgGetStateEnumerantName");;
	*cast(void**)&fp_cgGetStateEnumerantValue = loadFuncFromLib(cast(char*)"cgGetStateEnumerantValue");;

	*cast(void**)&fp_cgGetParameterEffect = loadFuncFromLib(cast(char*)"cgGetParameterEffect");;

	*cast(void**)&fp_cgGetTypeClass = loadFuncFromLib(cast(char*)"cgGetTypeClass");;
	*cast(void**)&fp_cgGetTypeBase = loadFuncFromLib(cast(char*)"cgGetTypeBase");;
	*cast(void**)&fp_cgGetTypeSizes = loadFuncFromLib(cast(char*)"cgGetTypeSizes");;
	*cast(void**)&fp_cgGetMatrixSize = loadFuncFromLib(cast(char*)"cgGetMatrixSize");;

	*cast(void**)&fp_cgGetNumProgramDomains = loadFuncFromLib(cast(char*)"cgGetNumProgramDomains");;
	*cast(void**)&fp_cgGetProfileDomain = loadFuncFromLib(cast(char*)"cgGetProfileDomain");;
	*cast(void**)&fp_cgCombinePrograms = loadFuncFromLib(cast(char*)"cgCombinePrograms");;
	*cast(void**)&fp_cgCombinePrograms2 = loadFuncFromLib(cast(char*)"cgCombinePrograms2");;
	*cast(void**)&fp_cgCombinePrograms3 = loadFuncFromLib(cast(char*)"cgCombinePrograms3");;
	*cast(void**)&fp_cgGetProgramDomainProfile = loadFuncFromLib(cast(char*)"cgGetProgramDomainProfile");;

	/*** CGobj Functions ***/
	*cast(void**)&fp_cgCreateObj = loadFuncFromLib(cast(char*)"cgCreateObj");;
	*cast(void**)&fp_cgCreateObjFromFile = loadFuncFromLib(cast(char*)"cgCreateObjFromFile");;
	*cast(void**)&fp_cgDestroyObj = loadFuncFromLib(cast(char*)"cgDestroyObj");;

	*cast(void**)&fp_cgGetParameterResourceSize = loadFuncFromLib(cast(char*)"cgGetParameterResourceSize");;
	*cast(void**)&fp_cgGetParameterResourceType = loadFuncFromLib(cast(char*)"cgGetParameterResourceType");;
	*cast(void**)&fp_cgGetParameterBufferIndex = loadFuncFromLib(cast(char*)"cgGetParameterBufferIndex");;
	*cast(void**)&fp_cgGetParameterBufferOffset = loadFuncFromLib(cast(char*)"cgGetParameterBufferOffset");;

	*cast(void**)&fp_cgCreateBuffer = loadFuncFromLib(cast(char*)"cgCreateBuffer");;
	*cast(void**)&fp_cgSetBufferData = loadFuncFromLib(cast(char*)"cgSetBufferData");;
	*cast(void**)&fp_cgSetBufferSubData = loadFuncFromLib(cast(char*)"cgSetBufferSubData");;
	*cast(void**)&fp_cgSetProgramBuffer = loadFuncFromLib(cast(char*)"cgSetProgramBuffer");;

	*cast(void**)&fp_cgMapBuffer = loadFuncFromLib(cast(char*)"cgMapBuffer");;
	*cast(void**)&fp_cgUnmapBuffer = loadFuncFromLib(cast(char*)"cgUnmapBuffer");;
	*cast(void**)&fp_cgDestroyBuffer = loadFuncFromLib(cast(char*)"cgDestroyBuffer");;
	*cast(void**)&fp_cgGetProgramBuffer = loadFuncFromLib(cast(char*)"cgGetProgramBuffer");;
	*cast(void**)&fp_cgGetBufferSize = loadFuncFromLib(cast(char*)"cgGetBufferSize");;
	*cast(void**)&fp_cgGetProgramBufferMaxSize = loadFuncFromLib(cast(char*)"cgGetProgramBufferMaxSize");;
	*cast(void**)&fp_cgGetProgramBufferMaxIndex = loadFuncFromLib(cast(char*)"cgGetProgramBufferMaxIndex");;
}





void loadCgGLFunctions_(void* function(char*) loadFuncFromLib) {
	/******************************************************************************
	 *** Profile Functions 
	 *****************************************************************************/

	*cast(void**)&fp_cgGLIsProfileSupported = loadFuncFromLib(cast(char*)"cgGLIsProfileSupported");;

	*cast(void**)&fp_cgGLEnableProfile = loadFuncFromLib(cast(char*)"cgGLEnableProfile");;
	*cast(void**)&fp_cgGLDisableProfile = loadFuncFromLib(cast(char*)"cgGLDisableProfile");;

	*cast(void**)&fp_cgGLGetLatestProfile = loadFuncFromLib(cast(char*)"cgGLGetLatestProfile");;
	*cast(void**)&fp_cgGLSetOptimalOptions = loadFuncFromLib(cast(char*)"cgGLSetOptimalOptions");;

	/******************************************************************************
	 *** Program Managment Functions 
	 *****************************************************************************/

	*cast(void**)&fp_cgGLLoadProgram = loadFuncFromLib(cast(char*)"cgGLLoadProgram");;
	*cast(void**)&fp_cgGLIsProgramLoaded = loadFuncFromLib(cast(char*)"cgGLIsProgramLoaded");;
	*cast(void**)&fp_cgGLBindProgram = loadFuncFromLib(cast(char*)"cgGLBindProgram");;
	*cast(void**)&fp_cgGLUnbindProgram = loadFuncFromLib(cast(char*)"cgGLUnbindProgram");;
	*cast(void**)&fp_cgGLGetProgramID = loadFuncFromLib(cast(char*)"cgGLGetProgramID");;

	/******************************************************************************
	 *** Parameter Managment Functions 
	 *****************************************************************************/

	*cast(void**)&fp_cgGLSetParameter1f = loadFuncFromLib(cast(char*)"cgGLSetParameter1f");;

	*cast(void**)&fp_cgGLSetParameter2f = loadFuncFromLib(cast(char*)"cgGLSetParameter2f");;

	*cast(void**)&fp_cgGLSetParameter3f = loadFuncFromLib(cast(char*)"cgGLSetParameter3f");;

	*cast(void**)&fp_cgGLSetParameter4f = loadFuncFromLib(cast(char*)"cgGLSetParameter4f");;

	*cast(void**)&fp_cgGLSetParameter1fv = loadFuncFromLib(cast(char*)"cgGLSetParameter1fv");;

	*cast(void**)&fp_cgGLSetParameter2fv = loadFuncFromLib(cast(char*)"cgGLSetParameter2fv");;

	*cast(void**)&fp_cgGLSetParameter3fv = loadFuncFromLib(cast(char*)"cgGLSetParameter3fv");;

	*cast(void**)&fp_cgGLSetParameter4fv = loadFuncFromLib(cast(char*)"cgGLSetParameter4fv");;

	*cast(void**)&fp_cgGLSetParameter1d = loadFuncFromLib(cast(char*)"cgGLSetParameter1d");;

	*cast(void**)&fp_cgGLSetParameter2d = loadFuncFromLib(cast(char*)"cgGLSetParameter2d");;

	*cast(void**)&fp_cgGLSetParameter3d = loadFuncFromLib(cast(char*)"cgGLSetParameter3d");;

	*cast(void**)&fp_cgGLSetParameter4d = loadFuncFromLib(cast(char*)"cgGLSetParameter4d");;

	*cast(void**)&fp_cgGLSetParameter1dv = loadFuncFromLib(cast(char*)"cgGLSetParameter1dv");;

	*cast(void**)&fp_cgGLSetParameter2dv = loadFuncFromLib(cast(char*)"cgGLSetParameter2dv");;

	*cast(void**)&fp_cgGLSetParameter3dv = loadFuncFromLib(cast(char*)"cgGLSetParameter3dv");;

	*cast(void**)&fp_cgGLSetParameter4dv = loadFuncFromLib(cast(char*)"cgGLSetParameter4dv");;

	*cast(void**)&fp_cgGLGetParameter1f = loadFuncFromLib(cast(char*)"cgGLGetParameter1f");;

	*cast(void**)&fp_cgGLGetParameter2f = loadFuncFromLib(cast(char*)"cgGLGetParameter2f");;

	*cast(void**)&fp_cgGLGetParameter3f = loadFuncFromLib(cast(char*)"cgGLGetParameter3f");;

	*cast(void**)&fp_cgGLGetParameter4f = loadFuncFromLib(cast(char*)"cgGLGetParameter4f");;

	*cast(void**)&fp_cgGLGetParameter1d = loadFuncFromLib(cast(char*)"cgGLGetParameter1d");;

	*cast(void**)&fp_cgGLGetParameter2d = loadFuncFromLib(cast(char*)"cgGLGetParameter2d");;

	*cast(void**)&fp_cgGLGetParameter3d = loadFuncFromLib(cast(char*)"cgGLGetParameter3d");;

	*cast(void**)&fp_cgGLGetParameter4d = loadFuncFromLib(cast(char*)"cgGLGetParameter4d");;

	*cast(void**)&fp_cgGLSetParameterArray1f = loadFuncFromLib(cast(char*)"cgGLSetParameterArray1f");;

	*cast(void**)&fp_cgGLSetParameterArray2f = loadFuncFromLib(cast(char*)"cgGLSetParameterArray2f");;

	*cast(void**)&fp_cgGLSetParameterArray3f = loadFuncFromLib(cast(char*)"cgGLSetParameterArray3f");;

	*cast(void**)&fp_cgGLSetParameterArray4f = loadFuncFromLib(cast(char*)"cgGLSetParameterArray4f");;

	*cast(void**)&fp_cgGLSetParameterArray1d = loadFuncFromLib(cast(char*)"cgGLSetParameterArray1d");;

	*cast(void**)&fp_cgGLSetParameterArray2d = loadFuncFromLib(cast(char*)"cgGLSetParameterArray2d");;

	*cast(void**)&fp_cgGLSetParameterArray3d = loadFuncFromLib(cast(char*)"cgGLSetParameterArray3d");;

	*cast(void**)&fp_cgGLSetParameterArray4d = loadFuncFromLib(cast(char*)"cgGLSetParameterArray4d");;

	*cast(void**)&fp_cgGLGetParameterArray1f = loadFuncFromLib(cast(char*)"cgGLGetParameterArray1f");;

	*cast(void**)&fp_cgGLGetParameterArray2f = loadFuncFromLib(cast(char*)"cgGLGetParameterArray2f");;

	*cast(void**)&fp_cgGLGetParameterArray3f = loadFuncFromLib(cast(char*)"cgGLGetParameterArray3f");;

	*cast(void**)&fp_cgGLGetParameterArray4f = loadFuncFromLib(cast(char*)"cgGLGetParameterArray4f");;

	*cast(void**)&fp_cgGLGetParameterArray1d = loadFuncFromLib(cast(char*)"cgGLGetParameterArray1d");;

	*cast(void**)&fp_cgGLGetParameterArray2d = loadFuncFromLib(cast(char*)"cgGLGetParameterArray2d");;

	*cast(void**)&fp_cgGLGetParameterArray3d = loadFuncFromLib(cast(char*)"cgGLGetParameterArray3d");;

	*cast(void**)&fp_cgGLGetParameterArray4d = loadFuncFromLib(cast(char*)"cgGLGetParameterArray4d");;

	*cast(void**)&fp_cgGLSetParameterPointer = loadFuncFromLib(cast(char*)"cgGLSetParameterPointer");;

	*cast(void**)&fp_cgGLEnableClientState = loadFuncFromLib(cast(char*)"cgGLEnableClientState");;
	*cast(void**)&fp_cgGLDisableClientState = loadFuncFromLib(cast(char*)"cgGLDisableClientState");;

	/******************************************************************************
	 *** Matrix Parameter Managment Functions 
	 *****************************************************************************/

	*cast(void**)&fp_cgGLSetMatrixParameterdr = loadFuncFromLib(cast(char*)"cgGLSetMatrixParameterdr");;
	*cast(void**)&fp_cgGLSetMatrixParameterfr = loadFuncFromLib(cast(char*)"cgGLSetMatrixParameterfr");;
	*cast(void**)&fp_cgGLSetMatrixParameterdc = loadFuncFromLib(cast(char*)"cgGLSetMatrixParameterdc");;
	*cast(void**)&fp_cgGLSetMatrixParameterfc = loadFuncFromLib(cast(char*)"cgGLSetMatrixParameterfc");;

	*cast(void**)&fp_cgGLGetMatrixParameterdr = loadFuncFromLib(cast(char*)"cgGLGetMatrixParameterdr");;
	*cast(void**)&fp_cgGLGetMatrixParameterfr = loadFuncFromLib(cast(char*)"cgGLGetMatrixParameterfr");;
	*cast(void**)&fp_cgGLGetMatrixParameterdc = loadFuncFromLib(cast(char*)"cgGLGetMatrixParameterdc");;
	*cast(void**)&fp_cgGLGetMatrixParameterfc = loadFuncFromLib(cast(char*)"cgGLGetMatrixParameterfc");;

	*cast(void**)&fp_cgGLSetStateMatrixParameter = loadFuncFromLib(cast(char*)"cgGLSetStateMatrixParameter");;

	*cast(void**)&fp_cgGLSetMatrixParameterArrayfc = loadFuncFromLib(cast(char*)"cgGLSetMatrixParameterArrayfc");;

	*cast(void**)&fp_cgGLSetMatrixParameterArrayfr = loadFuncFromLib(cast(char*)"cgGLSetMatrixParameterArrayfr");;

	*cast(void**)&fp_cgGLSetMatrixParameterArraydc = loadFuncFromLib(cast(char*)"cgGLSetMatrixParameterArraydc");;

	*cast(void**)&fp_cgGLSetMatrixParameterArraydr = loadFuncFromLib(cast(char*)"cgGLSetMatrixParameterArraydr");;

	*cast(void**)&fp_cgGLGetMatrixParameterArrayfc = loadFuncFromLib(cast(char*)"cgGLGetMatrixParameterArrayfc");;

	*cast(void**)&fp_cgGLGetMatrixParameterArrayfr = loadFuncFromLib(cast(char*)"cgGLGetMatrixParameterArrayfr");;

	*cast(void**)&fp_cgGLGetMatrixParameterArraydc = loadFuncFromLib(cast(char*)"cgGLGetMatrixParameterArraydc");;

	*cast(void**)&fp_cgGLGetMatrixParameterArraydr = loadFuncFromLib(cast(char*)"cgGLGetMatrixParameterArraydr");;

	/******************************************************************************
	 *** Texture Parameter Managment Functions
	 *****************************************************************************/

	*cast(void**)&fp_cgGLSetTextureParameter = loadFuncFromLib(cast(char*)"cgGLSetTextureParameter");;
	*cast(void**)&fp_cgGLGetTextureParameter = loadFuncFromLib(cast(char*)"cgGLGetTextureParameter");;
	*cast(void**)&fp_cgGLEnableTextureParameter = loadFuncFromLib(cast(char*)"cgGLEnableTextureParameter");;
	*cast(void**)&fp_cgGLDisableTextureParameter = loadFuncFromLib(cast(char*)"cgGLDisableTextureParameter");;
	*cast(void**)&fp_cgGLGetTextureEnum = loadFuncFromLib(cast(char*)"cgGLGetTextureEnum");;

	*cast(void**)&fp_cgGLSetManageTextureParameters = loadFuncFromLib(cast(char*)"cgGLSetManageTextureParameters");;
	*cast(void**)&fp_cgGLGetManageTextureParameters = loadFuncFromLib(cast(char*)"cgGLGetManageTextureParameters");;

	*cast(void**)&fp_cgGLSetupSampler = loadFuncFromLib(cast(char*)"cgGLSetupSampler");;
	*cast(void**)&fp_cgGLRegisterStates = loadFuncFromLib(cast(char*)"cgGLRegisterStates");;

	*cast(void**)&fp_cgGLEnableProgramProfiles = loadFuncFromLib(cast(char*)"cgGLEnableProgramProfiles");;
	*cast(void**)&fp_cgGLDisableProgramProfiles = loadFuncFromLib(cast(char*)"cgGLDisableProgramProfiles");;

	/******************************************************************************
	 *** Misc Functions
	 *****************************************************************************/

	*cast(void**)&fp_cgGLSetDebugMode = loadFuncFromLib(cast(char*)"cgGLSetDebugMode");;

	/******************************************************************************
	 *** Buffer Functions
	 *****************************************************************************/

	*cast(void**)&fp_cgGLCreateBuffer = loadFuncFromLib(cast(char*)"cgGLCreateBuffer");;
	*cast(void**)&fp_cgGLGetBufferObject = loadFuncFromLib(cast(char*)"cgGLGetBufferObject");;
}







CGenum cgSetLockingPolicy(ParameterTupleOf!(fp_cgSetLockingPolicy) params__) {
	return checkedCall("cgSetLockingPolicy", fp_cgSetLockingPolicy, params__);
}
CGenum cgGetLockingPolicy(ParameterTupleOf!(fp_cgGetLockingPolicy) params__) {
	return checkedCall("cgGetLockingPolicy", fp_cgGetLockingPolicy, params__);
}
CGenum cgSetSemanticCasePolicy(ParameterTupleOf!(fp_cgSetSemanticCasePolicy) params__) {
	return checkedCall("cgSetSemanticCasePolicy", fp_cgSetSemanticCasePolicy, params__);
}
CGenum cgGetSemanticCasePolicy(ParameterTupleOf!(fp_cgGetSemanticCasePolicy) params__) {
	return checkedCall("cgGetSemanticCasePolicy", fp_cgGetSemanticCasePolicy, params__);
}

/*** Context functions ***/

CGcontext cgCreateContext(ParameterTupleOf!(fp_cgCreateContext) params__) {
	return checkedCall("cgCreateContext", fp_cgCreateContext, params__);
} 
void cgDestroyContext(ParameterTupleOf!(fp_cgDestroyContext) params__) {
	return checkedCall("cgDestroyContext", fp_cgDestroyContext, params__);
} 
CGbool cgIsContext(ParameterTupleOf!(fp_cgIsContext) params__) {
	return checkedCall("cgIsContext", fp_cgIsContext, params__);
}
char * cgGetLastListing(ParameterTupleOf!(fp_cgGetLastListing) params__) {
	return checkedCall("cgGetLastListing", fp_cgGetLastListing, params__);
}
void cgSetLastListing(ParameterTupleOf!(fp_cgSetLastListing) params__) {
	return checkedCall("cgSetLastListing", fp_cgSetLastListing, params__);
}
void cgSetAutoCompile(ParameterTupleOf!(fp_cgSetAutoCompile) params__) {
	return checkedCall("cgSetAutoCompile", fp_cgSetAutoCompile, params__);
}
CGenum cgGetAutoCompile(ParameterTupleOf!(fp_cgGetAutoCompile) params__) {
	return checkedCall("cgGetAutoCompile", fp_cgGetAutoCompile, params__);
}
void cgSetParameterSettingMode(ParameterTupleOf!(fp_cgSetParameterSettingMode) params__) {
	return checkedCall("cgSetParameterSettingMode", fp_cgSetParameterSettingMode, params__);
}
CGenum cgGetParameterSettingMode(ParameterTupleOf!(fp_cgGetParameterSettingMode) params__) {
	return checkedCall("cgGetParameterSettingMode", fp_cgGetParameterSettingMode, params__);
}

/*** Program functions ***/

CGprogram cgCreateProgram(ParameterTupleOf!(fp_cgCreateProgram) params__) {
	return checkedCall("cgCreateProgram", fp_cgCreateProgram, params__);
}
CGprogram cgCreateProgramFromFile(ParameterTupleOf!(fp_cgCreateProgramFromFile) params__) {
	return checkedCall("cgCreateProgramFromFile", fp_cgCreateProgramFromFile, params__);
}
CGprogram cgCopyProgram(ParameterTupleOf!(fp_cgCopyProgram) params__) {
	return checkedCall("cgCopyProgram", fp_cgCopyProgram, params__);
} 
void cgDestroyProgram(ParameterTupleOf!(fp_cgDestroyProgram) params__) {
	return checkedCall("cgDestroyProgram", fp_cgDestroyProgram, params__);
} 

CGprogram cgGetFirstProgram(ParameterTupleOf!(fp_cgGetFirstProgram) params__) {
	return checkedCall("cgGetFirstProgram", fp_cgGetFirstProgram, params__);
}
CGprogram cgGetNextProgram(ParameterTupleOf!(fp_cgGetNextProgram) params__) {
	return checkedCall("cgGetNextProgram", fp_cgGetNextProgram, params__);
}
CGcontext cgGetProgramContext(ParameterTupleOf!(fp_cgGetProgramContext) params__) {
	return checkedCall("cgGetProgramContext", fp_cgGetProgramContext, params__);
}
CGbool cgIsProgram(ParameterTupleOf!(fp_cgIsProgram) params__) {
	return checkedCall("cgIsProgram", fp_cgIsProgram, params__);
} 

void cgCompileProgram(ParameterTupleOf!(fp_cgCompileProgram) params__) {
	return checkedCall("cgCompileProgram", fp_cgCompileProgram, params__);
} 
CGbool cgIsProgramCompiled(ParameterTupleOf!(fp_cgIsProgramCompiled) params__) {
	return checkedCall("cgIsProgramCompiled", fp_cgIsProgramCompiled, params__);
} 
char * cgGetProgramString(ParameterTupleOf!(fp_cgGetProgramString) params__) {
	return checkedCall("cgGetProgramString", fp_cgGetProgramString, params__);
} 
CGprofile cgGetProgramProfile(ParameterTupleOf!(fp_cgGetProgramProfile) params__) {
	return checkedCall("cgGetProgramProfile", fp_cgGetProgramProfile, params__);
} 
char ** cgGetProgramOptions(ParameterTupleOf!(fp_cgGetProgramOptions) params__) {
	return checkedCall("cgGetProgramOptions", fp_cgGetProgramOptions, params__);
}
void cgSetProgramProfile(ParameterTupleOf!(fp_cgSetProgramProfile) params__) {
	return checkedCall("cgSetProgramProfile", fp_cgSetProgramProfile, params__);
}
CGenum cgGetProgramInput(ParameterTupleOf!(fp_cgGetProgramInput) params__) {
	return checkedCall("cgGetProgramInput", fp_cgGetProgramInput, params__);
}
CGenum cgGetProgramOutput(ParameterTupleOf!(fp_cgGetProgramOutput) params__) {
	return checkedCall("cgGetProgramOutput", fp_cgGetProgramOutput, params__);
}
void cgSetPassProgramParameters(ParameterTupleOf!(fp_cgSetPassProgramParameters) params__) {
	return checkedCall("cgSetPassProgramParameters", fp_cgSetPassProgramParameters, params__);
}
void cgUpdateProgramParameters(ParameterTupleOf!(fp_cgUpdateProgramParameters) params__) {
	return checkedCall("cgUpdateProgramParameters", fp_cgUpdateProgramParameters, params__);
}

/*** Parameter functions ***/

CGparameter cgCreateParameter(ParameterTupleOf!(fp_cgCreateParameter) params__) {
	return checkedCall("cgCreateParameter", fp_cgCreateParameter, params__);
}
CGparameter cgCreateParameterArray(ParameterTupleOf!(fp_cgCreateParameterArray) params__) {
	return checkedCall("cgCreateParameterArray", fp_cgCreateParameterArray, params__);
}
CGparameter cgCreateParameterMultiDimArray(ParameterTupleOf!(fp_cgCreateParameterMultiDimArray) params__) {
	return checkedCall("cgCreateParameterMultiDimArray", fp_cgCreateParameterMultiDimArray, params__);
}
void cgDestroyParameter(ParameterTupleOf!(fp_cgDestroyParameter) params__) {
	return checkedCall("cgDestroyParameter", fp_cgDestroyParameter, params__);
}
void cgConnectParameter(ParameterTupleOf!(fp_cgConnectParameter) params__) {
	return checkedCall("cgConnectParameter", fp_cgConnectParameter, params__);
}
void cgDisconnectParameter(ParameterTupleOf!(fp_cgDisconnectParameter) params__) {
	return checkedCall("cgDisconnectParameter", fp_cgDisconnectParameter, params__);
}
CGparameter cgGetConnectedParameter(ParameterTupleOf!(fp_cgGetConnectedParameter) params__) {
	return checkedCall("cgGetConnectedParameter", fp_cgGetConnectedParameter, params__);
}

int cgGetNumConnectedToParameters(ParameterTupleOf!(fp_cgGetNumConnectedToParameters) params__) {
	return checkedCall("cgGetNumConnectedToParameters", fp_cgGetNumConnectedToParameters, params__);
}
CGparameter cgGetConnectedToParameter(ParameterTupleOf!(fp_cgGetConnectedToParameter) params__) {
	return checkedCall("cgGetConnectedToParameter", fp_cgGetConnectedToParameter, params__);
}

CGparameter cgGetNamedParameter(ParameterTupleOf!(fp_cgGetNamedParameter) params__) {
	return checkedCall("cgGetNamedParameter", fp_cgGetNamedParameter, params__);
}
CGparameter cgGetNamedProgramParameter(ParameterTupleOf!(fp_cgGetNamedProgramParameter) params__) {
	return checkedCall("cgGetNamedProgramParameter", fp_cgGetNamedProgramParameter, params__);
}

CGparameter cgGetFirstParameter(ParameterTupleOf!(fp_cgGetFirstParameter) params__) {
	return checkedCall("cgGetFirstParameter", fp_cgGetFirstParameter, params__);
}
CGparameter cgGetNextParameter(ParameterTupleOf!(fp_cgGetNextParameter) params__) {
	return checkedCall("cgGetNextParameter", fp_cgGetNextParameter, params__);
}
CGparameter cgGetFirstLeafParameter(ParameterTupleOf!(fp_cgGetFirstLeafParameter) params__) {
	return checkedCall("cgGetFirstLeafParameter", fp_cgGetFirstLeafParameter, params__);
}
CGparameter cgGetNextLeafParameter(ParameterTupleOf!(fp_cgGetNextLeafParameter) params__) {
	return checkedCall("cgGetNextLeafParameter", fp_cgGetNextLeafParameter, params__);
}

CGparameter cgGetFirstStructParameter(ParameterTupleOf!(fp_cgGetFirstStructParameter) params__) {
	return checkedCall("cgGetFirstStructParameter", fp_cgGetFirstStructParameter, params__);
}
CGparameter cgGetNamedStructParameter(ParameterTupleOf!(fp_cgGetNamedStructParameter) params__) {
	return checkedCall("cgGetNamedStructParameter", fp_cgGetNamedStructParameter, params__);
}

CGparameter cgGetFirstDependentParameter(ParameterTupleOf!(fp_cgGetFirstDependentParameter) params__) {
	return checkedCall("cgGetFirstDependentParameter", fp_cgGetFirstDependentParameter, params__);
}

CGparameter cgGetArrayParameter(ParameterTupleOf!(fp_cgGetArrayParameter) params__) {
	return checkedCall("cgGetArrayParameter", fp_cgGetArrayParameter, params__);
}
int cgGetArrayDimension(ParameterTupleOf!(fp_cgGetArrayDimension) params__) {
	return checkedCall("cgGetArrayDimension", fp_cgGetArrayDimension, params__);
}
CGtype cgGetArrayType(ParameterTupleOf!(fp_cgGetArrayType) params__) {
	return checkedCall("cgGetArrayType", fp_cgGetArrayType, params__);
}
int cgGetArraySize(ParameterTupleOf!(fp_cgGetArraySize) params__) {
	return checkedCall("cgGetArraySize", fp_cgGetArraySize, params__);
}
int cgGetArrayTotalSize(ParameterTupleOf!(fp_cgGetArrayTotalSize) params__) {
	return checkedCall("cgGetArrayTotalSize", fp_cgGetArrayTotalSize, params__);
}
void cgSetArraySize(ParameterTupleOf!(fp_cgSetArraySize) params__) {
	return checkedCall("cgSetArraySize", fp_cgSetArraySize, params__);
}
void cgSetMultiDimArraySize(ParameterTupleOf!(fp_cgSetMultiDimArraySize) params__) {
	return checkedCall("cgSetMultiDimArraySize", fp_cgSetMultiDimArraySize, params__);
}

CGprogram cgGetParameterProgram(ParameterTupleOf!(fp_cgGetParameterProgram) params__) {
	return checkedCall("cgGetParameterProgram", fp_cgGetParameterProgram, params__);
}
CGcontext cgGetParameterContext(ParameterTupleOf!(fp_cgGetParameterContext) params__) {
	return checkedCall("cgGetParameterContext", fp_cgGetParameterContext, params__);
}
CGbool cgIsParameter(ParameterTupleOf!(fp_cgIsParameter) params__) {
	return checkedCall("cgIsParameter", fp_cgIsParameter, params__);
}
char * cgGetParameterName(ParameterTupleOf!(fp_cgGetParameterName) params__) {
	return checkedCall("cgGetParameterName", fp_cgGetParameterName, params__);
}
CGtype cgGetParameterType(ParameterTupleOf!(fp_cgGetParameterType) params__) {
	return checkedCall("cgGetParameterType", fp_cgGetParameterType, params__);
}
CGtype cgGetParameterBaseType(ParameterTupleOf!(fp_cgGetParameterBaseType) params__) {
	return checkedCall("cgGetParameterBaseType", fp_cgGetParameterBaseType, params__);
}
CGparameterclass cgGetParameterClass(ParameterTupleOf!(fp_cgGetParameterClass) params__) {
	return checkedCall("cgGetParameterClass", fp_cgGetParameterClass, params__);
}
int cgGetParameterRows(ParameterTupleOf!(fp_cgGetParameterRows) params__) {
	return checkedCall("cgGetParameterRows", fp_cgGetParameterRows, params__);
}
int cgGetParameterColumns(ParameterTupleOf!(fp_cgGetParameterColumns) params__) {
	return checkedCall("cgGetParameterColumns", fp_cgGetParameterColumns, params__);
}
CGtype cgGetParameterNamedType(ParameterTupleOf!(fp_cgGetParameterNamedType) params__) {
	return checkedCall("cgGetParameterNamedType", fp_cgGetParameterNamedType, params__);
}
char * cgGetParameterSemantic(ParameterTupleOf!(fp_cgGetParameterSemantic) params__) {
	return checkedCall("cgGetParameterSemantic", fp_cgGetParameterSemantic, params__);
}
CGresource cgGetParameterResource(ParameterTupleOf!(fp_cgGetParameterResource) params__) {
	return checkedCall("cgGetParameterResource", fp_cgGetParameterResource, params__);
}
CGresource cgGetParameterBaseResource(ParameterTupleOf!(fp_cgGetParameterBaseResource) params__) {
	return checkedCall("cgGetParameterBaseResource", fp_cgGetParameterBaseResource, params__);
}
uint cgGetParameterResourceIndex(ParameterTupleOf!(fp_cgGetParameterResourceIndex) params__) {
	return checkedCall("cgGetParameterResourceIndex", fp_cgGetParameterResourceIndex, params__);
}
CGenum cgGetParameterVariability(ParameterTupleOf!(fp_cgGetParameterVariability) params__) {
	return checkedCall("cgGetParameterVariability", fp_cgGetParameterVariability, params__);
}
CGenum cgGetParameterDirection(ParameterTupleOf!(fp_cgGetParameterDirection) params__) {
	return checkedCall("cgGetParameterDirection", fp_cgGetParameterDirection, params__);
}
CGbool cgIsParameterReferenced(ParameterTupleOf!(fp_cgIsParameterReferenced) params__) {
	return checkedCall("cgIsParameterReferenced", fp_cgIsParameterReferenced, params__);
}
CGbool cgIsParameterUsed(ParameterTupleOf!(fp_cgIsParameterUsed) params__) {
	return checkedCall("cgIsParameterUsed", fp_cgIsParameterUsed, params__);
}
double * cgGetParameterValues(ParameterTupleOf!(fp_cgGetParameterValues) params__) {
	return checkedCall("cgGetParameterValues", fp_cgGetParameterValues, params__);
}
void cgSetParameterValuedr(ParameterTupleOf!(fp_cgSetParameterValuedr) params__) {
	return checkedCall("cgSetParameterValuedr", fp_cgSetParameterValuedr, params__);
}
void cgSetParameterValuedc(ParameterTupleOf!(fp_cgSetParameterValuedc) params__) {
	return checkedCall("cgSetParameterValuedc", fp_cgSetParameterValuedc, params__);
}
void cgSetParameterValuefr(ParameterTupleOf!(fp_cgSetParameterValuefr) params__) {
	return checkedCall("cgSetParameterValuefr", fp_cgSetParameterValuefr, params__);
}
void cgSetParameterValuefc(ParameterTupleOf!(fp_cgSetParameterValuefc) params__) {
	return checkedCall("cgSetParameterValuefc", fp_cgSetParameterValuefc, params__);
}
void cgSetParameterValueir(ParameterTupleOf!(fp_cgSetParameterValueir) params__) {
	return checkedCall("cgSetParameterValueir", fp_cgSetParameterValueir, params__);
}
void cgSetParameterValueic(ParameterTupleOf!(fp_cgSetParameterValueic) params__) {
	return checkedCall("cgSetParameterValueic", fp_cgSetParameterValueic, params__);
}
int cgGetParameterValuedr(ParameterTupleOf!(fp_cgGetParameterValuedr) params__) {
	return checkedCall("cgGetParameterValuedr", fp_cgGetParameterValuedr, params__);
}
int cgGetParameterValuedc(ParameterTupleOf!(fp_cgGetParameterValuedc) params__) {
	return checkedCall("cgGetParameterValuedc", fp_cgGetParameterValuedc, params__);
}
int cgGetParameterValuefr(ParameterTupleOf!(fp_cgGetParameterValuefr) params__) {
	return checkedCall("cgGetParameterValuefr", fp_cgGetParameterValuefr, params__);
}
int cgGetParameterValuefc(ParameterTupleOf!(fp_cgGetParameterValuefc) params__) {
	return checkedCall("cgGetParameterValuefc", fp_cgGetParameterValuefc, params__);
}
int cgGetParameterValueir(ParameterTupleOf!(fp_cgGetParameterValueir) params__) {
	return checkedCall("cgGetParameterValueir", fp_cgGetParameterValueir, params__);
}
int cgGetParameterValueic(ParameterTupleOf!(fp_cgGetParameterValueic) params__) {
	return checkedCall("cgGetParameterValueic", fp_cgGetParameterValueic, params__);
}
char * cgGetStringParameterValue(ParameterTupleOf!(fp_cgGetStringParameterValue) params__) {
	return checkedCall("cgGetStringParameterValue", fp_cgGetStringParameterValue, params__);
}
void cgSetStringParameterValue(ParameterTupleOf!(fp_cgSetStringParameterValue) params__) {
	return checkedCall("cgSetStringParameterValue", fp_cgSetStringParameterValue, params__);
}

int cgGetParameterOrdinalNumber(ParameterTupleOf!(fp_cgGetParameterOrdinalNumber) params__) {
	return checkedCall("cgGetParameterOrdinalNumber", fp_cgGetParameterOrdinalNumber, params__);
}
CGbool cgIsParameterGlobal(ParameterTupleOf!(fp_cgIsParameterGlobal) params__) {
	return checkedCall("cgIsParameterGlobal", fp_cgIsParameterGlobal, params__);
}
int cgGetParameterIndex(ParameterTupleOf!(fp_cgGetParameterIndex) params__) {
	return checkedCall("cgGetParameterIndex", fp_cgGetParameterIndex, params__);
}

void cgSetParameterVariability(ParameterTupleOf!(fp_cgSetParameterVariability) params__) {
	return checkedCall("cgSetParameterVariability", fp_cgSetParameterVariability, params__);
}
void cgSetParameterSemantic(ParameterTupleOf!(fp_cgSetParameterSemantic) params__) {
	return checkedCall("cgSetParameterSemantic", fp_cgSetParameterSemantic, params__);
}

void cgSetParameter1f(ParameterTupleOf!(fp_cgSetParameter1f) params__) {
	return checkedCall("cgSetParameter1f", fp_cgSetParameter1f, params__);
}
void cgSetParameter2f(ParameterTupleOf!(fp_cgSetParameter2f) params__) {
	return checkedCall("cgSetParameter2f", fp_cgSetParameter2f, params__);
}
void cgSetParameter3f(ParameterTupleOf!(fp_cgSetParameter3f) params__) {
	return checkedCall("cgSetParameter3f", fp_cgSetParameter3f, params__);
}
void cgSetParameter4f(ParameterTupleOf!(fp_cgSetParameter4f) params__) {
	return checkedCall("cgSetParameter4f", fp_cgSetParameter4f, params__);
}
void cgSetParameter1d(ParameterTupleOf!(fp_cgSetParameter1d) params__) {
	return checkedCall("cgSetParameter1d", fp_cgSetParameter1d, params__);
}
void cgSetParameter2d(ParameterTupleOf!(fp_cgSetParameter2d) params__) {
	return checkedCall("cgSetParameter2d", fp_cgSetParameter2d, params__);
}
void cgSetParameter3d(ParameterTupleOf!(fp_cgSetParameter3d) params__) {
	return checkedCall("cgSetParameter3d", fp_cgSetParameter3d, params__);
}
void cgSetParameter4d(ParameterTupleOf!(fp_cgSetParameter4d) params__) {
	return checkedCall("cgSetParameter4d", fp_cgSetParameter4d, params__);
}
void cgSetParameter1i(ParameterTupleOf!(fp_cgSetParameter1i) params__) {
	return checkedCall("cgSetParameter1i", fp_cgSetParameter1i, params__);
}
void cgSetParameter2i(ParameterTupleOf!(fp_cgSetParameter2i) params__) {
	return checkedCall("cgSetParameter2i", fp_cgSetParameter2i, params__);
}
void cgSetParameter3i(ParameterTupleOf!(fp_cgSetParameter3i) params__) {
	return checkedCall("cgSetParameter3i", fp_cgSetParameter3i, params__);
}
void cgSetParameter4i(ParameterTupleOf!(fp_cgSetParameter4i) params__) {
	return checkedCall("cgSetParameter4i", fp_cgSetParameter4i, params__);
}

void cgSetParameter1iv(ParameterTupleOf!(fp_cgSetParameter1iv) params__) {
	return checkedCall("cgSetParameter1iv", fp_cgSetParameter1iv, params__);
}
void cgSetParameter2iv(ParameterTupleOf!(fp_cgSetParameter2iv) params__) {
	return checkedCall("cgSetParameter2iv", fp_cgSetParameter2iv, params__);
}
void cgSetParameter3iv(ParameterTupleOf!(fp_cgSetParameter3iv) params__) {
	return checkedCall("cgSetParameter3iv", fp_cgSetParameter3iv, params__);
}
void cgSetParameter4iv(ParameterTupleOf!(fp_cgSetParameter4iv) params__) {
	return checkedCall("cgSetParameter4iv", fp_cgSetParameter4iv, params__);
}
void cgSetParameter1fv(ParameterTupleOf!(fp_cgSetParameter1fv) params__) {
	return checkedCall("cgSetParameter1fv", fp_cgSetParameter1fv, params__);
}
void cgSetParameter2fv(ParameterTupleOf!(fp_cgSetParameter2fv) params__) {
	return checkedCall("cgSetParameter2fv", fp_cgSetParameter2fv, params__);
}
void cgSetParameter3fv(ParameterTupleOf!(fp_cgSetParameter3fv) params__) {
	return checkedCall("cgSetParameter3fv", fp_cgSetParameter3fv, params__);
}
void cgSetParameter4fv(ParameterTupleOf!(fp_cgSetParameter4fv) params__) {
	return checkedCall("cgSetParameter4fv", fp_cgSetParameter4fv, params__);
}
void cgSetParameter1dv(ParameterTupleOf!(fp_cgSetParameter1dv) params__) {
	return checkedCall("cgSetParameter1dv", fp_cgSetParameter1dv, params__);
}
void cgSetParameter2dv(ParameterTupleOf!(fp_cgSetParameter2dv) params__) {
	return checkedCall("cgSetParameter2dv", fp_cgSetParameter2dv, params__);
}
void cgSetParameter3dv(ParameterTupleOf!(fp_cgSetParameter3dv) params__) {
	return checkedCall("cgSetParameter3dv", fp_cgSetParameter3dv, params__);
}
void cgSetParameter4dv(ParameterTupleOf!(fp_cgSetParameter4dv) params__) {
	return checkedCall("cgSetParameter4dv", fp_cgSetParameter4dv, params__);
}

void cgSetMatrixParameterir(ParameterTupleOf!(fp_cgSetMatrixParameterir) params__) {
	return checkedCall("cgSetMatrixParameterir", fp_cgSetMatrixParameterir, params__);
}
void cgSetMatrixParameterdr(ParameterTupleOf!(fp_cgSetMatrixParameterdr) params__) {
	return checkedCall("cgSetMatrixParameterdr", fp_cgSetMatrixParameterdr, params__);
}
void cgSetMatrixParameterfr(ParameterTupleOf!(fp_cgSetMatrixParameterfr) params__) {
	return checkedCall("cgSetMatrixParameterfr", fp_cgSetMatrixParameterfr, params__);
}
void cgSetMatrixParameteric(ParameterTupleOf!(fp_cgSetMatrixParameteric) params__) {
	return checkedCall("cgSetMatrixParameteric", fp_cgSetMatrixParameteric, params__);
}
void cgSetMatrixParameterdc(ParameterTupleOf!(fp_cgSetMatrixParameterdc) params__) {
	return checkedCall("cgSetMatrixParameterdc", fp_cgSetMatrixParameterdc, params__);
}
void cgSetMatrixParameterfc(ParameterTupleOf!(fp_cgSetMatrixParameterfc) params__) {
	return checkedCall("cgSetMatrixParameterfc", fp_cgSetMatrixParameterfc, params__);
}

void cgGetMatrixParameterir(ParameterTupleOf!(fp_cgGetMatrixParameterir) params__) {
	return checkedCall("cgGetMatrixParameterir", fp_cgGetMatrixParameterir, params__);
}
void cgGetMatrixParameterdr(ParameterTupleOf!(fp_cgGetMatrixParameterdr) params__) {
	return checkedCall("cgGetMatrixParameterdr", fp_cgGetMatrixParameterdr, params__);
}
void cgGetMatrixParameterfr(ParameterTupleOf!(fp_cgGetMatrixParameterfr) params__) {
	return checkedCall("cgGetMatrixParameterfr", fp_cgGetMatrixParameterfr, params__);
}
void cgGetMatrixParameteric(ParameterTupleOf!(fp_cgGetMatrixParameteric) params__) {
	return checkedCall("cgGetMatrixParameteric", fp_cgGetMatrixParameteric, params__);
}
void cgGetMatrixParameterdc(ParameterTupleOf!(fp_cgGetMatrixParameterdc) params__) {
	return checkedCall("cgGetMatrixParameterdc", fp_cgGetMatrixParameterdc, params__);
}
void cgGetMatrixParameterfc(ParameterTupleOf!(fp_cgGetMatrixParameterfc) params__) {
	return checkedCall("cgGetMatrixParameterfc", fp_cgGetMatrixParameterfc, params__);
}

CGparameter cgGetNamedSubParameter(ParameterTupleOf!(fp_cgGetNamedSubParameter) params__) {
	return checkedCall("cgGetNamedSubParameter", fp_cgGetNamedSubParameter, params__);
}

/*** Type Functions ***/

char * cgGetTypeString(ParameterTupleOf!(fp_cgGetTypeString) params__) {
	return checkedCall("cgGetTypeString", fp_cgGetTypeString, params__);
}
CGtype cgGetType(ParameterTupleOf!(fp_cgGetType) params__) {
	return checkedCall("cgGetType", fp_cgGetType, params__);
}

CGtype cgGetNamedUserType(ParameterTupleOf!(fp_cgGetNamedUserType) params__) {
	return checkedCall("cgGetNamedUserType", fp_cgGetNamedUserType, params__);
}

int cgGetNumUserTypes(ParameterTupleOf!(fp_cgGetNumUserTypes) params__) {
	return checkedCall("cgGetNumUserTypes", fp_cgGetNumUserTypes, params__);
}
CGtype cgGetUserType(ParameterTupleOf!(fp_cgGetUserType) params__) {
	return checkedCall("cgGetUserType", fp_cgGetUserType, params__);
}

int cgGetNumParentTypes(ParameterTupleOf!(fp_cgGetNumParentTypes) params__) {
	return checkedCall("cgGetNumParentTypes", fp_cgGetNumParentTypes, params__);
}
CGtype cgGetParentType(ParameterTupleOf!(fp_cgGetParentType) params__) {
	return checkedCall("cgGetParentType", fp_cgGetParentType, params__);
}

CGbool cgIsParentType(ParameterTupleOf!(fp_cgIsParentType) params__) {
	return checkedCall("cgIsParentType", fp_cgIsParentType, params__);
}
CGbool cgIsInterfaceType(ParameterTupleOf!(fp_cgIsInterfaceType) params__) {
	return checkedCall("cgIsInterfaceType", fp_cgIsInterfaceType, params__);
}

/*** Resource Functions ***/

char * cgGetResourceString(ParameterTupleOf!(fp_cgGetResourceString) params__) {
	return checkedCall("cgGetResourceString", fp_cgGetResourceString, params__);
}
CGresource cgGetResource(ParameterTupleOf!(fp_cgGetResource) params__) {
	return checkedCall("cgGetResource", fp_cgGetResource, params__);
}

/*** Enum Functions ***/

char * cgGetEnumString(ParameterTupleOf!(fp_cgGetEnumString) params__) {
	return checkedCall("cgGetEnumString", fp_cgGetEnumString, params__);
}
CGenum cgGetEnum(ParameterTupleOf!(fp_cgGetEnum) params__) {
	return checkedCall("cgGetEnum", fp_cgGetEnum, params__);
}

/*** Profile Functions ***/

char * cgGetProfileString(ParameterTupleOf!(fp_cgGetProfileString) params__) {
	return checkedCall("cgGetProfileString", fp_cgGetProfileString, params__);
}
CGprofile cgGetProfile(ParameterTupleOf!(fp_cgGetProfile) params__) {
	return checkedCall("cgGetProfile", fp_cgGetProfile, params__);
}

/*** Error Functions ***/

CGerror cgGetError(ParameterTupleOf!(fp_cgGetError) params__) {
	return checkedCall("cgGetError", fp_cgGetError, params__);
}
CGerror cgGetFirstError(ParameterTupleOf!(fp_cgGetFirstError) params__) {
	return checkedCall("cgGetFirstError", fp_cgGetFirstError, params__);
}
char * cgGetErrorString(ParameterTupleOf!(fp_cgGetErrorString) params__) {
	return checkedCall("cgGetErrorString", fp_cgGetErrorString, params__);
}
char * cgGetLastErrorString(ParameterTupleOf!(fp_cgGetLastErrorString) params__) {
	return checkedCall("cgGetLastErrorString", fp_cgGetLastErrorString, params__);
}
void cgSetErrorCallback(ParameterTupleOf!(fp_cgSetErrorCallback) params__) {
	version(LDC) { // Bug in ldc
		alias void  function()CGerrorCallbackFunc;
		return checkedCall("cgSetErrorCallback", cast(void function(CGerrorCallbackFunc))fp_cgSetErrorCallback, params__);
	} else {
		return checkedCall("cgSetErrorCallback", fp_cgSetErrorCallback, params__);
	}
}
CGerrorCallbackFunc cgGetErrorCallback(ParameterTupleOf!(fp_cgGetErrorCallback) params__) {
	return checkedCall("cgGetErrorCallback", fp_cgGetErrorCallback, params__);
}
void cgSetErrorHandler(ParameterTupleOf!(fp_cgSetErrorHandler) params__) {
	version(LDC) { // Bug in ldc
		alias void  function(CGcontext ctx, CGerror err, void *data)CGerrorHandlerFunc;
		return checkedCall("cgSetErrorHandler", cast(void function(CGerrorHandlerFunc func, void *data))fp_cgSetErrorHandler, params__);
	} else {
		return checkedCall("cgSetErrorHandler", cast(void function(CGerrorHandlerFunc func, void *data))fp_cgSetErrorHandler, params__);
	}
}
CGerrorHandlerFunc cgGetErrorHandler(ParameterTupleOf!(fp_cgGetErrorHandler) params__) {
	return checkedCall("cgGetErrorHandler",fp_cgGetErrorHandler, params__);
}

/*** Misc Functions ***/

char * cgGetString(ParameterTupleOf!(fp_cgGetString) params__) {
	return checkedCall("cgGetString", fp_cgGetString, params__);
}


/*** CgFX Functions ***/

CGeffect cgCreateEffect(ParameterTupleOf!(fp_cgCreateEffect) params__) {
	return checkedCall("cgCreateEffect", fp_cgCreateEffect, params__);
}
CGeffect cgCreateEffectFromFile(ParameterTupleOf!(fp_cgCreateEffectFromFile) params__) {
	return checkedCall("cgCreateEffectFromFile", fp_cgCreateEffectFromFile, params__);
}
CGeffect cgCopyEffect(ParameterTupleOf!(fp_cgCopyEffect) params__) {
	return checkedCall("cgCopyEffect", fp_cgCopyEffect, params__);
} 
void cgDestroyEffect(ParameterTupleOf!(fp_cgDestroyEffect) params__) {
	return checkedCall("cgDestroyEffect", fp_cgDestroyEffect, params__);
}
CGcontext cgGetEffectContext(ParameterTupleOf!(fp_cgGetEffectContext) params__) {
	return checkedCall("cgGetEffectContext", fp_cgGetEffectContext, params__);
}
CGbool cgIsEffect(ParameterTupleOf!(fp_cgIsEffect) params__) {
	return checkedCall("cgIsEffect", fp_cgIsEffect, params__);
}

CGeffect cgGetFirstEffect(ParameterTupleOf!(fp_cgGetFirstEffect) params__) {
	return checkedCall("cgGetFirstEffect", fp_cgGetFirstEffect, params__);
}
CGeffect cgGetNextEffect(ParameterTupleOf!(fp_cgGetNextEffect) params__) {
	return checkedCall("cgGetNextEffect", fp_cgGetNextEffect, params__);
}

CGprogram cgCreateProgramFromEffect(ParameterTupleOf!(fp_cgCreateProgramFromEffect) params__) {
	return checkedCall("cgCreateProgramFromEffect", fp_cgCreateProgramFromEffect, params__);
}

CGtechnique cgGetFirstTechnique(ParameterTupleOf!(fp_cgGetFirstTechnique) params__) {
	return checkedCall("cgGetFirstTechnique", fp_cgGetFirstTechnique, params__);
}
CGtechnique cgGetNextTechnique(ParameterTupleOf!(fp_cgGetNextTechnique) params__) {
	return checkedCall("cgGetNextTechnique", fp_cgGetNextTechnique, params__);
}
CGtechnique cgGetNamedTechnique(ParameterTupleOf!(fp_cgGetNamedTechnique) params__) {
	return checkedCall("cgGetNamedTechnique", fp_cgGetNamedTechnique, params__);
}
char * cgGetTechniqueName(ParameterTupleOf!(fp_cgGetTechniqueName) params__) {
	return checkedCall("cgGetTechniqueName", fp_cgGetTechniqueName, params__);
}
CGbool cgIsTechnique(ParameterTupleOf!(fp_cgIsTechnique) params__) {
	return checkedCall("cgIsTechnique", fp_cgIsTechnique, params__);
}
CGbool cgValidateTechnique(ParameterTupleOf!(fp_cgValidateTechnique) params__) {
	return checkedCall("cgValidateTechnique", fp_cgValidateTechnique, params__);
}
CGbool cgIsTechniqueValidated(ParameterTupleOf!(fp_cgIsTechniqueValidated) params__) {
	return checkedCall("cgIsTechniqueValidated", fp_cgIsTechniqueValidated, params__);
}
CGeffect cgGetTechniqueEffect(ParameterTupleOf!(fp_cgGetTechniqueEffect) params__) {
	return checkedCall("cgGetTechniqueEffect", fp_cgGetTechniqueEffect, params__);
}

CGpass cgGetFirstPass(ParameterTupleOf!(fp_cgGetFirstPass) params__) {
	return checkedCall("cgGetFirstPass", fp_cgGetFirstPass, params__);
}
CGpass cgGetNamedPass(ParameterTupleOf!(fp_cgGetNamedPass) params__) {
	return checkedCall("cgGetNamedPass", fp_cgGetNamedPass, params__);
}
CGpass cgGetNextPass(ParameterTupleOf!(fp_cgGetNextPass) params__) {
	return checkedCall("cgGetNextPass", fp_cgGetNextPass, params__);
}
CGbool cgIsPass(ParameterTupleOf!(fp_cgIsPass) params__) {
	return checkedCall("cgIsPass", fp_cgIsPass, params__);
}
char * cgGetPassName(ParameterTupleOf!(fp_cgGetPassName) params__) {
	return checkedCall("cgGetPassName", fp_cgGetPassName, params__);
} 
CGtechnique cgGetPassTechnique(ParameterTupleOf!(fp_cgGetPassTechnique) params__) {
	return checkedCall("cgGetPassTechnique", fp_cgGetPassTechnique, params__);
}

void cgSetPassState(ParameterTupleOf!(fp_cgSetPassState) params__) {
	return checkedCall("cgSetPassState", fp_cgSetPassState, params__);
}
void cgResetPassState(ParameterTupleOf!(fp_cgResetPassState) params__) {
	return checkedCall("cgResetPassState", fp_cgResetPassState, params__);
}

CGstateassignment cgGetFirstStateAssignment(ParameterTupleOf!(fp_cgGetFirstStateAssignment) params__) {
	return checkedCall("cgGetFirstStateAssignment", fp_cgGetFirstStateAssignment, params__);
}
CGstateassignment cgGetNamedStateAssignment(ParameterTupleOf!(fp_cgGetNamedStateAssignment) params__) {
	return checkedCall("cgGetNamedStateAssignment", fp_cgGetNamedStateAssignment, params__);
}
CGstateassignment cgGetNextStateAssignment(ParameterTupleOf!(fp_cgGetNextStateAssignment) params__) {
	return checkedCall("cgGetNextStateAssignment", fp_cgGetNextStateAssignment, params__);
}
CGbool cgIsStateAssignment(ParameterTupleOf!(fp_cgIsStateAssignment) params__) {
	return checkedCall("cgIsStateAssignment", fp_cgIsStateAssignment, params__);
}
CGbool cgCallStateSetCallback(ParameterTupleOf!(fp_cgCallStateSetCallback) params__) {
	return checkedCall("cgCallStateSetCallback", fp_cgCallStateSetCallback, params__);
}
CGbool cgCallStateValidateCallback(ParameterTupleOf!(fp_cgCallStateValidateCallback) params__) {
	return checkedCall("cgCallStateValidateCallback", fp_cgCallStateValidateCallback, params__);
}
CGbool cgCallStateResetCallback(ParameterTupleOf!(fp_cgCallStateResetCallback) params__) {
	return checkedCall("cgCallStateResetCallback", fp_cgCallStateResetCallback, params__);
}
CGpass cgGetStateAssignmentPass(ParameterTupleOf!(fp_cgGetStateAssignmentPass) params__) {
	return checkedCall("cgGetStateAssignmentPass", fp_cgGetStateAssignmentPass, params__);
}
CGparameter cgGetSamplerStateAssignmentParameter(ParameterTupleOf!(fp_cgGetSamplerStateAssignmentParameter) params__) {
	return checkedCall("cgGetSamplerStateAssignmentParameter", fp_cgGetSamplerStateAssignmentParameter, params__);
}

 float * cgGetFloatStateAssignmentValues(ParameterTupleOf!(fp_cgGetFloatStateAssignmentValues) params__) {
	return checkedCall("cgGetFloatStateAssignmentValues", fp_cgGetFloatStateAssignmentValues, params__);
}
 int * cgGetIntStateAssignmentValues(ParameterTupleOf!(fp_cgGetIntStateAssignmentValues) params__) {
	return checkedCall("cgGetIntStateAssignmentValues", fp_cgGetIntStateAssignmentValues, params__);
}
 CGbool * cgGetBoolStateAssignmentValues(ParameterTupleOf!(fp_cgGetBoolStateAssignmentValues) params__) {
	return checkedCall("cgGetBoolStateAssignmentValues", fp_cgGetBoolStateAssignmentValues, params__);
}
 char * cgGetStringStateAssignmentValue(ParameterTupleOf!(fp_cgGetStringStateAssignmentValue) params__) {
	return checkedCall("cgGetStringStateAssignmentValue", fp_cgGetStringStateAssignmentValue, params__);
}
CGprogram cgGetProgramStateAssignmentValue(ParameterTupleOf!(fp_cgGetProgramStateAssignmentValue) params__) {
	return checkedCall("cgGetProgramStateAssignmentValue", fp_cgGetProgramStateAssignmentValue, params__);
}
CGparameter cgGetTextureStateAssignmentValue(ParameterTupleOf!(fp_cgGetTextureStateAssignmentValue) params__) {
	return checkedCall("cgGetTextureStateAssignmentValue", fp_cgGetTextureStateAssignmentValue, params__);
}
CGparameter cgGetSamplerStateAssignmentValue(ParameterTupleOf!(fp_cgGetSamplerStateAssignmentValue) params__) {
	return checkedCall("cgGetSamplerStateAssignmentValue", fp_cgGetSamplerStateAssignmentValue, params__);
}
int cgGetStateAssignmentIndex(ParameterTupleOf!(fp_cgGetStateAssignmentIndex) params__) {
	return checkedCall("cgGetStateAssignmentIndex", fp_cgGetStateAssignmentIndex, params__);
}

int cgGetNumDependentStateAssignmentParameters(ParameterTupleOf!(fp_cgGetNumDependentStateAssignmentParameters) params__) {
	return checkedCall("cgGetNumDependentStateAssignmentParameters", fp_cgGetNumDependentStateAssignmentParameters, params__);
}
CGparameter cgGetDependentStateAssignmentParameter(ParameterTupleOf!(fp_cgGetDependentStateAssignmentParameter) params__) {
	return checkedCall("cgGetDependentStateAssignmentParameter", fp_cgGetDependentStateAssignmentParameter, params__);
}

CGparameter cgGetConnectedStateAssignmentParameter(ParameterTupleOf!(fp_cgGetConnectedStateAssignmentParameter) params__) {
	return checkedCall("cgGetConnectedStateAssignmentParameter", fp_cgGetConnectedStateAssignmentParameter, params__);
}

CGstate cgGetStateAssignmentState(ParameterTupleOf!(fp_cgGetStateAssignmentState) params__) {
	return checkedCall("cgGetStateAssignmentState", fp_cgGetStateAssignmentState, params__);
}
CGstate cgGetSamplerStateAssignmentState(ParameterTupleOf!(fp_cgGetSamplerStateAssignmentState) params__) {
	return checkedCall("cgGetSamplerStateAssignmentState", fp_cgGetSamplerStateAssignmentState, params__);
}

CGstate cgCreateState(ParameterTupleOf!(fp_cgCreateState) params__) {
	return checkedCall("cgCreateState", fp_cgCreateState, params__);
}
CGstate cgCreateArrayState(ParameterTupleOf!(fp_cgCreateArrayState) params__) {
	return checkedCall("cgCreateArrayState", fp_cgCreateArrayState, params__);
}
void cgSetStateCallbacks(ParameterTupleOf!(fp_cgSetStateCallbacks) params__) {
	version(LDC) { // Bug in ldc
		alias CGbool  function(CGstateassignment )CGstatecallback;
		return checkedCall("cgSetStateCallbacks", cast( void function(CGstate, CGstatecallback set, CGstatecallback reset, CGstatecallback validate) )fp_cgSetStateCallbacks, params__);
	} else {
		return checkedCall("cgSetStateCallbacks", cast( void function(CGstate, CGstatecallback set, CGstatecallback reset, CGstatecallback validate) )fp_cgSetStateCallbacks, params__);
	}
}
CGstatecallback cgGetStateSetCallback(ParameterTupleOf!(fp_cgGetStateSetCallback) params__) {
	return checkedCall("cgGetStateSetCallback", fp_cgGetStateSetCallback, params__);
}
CGstatecallback cgGetStateResetCallback(ParameterTupleOf!(fp_cgGetStateResetCallback) params__) {
	return checkedCall("cgGetStateResetCallback", fp_cgGetStateResetCallback, params__);
}
CGstatecallback cgGetStateValidateCallback(ParameterTupleOf!(fp_cgGetStateValidateCallback) params__) {
	return checkedCall("cgGetStateValidateCallback", fp_cgGetStateValidateCallback, params__);
}
CGcontext cgGetStateContext(ParameterTupleOf!(fp_cgGetStateContext) params__) {
	return checkedCall("cgGetStateContext", fp_cgGetStateContext, params__);
}
CGtype cgGetStateType(ParameterTupleOf!(fp_cgGetStateType) params__) {
	return checkedCall("cgGetStateType", fp_cgGetStateType, params__);
}
 char * cgGetStateName(ParameterTupleOf!(fp_cgGetStateName) params__) {
	return checkedCall("cgGetStateName", fp_cgGetStateName, params__);
}
CGstate cgGetNamedState(ParameterTupleOf!(fp_cgGetNamedState) params__) {
	return checkedCall("cgGetNamedState", fp_cgGetNamedState, params__);
}
CGstate cgGetFirstState(ParameterTupleOf!(fp_cgGetFirstState) params__) {
	return checkedCall("cgGetFirstState", fp_cgGetFirstState, params__);
}
CGstate cgGetNextState(ParameterTupleOf!(fp_cgGetNextState) params__) {
	return checkedCall("cgGetNextState", fp_cgGetNextState, params__);
}
CGbool cgIsState(ParameterTupleOf!(fp_cgIsState) params__) {
	return checkedCall("cgIsState", fp_cgIsState, params__);
}
void cgAddStateEnumerant(ParameterTupleOf!(fp_cgAddStateEnumerant) params__) {
	return checkedCall("cgAddStateEnumerant", fp_cgAddStateEnumerant, params__);
}

CGstate cgCreateSamplerState(ParameterTupleOf!(fp_cgCreateSamplerState) params__) {
	return checkedCall("cgCreateSamplerState", fp_cgCreateSamplerState, params__);
}
CGstate cgCreateArraySamplerState(ParameterTupleOf!(fp_cgCreateArraySamplerState) params__) {
	return checkedCall("cgCreateArraySamplerState", fp_cgCreateArraySamplerState, params__);
}
CGstate cgGetNamedSamplerState(ParameterTupleOf!(fp_cgGetNamedSamplerState) params__) {
	return checkedCall("cgGetNamedSamplerState", fp_cgGetNamedSamplerState, params__);
}
CGstate cgGetFirstSamplerState(ParameterTupleOf!(fp_cgGetFirstSamplerState) params__) {
	return checkedCall("cgGetFirstSamplerState", fp_cgGetFirstSamplerState, params__);
}

CGstateassignment cgGetFirstSamplerStateAssignment(ParameterTupleOf!(fp_cgGetFirstSamplerStateAssignment) params__) {
	return checkedCall("cgGetFirstSamplerStateAssignment", fp_cgGetFirstSamplerStateAssignment, params__);
}
CGstateassignment cgGetNamedSamplerStateAssignment(ParameterTupleOf!(fp_cgGetNamedSamplerStateAssignment) params__) {
	return checkedCall("cgGetNamedSamplerStateAssignment", fp_cgGetNamedSamplerStateAssignment, params__);
}
void cgSetSamplerState(ParameterTupleOf!(fp_cgSetSamplerState) params__) {
	return checkedCall("cgSetSamplerState", fp_cgSetSamplerState, params__);
}

CGparameter cgGetNamedEffectParameter(ParameterTupleOf!(fp_cgGetNamedEffectParameter) params__) {
	return checkedCall("cgGetNamedEffectParameter", fp_cgGetNamedEffectParameter, params__);
}
CGparameter cgGetFirstLeafEffectParameter(ParameterTupleOf!(fp_cgGetFirstLeafEffectParameter) params__) {
	return checkedCall("cgGetFirstLeafEffectParameter", fp_cgGetFirstLeafEffectParameter, params__);
}
CGparameter cgGetFirstEffectParameter(ParameterTupleOf!(fp_cgGetFirstEffectParameter) params__) {
	return checkedCall("cgGetFirstEffectParameter", fp_cgGetFirstEffectParameter, params__);
}
CGparameter cgGetEffectParameterBySemantic(ParameterTupleOf!(fp_cgGetEffectParameterBySemantic) params__) {
	return checkedCall("cgGetEffectParameterBySemantic", fp_cgGetEffectParameterBySemantic, params__);
}

CGannotation cgGetFirstTechniqueAnnotation(ParameterTupleOf!(fp_cgGetFirstTechniqueAnnotation) params__) {
	return checkedCall("cgGetFirstTechniqueAnnotation", fp_cgGetFirstTechniqueAnnotation, params__);
}
CGannotation cgGetFirstPassAnnotation(ParameterTupleOf!(fp_cgGetFirstPassAnnotation) params__) {
	return checkedCall("cgGetFirstPassAnnotation", fp_cgGetFirstPassAnnotation, params__);
}
CGannotation cgGetFirstParameterAnnotation(ParameterTupleOf!(fp_cgGetFirstParameterAnnotation) params__) {
	return checkedCall("cgGetFirstParameterAnnotation", fp_cgGetFirstParameterAnnotation, params__);
}
CGannotation cgGetFirstProgramAnnotation(ParameterTupleOf!(fp_cgGetFirstProgramAnnotation) params__) {
	return checkedCall("cgGetFirstProgramAnnotation", fp_cgGetFirstProgramAnnotation, params__);
}
CGannotation cgGetFirstEffectAnnotation(ParameterTupleOf!(fp_cgGetFirstEffectAnnotation) params__) {
	return checkedCall("cgGetFirstEffectAnnotation", fp_cgGetFirstEffectAnnotation, params__);
}
CGannotation cgGetNextAnnotation(ParameterTupleOf!(fp_cgGetNextAnnotation) params__) {
	return checkedCall("cgGetNextAnnotation", fp_cgGetNextAnnotation, params__);
}

CGannotation cgGetNamedTechniqueAnnotation(ParameterTupleOf!(fp_cgGetNamedTechniqueAnnotation) params__) {
	return checkedCall("cgGetNamedTechniqueAnnotation", fp_cgGetNamedTechniqueAnnotation, params__);
}
CGannotation cgGetNamedPassAnnotation(ParameterTupleOf!(fp_cgGetNamedPassAnnotation) params__) {
	return checkedCall("cgGetNamedPassAnnotation", fp_cgGetNamedPassAnnotation, params__);
}
CGannotation cgGetNamedParameterAnnotation(ParameterTupleOf!(fp_cgGetNamedParameterAnnotation) params__) {
	return checkedCall("cgGetNamedParameterAnnotation", fp_cgGetNamedParameterAnnotation, params__);
}
CGannotation cgGetNamedProgramAnnotation(ParameterTupleOf!(fp_cgGetNamedProgramAnnotation) params__) {
	return checkedCall("cgGetNamedProgramAnnotation", fp_cgGetNamedProgramAnnotation, params__);
}
CGannotation cgGetNamedEffectAnnotation(ParameterTupleOf!(fp_cgGetNamedEffectAnnotation) params__) {
	return checkedCall("cgGetNamedEffectAnnotation", fp_cgGetNamedEffectAnnotation, params__);
}

CGbool cgIsAnnotation(ParameterTupleOf!(fp_cgIsAnnotation) params__) {
	return checkedCall("cgIsAnnotation", fp_cgIsAnnotation, params__);
}

 char * cgGetAnnotationName(ParameterTupleOf!(fp_cgGetAnnotationName) params__) {
	return checkedCall("cgGetAnnotationName", fp_cgGetAnnotationName, params__);
}
CGtype cgGetAnnotationType(ParameterTupleOf!(fp_cgGetAnnotationType) params__) {
	return checkedCall("cgGetAnnotationType", fp_cgGetAnnotationType, params__);
}

 float * cgGetFloatAnnotationValues(ParameterTupleOf!(fp_cgGetFloatAnnotationValues) params__) {
	return checkedCall("cgGetFloatAnnotationValues", fp_cgGetFloatAnnotationValues, params__);
}
 int * cgGetIntAnnotationValues(ParameterTupleOf!(fp_cgGetIntAnnotationValues) params__) {
	return checkedCall("cgGetIntAnnotationValues", fp_cgGetIntAnnotationValues, params__);
}
 char * cgGetStringAnnotationValue(ParameterTupleOf!(fp_cgGetStringAnnotationValue) params__) {
	return checkedCall("cgGetStringAnnotationValue", fp_cgGetStringAnnotationValue, params__);
}
 char *  * cgGetStringAnnotationValues(ParameterTupleOf!(fp_cgGetStringAnnotationValues) params__) {
	return checkedCall("cgGetStringAnnotationValues", fp_cgGetStringAnnotationValues, params__);
}
 CGbool * cgGetBoolAnnotationValues(ParameterTupleOf!(fp_cgGetBoolAnnotationValues) params__) {
	return checkedCall("cgGetBoolAnnotationValues", fp_cgGetBoolAnnotationValues, params__);
}
 int * cgGetBooleanAnnotationValues(ParameterTupleOf!(fp_cgGetBooleanAnnotationValues) params__) {
	return checkedCall("cgGetBooleanAnnotationValues", fp_cgGetBooleanAnnotationValues, params__);
}

int cgGetNumDependentAnnotationParameters(ParameterTupleOf!(fp_cgGetNumDependentAnnotationParameters) params__) {
	return checkedCall("cgGetNumDependentAnnotationParameters", fp_cgGetNumDependentAnnotationParameters, params__);
}
CGparameter cgGetDependentAnnotationParameter(ParameterTupleOf!(fp_cgGetDependentAnnotationParameter) params__) {
	return checkedCall("cgGetDependentAnnotationParameter", fp_cgGetDependentAnnotationParameter, params__);
}

void cgEvaluateProgram(ParameterTupleOf!(fp_cgEvaluateProgram) params__) {
	return checkedCall("cgEvaluateProgram", fp_cgEvaluateProgram, params__);
}

/*** Cg 1.5 Additions ***/

CGbool cgSetEffectName(ParameterTupleOf!(fp_cgSetEffectName) params__) {
	return checkedCall("cgSetEffectName", fp_cgSetEffectName, params__);
}
 char * cgGetEffectName(ParameterTupleOf!(fp_cgGetEffectName) params__) {
	return checkedCall("cgGetEffectName", fp_cgGetEffectName, params__);
}
CGeffect cgGetNamedEffect(ParameterTupleOf!(fp_cgGetNamedEffect) params__) {
	return checkedCall("cgGetNamedEffect", fp_cgGetNamedEffect, params__);
}
CGparameter cgCreateEffectParameter(ParameterTupleOf!(fp_cgCreateEffectParameter) params__) {
	return checkedCall("cgCreateEffectParameter", fp_cgCreateEffectParameter, params__);
}

CGtechnique cgCreateTechnique(ParameterTupleOf!(fp_cgCreateTechnique) params__) {
	return checkedCall("cgCreateTechnique", fp_cgCreateTechnique, params__);
}

CGparameter cgCreateEffectParameterArray(ParameterTupleOf!(fp_cgCreateEffectParameterArray) params__) {
	return checkedCall("cgCreateEffectParameterArray", fp_cgCreateEffectParameterArray, params__);
} 
CGparameter cgCreateEffectParameterMultiDimArray(ParameterTupleOf!(fp_cgCreateEffectParameterMultiDimArray) params__) {
	return checkedCall("cgCreateEffectParameterMultiDimArray", fp_cgCreateEffectParameterMultiDimArray, params__);
} 

CGpass cgCreatePass(ParameterTupleOf!(fp_cgCreatePass) params__) {
	return checkedCall("cgCreatePass", fp_cgCreatePass, params__);
}

CGstateassignment cgCreateStateAssignment(ParameterTupleOf!(fp_cgCreateStateAssignment) params__) {
	return checkedCall("cgCreateStateAssignment", fp_cgCreateStateAssignment, params__);
}
CGstateassignment cgCreateStateAssignmentIndex(ParameterTupleOf!(fp_cgCreateStateAssignmentIndex) params__) {
	return checkedCall("cgCreateStateAssignmentIndex", fp_cgCreateStateAssignmentIndex, params__);
}
CGstateassignment cgCreateSamplerStateAssignment(ParameterTupleOf!(fp_cgCreateSamplerStateAssignment) params__) {
	return checkedCall("cgCreateSamplerStateAssignment", fp_cgCreateSamplerStateAssignment, params__);
}

CGbool cgSetFloatStateAssignment(ParameterTupleOf!(fp_cgSetFloatStateAssignment) params__) {
	return checkedCall("cgSetFloatStateAssignment", fp_cgSetFloatStateAssignment, params__);
}
CGbool cgSetIntStateAssignment(ParameterTupleOf!(fp_cgSetIntStateAssignment) params__) {
	return checkedCall("cgSetIntStateAssignment", fp_cgSetIntStateAssignment, params__);
}
CGbool cgSetBoolStateAssignment(ParameterTupleOf!(fp_cgSetBoolStateAssignment) params__) {
	return checkedCall("cgSetBoolStateAssignment", fp_cgSetBoolStateAssignment, params__);
}
CGbool cgSetStringStateAssignment(ParameterTupleOf!(fp_cgSetStringStateAssignment) params__) {
	return checkedCall("cgSetStringStateAssignment", fp_cgSetStringStateAssignment, params__);
}
CGbool cgSetProgramStateAssignment(ParameterTupleOf!(fp_cgSetProgramStateAssignment) params__) {
	return checkedCall("cgSetProgramStateAssignment", fp_cgSetProgramStateAssignment, params__);
}
CGbool cgSetSamplerStateAssignment(ParameterTupleOf!(fp_cgSetSamplerStateAssignment) params__) {
	return checkedCall("cgSetSamplerStateAssignment", fp_cgSetSamplerStateAssignment, params__);
}
CGbool cgSetTextureStateAssignment(ParameterTupleOf!(fp_cgSetTextureStateAssignment) params__) {
	return checkedCall("cgSetTextureStateAssignment", fp_cgSetTextureStateAssignment, params__);
}

CGbool cgSetFloatArrayStateAssignment(ParameterTupleOf!(fp_cgSetFloatArrayStateAssignment) params__) {
	return checkedCall("cgSetFloatArrayStateAssignment", fp_cgSetFloatArrayStateAssignment, params__);
}
CGbool cgSetIntArrayStateAssignment(ParameterTupleOf!(fp_cgSetIntArrayStateAssignment) params__) {
	return checkedCall("cgSetIntArrayStateAssignment", fp_cgSetIntArrayStateAssignment, params__);
}
CGbool cgSetBoolArrayStateAssignment(ParameterTupleOf!(fp_cgSetBoolArrayStateAssignment) params__) {
	return checkedCall("cgSetBoolArrayStateAssignment", fp_cgSetBoolArrayStateAssignment, params__);
}

CGannotation cgCreateTechniqueAnnotation(ParameterTupleOf!(fp_cgCreateTechniqueAnnotation) params__) {
	return checkedCall("cgCreateTechniqueAnnotation", fp_cgCreateTechniqueAnnotation, params__);
}
CGannotation cgCreatePassAnnotation(ParameterTupleOf!(fp_cgCreatePassAnnotation) params__) {
	return checkedCall("cgCreatePassAnnotation", fp_cgCreatePassAnnotation, params__);
}
CGannotation cgCreateParameterAnnotation(ParameterTupleOf!(fp_cgCreateParameterAnnotation) params__) {
	return checkedCall("cgCreateParameterAnnotation", fp_cgCreateParameterAnnotation, params__);
}
CGannotation cgCreateProgramAnnotation(ParameterTupleOf!(fp_cgCreateProgramAnnotation) params__) {
	return checkedCall("cgCreateProgramAnnotation", fp_cgCreateProgramAnnotation, params__);
}
CGannotation cgCreateEffectAnnotation(ParameterTupleOf!(fp_cgCreateEffectAnnotation) params__) {
	return checkedCall("cgCreateEffectAnnotation", fp_cgCreateEffectAnnotation, params__);
}

CGbool cgSetIntAnnotation(ParameterTupleOf!(fp_cgSetIntAnnotation) params__) {
	return checkedCall("cgSetIntAnnotation", fp_cgSetIntAnnotation, params__);
}
CGbool cgSetFloatAnnotation(ParameterTupleOf!(fp_cgSetFloatAnnotation) params__) {
	return checkedCall("cgSetFloatAnnotation", fp_cgSetFloatAnnotation, params__);
}
CGbool cgSetBoolAnnotation(ParameterTupleOf!(fp_cgSetBoolAnnotation) params__) {
	return checkedCall("cgSetBoolAnnotation", fp_cgSetBoolAnnotation, params__);
}
CGbool cgSetStringAnnotation(ParameterTupleOf!(fp_cgSetStringAnnotation) params__) {
	return checkedCall("cgSetStringAnnotation", fp_cgSetStringAnnotation, params__);
}

 char * cgGetStateEnumerantName(ParameterTupleOf!(fp_cgGetStateEnumerantName) params__) {
	return checkedCall("cgGetStateEnumerantName", fp_cgGetStateEnumerantName, params__);
}
int cgGetStateEnumerantValue(ParameterTupleOf!(fp_cgGetStateEnumerantValue) params__) {
	return checkedCall("cgGetStateEnumerantValue", fp_cgGetStateEnumerantValue, params__);
}

CGeffect cgGetParameterEffect(ParameterTupleOf!(fp_cgGetParameterEffect) params__) {
	return checkedCall("cgGetParameterEffect", fp_cgGetParameterEffect, params__);
}

CGparameterclass cgGetTypeClass(ParameterTupleOf!(fp_cgGetTypeClass) params__) {
	return checkedCall("cgGetTypeClass", fp_cgGetTypeClass, params__);
}
CGtype cgGetTypeBase(ParameterTupleOf!(fp_cgGetTypeBase) params__) {
	return checkedCall("cgGetTypeBase", fp_cgGetTypeBase, params__);
}
CGbool cgGetTypeSizes(ParameterTupleOf!(fp_cgGetTypeSizes) params__) {
	return checkedCall("cgGetTypeSizes", fp_cgGetTypeSizes, params__);
}
void cgGetMatrixSize(ParameterTupleOf!(fp_cgGetMatrixSize) params__) {
	return checkedCall("cgGetMatrixSize", fp_cgGetMatrixSize, params__);
}

int cgGetNumProgramDomains(ParameterTupleOf!(fp_cgGetNumProgramDomains) params__) {
	return checkedCall("cgGetNumProgramDomains", fp_cgGetNumProgramDomains, params__);
}
CGdomain cgGetProfileDomain(ParameterTupleOf!(fp_cgGetProfileDomain) params__) {
	return checkedCall("cgGetProfileDomain", fp_cgGetProfileDomain, params__);
}
CGprogram cgCombinePrograms(ParameterTupleOf!(fp_cgCombinePrograms) params__) {
	return checkedCall("cgCombinePrograms", fp_cgCombinePrograms, params__);
}
CGprogram cgCombinePrograms2(ParameterTupleOf!(fp_cgCombinePrograms2) params__) {
	return checkedCall("cgCombinePrograms2", fp_cgCombinePrograms2, params__);
}
CGprogram cgCombinePrograms3(ParameterTupleOf!(fp_cgCombinePrograms3) params__) {
	return checkedCall("cgCombinePrograms3", fp_cgCombinePrograms3, params__);
}
CGprofile cgGetProgramDomainProfile(ParameterTupleOf!(fp_cgGetProgramDomainProfile) params__) {
	return checkedCall("cgGetProgramDomainProfile", fp_cgGetProgramDomainProfile, params__);
}

/*** CGobj Functions ***/
CGobj cgCreateObj(ParameterTupleOf!(fp_cgCreateObj) params__) {
	return checkedCall("cgCreateObj", fp_cgCreateObj, params__);
}
CGobj cgCreateObjFromFile(ParameterTupleOf!(fp_cgCreateObjFromFile) params__) {
	return checkedCall("cgCreateObjFromFile", fp_cgCreateObjFromFile, params__);
}
void cgDestroyObj(ParameterTupleOf!(fp_cgDestroyObj) params__) {
	return checkedCall("cgDestroyObj", fp_cgDestroyObj, params__);
}

int cgGetParameterResourceSize(ParameterTupleOf!(fp_cgGetParameterResourceSize) params__) {
	return checkedCall("cgGetParameterResourceSize", fp_cgGetParameterResourceSize, params__);
}
CGtype cgGetParameterResourceType(ParameterTupleOf!(fp_cgGetParameterResourceType) params__) {
	return checkedCall("cgGetParameterResourceType", fp_cgGetParameterResourceType, params__);
}
int cgGetParameterBufferIndex(ParameterTupleOf!(fp_cgGetParameterBufferIndex) params__) {
	return checkedCall("cgGetParameterBufferIndex", fp_cgGetParameterBufferIndex, params__);
}
int cgGetParameterBufferOffset(ParameterTupleOf!(fp_cgGetParameterBufferOffset) params__) {
	return checkedCall("cgGetParameterBufferOffset", fp_cgGetParameterBufferOffset, params__);
}

CGbuffer cgCreateBuffer(ParameterTupleOf!(fp_cgCreateBuffer) params__) {
	return checkedCall("cgCreateBuffer", fp_cgCreateBuffer, params__);
}
void cgSetBufferData(ParameterTupleOf!(fp_cgSetBufferData) params__) {
	return checkedCall("cgSetBufferData", fp_cgSetBufferData, params__);
}
void cgSetBufferSubData(ParameterTupleOf!(fp_cgSetBufferSubData) params__) {
	return checkedCall("cgSetBufferSubData", fp_cgSetBufferSubData, params__);
}
void cgSetProgramBuffer(ParameterTupleOf!(fp_cgSetProgramBuffer) params__) {
	return checkedCall("cgSetProgramBuffer", fp_cgSetProgramBuffer, params__);
}

void * cgMapBuffer(ParameterTupleOf!(fp_cgMapBuffer) params__) {
	return checkedCall("cgMapBuffer", fp_cgMapBuffer, params__);
}
void cgUnmapBuffer(ParameterTupleOf!(fp_cgUnmapBuffer) params__) {
	return checkedCall("cgUnmapBuffer", fp_cgUnmapBuffer, params__);
}
void cgDestroyBuffer(ParameterTupleOf!(fp_cgDestroyBuffer) params__) {
	return checkedCall("cgDestroyBuffer", fp_cgDestroyBuffer, params__);
}
CGbuffer cgGetProgramBuffer(ParameterTupleOf!(fp_cgGetProgramBuffer) params__) {
	return checkedCall("cgGetProgramBuffer", fp_cgGetProgramBuffer, params__);
}
int cgGetBufferSize(ParameterTupleOf!(fp_cgGetBufferSize) params__) {
	return checkedCall("cgGetBufferSize", fp_cgGetBufferSize, params__);
}
int cgGetProgramBufferMaxSize(ParameterTupleOf!(fp_cgGetProgramBufferMaxSize) params__) {
	return checkedCall("cgGetProgramBufferMaxSize", fp_cgGetProgramBufferMaxSize, params__);
}
int cgGetProgramBufferMaxIndex(ParameterTupleOf!(fp_cgGetProgramBufferMaxIndex) params__) {
	return checkedCall("cgGetProgramBufferMaxIndex", fp_cgGetProgramBufferMaxIndex, params__);
}







/******************************************************************************
 *** Profile Functions 
 *****************************************************************************/

CGbool cgGLIsProfileSupported(ParameterTupleOf!(fp_cgGLIsProfileSupported) params__) {
	return checkedCall("cgGLIsProfileSupported", fp_cgGLIsProfileSupported, params__);
}

void cgGLEnableProfile(ParameterTupleOf!(fp_cgGLEnableProfile) params__) {
	return checkedCall("cgGLEnableProfile", fp_cgGLEnableProfile, params__);
}
void cgGLDisableProfile(ParameterTupleOf!(fp_cgGLDisableProfile) params__) {
	return checkedCall("cgGLDisableProfile", fp_cgGLDisableProfile, params__);
}

CGprofile cgGLGetLatestProfile(ParameterTupleOf!(fp_cgGLGetLatestProfile) params__) {
	return checkedCall("cgGLGetLatestProfile", fp_cgGLGetLatestProfile, params__);
}
void cgGLSetOptimalOptions(ParameterTupleOf!(fp_cgGLSetOptimalOptions) params__) {
	return checkedCall("cgGLSetOptimalOptions", fp_cgGLSetOptimalOptions, params__);
}

/******************************************************************************
 *** Program Managment Functions 
 *****************************************************************************/

void cgGLLoadProgram(ParameterTupleOf!(fp_cgGLLoadProgram) params__) {
	return checkedCall("cgGLLoadProgram", fp_cgGLLoadProgram, params__);
}
CGbool cgGLIsProgramLoaded(ParameterTupleOf!(fp_cgGLIsProgramLoaded) params__) {
	return checkedCall("cgGLIsProgramLoaded", fp_cgGLIsProgramLoaded, params__);
}
void cgGLBindProgram(ParameterTupleOf!(fp_cgGLBindProgram) params__) {
	return checkedCall("cgGLBindProgram", fp_cgGLBindProgram, params__);
}
void cgGLUnbindProgram(ParameterTupleOf!(fp_cgGLUnbindProgram) params__) {
	return checkedCall("cgGLUnbindProgram", fp_cgGLUnbindProgram, params__);
}
GLuint cgGLGetProgramID(ParameterTupleOf!(fp_cgGLGetProgramID) params__) {
	return checkedCall("cgGLGetProgramID", fp_cgGLGetProgramID, params__);
}

/******************************************************************************
 *** Parameter Managment Functions 
 *****************************************************************************/

void cgGLSetParameter1f(ParameterTupleOf!(fp_cgGLSetParameter1f) params__) {
	return checkedCall("cgGLSetParameter1f", fp_cgGLSetParameter1f, params__);
}

void cgGLSetParameter2f(ParameterTupleOf!(fp_cgGLSetParameter2f) params__) {
	return checkedCall("cgGLSetParameter2f", fp_cgGLSetParameter2f, params__);
}

void cgGLSetParameter3f(ParameterTupleOf!(fp_cgGLSetParameter3f) params__) {
	return checkedCall("cgGLSetParameter3f", fp_cgGLSetParameter3f, params__);
}

void cgGLSetParameter4f(ParameterTupleOf!(fp_cgGLSetParameter4f) params__) {
	return checkedCall("cgGLSetParameter4f", fp_cgGLSetParameter4f, params__);
}

void cgGLSetParameter1fv(ParameterTupleOf!(fp_cgGLSetParameter1fv) params__) {
	return checkedCall("cgGLSetParameter1fv", fp_cgGLSetParameter1fv, params__);
}

void cgGLSetParameter2fv(ParameterTupleOf!(fp_cgGLSetParameter2fv) params__) {
	return checkedCall("cgGLSetParameter2fv", fp_cgGLSetParameter2fv, params__);
}

void cgGLSetParameter3fv(ParameterTupleOf!(fp_cgGLSetParameter3fv) params__) {
	return checkedCall("cgGLSetParameter3fv", fp_cgGLSetParameter3fv, params__);
}

void cgGLSetParameter4fv(ParameterTupleOf!(fp_cgGLSetParameter4fv) params__) {
	return checkedCall("cgGLSetParameter4fv", fp_cgGLSetParameter4fv, params__);
}

void cgGLSetParameter1d(ParameterTupleOf!(fp_cgGLSetParameter1d) params__) {
	return checkedCall("cgGLSetParameter1d", fp_cgGLSetParameter1d, params__);
}

void cgGLSetParameter2d(ParameterTupleOf!(fp_cgGLSetParameter2d) params__) {
	return checkedCall("cgGLSetParameter2d", fp_cgGLSetParameter2d, params__);
}

void cgGLSetParameter3d(ParameterTupleOf!(fp_cgGLSetParameter3d) params__) {
	return checkedCall("cgGLSetParameter3d", fp_cgGLSetParameter3d, params__);
}

void cgGLSetParameter4d(ParameterTupleOf!(fp_cgGLSetParameter4d) params__) {
	return checkedCall("cgGLSetParameter4d", fp_cgGLSetParameter4d, params__);
}

void cgGLSetParameter1dv(ParameterTupleOf!(fp_cgGLSetParameter1dv) params__) {
	return checkedCall("cgGLSetParameter1dv", fp_cgGLSetParameter1dv, params__);
}

void cgGLSetParameter2dv(ParameterTupleOf!(fp_cgGLSetParameter2dv) params__) {
	return checkedCall("cgGLSetParameter2dv", fp_cgGLSetParameter2dv, params__);
}

void cgGLSetParameter3dv(ParameterTupleOf!(fp_cgGLSetParameter3dv) params__) {
	return checkedCall("cgGLSetParameter3dv", fp_cgGLSetParameter3dv, params__);
}

void cgGLSetParameter4dv(ParameterTupleOf!(fp_cgGLSetParameter4dv) params__) {
	return checkedCall("cgGLSetParameter4dv", fp_cgGLSetParameter4dv, params__);
}

void cgGLGetParameter1f(ParameterTupleOf!(fp_cgGLGetParameter1f) params__) {
	return checkedCall("cgGLGetParameter1f", fp_cgGLGetParameter1f, params__);
}

void cgGLGetParameter2f(ParameterTupleOf!(fp_cgGLGetParameter2f) params__) {
	return checkedCall("cgGLGetParameter2f", fp_cgGLGetParameter2f, params__);
}

void cgGLGetParameter3f(ParameterTupleOf!(fp_cgGLGetParameter3f) params__) {
	return checkedCall("cgGLGetParameter3f", fp_cgGLGetParameter3f, params__);
}

void cgGLGetParameter4f(ParameterTupleOf!(fp_cgGLGetParameter4f) params__) {
	return checkedCall("cgGLGetParameter4f", fp_cgGLGetParameter4f, params__);
}

void cgGLGetParameter1d(ParameterTupleOf!(fp_cgGLGetParameter1d) params__) {
	return checkedCall("cgGLGetParameter1d", fp_cgGLGetParameter1d, params__);
}

void cgGLGetParameter2d(ParameterTupleOf!(fp_cgGLGetParameter2d) params__) {
	return checkedCall("cgGLGetParameter2d", fp_cgGLGetParameter2d, params__);
}

void cgGLGetParameter3d(ParameterTupleOf!(fp_cgGLGetParameter3d) params__) {
	return checkedCall("cgGLGetParameter3d", fp_cgGLGetParameter3d, params__);
}

void cgGLGetParameter4d(ParameterTupleOf!(fp_cgGLGetParameter4d) params__) {
	return checkedCall("cgGLGetParameter4d", fp_cgGLGetParameter4d, params__);
}

void cgGLSetParameterArray1f(ParameterTupleOf!(fp_cgGLSetParameterArray1f) params__) {
	return checkedCall("cgGLSetParameterArray1f", fp_cgGLSetParameterArray1f, params__);
}

void cgGLSetParameterArray2f(ParameterTupleOf!(fp_cgGLSetParameterArray2f) params__) {
	return checkedCall("cgGLSetParameterArray2f", fp_cgGLSetParameterArray2f, params__);
}

void cgGLSetParameterArray3f(ParameterTupleOf!(fp_cgGLSetParameterArray3f) params__) {
	return checkedCall("cgGLSetParameterArray3f", fp_cgGLSetParameterArray3f, params__);
}

void cgGLSetParameterArray4f(ParameterTupleOf!(fp_cgGLSetParameterArray4f) params__) {
	return checkedCall("cgGLSetParameterArray4f", fp_cgGLSetParameterArray4f, params__);
}

void cgGLSetParameterArray1d(ParameterTupleOf!(fp_cgGLSetParameterArray1d) params__) {
	return checkedCall("cgGLSetParameterArray1d", fp_cgGLSetParameterArray1d, params__);
}

void cgGLSetParameterArray2d(ParameterTupleOf!(fp_cgGLSetParameterArray2d) params__) {
	return checkedCall("cgGLSetParameterArray2d", fp_cgGLSetParameterArray2d, params__);
}

void cgGLSetParameterArray3d(ParameterTupleOf!(fp_cgGLSetParameterArray3d) params__) {
	return checkedCall("cgGLSetParameterArray3d", fp_cgGLSetParameterArray3d, params__);
}

void cgGLSetParameterArray4d(ParameterTupleOf!(fp_cgGLSetParameterArray4d) params__) {
	return checkedCall("cgGLSetParameterArray4d", fp_cgGLSetParameterArray4d, params__);
}

void cgGLGetParameterArray1f(ParameterTupleOf!(fp_cgGLGetParameterArray1f) params__) {
	return checkedCall("cgGLGetParameterArray1f", fp_cgGLGetParameterArray1f, params__);
}

void cgGLGetParameterArray2f(ParameterTupleOf!(fp_cgGLGetParameterArray2f) params__) {
	return checkedCall("cgGLGetParameterArray2f", fp_cgGLGetParameterArray2f, params__);
}

void cgGLGetParameterArray3f(ParameterTupleOf!(fp_cgGLGetParameterArray3f) params__) {
	return checkedCall("cgGLGetParameterArray3f", fp_cgGLGetParameterArray3f, params__);
}

void cgGLGetParameterArray4f(ParameterTupleOf!(fp_cgGLGetParameterArray4f) params__) {
	return checkedCall("cgGLGetParameterArray4f", fp_cgGLGetParameterArray4f, params__);
}

void cgGLGetParameterArray1d(ParameterTupleOf!(fp_cgGLGetParameterArray1d) params__) {
	return checkedCall("cgGLGetParameterArray1d", fp_cgGLGetParameterArray1d, params__);
}

void cgGLGetParameterArray2d(ParameterTupleOf!(fp_cgGLGetParameterArray2d) params__) {
	return checkedCall("cgGLGetParameterArray2d", fp_cgGLGetParameterArray2d, params__);
}

void cgGLGetParameterArray3d(ParameterTupleOf!(fp_cgGLGetParameterArray3d) params__) {
	return checkedCall("cgGLGetParameterArray3d", fp_cgGLGetParameterArray3d, params__);
}

void cgGLGetParameterArray4d(ParameterTupleOf!(fp_cgGLGetParameterArray4d) params__) {
	return checkedCall("cgGLGetParameterArray4d", fp_cgGLGetParameterArray4d, params__);
}

void cgGLSetParameterPointer(ParameterTupleOf!(fp_cgGLSetParameterPointer) params__) {
	return checkedCall("cgGLSetParameterPointer", fp_cgGLSetParameterPointer, params__);
}

void cgGLEnableClientState(ParameterTupleOf!(fp_cgGLEnableClientState) params__) {
	return checkedCall("cgGLEnableClientState", fp_cgGLEnableClientState, params__);
}
void cgGLDisableClientState(ParameterTupleOf!(fp_cgGLDisableClientState) params__) {
	return checkedCall("cgGLDisableClientState", fp_cgGLDisableClientState, params__);
}

/******************************************************************************
 *** Matrix Parameter Managment Functions 
 *****************************************************************************/

void cgGLSetMatrixParameterdr(ParameterTupleOf!(fp_cgGLSetMatrixParameterdr) params__) {
	return checkedCall("cgGLSetMatrixParameterdr", fp_cgGLSetMatrixParameterdr, params__);
}
void cgGLSetMatrixParameterfr(ParameterTupleOf!(fp_cgGLSetMatrixParameterfr) params__) {
	return checkedCall("cgGLSetMatrixParameterfr", fp_cgGLSetMatrixParameterfr, params__);
}
void cgGLSetMatrixParameterdc(ParameterTupleOf!(fp_cgGLSetMatrixParameterdc) params__) {
	return checkedCall("cgGLSetMatrixParameterdc", fp_cgGLSetMatrixParameterdc, params__);
}
void cgGLSetMatrixParameterfc(ParameterTupleOf!(fp_cgGLSetMatrixParameterfc) params__) {
	return checkedCall("cgGLSetMatrixParameterfc", fp_cgGLSetMatrixParameterfc, params__);
}

void cgGLGetMatrixParameterdr(ParameterTupleOf!(fp_cgGLGetMatrixParameterdr) params__) {
	return checkedCall("cgGLGetMatrixParameterdr", fp_cgGLGetMatrixParameterdr, params__);
}
void cgGLGetMatrixParameterfr(ParameterTupleOf!(fp_cgGLGetMatrixParameterfr) params__) {
	return checkedCall("cgGLGetMatrixParameterfr", fp_cgGLGetMatrixParameterfr, params__);
}
void cgGLGetMatrixParameterdc(ParameterTupleOf!(fp_cgGLGetMatrixParameterdc) params__) {
	return checkedCall("cgGLGetMatrixParameterdc", fp_cgGLGetMatrixParameterdc, params__);
}
void cgGLGetMatrixParameterfc(ParameterTupleOf!(fp_cgGLGetMatrixParameterfc) params__) {
	return checkedCall("cgGLGetMatrixParameterfc", fp_cgGLGetMatrixParameterfc, params__);
}

void cgGLSetStateMatrixParameter(ParameterTupleOf!(fp_cgGLSetStateMatrixParameter) params__) {
	return checkedCall("cgGLSetStateMatrixParameter", fp_cgGLSetStateMatrixParameter, params__);
}

void cgGLSetMatrixParameterArrayfc(ParameterTupleOf!(fp_cgGLSetMatrixParameterArrayfc) params__) {
	return checkedCall("cgGLSetMatrixParameterArrayfc", fp_cgGLSetMatrixParameterArrayfc, params__);
}

void cgGLSetMatrixParameterArrayfr(ParameterTupleOf!(fp_cgGLSetMatrixParameterArrayfr) params__) {
	return checkedCall("cgGLSetMatrixParameterArrayfr", fp_cgGLSetMatrixParameterArrayfr, params__);
}

void cgGLSetMatrixParameterArraydc(ParameterTupleOf!(fp_cgGLSetMatrixParameterArraydc) params__) {
	return checkedCall("cgGLSetMatrixParameterArraydc", fp_cgGLSetMatrixParameterArraydc, params__);
}

void cgGLSetMatrixParameterArraydr(ParameterTupleOf!(fp_cgGLSetMatrixParameterArraydr) params__) {
	return checkedCall("cgGLSetMatrixParameterArraydr", fp_cgGLSetMatrixParameterArraydr, params__);
}

void cgGLGetMatrixParameterArrayfc(ParameterTupleOf!(fp_cgGLGetMatrixParameterArrayfc) params__) {
	return checkedCall("cgGLGetMatrixParameterArrayfc", fp_cgGLGetMatrixParameterArrayfc, params__);
}

void cgGLGetMatrixParameterArrayfr(ParameterTupleOf!(fp_cgGLGetMatrixParameterArrayfr) params__) {
	return checkedCall("cgGLGetMatrixParameterArrayfr", fp_cgGLGetMatrixParameterArrayfr, params__);
}

void cgGLGetMatrixParameterArraydc(ParameterTupleOf!(fp_cgGLGetMatrixParameterArraydc) params__) {
	return checkedCall("cgGLGetMatrixParameterArraydc", fp_cgGLGetMatrixParameterArraydc, params__);
}

void cgGLGetMatrixParameterArraydr(ParameterTupleOf!(fp_cgGLGetMatrixParameterArraydr) params__) {
	return checkedCall("cgGLGetMatrixParameterArraydr", fp_cgGLGetMatrixParameterArraydr, params__);
}

/******************************************************************************
 *** Texture Parameter Managment Functions
 *****************************************************************************/

void cgGLSetTextureParameter(ParameterTupleOf!(fp_cgGLSetTextureParameter) params__) {
	return checkedCall("cgGLSetTextureParameter", fp_cgGLSetTextureParameter, params__);
}
GLuint cgGLGetTextureParameter(ParameterTupleOf!(fp_cgGLGetTextureParameter) params__) {
	return checkedCall("cgGLGetTextureParameter", fp_cgGLGetTextureParameter, params__);
}
void cgGLEnableTextureParameter(ParameterTupleOf!(fp_cgGLEnableTextureParameter) params__) {
	return checkedCall("cgGLEnableTextureParameter", fp_cgGLEnableTextureParameter, params__);
}
void cgGLDisableTextureParameter(ParameterTupleOf!(fp_cgGLDisableTextureParameter) params__) {
	return checkedCall("cgGLDisableTextureParameter", fp_cgGLDisableTextureParameter, params__);
}
GLenum cgGLGetTextureEnum(ParameterTupleOf!(fp_cgGLGetTextureEnum) params__) {
	return checkedCall("cgGLGetTextureEnum", fp_cgGLGetTextureEnum, params__);
}

void cgGLSetManageTextureParameters(ParameterTupleOf!(fp_cgGLSetManageTextureParameters) params__) {
	return checkedCall("cgGLSetManageTextureParameters", fp_cgGLSetManageTextureParameters, params__);
}
CGbool cgGLGetManageTextureParameters(ParameterTupleOf!(fp_cgGLGetManageTextureParameters) params__) {
	return checkedCall("cgGLGetManageTextureParameters", fp_cgGLGetManageTextureParameters, params__);
}

void cgGLSetupSampler(ParameterTupleOf!(fp_cgGLSetupSampler) params__) {
	return checkedCall("cgGLSetupSampler", fp_cgGLSetupSampler, params__);
}
void cgGLRegisterStates(ParameterTupleOf!(fp_cgGLRegisterStates) params__) {
	return checkedCall("cgGLRegisterStates", fp_cgGLRegisterStates, params__);
}

void cgGLEnableProgramProfiles(ParameterTupleOf!(fp_cgGLEnableProgramProfiles) params__) {
	return checkedCall("cgGLEnableProgramProfiles", fp_cgGLEnableProgramProfiles, params__);
}
void cgGLDisableProgramProfiles(ParameterTupleOf!(fp_cgGLDisableProgramProfiles) params__) {
	return checkedCall("cgGLDisableProgramProfiles", fp_cgGLDisableProgramProfiles, params__);
}

/******************************************************************************
 *** Misc Functions
 *****************************************************************************/

void cgGLSetDebugMode(ParameterTupleOf!(fp_cgGLSetDebugMode) params__) {
	return checkedCall("cgGLSetDebugMode", fp_cgGLSetDebugMode, params__);
}

/******************************************************************************
 *** Buffer Functions
 *****************************************************************************/

CGbuffer cgGLCreateBuffer(ParameterTupleOf!(fp_cgGLCreateBuffer) params__) {
	return checkedCall("cgGLCreateBuffer", fp_cgGLCreateBuffer, params__);
}
GLuint cgGLGetBufferObject(ParameterTupleOf!(fp_cgGLGetBufferObject) params__) {
	return checkedCall("cgGLGetBufferObject", fp_cgGLGetBufferObject, params__);
}

