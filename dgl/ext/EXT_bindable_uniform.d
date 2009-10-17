module dgl.ext.EXT_bindable_uniform;
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



private ushort extensionId__ = 407;
alias extensionId__ EXT_bindable_uniform;

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
			const GLenum GL_MAX_VERTEX_BINDABLE_UNIFORMS_EXT = 0x8DE2;
			const GLenum GL_MAX_FRAGMENT_BINDABLE_UNIFORMS_EXT = 0x8DE3;
			const GLenum GL_MAX_GEOMETRY_BINDABLE_UNIFORMS_EXT = 0x8DE4;
			const GLenum GL_MAX_BINDABLE_UNIFORM_SIZE_EXT = 0x8DED;
			const GLenum GL_UNIFORM_BUFFER_BINDING_EXT = 0x8DEF;
			const GLenum GL_UNIFORM_BUFFER_EXT = 0x8DEE;
	}
	private {
		extern (System) {
			alias void function (GLuint program, GLint location, GLuint buffer)	fp_glUniformBufferEXT;
			alias GLint function (GLuint program, GLint location)	fp_glGetUniformBufferSizeEXT;
			alias GLintptr function (GLuint program, GLint location)	fp_glGetUniformOffsetEXT;
		}
	}
	public {
void UniformBuffer(GL gl_, ParameterTypeTuple!(fp_glUniformBufferEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glUniformBufferEXT)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "UniformBuffer", funcPtr, params__);
		}
GLint GetUniformBufferSize(GL gl_, ParameterTypeTuple!(fp_glGetUniformBufferSizeEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetUniformBufferSizeEXT)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "GetUniformBufferSize", funcPtr, params__);
		}
GLintptr GetUniformOffset(GL gl_, ParameterTypeTuple!(fp_glGetUniformOffsetEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetUniformOffsetEXT)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "GetUniformOffset", funcPtr, params__);
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
			if (!extStr.containsPattern("GL_EXT_bindable_uniform")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glUniformBufferEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glGetUniformBufferSizeEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glGetUniformOffsetEXT"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
