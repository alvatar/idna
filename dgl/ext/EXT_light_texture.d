module dgl.ext.EXT_light_texture;
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



private ushort extensionId__ = 336;
alias extensionId__ EXT_light_texture;
import dgl.ext.EXT_fragment_lighting;

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
			const GLenum GL_FRAGMENT_MATERIAL_EXT = 0x8349;
			const GLenum GL_FRAGMENT_NORMAL_EXT = 0x834A;
			const GLenum GL_FRAGMENT_COLOR_EXT = 0x834C;
			const GLenum GL_ATTENUATION_EXT = 0x834D;
			const GLenum GL_SHADOW_ATTENUATION_EXT = 0x834E;
			const GLenum GL_TEXTURE_APPLICATION_MODE_EXT = 0x834F;
			const GLenum GL_TEXTURE_LIGHT_EXT = 0x8350;
			const GLenum GL_TEXTURE_MATERIAL_FACE_EXT = 0x8351;
			const GLenum GL_TEXTURE_MATERIAL_PARAMETER_EXT = 0x8352;
			const GLenum GL_FRAGMENT_DEPTH_EXT = 0x8452;
	}
	private {
		extern (System) {
			alias void function (GLenum mode)	fp_glApplyTextureEXT;
			alias void function (GLenum pname)	fp_glTextureLightEXT;
			alias void function (GLenum face, GLenum mode)	fp_glTextureMaterialEXT;
		}
	}
	public {
void ApplyTexture(GL gl_, ParameterTypeTuple!(fp_glApplyTextureEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glApplyTextureEXT)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "ApplyTexture", funcPtr, params__);
		}
void TextureLight(GL gl_, ParameterTypeTuple!(fp_glTextureLightEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTextureLightEXT)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "TextureLight", funcPtr, params__);
		}
void TextureMaterial(GL gl_, ParameterTypeTuple!(fp_glTextureMaterialEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTextureMaterialEXT)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "TextureMaterial", funcPtr, params__);
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
			if (!extStr.containsPattern("GL_EXT_light_texture")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glApplyTextureEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glTextureLightEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glTextureMaterialEXT"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
