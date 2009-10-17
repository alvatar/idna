module dgl.ext.ARB_vertex_shader;
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



private ushort extensionId__ = 338;
alias extensionId__ ARB_vertex_shader;
import dgl.ext.ARB_shader_objects;

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
			const GLenum GL_VERTEX_SHADER_ARB = 0x8B31;
			const GLenum GL_MAX_VERTEX_UNIFORM_COMPONENTS_ARB = 0x8B4A;
			const GLenum GL_MAX_VARYING_FLOATS_ARB = 0x8B4B;
			const GLenum GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS_ARB = 0x8B4C;
			const GLenum GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS_ARB = 0x8B4D;
			const GLenum GL_OBJECT_ACTIVE_ATTRIBUTES_ARB = 0x8B89;
			const GLenum GL_OBJECT_ACTIVE_ATTRIBUTE_MAX_LENGTH_ARB = 0x8B8A;
	}
	private {
		extern (System) {
			alias void function (GLhandleARB programObj, GLuint index,  GLcharARB* name)	fp_glBindAttribLocationARB;
			alias void function (GLhandleARB programObj, GLuint index, GLsizei maxLength, GLsizei* length, GLint *size, GLenum *type, GLcharARB *name)	fp_glGetActiveAttribARB;
			alias GLint function (GLhandleARB programObj,  GLcharARB* name)	fp_glGetAttribLocationARB;
		}
	}
	public {
void BindAttribLocation(GL gl_, ParameterTypeTuple!(fp_glBindAttribLocationARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBindAttribLocationARB)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "BindAttribLocation", funcPtr, params__);
		}
void GetActiveAttrib(GL gl_, ParameterTypeTuple!(fp_glGetActiveAttribARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetActiveAttribARB)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "GetActiveAttrib", funcPtr, params__);
		}
GLint GetAttribLocation(GL gl_, ParameterTypeTuple!(fp_glGetAttribLocationARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetAttribLocationARB)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "GetAttribLocation", funcPtr, params__);
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
			if (!extStr.containsPattern("GL_ARB_vertex_shader")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glBindAttribLocationARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glGetActiveAttribARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glGetAttribLocationARB"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
