module dgl.ext.ATI_vertex_streams;
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



private ushort extensionId__ = 65;
alias extensionId__ ATI_vertex_streams;
import dgl.ext.ARB_vertex_blend;

	version (DglNoExtSupportAsserts) {
	} else {
		version = DglExtSupportAsserts;
	}
	
	static this() {
		if (__extSupportCheckingFuncs.length <= extensionId__) {
			__extSupportCheckingFuncs.length = extensionId__ + 1;
		}
		__extSupportCheckingFuncs[extensionId__] = &__supported;
	}

version (all) {
	public {
			const GLenum GL_MAX_VERTEX_STREAMS_ATI = 0x876B;
			const GLenum GL_VERTEX_SOURCE_ATI = 0x876C;
			const GLenum GL_VERTEX_STREAM0_ATI = 0x876D;
			const GLenum GL_VERTEX_STREAM1_ATI = 0x876E;
			const GLenum GL_VERTEX_STREAM2_ATI = 0x876F;
			const GLenum GL_VERTEX_STREAM3_ATI = 0x8770;
			const GLenum GL_VERTEX_STREAM4_ATI = 0x8771;
			const GLenum GL_VERTEX_STREAM5_ATI = 0x8772;
			const GLenum GL_VERTEX_STREAM6_ATI = 0x8773;
			const GLenum GL_VERTEX_STREAM7_ATI = 0x8774;
	}
	private {
		extern (System) {
			alias void function (GLenum stream)	fp_glClientActiveVertexStreamATI;
			alias void function (GLenum pname, GLint param)	fp_glVertexBlendEnviATI;
			alias void function (GLenum pname, GLfloat param)	fp_glVertexBlendEnvfATI;
			alias void function (GLenum stream, GLshort x, GLshort y)	fp_glVertexStream2sATI;
			alias void function (GLenum stream,  GLshort *v)	fp_glVertexStream2svATI;
			alias void function (GLenum stream, GLint x, GLint y)	fp_glVertexStream2iATI;
			alias void function (GLenum stream,  GLint *v)	fp_glVertexStream2ivATI;
			alias void function (GLenum stream, GLfloat x, GLfloat y)	fp_glVertexStream2fATI;
			alias void function (GLenum stream,  GLfloat *v)	fp_glVertexStream2fvATI;
			alias void function (GLenum stream, GLdouble x, GLdouble y)	fp_glVertexStream2dATI;
			alias void function (GLenum stream,  GLdouble *v)	fp_glVertexStream2dvATI;
			alias void function (GLenum stream, GLshort x, GLshort y, GLshort z)	fp_glVertexStream3sATI;
			alias void function (GLenum stream,  GLshort *v)	fp_glVertexStream3svATI;
			alias void function (GLenum stream, GLint x, GLint y, GLint z)	fp_glVertexStream3iATI;
			alias void function (GLenum stream,  GLint *v)	fp_glVertexStream3ivATI;
			alias void function (GLenum stream, GLfloat x, GLfloat y, GLfloat z)	fp_glVertexStream3fATI;
			alias void function (GLenum stream,  GLfloat *v)	fp_glVertexStream3fvATI;
			alias void function (GLenum stream, GLdouble x, GLdouble y, GLdouble z)	fp_glVertexStream3dATI;
			alias void function (GLenum stream,  GLdouble *v)	fp_glVertexStream3dvATI;
			alias void function (GLenum stream, GLshort x, GLshort y, GLshort z, GLshort w)	fp_glVertexStream4sATI;
			alias void function (GLenum stream,  GLshort *v)	fp_glVertexStream4svATI;
			alias void function (GLenum stream, GLint x, GLint y, GLint z, GLint w)	fp_glVertexStream4iATI;
			alias void function (GLenum stream,  GLint *v)	fp_glVertexStream4ivATI;
			alias void function (GLenum stream, GLfloat x, GLfloat y, GLfloat z, GLfloat w)	fp_glVertexStream4fATI;
			alias void function (GLenum stream,  GLfloat *v)	fp_glVertexStream4fvATI;
			alias void function (GLenum stream, GLdouble x, GLdouble y, GLdouble z, GLdouble w)	fp_glVertexStream4dATI;
			alias void function (GLenum stream,  GLdouble *v)	fp_glVertexStream4dvATI;
			alias void function (GLenum stream, GLbyte x, GLbyte y, GLbyte z)	fp_glNormalStream3bATI;
			alias void function (GLenum stream,  GLbyte *v)	fp_glNormalStream3bvATI;
			alias void function (GLenum stream, GLshort x, GLshort y, GLshort z)	fp_glNormalStream3sATI;
			alias void function (GLenum stream,  GLshort *v)	fp_glNormalStream3svATI;
			alias void function (GLenum stream, GLint x, GLint y, GLint z)	fp_glNormalStream3iATI;
			alias void function (GLenum stream,  GLint *v)	fp_glNormalStream3ivATI;
			alias void function (GLenum stream, GLfloat x, GLfloat y, GLfloat z)	fp_glNormalStream3fATI;
			alias void function (GLenum stream,  GLfloat *v)	fp_glNormalStream3fvATI;
			alias void function (GLenum stream, GLdouble x, GLdouble y, GLdouble z)	fp_glNormalStream3dATI;
			alias void function (GLenum stream,  GLdouble *v)	fp_glNormalStream3dvATI;
		}
	}
	public {
void ClientActiveVertexStream(GL gl_, ParameterTypeTuple!(fp_glClientActiveVertexStreamATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glClientActiveVertexStreamATI)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "ClientActiveVertexStream", funcPtr, params__);
		}
void VertexBlendEnvi(GL gl_, ParameterTypeTuple!(fp_glVertexBlendEnviATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexBlendEnviATI)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "VertexBlendEnvi", funcPtr, params__);
		}
void VertexBlendEnvf(GL gl_, ParameterTypeTuple!(fp_glVertexBlendEnvfATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexBlendEnvfATI)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "VertexBlendEnvf", funcPtr, params__);
		}
void VertexStream2s(GL gl_, ParameterTypeTuple!(fp_glVertexStream2sATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexStream2sATI)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "VertexStream2s", funcPtr, params__);
		}
void VertexStream2sv(GL gl_, ParameterTypeTuple!(fp_glVertexStream2svATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexStream2svATI)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "VertexStream2sv", funcPtr, params__);
		}
void VertexStream2i(GL gl_, ParameterTypeTuple!(fp_glVertexStream2iATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexStream2iATI)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "VertexStream2i", funcPtr, params__);
		}
void VertexStream2iv(GL gl_, ParameterTypeTuple!(fp_glVertexStream2ivATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexStream2ivATI)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "VertexStream2iv", funcPtr, params__);
		}
void VertexStream2f(GL gl_, ParameterTypeTuple!(fp_glVertexStream2fATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexStream2fATI)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "VertexStream2f", funcPtr, params__);
		}
void VertexStream2fv(GL gl_, ParameterTypeTuple!(fp_glVertexStream2fvATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexStream2fvATI)(gl.extFuncs[extensionId__][8]);
			return checkedCall(gl_, "VertexStream2fv", funcPtr, params__);
		}
void VertexStream2d(GL gl_, ParameterTypeTuple!(fp_glVertexStream2dATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexStream2dATI)(gl.extFuncs[extensionId__][9]);
			return checkedCall(gl_, "VertexStream2d", funcPtr, params__);
		}
void VertexStream2dv(GL gl_, ParameterTypeTuple!(fp_glVertexStream2dvATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexStream2dvATI)(gl.extFuncs[extensionId__][10]);
			return checkedCall(gl_, "VertexStream2dv", funcPtr, params__);
		}
void VertexStream3s(GL gl_, ParameterTypeTuple!(fp_glVertexStream3sATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexStream3sATI)(gl.extFuncs[extensionId__][11]);
			return checkedCall(gl_, "VertexStream3s", funcPtr, params__);
		}
void VertexStream3sv(GL gl_, ParameterTypeTuple!(fp_glVertexStream3svATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexStream3svATI)(gl.extFuncs[extensionId__][12]);
			return checkedCall(gl_, "VertexStream3sv", funcPtr, params__);
		}
void VertexStream3i(GL gl_, ParameterTypeTuple!(fp_glVertexStream3iATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexStream3iATI)(gl.extFuncs[extensionId__][13]);
			return checkedCall(gl_, "VertexStream3i", funcPtr, params__);
		}
void VertexStream3iv(GL gl_, ParameterTypeTuple!(fp_glVertexStream3ivATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexStream3ivATI)(gl.extFuncs[extensionId__][14]);
			return checkedCall(gl_, "VertexStream3iv", funcPtr, params__);
		}
void VertexStream3f(GL gl_, ParameterTypeTuple!(fp_glVertexStream3fATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexStream3fATI)(gl.extFuncs[extensionId__][15]);
			return checkedCall(gl_, "VertexStream3f", funcPtr, params__);
		}
void VertexStream3fv(GL gl_, ParameterTypeTuple!(fp_glVertexStream3fvATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexStream3fvATI)(gl.extFuncs[extensionId__][16]);
			return checkedCall(gl_, "VertexStream3fv", funcPtr, params__);
		}
void VertexStream3d(GL gl_, ParameterTypeTuple!(fp_glVertexStream3dATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexStream3dATI)(gl.extFuncs[extensionId__][17]);
			return checkedCall(gl_, "VertexStream3d", funcPtr, params__);
		}
void VertexStream3dv(GL gl_, ParameterTypeTuple!(fp_glVertexStream3dvATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexStream3dvATI)(gl.extFuncs[extensionId__][18]);
			return checkedCall(gl_, "VertexStream3dv", funcPtr, params__);
		}
void VertexStream4s(GL gl_, ParameterTypeTuple!(fp_glVertexStream4sATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexStream4sATI)(gl.extFuncs[extensionId__][19]);
			return checkedCall(gl_, "VertexStream4s", funcPtr, params__);
		}
void VertexStream4sv(GL gl_, ParameterTypeTuple!(fp_glVertexStream4svATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexStream4svATI)(gl.extFuncs[extensionId__][20]);
			return checkedCall(gl_, "VertexStream4sv", funcPtr, params__);
		}
void VertexStream4i(GL gl_, ParameterTypeTuple!(fp_glVertexStream4iATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexStream4iATI)(gl.extFuncs[extensionId__][21]);
			return checkedCall(gl_, "VertexStream4i", funcPtr, params__);
		}
void VertexStream4iv(GL gl_, ParameterTypeTuple!(fp_glVertexStream4ivATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexStream4ivATI)(gl.extFuncs[extensionId__][22]);
			return checkedCall(gl_, "VertexStream4iv", funcPtr, params__);
		}
void VertexStream4f(GL gl_, ParameterTypeTuple!(fp_glVertexStream4fATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexStream4fATI)(gl.extFuncs[extensionId__][23]);
			return checkedCall(gl_, "VertexStream4f", funcPtr, params__);
		}
void VertexStream4fv(GL gl_, ParameterTypeTuple!(fp_glVertexStream4fvATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexStream4fvATI)(gl.extFuncs[extensionId__][24]);
			return checkedCall(gl_, "VertexStream4fv", funcPtr, params__);
		}
void VertexStream4d(GL gl_, ParameterTypeTuple!(fp_glVertexStream4dATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexStream4dATI)(gl.extFuncs[extensionId__][25]);
			return checkedCall(gl_, "VertexStream4d", funcPtr, params__);
		}
void VertexStream4dv(GL gl_, ParameterTypeTuple!(fp_glVertexStream4dvATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexStream4dvATI)(gl.extFuncs[extensionId__][26]);
			return checkedCall(gl_, "VertexStream4dv", funcPtr, params__);
		}
void NormalStream3b(GL gl_, ParameterTypeTuple!(fp_glNormalStream3bATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNormalStream3bATI)(gl.extFuncs[extensionId__][27]);
			return checkedCall(gl_, "NormalStream3b", funcPtr, params__);
		}
void NormalStream3bv(GL gl_, ParameterTypeTuple!(fp_glNormalStream3bvATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNormalStream3bvATI)(gl.extFuncs[extensionId__][28]);
			return checkedCall(gl_, "NormalStream3bv", funcPtr, params__);
		}
void NormalStream3s(GL gl_, ParameterTypeTuple!(fp_glNormalStream3sATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNormalStream3sATI)(gl.extFuncs[extensionId__][29]);
			return checkedCall(gl_, "NormalStream3s", funcPtr, params__);
		}
void NormalStream3sv(GL gl_, ParameterTypeTuple!(fp_glNormalStream3svATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNormalStream3svATI)(gl.extFuncs[extensionId__][30]);
			return checkedCall(gl_, "NormalStream3sv", funcPtr, params__);
		}
void NormalStream3i(GL gl_, ParameterTypeTuple!(fp_glNormalStream3iATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNormalStream3iATI)(gl.extFuncs[extensionId__][31]);
			return checkedCall(gl_, "NormalStream3i", funcPtr, params__);
		}
void NormalStream3iv(GL gl_, ParameterTypeTuple!(fp_glNormalStream3ivATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNormalStream3ivATI)(gl.extFuncs[extensionId__][32]);
			return checkedCall(gl_, "NormalStream3iv", funcPtr, params__);
		}
void NormalStream3f(GL gl_, ParameterTypeTuple!(fp_glNormalStream3fATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNormalStream3fATI)(gl.extFuncs[extensionId__][33]);
			return checkedCall(gl_, "NormalStream3f", funcPtr, params__);
		}
void NormalStream3fv(GL gl_, ParameterTypeTuple!(fp_glNormalStream3fvATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNormalStream3fvATI)(gl.extFuncs[extensionId__][34]);
			return checkedCall(gl_, "NormalStream3fv", funcPtr, params__);
		}
void NormalStream3d(GL gl_, ParameterTypeTuple!(fp_glNormalStream3dATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNormalStream3dATI)(gl.extFuncs[extensionId__][35]);
			return checkedCall(gl_, "NormalStream3d", funcPtr, params__);
		}
void NormalStream3dv(GL gl_, ParameterTypeTuple!(fp_glNormalStream3dvATI) params__) {
			auto gl = _getGL(gl_);
			version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNormalStream3dvATI)(gl.extFuncs[extensionId__][36]);
			return checkedCall(gl_, "NormalStream3dv", funcPtr, params__);
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
				
				version (DglExtSupportAsserts) {
					gl.extEnabled.length = extensionId__ + 1;
				}
			}
			gl.extFuncs[extensionId__] = loadFunctions__(gl_);
			
			return gl.extFuncs[extensionId__][0] !is null;
		}
	}
	private void*[] loadFunctions__(GL gl) {
		void*[] funcAddr = new void*[37];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_ATI_vertex_streams")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glClientActiveVertexStreamATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glVertexBlendEnviATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glVertexBlendEnvfATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glVertexStream2sATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glVertexStream2svATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glVertexStream2iATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glVertexStream2ivATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glVertexStream2fATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[8] = getExtensionFuncPtr(cast(char*)"glVertexStream2fvATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[9] = getExtensionFuncPtr(cast(char*)"glVertexStream2dATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[10] = getExtensionFuncPtr(cast(char*)"glVertexStream2dvATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[11] = getExtensionFuncPtr(cast(char*)"glVertexStream3sATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[12] = getExtensionFuncPtr(cast(char*)"glVertexStream3svATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[13] = getExtensionFuncPtr(cast(char*)"glVertexStream3iATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[14] = getExtensionFuncPtr(cast(char*)"glVertexStream3ivATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[15] = getExtensionFuncPtr(cast(char*)"glVertexStream3fATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[16] = getExtensionFuncPtr(cast(char*)"glVertexStream3fvATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[17] = getExtensionFuncPtr(cast(char*)"glVertexStream3dATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[18] = getExtensionFuncPtr(cast(char*)"glVertexStream3dvATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[19] = getExtensionFuncPtr(cast(char*)"glVertexStream4sATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[20] = getExtensionFuncPtr(cast(char*)"glVertexStream4svATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[21] = getExtensionFuncPtr(cast(char*)"glVertexStream4iATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[22] = getExtensionFuncPtr(cast(char*)"glVertexStream4ivATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[23] = getExtensionFuncPtr(cast(char*)"glVertexStream4fATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[24] = getExtensionFuncPtr(cast(char*)"glVertexStream4fvATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[25] = getExtensionFuncPtr(cast(char*)"glVertexStream4dATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[26] = getExtensionFuncPtr(cast(char*)"glVertexStream4dvATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[27] = getExtensionFuncPtr(cast(char*)"glNormalStream3bATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[28] = getExtensionFuncPtr(cast(char*)"glNormalStream3bvATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[29] = getExtensionFuncPtr(cast(char*)"glNormalStream3sATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[30] = getExtensionFuncPtr(cast(char*)"glNormalStream3svATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[31] = getExtensionFuncPtr(cast(char*)"glNormalStream3iATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[32] = getExtensionFuncPtr(cast(char*)"glNormalStream3ivATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[33] = getExtensionFuncPtr(cast(char*)"glNormalStream3fATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[34] = getExtensionFuncPtr(cast(char*)"glNormalStream3fvATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[35] = getExtensionFuncPtr(cast(char*)"glNormalStream3dATI"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[36] = getExtensionFuncPtr(cast(char*)"glNormalStream3dvATI"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
