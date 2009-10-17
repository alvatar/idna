module dgl.ext.ATI_vertex_array_object;
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



private ushort extensionId__ = 258;
alias extensionId__ ATI_vertex_array_object;

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
			const GLenum GL_STATIC_ATI = 0x8760;
			const GLenum GL_DYNAMIC_ATI = 0x8761;
			const GLenum GL_PRESERVE_ATI = 0x8762;
			const GLenum GL_DISCARD_ATI = 0x8763;
			const GLenum GL_OBJECT_BUFFER_SIZE_ATI = 0x8764;
			const GLenum GL_OBJECT_BUFFER_USAGE_ATI = 0x8765;
			const GLenum GL_ARRAY_OBJECT_BUFFER_ATI = 0x8766;
			const GLenum GL_ARRAY_OBJECT_OFFSET_ATI = 0x8767;
	}
	private {
		extern (System) {
			alias void function (GLenum array, GLint size, GLenum type, GLsizei stride, GLuint buffer, GLuint offset)	fp_glArrayObjectATI;
			alias void function (GLuint buffer)	fp_glFreeObjectBufferATI;
			alias void function (GLenum array, GLenum pname, GLfloat* params)	fp_glGetArrayObjectfvATI;
			alias void function (GLenum array, GLenum pname, GLint* params)	fp_glGetArrayObjectivATI;
			alias void function (GLuint buffer, GLenum pname, GLfloat* params)	fp_glGetObjectBufferfvATI;
			alias void function (GLuint buffer, GLenum pname, GLint* params)	fp_glGetObjectBufferivATI;
			alias void function (GLuint id, GLenum pname, GLfloat* params)	fp_glGetVariantArrayObjectfvATI;
			alias void function (GLuint id, GLenum pname, GLint* params)	fp_glGetVariantArrayObjectivATI;
			alias GLboolean function (GLuint buffer)	fp_glIsObjectBufferATI;
			alias GLuint function (GLsizei size,  void* pointer, GLenum usage)	fp_glNewObjectBufferATI;
			alias void function (GLuint buffer, GLuint offset, GLsizei size,  void* pointer, GLenum preserve)	fp_glUpdateObjectBufferATI;
			alias void function (GLuint id, GLenum type, GLsizei stride, GLuint buffer, GLuint offset)	fp_glVariantArrayObjectATI;
		}
	}
	public {
void ArrayObject(GL gl_, ParameterTypeTuple!(fp_glArrayObjectATI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glArrayObjectATI)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "ArrayObject", funcPtr, params__);
		}
void FreeObjectBuffer(GL gl_, ParameterTypeTuple!(fp_glFreeObjectBufferATI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFreeObjectBufferATI)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "FreeObjectBuffer", funcPtr, params__);
		}
void GetArrayObjectfv(GL gl_, ParameterTypeTuple!(fp_glGetArrayObjectfvATI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetArrayObjectfvATI)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "GetArrayObjectfv", funcPtr, params__);
		}
void GetArrayObjectiv(GL gl_, ParameterTypeTuple!(fp_glGetArrayObjectivATI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetArrayObjectivATI)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "GetArrayObjectiv", funcPtr, params__);
		}
void GetObjectBufferfv(GL gl_, ParameterTypeTuple!(fp_glGetObjectBufferfvATI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetObjectBufferfvATI)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "GetObjectBufferfv", funcPtr, params__);
		}
void GetObjectBufferiv(GL gl_, ParameterTypeTuple!(fp_glGetObjectBufferivATI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetObjectBufferivATI)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "GetObjectBufferiv", funcPtr, params__);
		}
void GetVariantArrayObjectfv(GL gl_, ParameterTypeTuple!(fp_glGetVariantArrayObjectfvATI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetVariantArrayObjectfvATI)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "GetVariantArrayObjectfv", funcPtr, params__);
		}
void GetVariantArrayObjectiv(GL gl_, ParameterTypeTuple!(fp_glGetVariantArrayObjectivATI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetVariantArrayObjectivATI)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "GetVariantArrayObjectiv", funcPtr, params__);
		}
GLboolean IsObjectBuffer(GL gl_, ParameterTypeTuple!(fp_glIsObjectBufferATI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glIsObjectBufferATI)(gl.extFuncs[extensionId__][8]);
			return checkedCall(gl_, "IsObjectBuffer", funcPtr, params__);
		}
GLuint NewObjectBuffer(GL gl_, ParameterTypeTuple!(fp_glNewObjectBufferATI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNewObjectBufferATI)(gl.extFuncs[extensionId__][9]);
			return checkedCall(gl_, "NewObjectBuffer", funcPtr, params__);
		}
void UpdateObjectBuffer(GL gl_, ParameterTypeTuple!(fp_glUpdateObjectBufferATI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUpdateObjectBufferATI)(gl.extFuncs[extensionId__][10]);
			return checkedCall(gl_, "UpdateObjectBuffer", funcPtr, params__);
		}
void VariantArrayObject(GL gl_, ParameterTypeTuple!(fp_glVariantArrayObjectATI) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVariantArrayObjectATI)(gl.extFuncs[extensionId__][11]);
			return checkedCall(gl_, "VariantArrayObject", funcPtr, params__);
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
		void*[] funcAddr = new void*[12];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_ATI_vertex_array_object")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glArrayObjectATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glFreeObjectBufferATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glGetArrayObjectfvATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glGetArrayObjectivATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glGetObjectBufferfvATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glGetObjectBufferivATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glGetVariantArrayObjectfvATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glGetVariantArrayObjectivATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[8] = getExtensionFuncPtr(cast(char*)"glIsObjectBufferATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[9] = getExtensionFuncPtr(cast(char*)"glNewObjectBufferATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[10] = getExtensionFuncPtr(cast(char*)"glUpdateObjectBufferATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[11] = getExtensionFuncPtr(cast(char*)"glVariantArrayObjectATI"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
