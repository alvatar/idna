module dgl.ext.NV_half_float;
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



private ushort extensionId__ = 126;
alias extensionId__ NV_half_float;

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
			const GLenum GL_HALF_FLOAT_NV = 0x140B;
			alias ushort GLhalf;
	}
	private {
		extern (System) {
			alias void function (GLhalf red, GLhalf green, GLhalf blue)	fp_glColor3hNV;
			alias void function ( GLhalf* v)	fp_glColor3hvNV;
			alias void function (GLhalf red, GLhalf green, GLhalf blue, GLhalf alpha)	fp_glColor4hNV;
			alias void function ( GLhalf* v)	fp_glColor4hvNV;
			alias void function (GLhalf fog)	fp_glFogCoordhNV;
			alias void function ( GLhalf* fog)	fp_glFogCoordhvNV;
			alias void function (GLenum target, GLhalf s)	fp_glMultiTexCoord1hNV;
			alias void function (GLenum target,  GLhalf* v)	fp_glMultiTexCoord1hvNV;
			alias void function (GLenum target, GLhalf s, GLhalf t)	fp_glMultiTexCoord2hNV;
			alias void function (GLenum target,  GLhalf* v)	fp_glMultiTexCoord2hvNV;
			alias void function (GLenum target, GLhalf s, GLhalf t, GLhalf r)	fp_glMultiTexCoord3hNV;
			alias void function (GLenum target,  GLhalf* v)	fp_glMultiTexCoord3hvNV;
			alias void function (GLenum target, GLhalf s, GLhalf t, GLhalf r, GLhalf q)	fp_glMultiTexCoord4hNV;
			alias void function (GLenum target,  GLhalf* v)	fp_glMultiTexCoord4hvNV;
			alias void function (GLhalf nx, GLhalf ny, GLhalf nz)	fp_glNormal3hNV;
			alias void function ( GLhalf* v)	fp_glNormal3hvNV;
			alias void function (GLhalf red, GLhalf green, GLhalf blue)	fp_glSecondaryColor3hNV;
			alias void function ( GLhalf* v)	fp_glSecondaryColor3hvNV;
			alias void function (GLhalf s)	fp_glTexCoord1hNV;
			alias void function ( GLhalf* v)	fp_glTexCoord1hvNV;
			alias void function (GLhalf s, GLhalf t)	fp_glTexCoord2hNV;
			alias void function ( GLhalf* v)	fp_glTexCoord2hvNV;
			alias void function (GLhalf s, GLhalf t, GLhalf r)	fp_glTexCoord3hNV;
			alias void function ( GLhalf* v)	fp_glTexCoord3hvNV;
			alias void function (GLhalf s, GLhalf t, GLhalf r, GLhalf q)	fp_glTexCoord4hNV;
			alias void function ( GLhalf* v)	fp_glTexCoord4hvNV;
			alias void function (GLhalf x, GLhalf y)	fp_glVertex2hNV;
			alias void function ( GLhalf* v)	fp_glVertex2hvNV;
			alias void function (GLhalf x, GLhalf y, GLhalf z)	fp_glVertex3hNV;
			alias void function ( GLhalf* v)	fp_glVertex3hvNV;
			alias void function (GLhalf x, GLhalf y, GLhalf z, GLhalf w)	fp_glVertex4hNV;
			alias void function ( GLhalf* v)	fp_glVertex4hvNV;
			alias void function (GLuint index, GLhalf x)	fp_glVertexAttrib1hNV;
			alias void function (GLuint index,  GLhalf* v)	fp_glVertexAttrib1hvNV;
			alias void function (GLuint index, GLhalf x, GLhalf y)	fp_glVertexAttrib2hNV;
			alias void function (GLuint index,  GLhalf* v)	fp_glVertexAttrib2hvNV;
			alias void function (GLuint index, GLhalf x, GLhalf y, GLhalf z)	fp_glVertexAttrib3hNV;
			alias void function (GLuint index,  GLhalf* v)	fp_glVertexAttrib3hvNV;
			alias void function (GLuint index, GLhalf x, GLhalf y, GLhalf z, GLhalf w)	fp_glVertexAttrib4hNV;
			alias void function (GLuint index,  GLhalf* v)	fp_glVertexAttrib4hvNV;
			alias void function (GLuint index, GLsizei n,  GLhalf* v)	fp_glVertexAttribs1hvNV;
			alias void function (GLuint index, GLsizei n,  GLhalf* v)	fp_glVertexAttribs2hvNV;
			alias void function (GLuint index, GLsizei n,  GLhalf* v)	fp_glVertexAttribs3hvNV;
			alias void function (GLuint index, GLsizei n,  GLhalf* v)	fp_glVertexAttribs4hvNV;
			alias void function (GLhalf weight)	fp_glVertexWeighthNV;
			alias void function ( GLhalf* weight)	fp_glVertexWeighthvNV;
		}
	}
	public {
void Color3h(GL gl_, ParameterTypeTuple!(fp_glColor3hNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glColor3hNV)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "Color3h", funcPtr, params__);
		}
void Color3hv(GL gl_, ParameterTypeTuple!(fp_glColor3hvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glColor3hvNV)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "Color3hv", funcPtr, params__);
		}
void Color4h(GL gl_, ParameterTypeTuple!(fp_glColor4hNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glColor4hNV)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "Color4h", funcPtr, params__);
		}
void Color4hv(GL gl_, ParameterTypeTuple!(fp_glColor4hvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glColor4hvNV)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "Color4hv", funcPtr, params__);
		}
void FogCoordh(GL gl_, ParameterTypeTuple!(fp_glFogCoordhNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFogCoordhNV)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "FogCoordh", funcPtr, params__);
		}
void FogCoordhv(GL gl_, ParameterTypeTuple!(fp_glFogCoordhvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFogCoordhvNV)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "FogCoordhv", funcPtr, params__);
		}
void MultiTexCoord1h(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord1hNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord1hNV)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "MultiTexCoord1h", funcPtr, params__);
		}
void MultiTexCoord1hv(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord1hvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord1hvNV)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "MultiTexCoord1hv", funcPtr, params__);
		}
void MultiTexCoord2h(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord2hNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord2hNV)(gl.extFuncs[extensionId__][8]);
			return checkedCall(gl_, "MultiTexCoord2h", funcPtr, params__);
		}
void MultiTexCoord2hv(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord2hvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord2hvNV)(gl.extFuncs[extensionId__][9]);
			return checkedCall(gl_, "MultiTexCoord2hv", funcPtr, params__);
		}
void MultiTexCoord3h(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord3hNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord3hNV)(gl.extFuncs[extensionId__][10]);
			return checkedCall(gl_, "MultiTexCoord3h", funcPtr, params__);
		}
void MultiTexCoord3hv(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord3hvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord3hvNV)(gl.extFuncs[extensionId__][11]);
			return checkedCall(gl_, "MultiTexCoord3hv", funcPtr, params__);
		}
void MultiTexCoord4h(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord4hNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord4hNV)(gl.extFuncs[extensionId__][12]);
			return checkedCall(gl_, "MultiTexCoord4h", funcPtr, params__);
		}
void MultiTexCoord4hv(GL gl_, ParameterTypeTuple!(fp_glMultiTexCoord4hvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glMultiTexCoord4hvNV)(gl.extFuncs[extensionId__][13]);
			return checkedCall(gl_, "MultiTexCoord4hv", funcPtr, params__);
		}
void Normal3h(GL gl_, ParameterTypeTuple!(fp_glNormal3hNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNormal3hNV)(gl.extFuncs[extensionId__][14]);
			return checkedCall(gl_, "Normal3h", funcPtr, params__);
		}
void Normal3hv(GL gl_, ParameterTypeTuple!(fp_glNormal3hvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glNormal3hvNV)(gl.extFuncs[extensionId__][15]);
			return checkedCall(gl_, "Normal3hv", funcPtr, params__);
		}
void SecondaryColor3h(GL gl_, ParameterTypeTuple!(fp_glSecondaryColor3hNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSecondaryColor3hNV)(gl.extFuncs[extensionId__][16]);
			return checkedCall(gl_, "SecondaryColor3h", funcPtr, params__);
		}
void SecondaryColor3hv(GL gl_, ParameterTypeTuple!(fp_glSecondaryColor3hvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glSecondaryColor3hvNV)(gl.extFuncs[extensionId__][17]);
			return checkedCall(gl_, "SecondaryColor3hv", funcPtr, params__);
		}
void TexCoord1h(GL gl_, ParameterTypeTuple!(fp_glTexCoord1hNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTexCoord1hNV)(gl.extFuncs[extensionId__][18]);
			return checkedCall(gl_, "TexCoord1h", funcPtr, params__);
		}
void TexCoord1hv(GL gl_, ParameterTypeTuple!(fp_glTexCoord1hvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTexCoord1hvNV)(gl.extFuncs[extensionId__][19]);
			return checkedCall(gl_, "TexCoord1hv", funcPtr, params__);
		}
void TexCoord2h(GL gl_, ParameterTypeTuple!(fp_glTexCoord2hNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTexCoord2hNV)(gl.extFuncs[extensionId__][20]);
			return checkedCall(gl_, "TexCoord2h", funcPtr, params__);
		}
void TexCoord2hv(GL gl_, ParameterTypeTuple!(fp_glTexCoord2hvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTexCoord2hvNV)(gl.extFuncs[extensionId__][21]);
			return checkedCall(gl_, "TexCoord2hv", funcPtr, params__);
		}
void TexCoord3h(GL gl_, ParameterTypeTuple!(fp_glTexCoord3hNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTexCoord3hNV)(gl.extFuncs[extensionId__][22]);
			return checkedCall(gl_, "TexCoord3h", funcPtr, params__);
		}
void TexCoord3hv(GL gl_, ParameterTypeTuple!(fp_glTexCoord3hvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTexCoord3hvNV)(gl.extFuncs[extensionId__][23]);
			return checkedCall(gl_, "TexCoord3hv", funcPtr, params__);
		}
void TexCoord4h(GL gl_, ParameterTypeTuple!(fp_glTexCoord4hNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTexCoord4hNV)(gl.extFuncs[extensionId__][24]);
			return checkedCall(gl_, "TexCoord4h", funcPtr, params__);
		}
void TexCoord4hv(GL gl_, ParameterTypeTuple!(fp_glTexCoord4hvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glTexCoord4hvNV)(gl.extFuncs[extensionId__][25]);
			return checkedCall(gl_, "TexCoord4hv", funcPtr, params__);
		}
void Vertex2h(GL gl_, ParameterTypeTuple!(fp_glVertex2hNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertex2hNV)(gl.extFuncs[extensionId__][26]);
			return checkedCall(gl_, "Vertex2h", funcPtr, params__);
		}
void Vertex2hv(GL gl_, ParameterTypeTuple!(fp_glVertex2hvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertex2hvNV)(gl.extFuncs[extensionId__][27]);
			return checkedCall(gl_, "Vertex2hv", funcPtr, params__);
		}
void Vertex3h(GL gl_, ParameterTypeTuple!(fp_glVertex3hNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertex3hNV)(gl.extFuncs[extensionId__][28]);
			return checkedCall(gl_, "Vertex3h", funcPtr, params__);
		}
void Vertex3hv(GL gl_, ParameterTypeTuple!(fp_glVertex3hvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertex3hvNV)(gl.extFuncs[extensionId__][29]);
			return checkedCall(gl_, "Vertex3hv", funcPtr, params__);
		}
void Vertex4h(GL gl_, ParameterTypeTuple!(fp_glVertex4hNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertex4hNV)(gl.extFuncs[extensionId__][30]);
			return checkedCall(gl_, "Vertex4h", funcPtr, params__);
		}
void Vertex4hv(GL gl_, ParameterTypeTuple!(fp_glVertex4hvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertex4hvNV)(gl.extFuncs[extensionId__][31]);
			return checkedCall(gl_, "Vertex4hv", funcPtr, params__);
		}
void VertexAttrib1h(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib1hNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib1hNV)(gl.extFuncs[extensionId__][32]);
			return checkedCall(gl_, "VertexAttrib1h", funcPtr, params__);
		}
void VertexAttrib1hv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib1hvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib1hvNV)(gl.extFuncs[extensionId__][33]);
			return checkedCall(gl_, "VertexAttrib1hv", funcPtr, params__);
		}
void VertexAttrib2h(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib2hNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib2hNV)(gl.extFuncs[extensionId__][34]);
			return checkedCall(gl_, "VertexAttrib2h", funcPtr, params__);
		}
void VertexAttrib2hv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib2hvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib2hvNV)(gl.extFuncs[extensionId__][35]);
			return checkedCall(gl_, "VertexAttrib2hv", funcPtr, params__);
		}
void VertexAttrib3h(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib3hNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib3hNV)(gl.extFuncs[extensionId__][36]);
			return checkedCall(gl_, "VertexAttrib3h", funcPtr, params__);
		}
void VertexAttrib3hv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib3hvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib3hvNV)(gl.extFuncs[extensionId__][37]);
			return checkedCall(gl_, "VertexAttrib3hv", funcPtr, params__);
		}
void VertexAttrib4h(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4hNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4hNV)(gl.extFuncs[extensionId__][38]);
			return checkedCall(gl_, "VertexAttrib4h", funcPtr, params__);
		}
void VertexAttrib4hv(GL gl_, ParameterTypeTuple!(fp_glVertexAttrib4hvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttrib4hvNV)(gl.extFuncs[extensionId__][39]);
			return checkedCall(gl_, "VertexAttrib4hv", funcPtr, params__);
		}
void VertexAttribs1hv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribs1hvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribs1hvNV)(gl.extFuncs[extensionId__][40]);
			return checkedCall(gl_, "VertexAttribs1hv", funcPtr, params__);
		}
void VertexAttribs2hv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribs2hvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribs2hvNV)(gl.extFuncs[extensionId__][41]);
			return checkedCall(gl_, "VertexAttribs2hv", funcPtr, params__);
		}
void VertexAttribs3hv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribs3hvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribs3hvNV)(gl.extFuncs[extensionId__][42]);
			return checkedCall(gl_, "VertexAttribs3hv", funcPtr, params__);
		}
void VertexAttribs4hv(GL gl_, ParameterTypeTuple!(fp_glVertexAttribs4hvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexAttribs4hvNV)(gl.extFuncs[extensionId__][43]);
			return checkedCall(gl_, "VertexAttribs4hv", funcPtr, params__);
		}
void VertexWeighth(GL gl_, ParameterTypeTuple!(fp_glVertexWeighthNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexWeighthNV)(gl.extFuncs[extensionId__][44]);
			return checkedCall(gl_, "VertexWeighth", funcPtr, params__);
		}
void VertexWeighthv(GL gl_, ParameterTypeTuple!(fp_glVertexWeighthvNV) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glVertexWeighthvNV)(gl.extFuncs[extensionId__][45]);
			return checkedCall(gl_, "VertexWeighthv", funcPtr, params__);
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
		void*[] funcAddr = new void*[46];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_NV_half_float")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glColor3hNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glColor3hvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glColor4hNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glColor4hvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glFogCoordhNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glFogCoordhvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord1hNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord1hvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[8] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord2hNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[9] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord2hvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[10] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord3hNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[11] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord3hvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[12] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord4hNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[13] = getExtensionFuncPtr(cast(char*)"glMultiTexCoord4hvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[14] = getExtensionFuncPtr(cast(char*)"glNormal3hNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[15] = getExtensionFuncPtr(cast(char*)"glNormal3hvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[16] = getExtensionFuncPtr(cast(char*)"glSecondaryColor3hNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[17] = getExtensionFuncPtr(cast(char*)"glSecondaryColor3hvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[18] = getExtensionFuncPtr(cast(char*)"glTexCoord1hNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[19] = getExtensionFuncPtr(cast(char*)"glTexCoord1hvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[20] = getExtensionFuncPtr(cast(char*)"glTexCoord2hNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[21] = getExtensionFuncPtr(cast(char*)"glTexCoord2hvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[22] = getExtensionFuncPtr(cast(char*)"glTexCoord3hNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[23] = getExtensionFuncPtr(cast(char*)"glTexCoord3hvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[24] = getExtensionFuncPtr(cast(char*)"glTexCoord4hNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[25] = getExtensionFuncPtr(cast(char*)"glTexCoord4hvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[26] = getExtensionFuncPtr(cast(char*)"glVertex2hNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[27] = getExtensionFuncPtr(cast(char*)"glVertex2hvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[28] = getExtensionFuncPtr(cast(char*)"glVertex3hNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[29] = getExtensionFuncPtr(cast(char*)"glVertex3hvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[30] = getExtensionFuncPtr(cast(char*)"glVertex4hNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[31] = getExtensionFuncPtr(cast(char*)"glVertex4hvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[32] = getExtensionFuncPtr(cast(char*)"glVertexAttrib1hNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[33] = getExtensionFuncPtr(cast(char*)"glVertexAttrib1hvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[34] = getExtensionFuncPtr(cast(char*)"glVertexAttrib2hNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[35] = getExtensionFuncPtr(cast(char*)"glVertexAttrib2hvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[36] = getExtensionFuncPtr(cast(char*)"glVertexAttrib3hNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[37] = getExtensionFuncPtr(cast(char*)"glVertexAttrib3hvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[38] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4hNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[39] = getExtensionFuncPtr(cast(char*)"glVertexAttrib4hvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[40] = getExtensionFuncPtr(cast(char*)"glVertexAttribs1hvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[41] = getExtensionFuncPtr(cast(char*)"glVertexAttribs2hvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[42] = getExtensionFuncPtr(cast(char*)"glVertexAttribs3hvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[43] = getExtensionFuncPtr(cast(char*)"glVertexAttribs4hvNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[44] = getExtensionFuncPtr(cast(char*)"glVertexWeighthNV"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[45] = getExtensionFuncPtr(cast(char*)"glVertexWeighthvNV"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
