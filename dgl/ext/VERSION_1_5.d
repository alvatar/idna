module dgl.ext.VERSION_1_5;
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



private ushort extensionId__ = 412;
alias extensionId__ VERSION_1_5;

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
			const GLenum GL_BUFFER_SIZE = 0x8764;
			const GLenum GL_BUFFER_USAGE = 0x8765;
			const GLenum GL_QUERY_COUNTER_BITS = 0x8864;
			const GLenum GL_CURRENT_QUERY = 0x8865;
			const GLenum GL_QUERY_RESULT = 0x8866;
			const GLenum GL_QUERY_RESULT_AVAILABLE = 0x8867;
			const GLenum GL_ARRAY_BUFFER = 0x8892;
			const GLenum GL_ELEMENT_ARRAY_BUFFER = 0x8893;
			const GLenum GL_ARRAY_BUFFER_BINDING = 0x8894;
			const GLenum GL_ELEMENT_ARRAY_BUFFER_BINDING = 0x8895;
			const GLenum GL_VERTEX_ARRAY_BUFFER_BINDING = 0x8896;
			const GLenum GL_NORMAL_ARRAY_BUFFER_BINDING = 0x8897;
			const GLenum GL_COLOR_ARRAY_BUFFER_BINDING = 0x8898;
			const GLenum GL_INDEX_ARRAY_BUFFER_BINDING = 0x8899;
			const GLenum GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING = 0x889A;
			const GLenum GL_EDGE_FLAG_ARRAY_BUFFER_BINDING = 0x889B;
			const GLenum GL_SECONDARY_COLOR_ARRAY_BUFFER_BINDING = 0x889C;
			const GLenum GL_FOG_COORDINATE_ARRAY_BUFFER_BINDING = 0x889D;
			const GLenum GL_WEIGHT_ARRAY_BUFFER_BINDING = 0x889E;
			const GLenum GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING = 0x889F;
			const GLenum GL_READ_ONLY = 0x88B8;
			const GLenum GL_WRITE_ONLY = 0x88B9;
			const GLenum GL_READ_WRITE = 0x88BA;
			const GLenum GL_BUFFER_ACCESS = 0x88BB;
			const GLenum GL_BUFFER_MAPPED = 0x88BC;
			const GLenum GL_BUFFER_MAP_POINTER = 0x88BD;
			const GLenum GL_STREAM_DRAW = 0x88E0;
			const GLenum GL_STREAM_READ = 0x88E1;
			const GLenum GL_STREAM_COPY = 0x88E2;
			const GLenum GL_STATIC_DRAW = 0x88E4;
			const GLenum GL_STATIC_READ = 0x88E5;
			const GLenum GL_STATIC_COPY = 0x88E6;
			const GLenum GL_DYNAMIC_DRAW = 0x88E8;
			const GLenum GL_DYNAMIC_READ = 0x88E9;
			const GLenum GL_DYNAMIC_COPY = 0x88EA;
			const GLenum GL_SAMPLES_PASSED = 0x8914;
			alias ptrdiff_t GLsizeiptr;
			alias ptrdiff_t GLintptr;
	}
	private {
		extern (System) {
			alias void function (GLsizei n, GLuint* ids)	fp_glGenQueries;
			alias void function (GLsizei n,  GLuint* ids)	fp_glDeleteQueries;
			alias GLboolean function (GLuint id)	fp_glIsQuery;
			alias void function (GLenum target, GLuint id)	fp_glBeginQuery;
			alias void function (GLenum target)	fp_glEndQuery;
			alias void function (GLenum target, GLenum pname, GLint* params)	fp_glGetQueryiv;
			alias void function (GLuint id, GLenum pname, GLint* params)	fp_glGetQueryObjectiv;
			alias void function (GLuint id, GLenum pname, GLuint* params)	fp_glGetQueryObjectuiv;
			alias void function (GLenum target, GLuint buffer)	fp_glBindBuffer;
			alias void function (GLsizei n,  GLuint* buffers)	fp_glDeleteBuffers;
			alias void function (GLsizei n, GLuint* buffers)	fp_glGenBuffers;
			alias GLboolean function (GLuint buffer)	fp_glIsBuffer;
			alias void function (GLenum target, GLsizeiptr size,  GLvoid* data, GLenum usage)	fp_glBufferData;
			alias void function (GLenum target, GLintptr offset, GLsizeiptr size,  GLvoid* data)	fp_glBufferSubData;
			alias void function (GLenum target, GLintptr offset, GLsizeiptr size, GLvoid* data)	fp_glGetBufferSubData;
			alias GLvoid* function (GLenum target, GLenum access)	fp_glMapBuffer;
			alias GLboolean function (GLenum target)	fp_glUnmapBuffer;
			alias void function (GLenum target, GLenum pname, GLint* params)	fp_glGetBufferParameteriv;
			alias void function (GLenum target, GLenum pname, GLvoid** params)	fp_glGetBufferPointerv;
		}
	}
	public {
void GenQueries(GL gl_, ParameterTypeTuple!(fp_glGenQueries) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGenQueries)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "GenQueries", funcPtr, params__);
		}
void DeleteQueries(GL gl_, ParameterTypeTuple!(fp_glDeleteQueries) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDeleteQueries)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "DeleteQueries", funcPtr, params__);
		}
GLboolean IsQuery(GL gl_, ParameterTypeTuple!(fp_glIsQuery) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glIsQuery)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "IsQuery", funcPtr, params__);
		}
void BeginQuery(GL gl_, ParameterTypeTuple!(fp_glBeginQuery) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBeginQuery)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "BeginQuery", funcPtr, params__);
		}
void EndQuery(GL gl_, ParameterTypeTuple!(fp_glEndQuery) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glEndQuery)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "EndQuery", funcPtr, params__);
		}
void GetQueryiv(GL gl_, ParameterTypeTuple!(fp_glGetQueryiv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetQueryiv)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "GetQueryiv", funcPtr, params__);
		}
void GetQueryObjectiv(GL gl_, ParameterTypeTuple!(fp_glGetQueryObjectiv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetQueryObjectiv)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "GetQueryObjectiv", funcPtr, params__);
		}
void GetQueryObjectuiv(GL gl_, ParameterTypeTuple!(fp_glGetQueryObjectuiv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetQueryObjectuiv)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "GetQueryObjectuiv", funcPtr, params__);
		}
void BindBuffer(GL gl_, ParameterTypeTuple!(fp_glBindBuffer) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBindBuffer)(gl.extFuncs[extensionId__][8]);
			return checkedCall(gl_, "BindBuffer", funcPtr, params__);
		}
void DeleteBuffers(GL gl_, ParameterTypeTuple!(fp_glDeleteBuffers) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDeleteBuffers)(gl.extFuncs[extensionId__][9]);
			return checkedCall(gl_, "DeleteBuffers", funcPtr, params__);
		}
void GenBuffers(GL gl_, ParameterTypeTuple!(fp_glGenBuffers) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGenBuffers)(gl.extFuncs[extensionId__][10]);
			return checkedCall(gl_, "GenBuffers", funcPtr, params__);
		}
GLboolean IsBuffer(GL gl_, ParameterTypeTuple!(fp_glIsBuffer) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glIsBuffer)(gl.extFuncs[extensionId__][11]);
			return checkedCall(gl_, "IsBuffer", funcPtr, params__);
		}
void BufferData(GL gl_, ParameterTypeTuple!(fp_glBufferData) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBufferData)(gl.extFuncs[extensionId__][12]);
			return checkedCall(gl_, "BufferData", funcPtr, params__);
		}
void BufferSubData(GL gl_, ParameterTypeTuple!(fp_glBufferSubData) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBufferSubData)(gl.extFuncs[extensionId__][13]);
			return checkedCall(gl_, "BufferSubData", funcPtr, params__);
		}
void GetBufferSubData(GL gl_, ParameterTypeTuple!(fp_glGetBufferSubData) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetBufferSubData)(gl.extFuncs[extensionId__][14]);
			return checkedCall(gl_, "GetBufferSubData", funcPtr, params__);
		}
GLvoid* MapBuffer(GL gl_, ParameterTypeTuple!(fp_glMapBuffer) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMapBuffer)(gl.extFuncs[extensionId__][15]);
			return checkedCall(gl_, "MapBuffer", funcPtr, params__);
		}
GLboolean UnmapBuffer(GL gl_, ParameterTypeTuple!(fp_glUnmapBuffer) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUnmapBuffer)(gl.extFuncs[extensionId__][16]);
			return checkedCall(gl_, "UnmapBuffer", funcPtr, params__);
		}
void GetBufferParameteriv(GL gl_, ParameterTypeTuple!(fp_glGetBufferParameteriv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetBufferParameteriv)(gl.extFuncs[extensionId__][17]);
			return checkedCall(gl_, "GetBufferParameteriv", funcPtr, params__);
		}
void GetBufferPointerv(GL gl_, ParameterTypeTuple!(fp_glGetBufferPointerv) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetBufferPointerv)(gl.extFuncs[extensionId__][18]);
			return checkedCall(gl_, "GetBufferPointerv", funcPtr, params__);
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
		void*[] funcAddr = new void*[19];
		{
			if (!isOpenGLVersionSupported("1_5", '_')) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glGenQueries"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glDeleteQueries"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glIsQuery"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glBeginQuery"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glEndQuery"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glGetQueryiv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glGetQueryObjectiv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glGetQueryObjectuiv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[8] = getExtensionFuncPtr(cast(char*)"glBindBuffer"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[9] = getExtensionFuncPtr(cast(char*)"glDeleteBuffers"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[10] = getExtensionFuncPtr(cast(char*)"glGenBuffers"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[11] = getExtensionFuncPtr(cast(char*)"glIsBuffer"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[12] = getExtensionFuncPtr(cast(char*)"glBufferData"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[13] = getExtensionFuncPtr(cast(char*)"glBufferSubData"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[14] = getExtensionFuncPtr(cast(char*)"glGetBufferSubData"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[15] = getExtensionFuncPtr(cast(char*)"glMapBuffer"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[16] = getExtensionFuncPtr(cast(char*)"glUnmapBuffer"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[17] = getExtensionFuncPtr(cast(char*)"glGetBufferParameteriv"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[18] = getExtensionFuncPtr(cast(char*)"glGetBufferPointerv"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
