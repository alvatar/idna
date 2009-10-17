module dgl.ext.SUN_vertex;
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



private ushort extensionId__ = 187;
alias extensionId__ SUN_vertex;

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
	}
	private {
		extern (System) {
			alias void function (GLfloat r, GLfloat g, GLfloat b, GLfloat x, GLfloat y, GLfloat z)	fp_glColor3fVertex3fSUN;
			alias void function ( GLfloat* c,  GLfloat *v)	fp_glColor3fVertex3fvSUN;
			alias void function (GLfloat r, GLfloat g, GLfloat b, GLfloat a, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z)	fp_glColor4fNormal3fVertex3fSUN;
			alias void function ( GLfloat* c,  GLfloat *n,  GLfloat *v)	fp_glColor4fNormal3fVertex3fvSUN;
			alias void function (GLubyte r, GLubyte g, GLubyte b, GLubyte a, GLfloat x, GLfloat y)	fp_glColor4ubVertex2fSUN;
			alias void function ( GLubyte* c,  GLfloat *v)	fp_glColor4ubVertex2fvSUN;
			alias void function (GLubyte r, GLubyte g, GLubyte b, GLubyte a, GLfloat x, GLfloat y, GLfloat z)	fp_glColor4ubVertex3fSUN;
			alias void function ( GLubyte* c,  GLfloat *v)	fp_glColor4ubVertex3fvSUN;
			alias void function (GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z)	fp_glNormal3fVertex3fSUN;
			alias void function ( GLfloat* n,  GLfloat *v)	fp_glNormal3fVertex3fvSUN;
			alias void function (GLuint rc, GLfloat r, GLfloat g, GLfloat b, GLfloat x, GLfloat y, GLfloat z)	fp_glReplacementCodeuiColor3fVertex3fSUN;
			alias void function ( GLuint* rc,  GLfloat *c,  GLfloat *v)	fp_glReplacementCodeuiColor3fVertex3fvSUN;
			alias void function (GLuint rc, GLfloat r, GLfloat g, GLfloat b, GLfloat a, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z)	fp_glReplacementCodeuiColor4fNormal3fVertex3fSUN;
			alias void function ( GLuint* rc,  GLfloat *c,  GLfloat *n,  GLfloat *v)	fp_glReplacementCodeuiColor4fNormal3fVertex3fvSUN;
			alias void function (GLuint rc, GLubyte r, GLubyte g, GLubyte b, GLubyte a, GLfloat x, GLfloat y, GLfloat z)	fp_glReplacementCodeuiColor4ubVertex3fSUN;
			alias void function ( GLuint* rc,  GLubyte *c,  GLfloat *v)	fp_glReplacementCodeuiColor4ubVertex3fvSUN;
			alias void function (GLuint rc, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z)	fp_glReplacementCodeuiNormal3fVertex3fSUN;
			alias void function ( GLuint* rc,  GLfloat *n,  GLfloat *v)	fp_glReplacementCodeuiNormal3fVertex3fvSUN;
			alias void function (GLuint rc, GLfloat s, GLfloat t, GLfloat r, GLfloat g, GLfloat b, GLfloat a, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z)	fp_glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fSUN;
			alias void function ( GLuint* rc,  GLfloat *tc,  GLfloat *c,  GLfloat *n,  GLfloat *v)	fp_glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fvSUN;
			alias void function (GLuint rc, GLfloat s, GLfloat t, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z)	fp_glReplacementCodeuiTexCoord2fNormal3fVertex3fSUN;
			alias void function ( GLuint* rc,  GLfloat *tc,  GLfloat *n,  GLfloat *v)	fp_glReplacementCodeuiTexCoord2fNormal3fVertex3fvSUN;
			alias void function (GLuint rc, GLfloat s, GLfloat t, GLfloat x, GLfloat y, GLfloat z)	fp_glReplacementCodeuiTexCoord2fVertex3fSUN;
			alias void function ( GLuint* rc,  GLfloat *tc,  GLfloat *v)	fp_glReplacementCodeuiTexCoord2fVertex3fvSUN;
			alias void function (GLuint rc, GLfloat x, GLfloat y, GLfloat z)	fp_glReplacementCodeuiVertex3fSUN;
			alias void function ( GLuint* rc,  GLfloat *v)	fp_glReplacementCodeuiVertex3fvSUN;
			alias void function (GLfloat s, GLfloat t, GLfloat r, GLfloat g, GLfloat b, GLfloat x, GLfloat y, GLfloat z)	fp_glTexCoord2fColor3fVertex3fSUN;
			alias void function ( GLfloat* tc,  GLfloat *c,  GLfloat *v)	fp_glTexCoord2fColor3fVertex3fvSUN;
			alias void function (GLfloat s, GLfloat t, GLfloat r, GLfloat g, GLfloat b, GLfloat a, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z)	fp_glTexCoord2fColor4fNormal3fVertex3fSUN;
			alias void function ( GLfloat* tc,  GLfloat *c,  GLfloat *n,  GLfloat *v)	fp_glTexCoord2fColor4fNormal3fVertex3fvSUN;
			alias void function (GLfloat s, GLfloat t, GLubyte r, GLubyte g, GLubyte b, GLubyte a, GLfloat x, GLfloat y, GLfloat z)	fp_glTexCoord2fColor4ubVertex3fSUN;
			alias void function ( GLfloat* tc,  GLubyte *c,  GLfloat *v)	fp_glTexCoord2fColor4ubVertex3fvSUN;
			alias void function (GLfloat s, GLfloat t, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z)	fp_glTexCoord2fNormal3fVertex3fSUN;
			alias void function ( GLfloat* tc,  GLfloat *n,  GLfloat *v)	fp_glTexCoord2fNormal3fVertex3fvSUN;
			alias void function (GLfloat s, GLfloat t, GLfloat x, GLfloat y, GLfloat z)	fp_glTexCoord2fVertex3fSUN;
			alias void function ( GLfloat* tc,  GLfloat *v)	fp_glTexCoord2fVertex3fvSUN;
			alias void function (GLfloat s, GLfloat t, GLfloat p, GLfloat q, GLfloat r, GLfloat g, GLfloat b, GLfloat a, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z, GLfloat w)	fp_glTexCoord4fColor4fNormal3fVertex4fSUN;
			alias void function ( GLfloat* tc,  GLfloat *c,  GLfloat *n,  GLfloat *v)	fp_glTexCoord4fColor4fNormal3fVertex4fvSUN;
			alias void function (GLfloat s, GLfloat t, GLfloat p, GLfloat q, GLfloat x, GLfloat y, GLfloat z, GLfloat w)	fp_glTexCoord4fVertex4fSUN;
			alias void function ( GLfloat* tc,  GLfloat *v)	fp_glTexCoord4fVertex4fvSUN;
		}
	}
	public {
void Color3fVertex3f(GL gl_, ParameterTypeTuple!(fp_glColor3fVertex3fSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glColor3fVertex3fSUN)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "Color3fVertex3f", funcPtr, params__);
		}
void Color3fVertex3fv(GL gl_, ParameterTypeTuple!(fp_glColor3fVertex3fvSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glColor3fVertex3fvSUN)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "Color3fVertex3fv", funcPtr, params__);
		}
void Color4fNormal3fVertex3f(GL gl_, ParameterTypeTuple!(fp_glColor4fNormal3fVertex3fSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glColor4fNormal3fVertex3fSUN)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "Color4fNormal3fVertex3f", funcPtr, params__);
		}
void Color4fNormal3fVertex3fv(GL gl_, ParameterTypeTuple!(fp_glColor4fNormal3fVertex3fvSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glColor4fNormal3fVertex3fvSUN)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "Color4fNormal3fVertex3fv", funcPtr, params__);
		}
void Color4ubVertex2f(GL gl_, ParameterTypeTuple!(fp_glColor4ubVertex2fSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glColor4ubVertex2fSUN)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "Color4ubVertex2f", funcPtr, params__);
		}
void Color4ubVertex2fv(GL gl_, ParameterTypeTuple!(fp_glColor4ubVertex2fvSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glColor4ubVertex2fvSUN)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "Color4ubVertex2fv", funcPtr, params__);
		}
void Color4ubVertex3f(GL gl_, ParameterTypeTuple!(fp_glColor4ubVertex3fSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glColor4ubVertex3fSUN)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "Color4ubVertex3f", funcPtr, params__);
		}
void Color4ubVertex3fv(GL gl_, ParameterTypeTuple!(fp_glColor4ubVertex3fvSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glColor4ubVertex3fvSUN)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "Color4ubVertex3fv", funcPtr, params__);
		}
void Normal3fVertex3f(GL gl_, ParameterTypeTuple!(fp_glNormal3fVertex3fSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNormal3fVertex3fSUN)(gl.extFuncs[extensionId__][8]);
			return checkedCall(gl_, "Normal3fVertex3f", funcPtr, params__);
		}
void Normal3fVertex3fv(GL gl_, ParameterTypeTuple!(fp_glNormal3fVertex3fvSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNormal3fVertex3fvSUN)(gl.extFuncs[extensionId__][9]);
			return checkedCall(gl_, "Normal3fVertex3fv", funcPtr, params__);
		}
void ReplacementCodeuiColor3fVertex3f(GL gl_, ParameterTypeTuple!(fp_glReplacementCodeuiColor3fVertex3fSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glReplacementCodeuiColor3fVertex3fSUN)(gl.extFuncs[extensionId__][10]);
			return checkedCall(gl_, "ReplacementCodeuiColor3fVertex3f", funcPtr, params__);
		}
void ReplacementCodeuiColor3fVertex3fv(GL gl_, ParameterTypeTuple!(fp_glReplacementCodeuiColor3fVertex3fvSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glReplacementCodeuiColor3fVertex3fvSUN)(gl.extFuncs[extensionId__][11]);
			return checkedCall(gl_, "ReplacementCodeuiColor3fVertex3fv", funcPtr, params__);
		}
void ReplacementCodeuiColor4fNormal3fVertex3f(GL gl_, ParameterTypeTuple!(fp_glReplacementCodeuiColor4fNormal3fVertex3fSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glReplacementCodeuiColor4fNormal3fVertex3fSUN)(gl.extFuncs[extensionId__][12]);
			return checkedCall(gl_, "ReplacementCodeuiColor4fNormal3fVertex3f", funcPtr, params__);
		}
void ReplacementCodeuiColor4fNormal3fVertex3fv(GL gl_, ParameterTypeTuple!(fp_glReplacementCodeuiColor4fNormal3fVertex3fvSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glReplacementCodeuiColor4fNormal3fVertex3fvSUN)(gl.extFuncs[extensionId__][13]);
			return checkedCall(gl_, "ReplacementCodeuiColor4fNormal3fVertex3fv", funcPtr, params__);
		}
void ReplacementCodeuiColor4ubVertex3f(GL gl_, ParameterTypeTuple!(fp_glReplacementCodeuiColor4ubVertex3fSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glReplacementCodeuiColor4ubVertex3fSUN)(gl.extFuncs[extensionId__][14]);
			return checkedCall(gl_, "ReplacementCodeuiColor4ubVertex3f", funcPtr, params__);
		}
void ReplacementCodeuiColor4ubVertex3fv(GL gl_, ParameterTypeTuple!(fp_glReplacementCodeuiColor4ubVertex3fvSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glReplacementCodeuiColor4ubVertex3fvSUN)(gl.extFuncs[extensionId__][15]);
			return checkedCall(gl_, "ReplacementCodeuiColor4ubVertex3fv", funcPtr, params__);
		}
void ReplacementCodeuiNormal3fVertex3f(GL gl_, ParameterTypeTuple!(fp_glReplacementCodeuiNormal3fVertex3fSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glReplacementCodeuiNormal3fVertex3fSUN)(gl.extFuncs[extensionId__][16]);
			return checkedCall(gl_, "ReplacementCodeuiNormal3fVertex3f", funcPtr, params__);
		}
void ReplacementCodeuiNormal3fVertex3fv(GL gl_, ParameterTypeTuple!(fp_glReplacementCodeuiNormal3fVertex3fvSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glReplacementCodeuiNormal3fVertex3fvSUN)(gl.extFuncs[extensionId__][17]);
			return checkedCall(gl_, "ReplacementCodeuiNormal3fVertex3fv", funcPtr, params__);
		}
void ReplacementCodeuiTexCoord2fColor4fNormal3fVertex3f(GL gl_, ParameterTypeTuple!(fp_glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fSUN)(gl.extFuncs[extensionId__][18]);
			return checkedCall(gl_, "ReplacementCodeuiTexCoord2fColor4fNormal3fVertex3f", funcPtr, params__);
		}
void ReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fv(GL gl_, ParameterTypeTuple!(fp_glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fvSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fvSUN)(gl.extFuncs[extensionId__][19]);
			return checkedCall(gl_, "ReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fv", funcPtr, params__);
		}
void ReplacementCodeuiTexCoord2fNormal3fVertex3f(GL gl_, ParameterTypeTuple!(fp_glReplacementCodeuiTexCoord2fNormal3fVertex3fSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glReplacementCodeuiTexCoord2fNormal3fVertex3fSUN)(gl.extFuncs[extensionId__][20]);
			return checkedCall(gl_, "ReplacementCodeuiTexCoord2fNormal3fVertex3f", funcPtr, params__);
		}
void ReplacementCodeuiTexCoord2fNormal3fVertex3fv(GL gl_, ParameterTypeTuple!(fp_glReplacementCodeuiTexCoord2fNormal3fVertex3fvSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glReplacementCodeuiTexCoord2fNormal3fVertex3fvSUN)(gl.extFuncs[extensionId__][21]);
			return checkedCall(gl_, "ReplacementCodeuiTexCoord2fNormal3fVertex3fv", funcPtr, params__);
		}
void ReplacementCodeuiTexCoord2fVertex3f(GL gl_, ParameterTypeTuple!(fp_glReplacementCodeuiTexCoord2fVertex3fSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glReplacementCodeuiTexCoord2fVertex3fSUN)(gl.extFuncs[extensionId__][22]);
			return checkedCall(gl_, "ReplacementCodeuiTexCoord2fVertex3f", funcPtr, params__);
		}
void ReplacementCodeuiTexCoord2fVertex3fv(GL gl_, ParameterTypeTuple!(fp_glReplacementCodeuiTexCoord2fVertex3fvSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glReplacementCodeuiTexCoord2fVertex3fvSUN)(gl.extFuncs[extensionId__][23]);
			return checkedCall(gl_, "ReplacementCodeuiTexCoord2fVertex3fv", funcPtr, params__);
		}
void ReplacementCodeuiVertex3f(GL gl_, ParameterTypeTuple!(fp_glReplacementCodeuiVertex3fSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glReplacementCodeuiVertex3fSUN)(gl.extFuncs[extensionId__][24]);
			return checkedCall(gl_, "ReplacementCodeuiVertex3f", funcPtr, params__);
		}
void ReplacementCodeuiVertex3fv(GL gl_, ParameterTypeTuple!(fp_glReplacementCodeuiVertex3fvSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glReplacementCodeuiVertex3fvSUN)(gl.extFuncs[extensionId__][25]);
			return checkedCall(gl_, "ReplacementCodeuiVertex3fv", funcPtr, params__);
		}
void TexCoord2fColor3fVertex3f(GL gl_, ParameterTypeTuple!(fp_glTexCoord2fColor3fVertex3fSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTexCoord2fColor3fVertex3fSUN)(gl.extFuncs[extensionId__][26]);
			return checkedCall(gl_, "TexCoord2fColor3fVertex3f", funcPtr, params__);
		}
void TexCoord2fColor3fVertex3fv(GL gl_, ParameterTypeTuple!(fp_glTexCoord2fColor3fVertex3fvSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTexCoord2fColor3fVertex3fvSUN)(gl.extFuncs[extensionId__][27]);
			return checkedCall(gl_, "TexCoord2fColor3fVertex3fv", funcPtr, params__);
		}
void TexCoord2fColor4fNormal3fVertex3f(GL gl_, ParameterTypeTuple!(fp_glTexCoord2fColor4fNormal3fVertex3fSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTexCoord2fColor4fNormal3fVertex3fSUN)(gl.extFuncs[extensionId__][28]);
			return checkedCall(gl_, "TexCoord2fColor4fNormal3fVertex3f", funcPtr, params__);
		}
void TexCoord2fColor4fNormal3fVertex3fv(GL gl_, ParameterTypeTuple!(fp_glTexCoord2fColor4fNormal3fVertex3fvSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTexCoord2fColor4fNormal3fVertex3fvSUN)(gl.extFuncs[extensionId__][29]);
			return checkedCall(gl_, "TexCoord2fColor4fNormal3fVertex3fv", funcPtr, params__);
		}
void TexCoord2fColor4ubVertex3f(GL gl_, ParameterTypeTuple!(fp_glTexCoord2fColor4ubVertex3fSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTexCoord2fColor4ubVertex3fSUN)(gl.extFuncs[extensionId__][30]);
			return checkedCall(gl_, "TexCoord2fColor4ubVertex3f", funcPtr, params__);
		}
void TexCoord2fColor4ubVertex3fv(GL gl_, ParameterTypeTuple!(fp_glTexCoord2fColor4ubVertex3fvSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTexCoord2fColor4ubVertex3fvSUN)(gl.extFuncs[extensionId__][31]);
			return checkedCall(gl_, "TexCoord2fColor4ubVertex3fv", funcPtr, params__);
		}
void TexCoord2fNormal3fVertex3f(GL gl_, ParameterTypeTuple!(fp_glTexCoord2fNormal3fVertex3fSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTexCoord2fNormal3fVertex3fSUN)(gl.extFuncs[extensionId__][32]);
			return checkedCall(gl_, "TexCoord2fNormal3fVertex3f", funcPtr, params__);
		}
void TexCoord2fNormal3fVertex3fv(GL gl_, ParameterTypeTuple!(fp_glTexCoord2fNormal3fVertex3fvSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTexCoord2fNormal3fVertex3fvSUN)(gl.extFuncs[extensionId__][33]);
			return checkedCall(gl_, "TexCoord2fNormal3fVertex3fv", funcPtr, params__);
		}
void TexCoord2fVertex3f(GL gl_, ParameterTypeTuple!(fp_glTexCoord2fVertex3fSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTexCoord2fVertex3fSUN)(gl.extFuncs[extensionId__][34]);
			return checkedCall(gl_, "TexCoord2fVertex3f", funcPtr, params__);
		}
void TexCoord2fVertex3fv(GL gl_, ParameterTypeTuple!(fp_glTexCoord2fVertex3fvSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTexCoord2fVertex3fvSUN)(gl.extFuncs[extensionId__][35]);
			return checkedCall(gl_, "TexCoord2fVertex3fv", funcPtr, params__);
		}
void TexCoord4fColor4fNormal3fVertex4f(GL gl_, ParameterTypeTuple!(fp_glTexCoord4fColor4fNormal3fVertex4fSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTexCoord4fColor4fNormal3fVertex4fSUN)(gl.extFuncs[extensionId__][36]);
			return checkedCall(gl_, "TexCoord4fColor4fNormal3fVertex4f", funcPtr, params__);
		}
void TexCoord4fColor4fNormal3fVertex4fv(GL gl_, ParameterTypeTuple!(fp_glTexCoord4fColor4fNormal3fVertex4fvSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTexCoord4fColor4fNormal3fVertex4fvSUN)(gl.extFuncs[extensionId__][37]);
			return checkedCall(gl_, "TexCoord4fColor4fNormal3fVertex4fv", funcPtr, params__);
		}
void TexCoord4fVertex4f(GL gl_, ParameterTypeTuple!(fp_glTexCoord4fVertex4fSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTexCoord4fVertex4fSUN)(gl.extFuncs[extensionId__][38]);
			return checkedCall(gl_, "TexCoord4fVertex4f", funcPtr, params__);
		}
void TexCoord4fVertex4fv(GL gl_, ParameterTypeTuple!(fp_glTexCoord4fVertex4fvSUN) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTexCoord4fVertex4fvSUN)(gl.extFuncs[extensionId__][39]);
			return checkedCall(gl_, "TexCoord4fVertex4fv", funcPtr, params__);
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
		void*[] funcAddr = new void*[40];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_SUN_vertex")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glColor3fVertex3fSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glColor3fVertex3fvSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glColor4fNormal3fVertex3fSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glColor4fNormal3fVertex3fvSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glColor4ubVertex2fSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glColor4ubVertex2fvSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glColor4ubVertex3fSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glColor4ubVertex3fvSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[8] = getExtensionFuncPtr(cast(char*)"glNormal3fVertex3fSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[9] = getExtensionFuncPtr(cast(char*)"glNormal3fVertex3fvSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[10] = getExtensionFuncPtr(cast(char*)"glReplacementCodeuiColor3fVertex3fSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[11] = getExtensionFuncPtr(cast(char*)"glReplacementCodeuiColor3fVertex3fvSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[12] = getExtensionFuncPtr(cast(char*)"glReplacementCodeuiColor4fNormal3fVertex3fSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[13] = getExtensionFuncPtr(cast(char*)"glReplacementCodeuiColor4fNormal3fVertex3fvSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[14] = getExtensionFuncPtr(cast(char*)"glReplacementCodeuiColor4ubVertex3fSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[15] = getExtensionFuncPtr(cast(char*)"glReplacementCodeuiColor4ubVertex3fvSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[16] = getExtensionFuncPtr(cast(char*)"glReplacementCodeuiNormal3fVertex3fSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[17] = getExtensionFuncPtr(cast(char*)"glReplacementCodeuiNormal3fVertex3fvSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[18] = getExtensionFuncPtr(cast(char*)"glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[19] = getExtensionFuncPtr(cast(char*)"glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fvSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[20] = getExtensionFuncPtr(cast(char*)"glReplacementCodeuiTexCoord2fNormal3fVertex3fSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[21] = getExtensionFuncPtr(cast(char*)"glReplacementCodeuiTexCoord2fNormal3fVertex3fvSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[22] = getExtensionFuncPtr(cast(char*)"glReplacementCodeuiTexCoord2fVertex3fSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[23] = getExtensionFuncPtr(cast(char*)"glReplacementCodeuiTexCoord2fVertex3fvSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[24] = getExtensionFuncPtr(cast(char*)"glReplacementCodeuiVertex3fSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[25] = getExtensionFuncPtr(cast(char*)"glReplacementCodeuiVertex3fvSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[26] = getExtensionFuncPtr(cast(char*)"glTexCoord2fColor3fVertex3fSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[27] = getExtensionFuncPtr(cast(char*)"glTexCoord2fColor3fVertex3fvSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[28] = getExtensionFuncPtr(cast(char*)"glTexCoord2fColor4fNormal3fVertex3fSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[29] = getExtensionFuncPtr(cast(char*)"glTexCoord2fColor4fNormal3fVertex3fvSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[30] = getExtensionFuncPtr(cast(char*)"glTexCoord2fColor4ubVertex3fSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[31] = getExtensionFuncPtr(cast(char*)"glTexCoord2fColor4ubVertex3fvSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[32] = getExtensionFuncPtr(cast(char*)"glTexCoord2fNormal3fVertex3fSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[33] = getExtensionFuncPtr(cast(char*)"glTexCoord2fNormal3fVertex3fvSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[34] = getExtensionFuncPtr(cast(char*)"glTexCoord2fVertex3fSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[35] = getExtensionFuncPtr(cast(char*)"glTexCoord2fVertex3fvSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[36] = getExtensionFuncPtr(cast(char*)"glTexCoord4fColor4fNormal3fVertex4fSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[37] = getExtensionFuncPtr(cast(char*)"glTexCoord4fColor4fNormal3fVertex4fvSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[38] = getExtensionFuncPtr(cast(char*)"glTexCoord4fVertex4fSUN"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[39] = getExtensionFuncPtr(cast(char*)"glTexCoord4fVertex4fvSUN"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
