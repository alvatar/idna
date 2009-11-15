module dgl.cg.functionptrs;

private {
	import dgl.cg.consts;
	import dgl.glconsts;
}


extern (C):



CGenum function(CGenum lockingPolicy)	fp_cgSetLockingPolicy;
CGenum function()	fp_cgGetLockingPolicy;
CGenum function(CGenum casePolicy)	fp_cgSetSemanticCasePolicy;
CGenum function()	fp_cgGetSemanticCasePolicy;

/*** Context functions ***/

CGcontext function()	fp_cgCreateContext;
void function(CGcontext ctx)	fp_cgDestroyContext; 
CGbool function(CGcontext ctx)	fp_cgIsContext;
char * function(CGcontext ctx)	fp_cgGetLastListing;
void function(CGhandle handle, char *listing)	fp_cgSetLastListing;
void function(CGcontext ctx, CGenum flag)	fp_cgSetAutoCompile;
CGenum function(CGcontext ctx)	fp_cgGetAutoCompile;
void function(CGcontext ctx, CGenum parameterSettingMode)	fp_cgSetParameterSettingMode;
CGenum function(CGcontext ctx)	fp_cgGetParameterSettingMode;

/*** Program functions ***/

CGprogram function(CGcontext ctx, CGenum program_type, char *program, CGprofile profile, char *entry, char **args)	fp_cgCreateProgram;
CGprogram function(CGcontext ctx, CGenum program_type, char *program_file, CGprofile profile, char *entry, char **args)	fp_cgCreateProgramFromFile;
CGprogram function(CGprogram program)	fp_cgCopyProgram; 
void function(CGprogram program)	fp_cgDestroyProgram; 

CGprogram function(CGcontext ctx)	fp_cgGetFirstProgram;
CGprogram function(CGprogram current)	fp_cgGetNextProgram;
CGcontext function(CGprogram prog)	fp_cgGetProgramContext;
CGbool function(CGprogram program)	fp_cgIsProgram; 

void function(CGprogram program)	fp_cgCompileProgram; 
CGbool function(CGprogram program)	fp_cgIsProgramCompiled; 
char * function(CGprogram prog, CGenum pname)	fp_cgGetProgramString; 
CGprofile function(CGprogram prog)	fp_cgGetProgramProfile; 
char * * function(CGprogram prog)	fp_cgGetProgramOptions;
void function(CGprogram prog, CGprofile profile)	fp_cgSetProgramProfile;
CGenum function(CGprogram program)	fp_cgGetProgramInput;
CGenum function(CGprogram program)	fp_cgGetProgramOutput;
void function(CGprogram)	fp_cgSetPassProgramParameters;
void function(CGprogram program)	fp_cgUpdateProgramParameters;

/*** Parameter functions ***/

CGparameter function(CGcontext ctx, CGtype type)	fp_cgCreateParameter;
CGparameter function(CGcontext ctx, CGtype type, int length)	fp_cgCreateParameterArray;
CGparameter function(CGcontext ctx, CGtype type, int dim, int *lengths)	fp_cgCreateParameterMultiDimArray;
void function(CGparameter param)	fp_cgDestroyParameter;
void function(CGparameter from, CGparameter to)	fp_cgConnectParameter;
void function(CGparameter param)	fp_cgDisconnectParameter;
CGparameter function(CGparameter param)	fp_cgGetConnectedParameter;

int function(CGparameter param)	fp_cgGetNumConnectedToParameters;
CGparameter function(CGparameter param, int index)	fp_cgGetConnectedToParameter;

CGparameter function(CGprogram prog, char *name)	fp_cgGetNamedParameter;
CGparameter function(CGprogram prog, CGenum name_space, char *name)	fp_cgGetNamedProgramParameter;

CGparameter function(CGprogram prog, CGenum name_space)	fp_cgGetFirstParameter;
CGparameter function(CGparameter current)	fp_cgGetNextParameter;
CGparameter function(CGprogram prog, CGenum name_space)	fp_cgGetFirstLeafParameter;
CGparameter function(CGparameter current)	fp_cgGetNextLeafParameter;

CGparameter function(CGparameter param)	fp_cgGetFirstStructParameter;
CGparameter function(CGparameter param, char *name)	fp_cgGetNamedStructParameter;

CGparameter function(CGparameter param)	fp_cgGetFirstDependentParameter;

CGparameter function(CGparameter aparam, int index)	fp_cgGetArrayParameter;
int function(CGparameter param)	fp_cgGetArrayDimension;
CGtype function(CGparameter param)	fp_cgGetArrayType;
int function(CGparameter param, int dimension)	fp_cgGetArraySize;
int function(CGparameter param)	fp_cgGetArrayTotalSize;
void function(CGparameter param, int size)	fp_cgSetArraySize;
void function(CGparameter param, int *sizes)	fp_cgSetMultiDimArraySize;

CGprogram function(CGparameter param)	fp_cgGetParameterProgram;
CGcontext function(CGparameter param)	fp_cgGetParameterContext;
CGbool function(CGparameter param)	fp_cgIsParameter;
char * function(CGparameter param)	fp_cgGetParameterName;
CGtype function(CGparameter param)	fp_cgGetParameterType;
CGtype function(CGparameter param)	fp_cgGetParameterBaseType;
CGparameterclass function(CGparameter param)	fp_cgGetParameterClass;
int function(CGparameter param)	fp_cgGetParameterRows;
int function(CGparameter param)	fp_cgGetParameterColumns;
CGtype function(CGparameter param)	fp_cgGetParameterNamedType;
char * function(CGparameter param)	fp_cgGetParameterSemantic;
CGresource function(CGparameter param)	fp_cgGetParameterResource;
CGresource function(CGparameter param)	fp_cgGetParameterBaseResource;
uint function(CGparameter param)	fp_cgGetParameterResourceIndex;
CGenum function(CGparameter param)	fp_cgGetParameterVariability;
CGenum function(CGparameter param)	fp_cgGetParameterDirection;
CGbool function(CGparameter param)	fp_cgIsParameterReferenced;
CGbool function(CGparameter param, CGhandle handle)	fp_cgIsParameterUsed;
double * function(CGparameter param, CGenum value_type, int *nvalues)	fp_cgGetParameterValues;
void function(CGparameter param, int n, double *vals)	fp_cgSetParameterValuedr;
void function(CGparameter param, int n, double *vals)	fp_cgSetParameterValuedc;
void function(CGparameter param, int n, float *vals)	fp_cgSetParameterValuefr;
void function(CGparameter param, int n, float *vals)	fp_cgSetParameterValuefc;
void function(CGparameter param, int n, int *vals)	fp_cgSetParameterValueir;
void function(CGparameter param, int n, int *vals)	fp_cgSetParameterValueic;
int function(CGparameter param, int n, double *vals)	fp_cgGetParameterValuedr;
int function(CGparameter param, int n, double *vals)	fp_cgGetParameterValuedc;
int function(CGparameter param, int n, float *vals)	fp_cgGetParameterValuefr;
int function(CGparameter param, int n, float *vals)	fp_cgGetParameterValuefc;
int function(CGparameter param, int n, int *vals)	fp_cgGetParameterValueir;
int function(CGparameter param, int n, int *vals)	fp_cgGetParameterValueic;
char * function(CGparameter param)	fp_cgGetStringParameterValue;
void function(CGparameter param, char *str)	fp_cgSetStringParameterValue;

int function(CGparameter param)	fp_cgGetParameterOrdinalNumber;
CGbool function(CGparameter param)	fp_cgIsParameterGlobal;
int function(CGparameter param)	fp_cgGetParameterIndex;

void function(CGparameter param, CGenum vary)	fp_cgSetParameterVariability;
void function(CGparameter param, char *semantic)	fp_cgSetParameterSemantic;

void function(CGparameter param, float x)	fp_cgSetParameter1f;
void function(CGparameter param, float x, float y)	fp_cgSetParameter2f;
void function(CGparameter param, float x, float y, float z)	fp_cgSetParameter3f;
void function(CGparameter param, float x, float y, float z, float w)	fp_cgSetParameter4f;
void function(CGparameter param, double x)	fp_cgSetParameter1d;
void function(CGparameter param, double x, double y)	fp_cgSetParameter2d;
void function(CGparameter param, double x, double y, double z)	fp_cgSetParameter3d;
void function(CGparameter param, double x, double y, double z, double w)	fp_cgSetParameter4d;
void function(CGparameter param, int x)	fp_cgSetParameter1i;
void function(CGparameter param, int x, int y)	fp_cgSetParameter2i;
void function(CGparameter param, int x, int y, int z)	fp_cgSetParameter3i;
void function(CGparameter param, int x, int y, int z, int w)	fp_cgSetParameter4i;

void function(CGparameter param, int *v)	fp_cgSetParameter1iv;
void function(CGparameter param, int *v)	fp_cgSetParameter2iv;
void function(CGparameter param, int *v)	fp_cgSetParameter3iv;
void function(CGparameter param, int *v)	fp_cgSetParameter4iv;
void function(CGparameter param, float *v)	fp_cgSetParameter1fv;
void function(CGparameter param, float *v)	fp_cgSetParameter2fv;
void function(CGparameter param, float *v)	fp_cgSetParameter3fv;
void function(CGparameter param, float *v)	fp_cgSetParameter4fv;
void function(CGparameter param, double *v)	fp_cgSetParameter1dv;
void function(CGparameter param, double *v)	fp_cgSetParameter2dv;
void function(CGparameter param, double *v)	fp_cgSetParameter3dv;
void function(CGparameter param, double *v)	fp_cgSetParameter4dv;

void function(CGparameter param, int *matrix)	fp_cgSetMatrixParameterir;
void function(CGparameter param, double *matrix)	fp_cgSetMatrixParameterdr;
void function(CGparameter param, float *matrix)	fp_cgSetMatrixParameterfr;
void function(CGparameter param, int *matrix)	fp_cgSetMatrixParameteric;
void function(CGparameter param, double *matrix)	fp_cgSetMatrixParameterdc;
void function(CGparameter param, float *matrix)	fp_cgSetMatrixParameterfc;

void function(CGparameter param, int *matrix)	fp_cgGetMatrixParameterir;
void function(CGparameter param, double *matrix)	fp_cgGetMatrixParameterdr;
void function(CGparameter param, float *matrix)	fp_cgGetMatrixParameterfr;
void function(CGparameter param, int *matrix)	fp_cgGetMatrixParameteric;
void function(CGparameter param, double *matrix)	fp_cgGetMatrixParameterdc;
void function(CGparameter param, float *matrix)	fp_cgGetMatrixParameterfc;

CGparameter function(CGparameter param, char *name)	fp_cgGetNamedSubParameter;

/*** Type Functions ***/

char * function(CGtype type)	fp_cgGetTypeString;
CGtype function(char *type_string)	fp_cgGetType;

CGtype function(CGhandle handle, char *name)	fp_cgGetNamedUserType;

int function(CGhandle handle)	fp_cgGetNumUserTypes;
CGtype function(CGhandle handle, int index)	fp_cgGetUserType;

int function(CGtype type)	fp_cgGetNumParentTypes;
CGtype function(CGtype type, int index)	fp_cgGetParentType;

CGbool function(CGtype parent, CGtype child)	fp_cgIsParentType;
CGbool function(CGtype type)	fp_cgIsInterfaceType;

/*** Resource Functions ***/

char * function(CGresource resource)	fp_cgGetResourceString;
CGresource function(char *resource_string)	fp_cgGetResource;

/*** Enum Functions ***/

char * function(CGenum en)	fp_cgGetEnumString;
CGenum function(char *enum_string)	fp_cgGetEnum;

/*** Profile Functions ***/

char * function(CGprofile profile)	fp_cgGetProfileString;
CGprofile function(char *profile_string)	fp_cgGetProfile;

/*** Error Functions ***/

CGerror function()	fp_cgGetError;
CGerror function()	fp_cgGetFirstError;
char * function(CGerror error)	fp_cgGetErrorString;
char * function(CGerror *error)	fp_cgGetLastErrorString;
void function(CGerrorCallbackFunc func)	fp_cgSetErrorCallback;
CGerrorCallbackFunc function()	fp_cgGetErrorCallback;
void function(CGerrorHandlerFunc func, void *data)	fp_cgSetErrorHandler;
CGerrorHandlerFunc function(void **data)	fp_cgGetErrorHandler;

/*** Misc Functions ***/

char * function(CGenum sname)	fp_cgGetString;


/*** CgFX Functions ***/

CGeffect function(CGcontext, char *code, char **args)	fp_cgCreateEffect;
CGeffect function(CGcontext, char *filename, char **args)	fp_cgCreateEffectFromFile;
CGeffect function(CGeffect effect)	fp_cgCopyEffect; 
void function(CGeffect)	fp_cgDestroyEffect;
CGcontext function(CGeffect)	fp_cgGetEffectContext;
CGbool function(CGeffect effect)	fp_cgIsEffect;

CGeffect function(CGcontext)	fp_cgGetFirstEffect;
CGeffect function(CGeffect)	fp_cgGetNextEffect;

CGprogram function(CGeffect effect, CGprofile profile, char *entry, char **args)	fp_cgCreateProgramFromEffect;

CGtechnique function(CGeffect)	fp_cgGetFirstTechnique;
CGtechnique function(CGtechnique)	fp_cgGetNextTechnique;
CGtechnique function(CGeffect, char *name)	fp_cgGetNamedTechnique;
char * function(CGtechnique)	fp_cgGetTechniqueName;
CGbool function(CGtechnique)	fp_cgIsTechnique;
CGbool function(CGtechnique)	fp_cgValidateTechnique;
CGbool function(CGtechnique)	fp_cgIsTechniqueValidated;
CGeffect function(CGtechnique)	fp_cgGetTechniqueEffect;

CGpass function(CGtechnique)	fp_cgGetFirstPass;
CGpass function(CGtechnique, char *name)	fp_cgGetNamedPass;
CGpass function(CGpass)	fp_cgGetNextPass;
CGbool function(CGpass)	fp_cgIsPass;
char * function(CGpass)	fp_cgGetPassName; 
CGtechnique function(CGpass)	fp_cgGetPassTechnique;

void function(CGpass)	fp_cgSetPassState;
void function(CGpass)	fp_cgResetPassState;

CGstateassignment function(CGpass)	fp_cgGetFirstStateAssignment;
CGstateassignment function(CGpass, char *name)	fp_cgGetNamedStateAssignment;
CGstateassignment function(CGstateassignment)	fp_cgGetNextStateAssignment;
CGbool function(CGstateassignment)	fp_cgIsStateAssignment;
CGbool function(CGstateassignment)	fp_cgCallStateSetCallback;
CGbool function(CGstateassignment)	fp_cgCallStateValidateCallback;
CGbool function(CGstateassignment)	fp_cgCallStateResetCallback;
CGpass function(CGstateassignment)	fp_cgGetStateAssignmentPass;
CGparameter function(CGstateassignment)	fp_cgGetSamplerStateAssignmentParameter;

float * function(CGstateassignment, int *nVals)	fp_cgGetFloatStateAssignmentValues;
int * function(CGstateassignment, int *nVals)	fp_cgGetIntStateAssignmentValues;
CGbool * function(CGstateassignment, int *nVals)	fp_cgGetBoolStateAssignmentValues;
char * function(CGstateassignment)	fp_cgGetStringStateAssignmentValue;
CGprogram function(CGstateassignment)	fp_cgGetProgramStateAssignmentValue;
CGparameter function(CGstateassignment)	fp_cgGetTextureStateAssignmentValue;
CGparameter function(CGstateassignment)	fp_cgGetSamplerStateAssignmentValue;
int function(CGstateassignment)	fp_cgGetStateAssignmentIndex;

int function(CGstateassignment)	fp_cgGetNumDependentStateAssignmentParameters;
CGparameter function(CGstateassignment, int index)	fp_cgGetDependentStateAssignmentParameter;

CGparameter function(CGstateassignment)	fp_cgGetConnectedStateAssignmentParameter;

CGstate function(CGstateassignment)	fp_cgGetStateAssignmentState;
CGstate function(CGstateassignment)	fp_cgGetSamplerStateAssignmentState;

CGstate function(CGcontext, char *name, CGtype)	fp_cgCreateState;
CGstate function(CGcontext, char *name, CGtype, int nelems)	fp_cgCreateArrayState;
void function(CGstate, CGstatecallback set, CGstatecallback reset, CGstatecallback validate)	fp_cgSetStateCallbacks;
CGstatecallback function(CGstate)	fp_cgGetStateSetCallback;
CGstatecallback function(CGstate)	fp_cgGetStateResetCallback;
CGstatecallback function(CGstate)	fp_cgGetStateValidateCallback;
CGcontext function(CGstate)	fp_cgGetStateContext;
CGtype function(CGstate)	fp_cgGetStateType;
char * function(CGstate)	fp_cgGetStateName;
CGstate function(CGcontext, char *name)	fp_cgGetNamedState;
CGstate function(CGcontext)	fp_cgGetFirstState;
CGstate function(CGstate)	fp_cgGetNextState;
CGbool function(CGstate)	fp_cgIsState;
void function(CGstate, char *name, int value)	fp_cgAddStateEnumerant;

CGstate function(CGcontext, char *name, CGtype)	fp_cgCreateSamplerState;
CGstate function(CGcontext, char *name, CGtype, int nelems)	fp_cgCreateArraySamplerState;
CGstate function(CGcontext, char *name)	fp_cgGetNamedSamplerState;
CGstate function(CGcontext)	fp_cgGetFirstSamplerState;

CGstateassignment function(CGparameter)	fp_cgGetFirstSamplerStateAssignment;
CGstateassignment function(CGparameter, char *)	fp_cgGetNamedSamplerStateAssignment;
void function(CGparameter)	fp_cgSetSamplerState;

CGparameter function(CGeffect, char *)	fp_cgGetNamedEffectParameter;
CGparameter function(CGeffect)	fp_cgGetFirstLeafEffectParameter;
CGparameter function(CGeffect)	fp_cgGetFirstEffectParameter;
CGparameter function(CGeffect, char *)	fp_cgGetEffectParameterBySemantic;

CGannotation function(CGtechnique)	fp_cgGetFirstTechniqueAnnotation;
CGannotation function(CGpass)	fp_cgGetFirstPassAnnotation;
CGannotation function(CGparameter)	fp_cgGetFirstParameterAnnotation;
CGannotation function(CGprogram)	fp_cgGetFirstProgramAnnotation;
CGannotation function(CGeffect)	fp_cgGetFirstEffectAnnotation;
CGannotation function(CGannotation)	fp_cgGetNextAnnotation;

CGannotation function(CGtechnique, char *)	fp_cgGetNamedTechniqueAnnotation;
CGannotation function(CGpass, char *)	fp_cgGetNamedPassAnnotation;
CGannotation function(CGparameter, char *)	fp_cgGetNamedParameterAnnotation;
CGannotation function(CGprogram, char *)	fp_cgGetNamedProgramAnnotation;
CGannotation function(CGeffect, char *)	fp_cgGetNamedEffectAnnotation;

CGbool function(CGannotation)	fp_cgIsAnnotation;

char * function(CGannotation)	fp_cgGetAnnotationName;
CGtype function(CGannotation)	fp_cgGetAnnotationType;

float * function(CGannotation, int *nvalues)	fp_cgGetFloatAnnotationValues;
int * function(CGannotation, int *nvalues)	fp_cgGetIntAnnotationValues;
char * function(CGannotation)	fp_cgGetStringAnnotationValue;
char * * function(CGannotation, int *nvalues)	fp_cgGetStringAnnotationValues;
CGbool * function(CGannotation, int *nvalues)	fp_cgGetBoolAnnotationValues;
int * function(CGannotation, int *nvalues)	fp_cgGetBooleanAnnotationValues;

int function(CGannotation)	fp_cgGetNumDependentAnnotationParameters;
CGparameter function(CGannotation, int index)	fp_cgGetDependentAnnotationParameter;

void function(CGprogram, float *, int ncomps, int nx, int ny, int nz)	fp_cgEvaluateProgram;

/*** Cg 1.5 Additions ***/

CGbool function(CGeffect, char *name)	fp_cgSetEffectName;
char * function(CGeffect)	fp_cgGetEffectName;
CGeffect function(CGcontext, char *name)	fp_cgGetNamedEffect;
CGparameter function(CGeffect, char *name, CGtype)	fp_cgCreateEffectParameter;

CGtechnique function(CGeffect, char *name)	fp_cgCreateTechnique;

CGparameter function(CGeffect, char *name, CGtype type, int length)	fp_cgCreateEffectParameterArray; 
CGparameter function(CGeffect, char *name, CGtype type, int dim, int *lengths)	fp_cgCreateEffectParameterMultiDimArray; 

CGpass function(CGtechnique, char *name)	fp_cgCreatePass;

CGstateassignment function(CGpass, CGstate)	fp_cgCreateStateAssignment;
CGstateassignment function(CGpass, CGstate, int index)	fp_cgCreateStateAssignmentIndex;
CGstateassignment function(CGparameter, CGstate)	fp_cgCreateSamplerStateAssignment;

CGbool function(CGstateassignment, float)	fp_cgSetFloatStateAssignment;
CGbool function(CGstateassignment, int)	fp_cgSetIntStateAssignment;
CGbool function(CGstateassignment, CGbool)	fp_cgSetBoolStateAssignment;
CGbool function(CGstateassignment, char *)	fp_cgSetStringStateAssignment;
CGbool function(CGstateassignment, CGprogram)	fp_cgSetProgramStateAssignment;
CGbool function(CGstateassignment, CGparameter)	fp_cgSetSamplerStateAssignment;
CGbool function(CGstateassignment, CGparameter)	fp_cgSetTextureStateAssignment;

CGbool function(CGstateassignment, float *vals)	fp_cgSetFloatArrayStateAssignment;
CGbool function(CGstateassignment, int *vals)	fp_cgSetIntArrayStateAssignment;
CGbool function(CGstateassignment, CGbool *vals)	fp_cgSetBoolArrayStateAssignment;

CGannotation function(CGtechnique, char *name, CGtype)	fp_cgCreateTechniqueAnnotation;
CGannotation function(CGpass, char *name, CGtype)	fp_cgCreatePassAnnotation;
CGannotation function(CGparameter, char *name, CGtype)	fp_cgCreateParameterAnnotation;
CGannotation function(CGprogram, char *name, CGtype)	fp_cgCreateProgramAnnotation;
CGannotation function(CGeffect, char *name, CGtype)	fp_cgCreateEffectAnnotation;

CGbool function(CGannotation, int value)	fp_cgSetIntAnnotation;
CGbool function(CGannotation, float value)	fp_cgSetFloatAnnotation;
CGbool function(CGannotation, CGbool value)	fp_cgSetBoolAnnotation;
CGbool function(CGannotation, char *value)	fp_cgSetStringAnnotation;

char * function(CGstate, int value)	fp_cgGetStateEnumerantName;
int function(CGstate, char *name)	fp_cgGetStateEnumerantValue;

CGeffect function(CGparameter param)	fp_cgGetParameterEffect;

CGparameterclass function(CGtype type)	fp_cgGetTypeClass;
CGtype function(CGtype type)	fp_cgGetTypeBase;
CGbool function(CGtype type, int *nrows, int *ncols)	fp_cgGetTypeSizes;
void function(CGtype type, int *nrows, int *ncols)	fp_cgGetMatrixSize;

int function( CGprogram program )	fp_cgGetNumProgramDomains;
CGdomain function( CGprofile profile )	fp_cgGetProfileDomain;
CGprogram function( int n, CGprogram *exeList )	fp_cgCombinePrograms;
CGprogram function( CGprogram exe1, CGprogram exe2 )	fp_cgCombinePrograms2;
CGprogram function( CGprogram exe1, CGprogram exe2, CGprogram exe3 )	fp_cgCombinePrograms3;
CGprofile function(CGprogram program, int index)	fp_cgGetProgramDomainProfile;

/*** CGobj Functions ***/
CGobj function( CGcontext context, CGenum program_type, char *source, CGprofile profile, char **args )	fp_cgCreateObj;
CGobj function( CGcontext context, CGenum program_type, char *source_file, CGprofile profile, char **args )	fp_cgCreateObjFromFile;
void function( CGobj obj )	fp_cgDestroyObj;

int function(CGparameter)	fp_cgGetParameterResourceSize;
CGtype function(CGparameter)	fp_cgGetParameterResourceType;
int function(CGparameter)	fp_cgGetParameterBufferIndex;
int function(CGparameter)	fp_cgGetParameterBufferOffset;

CGbuffer function(CGcontext, int size, void *data, CGbufferusage bufferUsage)	fp_cgCreateBuffer;
void function(CGbuffer, int size, void *data)	fp_cgSetBufferData;
void function(CGbuffer, int offset, int size, void *data)	fp_cgSetBufferSubData;
void function(CGprogram program, int bufferIndex, CGbuffer buffer)	fp_cgSetProgramBuffer;

void * function(CGbuffer buffer, CGbufferaccess access)	fp_cgMapBuffer;
void function(CGbuffer buffer)	fp_cgUnmapBuffer;
void function(CGbuffer buffer)	fp_cgDestroyBuffer;
CGbuffer function(CGprogram, int bufferIndex)	fp_cgGetProgramBuffer;
int function(CGbuffer)	fp_cgGetBufferSize;
int function(CGprofile profile)	fp_cgGetProgramBufferMaxSize;
int function(CGprofile profile)	fp_cgGetProgramBufferMaxIndex;







/******************************************************************************
 *** Profile Functions 
 *****************************************************************************/

CGbool function(CGprofile profile)	fp_cgGLIsProfileSupported;

void function(CGprofile profile)	fp_cgGLEnableProfile;
void function(CGprofile profile)	fp_cgGLDisableProfile;

CGprofile function(CGGLenum profile_type)	fp_cgGLGetLatestProfile;
void function(CGprofile profile)	fp_cgGLSetOptimalOptions;

/******************************************************************************
 *** Program Managment Functions 
 *****************************************************************************/

void function(CGprogram program)	fp_cgGLLoadProgram;
CGbool function(CGprogram program)	fp_cgGLIsProgramLoaded;
void function(CGprogram program)	fp_cgGLBindProgram;
void function(CGprofile profile)	fp_cgGLUnbindProgram;
GLuint function(CGprogram program)	fp_cgGLGetProgramID;

/******************************************************************************
 *** Parameter Managment Functions 
 *****************************************************************************/

void function(CGparameter param, float x)	fp_cgGLSetParameter1f;

void function(CGparameter param, float x, float y)	fp_cgGLSetParameter2f;

void function(CGparameter param, float x, float y, float z)	fp_cgGLSetParameter3f;

void function(CGparameter param, float x, float y, float z, float w)	fp_cgGLSetParameter4f;

void function(CGparameter param, float *v)	fp_cgGLSetParameter1fv;

void function(CGparameter param, float *v)	fp_cgGLSetParameter2fv;

void function(CGparameter param, float *v)	fp_cgGLSetParameter3fv;

void function(CGparameter param, float *v)	fp_cgGLSetParameter4fv;

void function(CGparameter param, double x)	fp_cgGLSetParameter1d;

void function(CGparameter param, double x, double y)	fp_cgGLSetParameter2d;

void function(CGparameter param, double x, double y, double z)	fp_cgGLSetParameter3d;

void function(CGparameter param, double x, double y, double z, double w)	fp_cgGLSetParameter4d;

void function(CGparameter param, double *v)	fp_cgGLSetParameter1dv;

void function(CGparameter param, double *v)	fp_cgGLSetParameter2dv;

void function(CGparameter param, double *v)	fp_cgGLSetParameter3dv;

void function(CGparameter param, double *v)	fp_cgGLSetParameter4dv;

void function(CGparameter param, float *v)	fp_cgGLGetParameter1f;

void function(CGparameter param, float *v)	fp_cgGLGetParameter2f;

void function(CGparameter param, float *v)	fp_cgGLGetParameter3f;

void function(CGparameter param, float *v)	fp_cgGLGetParameter4f;

void function(CGparameter param, double *v)	fp_cgGLGetParameter1d;

void function(CGparameter param, double *v)	fp_cgGLGetParameter2d;

void function(CGparameter param, double *v)	fp_cgGLGetParameter3d;

void function(CGparameter param, double *v)	fp_cgGLGetParameter4d;

void function(CGparameter param, int offset, int nelements, float *v)	fp_cgGLSetParameterArray1f;

void function(CGparameter param, int offset, int nelements, float *v)	fp_cgGLSetParameterArray2f;

void function(CGparameter param, int offset, int nelements, float *v)	fp_cgGLSetParameterArray3f;

void function(CGparameter param, int offset, int nelements, float *v)	fp_cgGLSetParameterArray4f;

void function(CGparameter param, int offset, int nelements, double *v)	fp_cgGLSetParameterArray1d;

void function(CGparameter param, int offset, int nelements, double *v)	fp_cgGLSetParameterArray2d;

void function(CGparameter param, int offset, int nelements, double *v)	fp_cgGLSetParameterArray3d;

void function(CGparameter param, int offset, int nelements, double *v)	fp_cgGLSetParameterArray4d;

void function(CGparameter param, int offset, int nelements, float *v)	fp_cgGLGetParameterArray1f;

void function(CGparameter param, int offset, int nelements, float *v)	fp_cgGLGetParameterArray2f;

void function(CGparameter param, int offset, int nelements, float *v)	fp_cgGLGetParameterArray3f;

void function(CGparameter param, int offset, int nelements, float *v)	fp_cgGLGetParameterArray4f;

void function(CGparameter param, int offset, int nelements, double *v)	fp_cgGLGetParameterArray1d;

void function(CGparameter param, int offset, int nelements, double *v)	fp_cgGLGetParameterArray2d;

void function(CGparameter param, int offset, int nelements, double *v)	fp_cgGLGetParameterArray3d;

void function(CGparameter param, int offset, int nelements, double *v)	fp_cgGLGetParameterArray4d;

void function(CGparameter param, GLint fsize, GLenum type, GLsizei stride, GLvoid *pointer)	fp_cgGLSetParameterPointer;

void function(CGparameter param)	fp_cgGLEnableClientState;
void function(CGparameter param)	fp_cgGLDisableClientState;

/******************************************************************************
 *** Matrix Parameter Managment Functions 
 *****************************************************************************/

void function(CGparameter param, double *matrix)	fp_cgGLSetMatrixParameterdr;
void function(CGparameter param, float *matrix)	fp_cgGLSetMatrixParameterfr;
void function(CGparameter param, double *matrix)	fp_cgGLSetMatrixParameterdc;
void function(CGparameter param, float *matrix)	fp_cgGLSetMatrixParameterfc;

void function(CGparameter param, double *matrix)	fp_cgGLGetMatrixParameterdr;
void function(CGparameter param, float *matrix)	fp_cgGLGetMatrixParameterfr;
void function(CGparameter param, double *matrix)	fp_cgGLGetMatrixParameterdc;
void function(CGparameter param, float *matrix)	fp_cgGLGetMatrixParameterfc;

void function(CGparameter param, CGGLenum matrix, CGGLenum transform)	fp_cgGLSetStateMatrixParameter;

void function(CGparameter param, int offset, int nelements, float *matrices)	fp_cgGLSetMatrixParameterArrayfc;

void function(CGparameter param, int offset, int nelements, float *matrices)	fp_cgGLSetMatrixParameterArrayfr;

void function(CGparameter param, int offset, int nelements, double *matrices)	fp_cgGLSetMatrixParameterArraydc;

void function(CGparameter param, int offset, int nelements, double *matrices)	fp_cgGLSetMatrixParameterArraydr;

void function(CGparameter param, int offset, int nelements, float *matrices)	fp_cgGLGetMatrixParameterArrayfc;

void function(CGparameter param, int offset, int nelements, float *matrices)	fp_cgGLGetMatrixParameterArrayfr;

void function(CGparameter param, int offset, int nelements, double *matrices)	fp_cgGLGetMatrixParameterArraydc;

void function(CGparameter param, int offset, int nelements, double *matrices)	fp_cgGLGetMatrixParameterArraydr;

/******************************************************************************
 *** Texture Parameter Managment Functions
 *****************************************************************************/

void function(CGparameter param, GLuint texobj)	fp_cgGLSetTextureParameter;
GLuint function(CGparameter param)	fp_cgGLGetTextureParameter;
void function(CGparameter param)	fp_cgGLEnableTextureParameter;
void function(CGparameter param)	fp_cgGLDisableTextureParameter;
GLenum function(CGparameter param)	fp_cgGLGetTextureEnum;

void function(CGcontext ctx, CGbool flag)	fp_cgGLSetManageTextureParameters;
CGbool function(CGcontext ctx)	fp_cgGLGetManageTextureParameters;

void function(CGparameter param, GLuint texobj)	fp_cgGLSetupSampler;
void function(CGcontext)	fp_cgGLRegisterStates;

void function( CGprogram program )	fp_cgGLEnableProgramProfiles;
void function( CGprogram program )	fp_cgGLDisableProgramProfiles;

/******************************************************************************
 *** Misc Functions
 *****************************************************************************/

void function( CGbool debug_ )	fp_cgGLSetDebugMode;

/******************************************************************************
 *** Buffer Functions
 *****************************************************************************/

CGbuffer function(CGcontext context, int size, void *data, GLenum bufferUsage)	fp_cgGLCreateBuffer;
GLuint function(CGbuffer buffer)	fp_cgGLGetBufferObject;

