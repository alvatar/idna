module dgl.ext.EXT_coordinate_frame;
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



private ushort extensionId__ = 168;
alias extensionId__ EXT_coordinate_frame;

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
			const GLenum GL_TANGENT_ARRAY_EXT = 0x8439;
			const GLenum GL_BINORMAL_ARRAY_EXT = 0x843A;
			const GLenum GL_CURRENT_TANGENT_EXT = 0x843B;
			const GLenum GL_CURRENT_BINORMAL_EXT = 0x843C;
			const GLenum GL_TANGENT_ARRAY_TYPE_EXT = 0x843E;
			const GLenum GL_TANGENT_ARRAY_STRIDE_EXT = 0x843F;
			const GLenum GL_BINORMAL_ARRAY_TYPE_EXT = 0x8440;
			const GLenum GL_BINORMAL_ARRAY_STRIDE_EXT = 0x8441;
			const GLenum GL_TANGENT_ARRAY_POINTER_EXT = 0x8442;
			const GLenum GL_BINORMAL_ARRAY_POINTER_EXT = 0x8443;
			const GLenum GL_MAP1_TANGENT_EXT = 0x8444;
			const GLenum GL_MAP2_TANGENT_EXT = 0x8445;
			const GLenum GL_MAP1_BINORMAL_EXT = 0x8446;
			const GLenum GL_MAP2_BINORMAL_EXT = 0x8447;
	}
	private {
		extern (System) {
			alias void function (GLenum type, GLsizei stride, void* pointer)	fp_glBinormalPointerEXT;
			alias void function (GLenum type, GLsizei stride, void* pointer)	fp_glTangentPointerEXT;
		}
	}
	public {
void BinormalPointer(GL gl_, ParameterTypeTuple!(fp_glBinormalPointerEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glBinormalPointerEXT)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "BinormalPointer", funcPtr, params__);
		}
void TangentPointer(GL gl_, ParameterTypeTuple!(fp_glTangentPointerEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTangentPointerEXT)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "TangentPointer", funcPtr, params__);
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
		void*[] funcAddr = new void*[2];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_EXT_coordinate_frame")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glBinormalPointerEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glTangentPointerEXT"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
