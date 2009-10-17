module dgl.ext.NV_explicit_multisample;
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



private ushort extensionId__ = 17;
alias extensionId__ NV_explicit_multisample;
import dgl.ext.ARB_multisample;

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
			const GLenum GL_SAMPLE_POSITION_NV = 0x8E50;
			const GLenum GL_SAMPLE_MASK_NV = 0x8E51;
			const GLenum GL_SAMPLE_MASK_VALUE_NV = 0x8E52;
			const GLenum GL_TEXTURE_BINDING_RENDERBUFFER_NV = 0x8E53;
			const GLenum GL_TEXTURE_RENDERBUFFER_DATA_STORE_BINDING_NV = 0x8E54;
			const GLenum GL_TEXTURE_RENDERBUFFER_NV = 0x8E55;
			const GLenum GL_SAMPLER_RENDERBUFFER_NV = 0x8E56;
			const GLenum GL_INT_SAMPLER_RENDERBUFFER_NV = 0x8E57;
			const GLenum GL_UNSIGNED_INT_SAMPLER_RENDERBUFFER_NV = 0x8E58;
			const GLenum GL_MAX_SAMPLE_MASK_WORDS_NV = 0x8E59;
	}
	private {
		extern (System) {
			alias void function (GLenum pname, GLuint index, GLfloat* val)	fp_glGetMultisamplefvNV;
			alias void function (GLuint index, GLbitfield mask)	fp_glSampleMaskIndexedNV;
			alias void function (GLenum target, GLuint renderbuffer)	fp_glTexRenderbufferNV;
		}
	}
	public {
void GetMultisamplefv(GL gl_, ParameterTypeTuple!(fp_glGetMultisamplefvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetMultisamplefvNV)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "GetMultisamplefv", funcPtr, params__);
		}
void SampleMaskIndexed(GL gl_, ParameterTypeTuple!(fp_glSampleMaskIndexedNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSampleMaskIndexedNV)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "SampleMaskIndexed", funcPtr, params__);
		}
void TexRenderbuffer(GL gl_, ParameterTypeTuple!(fp_glTexRenderbufferNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTexRenderbufferNV)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "TexRenderbuffer", funcPtr, params__);
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
			if (!extStr.containsPattern("GL_NV_explicit_multisample")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glGetMultisamplefvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glSampleMaskIndexedNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glTexRenderbufferNV"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
