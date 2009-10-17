module dgl.ext.ARB_multitexture;
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



private ushort extensionId__ = 437;
alias extensionId__ ARB_multitexture;

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
			const GLenum GL_TEXTURE0_ARB = 0x84C0;
			const GLenum GL_TEXTURE1_ARB = 0x84C1;
			const GLenum GL_TEXTURE2_ARB = 0x84C2;
			const GLenum GL_TEXTURE3_ARB = 0x84C3;
			const GLenum GL_TEXTURE4_ARB = 0x84C4;
			const GLenum GL_TEXTURE5_ARB = 0x84C5;
			const GLenum GL_TEXTURE6_ARB = 0x84C6;
			const GLenum GL_TEXTURE7_ARB = 0x84C7;
			const GLenum GL_TEXTURE8_ARB = 0x84C8;
			const GLenum GL_TEXTURE9_ARB = 0x84C9;
			const GLenum GL_TEXTURE10_ARB = 0x84CA;
			const GLenum GL_TEXTURE11_ARB = 0x84CB;
			const GLenum GL_TEXTURE12_ARB = 0x84CC;
			const GLenum GL_TEXTURE13_ARB = 0x84CD;
			const GLenum GL_TEXTURE14_ARB = 0x84CE;
			const GLenum GL_TEXTURE15_ARB = 0x84CF;
			const GLenum GL_TEXTURE16_ARB = 0x84D0;
			const GLenum GL_TEXTURE17_ARB = 0x84D1;
			const GLenum GL_TEXTURE18_ARB = 0x84D2;
			const GLenum GL_TEXTURE19_ARB = 0x84D3;
			const GLenum GL_TEXTURE20_ARB = 0x84D4;
			const GLenum GL_TEXTURE21_ARB = 0x84D5;
			const GLenum GL_TEXTURE22_ARB = 0x84D6;
			const GLenum GL_TEXTURE23_ARB = 0x84D7;
			const GLenum GL_TEXTURE24_ARB = 0x84D8;
			const GLenum GL_TEXTURE25_ARB = 0x84D9;
			const GLenum GL_TEXTURE26_ARB = 0x84DA;
			const GLenum GL_TEXTURE27_ARB = 0x84DB;
			const GLenum GL_TEXTURE28_ARB = 0x84DC;
			const GLenum GL_TEXTURE29_ARB = 0x84DD;
			const GLenum GL_TEXTURE30_ARB = 0x84DE;
			const GLenum GL_TEXTURE31_ARB = 0x84DF;
			const GLenum GL_ACTIVE_TEXTURE_ARB = 0x84E0;
			const GLenum GL_CLIENT_ACTIVE_TEXTURE_ARB = 0x84E1;
			const GLenum GL_MAX_TEXTURE_UNITS_ARB = 0x84E2;
	}
	private {
		extern (System) {
			alias void function (GLenum texture)	fp_glActiveTextureARB;
			alias void function (GLenum texture)	fp_glClientActiveTextureARB;
			alias void function (GLenum target, GLdouble s)	fp_glMultiTexCoord1dARB;
			alias void function (GLenum target,  GLdouble *v)	fp_glMultiTexCoord1dvARB;
			alias void function (GLenum target, GLfloat s)	fp_glMultiTexCoord1fARB;
			alias void function (GLenum target,  GLfloat *v)	fp_glMultiTexCoord1fvARB;
			alias void function (GLenum target, GLint s)	fp_glMultiTexCoord1iARB;
			alias void function (GLenum target,  GLint *v)	fp_glMultiTexCoord1ivARB;
			alias void function (GLenum target, GLshort s)	fp_glMultiTexCoord1sARB;
			alias void function (GLenum target,  GLshort *v)	fp_glMultiTexCoord1svARB;
			alias void function (GLenum target, GLdouble s, GLdouble t)	fp_glMultiTexCoord2dARB;
			alias void function (GLenum target,  GLdouble *v)	fp_glMultiTexCoord2dvARB;
			alias void function (GLenum target, GLfloat s, GLfloat t)	fp_glMultiTexCoord2fARB;
			alias void function (GLenum target,  GLfloat *v)	fp_glMultiTexCoord2fvARB;
			alias void function (GLenum target, GLint s, GLint t)	fp_glMultiTexCoord2iARB;
			alias void function (GLenum target,  GLint *v)	fp_glMultiTexCoord2ivARB;
			alias void function (GLenum target, GLshort s, GLshort t)	fp_glMultiTexCoord2sARB;
			alias void function (GLenum target,  GLshort *v)	fp_glMultiTexCoord2svARB;
			alias void function (GLenum target, GLdouble s, GLdouble t, GLdouble r)	fp_glMultiTexCoord3dARB;
			alias void function (GLenum target,  GLdouble *v)	fp_glMultiTexCoord3dvARB;
			alias void function (GLenum target, GLfloat s, GLfloat t, GLfloat r)	fp_glMultiTexCoord3fARB;
			alias void function (GLenum target,  GLfloat *v)	fp_glMultiTexCoord3fvARB;
			alias void function (GLenum target, GLint s, GLint t, GLint r)	fp_glMultiTexCoord3iARB;
			alias void function (GLenum target,  GLint *v)	fp_glMultiTexCoord3ivARB;
			alias void function (GLenum target, GLshort s, GLshort t, GLshort r)	fp_glMultiTexCoord3sARB;
			alias void function (GLenum target,  GLshort *v)	fp_glMultiTexCoord3svARB;
			alias void function (GLenum target, GLdouble s, GLdouble t, GLdouble r, GLdouble q)	fp_glMultiTexCoord4dARB;
			alias void function (GLenum target,  GLdouble *v)	fp_glMultiTexCoord4dvARB;
			alias void function (GLenum target, GLfloat s, GLfloat t, GLfloat r, GLfloat q)	fp_glMultiTexCoord4fARB;
			alias void function (GLenum target,  GLfloat *v)	fp_glMultiTexCoord4fvARB;
			alias void function (GLenum target, GLint s, GLint t, GLint r, GLint q)	fp_glMultiTexCoord4iARB;
			alias void function (GLenum target,  GLint *v)	fp_glMultiTexCoord4ivARB;
			alias void function (GLenum target, GLshort s, GLshort t, GLshort r, GLshort q)	fp_glMultiTexCoord4sARB;
			alias void function (GLenum target,  GLshort *v)	fp_glMultiTexCoord4svARB;
		}
	}
	public {
void ActiveTexture(GL gl_, ParameterTypeTuple!(fp_glActiveTextureARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glActiveTextureARB)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "ActiveTexture", funcPtr, params__);
		}
void ClientActiveTexture(GL gl_, ParameterTypeTuple!(fp_glClientActiveTextureARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glClientActiveTextureARB)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "ClientActiveTexture", funcPtr, params__);
		}
void MultiTexCoord1d(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord1dARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord1dARB)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "MultiTexCoord1d", funcPtr, params__);
		}
void MultiTexCoord1dv(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord1dvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord1dvARB)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "MultiTexCoord1dv", funcPtr, params__);
		}
void MultiTexCoord1f(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord1fARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord1fARB)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "MultiTexCoord1f", funcPtr, params__);
		}
void MultiTexCoord1fv(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord1fvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord1fvARB)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "MultiTexCoord1fv", funcPtr, params__);
		}
void MultiTexCoord1i(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord1iARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord1iARB)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "MultiTexCoord1i", funcPtr, params__);
		}
void MultiTexCoord1iv(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord1ivARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord1ivARB)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "MultiTexCoord1iv", funcPtr, params__);
		}
void MultiTexCoord1s(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord1sARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord1sARB)(gl.extFuncs[extensionId__][8]);
			return checkedCall(gl_, "MultiTexCoord1s", funcPtr, params__);
		}
void MultiTexCoord1sv(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord1svARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord1svARB)(gl.extFuncs[extensionId__][9]);
			return checkedCall(gl_, "MultiTexCoord1sv", funcPtr, params__);
		}
void MultiTexCoord2d(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord2dARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord2dARB)(gl.extFuncs[extensionId__][10]);
			return checkedCall(gl_, "MultiTexCoord2d", funcPtr, params__);
		}
void MultiTexCoord2dv(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord2dvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord2dvARB)(gl.extFuncs[extensionId__][11]);
			return checkedCall(gl_, "MultiTexCoord2dv", funcPtr, params__);
		}
void MultiTexCoord2f(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord2fARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord2fARB)(gl.extFuncs[extensionId__][12]);
			return checkedCall(gl_, "MultiTexCoord2f", funcPtr, params__);
		}
void MultiTexCoord2fv(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord2fvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord2fvARB)(gl.extFuncs[extensionId__][13]);
			return checkedCall(gl_, "MultiTexCoord2fv", funcPtr, params__);
		}
void MultiTexCoord2i(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord2iARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord2iARB)(gl.extFuncs[extensionId__][14]);
			return checkedCall(gl_, "MultiTexCoord2i", funcPtr, params__);
		}
void MultiTexCoord2iv(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord2ivARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord2ivARB)(gl.extFuncs[extensionId__][15]);
			return checkedCall(gl_, "MultiTexCoord2iv", funcPtr, params__);
		}
void MultiTexCoord2s(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord2sARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord2sARB)(gl.extFuncs[extensionId__][16]);
			return checkedCall(gl_, "MultiTexCoord2s", funcPtr, params__);
		}
void MultiTexCoord2sv(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord2svARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord2svARB)(gl.extFuncs[extensionId__][17]);
			return checkedCall(gl_, "MultiTexCoord2sv", funcPtr, params__);
		}
void MultiTexCoord3d(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord3dARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord3dARB)(gl.extFuncs[extensionId__][18]);
			return checkedCall(gl_, "MultiTexCoord3d", funcPtr, params__);
		}
void MultiTexCoord3dv(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord3dvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord3dvARB)(gl.extFuncs[extensionId__][19]);
			return checkedCall(gl_, "MultiTexCoord3dv", funcPtr, params__);
		}
void MultiTexCoord3f(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord3fARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord3fARB)(gl.extFuncs[extensionId__][20]);
			return checkedCall(gl_, "MultiTexCoord3f", funcPtr, params__);
		}
void MultiTexCoord3fv(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord3fvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord3fvARB)(gl.extFuncs[extensionId__][21]);
			return checkedCall(gl_, "MultiTexCoord3fv", funcPtr, params__);
		}
void MultiTexCoord3i(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord3iARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord3iARB)(gl.extFuncs[extensionId__][22]);
			return checkedCall(gl_, "MultiTexCoord3i", funcPtr, params__);
		}
void MultiTexCoord3iv(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord3ivARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord3ivARB)(gl.extFuncs[extensionId__][23]);
			return checkedCall(gl_, "MultiTexCoord3iv", funcPtr, params__);
		}
void MultiTexCoord3s(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord3sARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord3sARB)(gl.extFuncs[extensionId__][24]);
			return checkedCall(gl_, "MultiTexCoord3s", funcPtr, params__);
		}
void MultiTexCoord3sv(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord3svARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord3svARB)(gl.extFuncs[extensionId__][25]);
			return checkedCall(gl_, "MultiTexCoord3sv", funcPtr, params__);
		}
void MultiTexCoord4d(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord4dARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord4dARB)(gl.extFuncs[extensionId__][26]);
			return checkedCall(gl_, "MultiTexCoord4d", funcPtr, params__);
		}
void MultiTexCoord4dv(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord4dvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord4dvARB)(gl.extFuncs[extensionId__][27]);
			return checkedCall(gl_, "MultiTexCoord4dv", funcPtr, params__);
		}
void MultiTexCoord4f(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord4fARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord4fARB)(gl.extFuncs[extensionId__][28]);
			return checkedCall(gl_, "MultiTexCoord4f", funcPtr, params__);
		}
void MultiTexCoord4fv(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord4fvARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord4fvARB)(gl.extFuncs[extensionId__][29]);
			return checkedCall(gl_, "MultiTexCoord4fv", funcPtr, params__);
		}
void MultiTexCoord4i(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord4iARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord4iARB)(gl.extFuncs[extensionId__][30]);
			return checkedCall(gl_, "MultiTexCoord4i", funcPtr, params__);
		}
void MultiTexCoord4iv(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord4ivARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord4ivARB)(gl.extFuncs[extensionId__][31]);
			return checkedCall(gl_, "MultiTexCoord4iv", funcPtr, params__);
		}
void MultiTexCoord4s(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord4sARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord4sARB)(gl.extFuncs[extensionId__][32]);
			return checkedCall(gl_, "MultiTexCoord4s", funcPtr, params__);
		}
void MultiTexCoord4sv(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord4svARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord4svARB)(gl.extFuncs[extensionId__][33]);
			return checkedCall(gl_, "MultiTexCoord4sv", funcPtr, params__);
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
		void*[] funcAddr = new void*[34];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_ARB_multitexture")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glActiveTextureARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glClientActiveTextureARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord1dARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord1dvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord1fARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord1fvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord1iARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord1ivARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[8] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord1sARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[9] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord1svARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[10] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord2dARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[11] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord2dvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[12] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord2fARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[13] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord2fvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[14] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord2iARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[15] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord2ivARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[16] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord2sARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[17] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord2svARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[18] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord3dARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[19] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord3dvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[20] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord3fARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[21] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord3fvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[22] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord3iARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[23] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord3ivARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[24] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord3sARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[25] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord3svARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[26] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord4dARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[27] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord4dvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[28] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord4fARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[29] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord4fvARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[30] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord4iARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[31] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord4ivARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[32] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord4sARB"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[33] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord4svARB"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
