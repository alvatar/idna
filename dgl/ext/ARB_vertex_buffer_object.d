module dgl.ext.ARB_vertex_buffer_object;
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



private ushort extensionId__ = 300;
alias extensionId__ ARB_vertex_buffer_object;

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
			const GLenum GL_BUFFER_SIZE_ARB = 0x8764;
			const GLenum GL_BUFFER_USAGE_ARB = 0x8765;
			const GLenum GL_ARRAY_BUFFER_ARB = 0x8892;
			const GLenum GL_ELEMENT_ARRAY_BUFFER_ARB = 0x8893;
			const GLenum GL_ARRAY_BUFFER_BINDING_ARB = 0x8894;
			const GLenum GL_ELEMENT_ARRAY_BUFFER_BINDING_ARB = 0x8895;
			const GLenum GL_VERTEX_ARRAY_BUFFER_BINDING_ARB = 0x8896;
			const GLenum GL_NORMAL_ARRAY_BUFFER_BINDING_ARB = 0x8897;
			const GLenum GL_COLOR_ARRAY_BUFFER_BINDING_ARB = 0x8898;
			const GLenum GL_INDEX_ARRAY_BUFFER_BINDING_ARB = 0x8899;
			const GLenum GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING_ARB = 0x889A;
			const GLenum GL_EDGE_FLAG_ARRAY_BUFFER_BINDING_ARB = 0x889B;
			const GLenum GL_SECONDARY_COLOR_ARRAY_BUFFER_BINDING_ARB = 0x889C;
			const GLenum GL_FOG_COORDINATE_ARRAY_BUFFER_BINDING_ARB = 0x889D;
			const GLenum GL_WEIGHT_ARRAY_BUFFER_BINDING_ARB = 0x889E;
			const GLenum GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING_ARB = 0x889F;
			const GLenum GL_READ_ONLY_ARB = 0x88B8;
			const GLenum GL_WRITE_ONLY_ARB = 0x88B9;
			const GLenum GL_READ_WRITE_ARB = 0x88BA;
			const GLenum GL_BUFFER_ACCESS_ARB = 0x88BB;
			const GLenum GL_BUFFER_MAPPED_ARB = 0x88BC;
			const GLenum GL_BUFFER_MAP_POINTER_ARB = 0x88BD;
			const GLenum GL_STREAM_DRAW_ARB = 0x88E0;
			const GLenum GL_STREAM_READ_ARB = 0x88E1;
			const GLenum GL_STREAM_COPY_ARB = 0x88E2;
			const GLenum GL_STATIC_DRAW_ARB = 0x88E4;
			const GLenum GL_STATIC_READ_ARB = 0x88E5;
			const GLenum GL_STATIC_COPY_ARB = 0x88E6;
			const GLenum GL_DYNAMIC_DRAW_ARB = 0x88E8;
			const GLenum GL_DYNAMIC_READ_ARB = 0x88E9;
			const GLenum GL_DYNAMIC_COPY_ARB = 0x88EA;
			alias ptrdiff_t GLsizeiptrARB;
			alias ptrdiff_t GLintptrARB;
	}
	private {
		extern (System) {
			alias void function (GLenum target, GLuint buffer)	fp_glBindBufferARB;
			alias void function (GLenum target, GLsizeiptrARB size,  GLvoid* data, GLenum usage)	fp_glBufferDataARB;
			alias void function (GLenum target, GLintptrARB offset, GLsizeiptrARB size,  GLvoid* data)	fp_glBufferSubDataARB;
			alias void function (GLsizei n,  GLuint* buffers)	fp_glDeleteBuffersARB;
			alias void function (GLsizei n, GLuint* buffers)	fp_glGenBuffersARB;
			alias void function (GLenum target, GLenum pname, GLint* params)	fp_glGetBufferParameterivARB;
			alias void function (GLenum target, GLenum pname, GLvoid** params)	fp_glGetBufferPointervARB;
			alias void function (GLenum target, GLintptrARB offset, GLsizeiptrARB size, GLvoid* data)	fp_glGetBufferSubDataARB;
			alias GLboolean function (GLuint buffer)	fp_glIsBufferARB;
			alias GLvoid * function (GLenum target, GLenum access)	fp_glMapBufferARB;
			alias GLboolean function (GLenum target)	fp_glUnmapBufferARB;
		}
	}
	public {
void BindBuffer(GL gl_, ParameterTypeTuple!(fp_glBindBufferARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBindBufferARB)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "BindBuffer", funcPtr, params__);
		}
void BufferData(GL gl_, ParameterTypeTuple!(fp_glBufferDataARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBufferDataARB)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "BufferData", funcPtr, params__);
		}
void BufferSubData(GL gl_, ParameterTypeTuple!(fp_glBufferSubDataARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBufferSubDataARB)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "BufferSubData", funcPtr, params__);
		}
void DeleteBuffers(GL gl_, ParameterTypeTuple!(fp_glDeleteBuffersARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glDeleteBuffersARB)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "DeleteBuffers", funcPtr, params__);
		}
void GenBuffers(GL gl_, ParameterTypeTuple!(fp_glGenBuffersARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGenBuffersARB)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "GenBuffers", funcPtr, params__);
		}
void GetBufferParameteriv(GL gl_, ParameterTypeTuple!(fp_glGetBufferParameterivARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetBufferParameterivARB)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "GetBufferParameteriv", funcPtr, params__);
		}
void GetBufferPointerv(GL gl_, ParameterTypeTuple!(fp_glGetBufferPointervARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetBufferPointervARB)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "GetBufferPointerv", funcPtr, params__);
		}
void GetBufferSubData(GL gl_, ParameterTypeTuple!(fp_glGetBufferSubDataARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetBufferSubDataARB)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "GetBufferSubData", funcPtr, params__);
		}
GLboolean IsBuffer(GL gl_, ParameterTypeTuple!(fp_glIsBufferARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glIsBufferARB)(gl.extFuncs[extensionId__][8]);
			return checkedCall(gl_, "IsBuffer", funcPtr, params__);
		}
GLvoid * MapBuffer(GL gl_, ParameterTypeTuple!(fp_glMapBufferARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMapBufferARB)(gl.extFuncs[extensionId__][9]);
			return checkedCall(gl_, "MapBuffer", funcPtr, params__);
		}
GLboolean UnmapBuffer(GL gl_, ParameterTypeTuple!(fp_glUnmapBufferARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUnmapBufferARB)(gl.extFuncs[extensionId__][10]);
			return checkedCall(gl_, "UnmapBuffer", funcPtr, params__);
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
		void*[] funcAddr = new void*[11];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_ARB_vertex_buffer_object")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glBindBufferARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glBufferDataARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glBufferSubDataARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glDeleteBuffersARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glGenBuffersARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glGetBufferParameterivARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glGetBufferPointervARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glGetBufferSubDataARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[8] = getExtensionFuncPtr(cast(char*)"glIsBufferARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[9] = getExtensionFuncPtr(cast(char*)"glMapBufferARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[10] = getExtensionFuncPtr(cast(char*)"glUnmapBufferARB"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
