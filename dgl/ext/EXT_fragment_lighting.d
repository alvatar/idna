module dgl.ext.EXT_fragment_lighting;
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



private ushort extensionId__ = 148;
alias extensionId__ EXT_fragment_lighting;

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
			const GLenum GL_FRAGMENT_LIGHTING_EXT = 0x8400;
			const GLenum GL_FRAGMENT_COLOR_MATERIAL_EXT = 0x8401;
			const GLenum GL_FRAGMENT_COLOR_MATERIAL_FACE_EXT = 0x8402;
			const GLenum GL_FRAGMENT_COLOR_MATERIAL_PARAMETER_EXT = 0x8403;
			const GLenum GL_MAX_FRAGMENT_LIGHTS_EXT = 0x8404;
			const GLenum GL_MAX_ACTIVE_LIGHTS_EXT = 0x8405;
			const GLenum GL_CURRENT_RASTER_NORMAL_EXT = 0x8406;
			const GLenum GL_LIGHT_ENV_MODE_EXT = 0x8407;
			const GLenum GL_FRAGMENT_LIGHT_MODEL_LOCAL_VIEWER_EXT = 0x8408;
			const GLenum GL_FRAGMENT_LIGHT_MODEL_TWO_SIDE_EXT = 0x8409;
			const GLenum GL_FRAGMENT_LIGHT_MODEL_AMBIENT_EXT = 0x840A;
			const GLenum GL_FRAGMENT_LIGHT_MODEL_NORMAL_INTERPOLATION_EXT = 0x840B;
			const GLenum GL_FRAGMENT_LIGHT0_EXT = 0x840C;
			const GLenum GL_FRAGMENT_LIGHT7_EXT = 0x8413;
	}
	private {
		extern (System) {
			alias void function (GLenum face, GLenum mode)	fp_glFragmentColorMaterialEXT;
			alias void function (GLenum pname, GLfloat param)	fp_glFragmentLightModelfEXT;
			alias void function (GLenum pname, GLfloat* params)	fp_glFragmentLightModelfvEXT;
			alias void function (GLenum pname, GLint param)	fp_glFragmentLightModeliEXT;
			alias void function (GLenum pname, GLint* params)	fp_glFragmentLightModelivEXT;
			alias void function (GLenum light, GLenum pname, GLfloat param)	fp_glFragmentLightfEXT;
			alias void function (GLenum light, GLenum pname, GLfloat* params)	fp_glFragmentLightfvEXT;
			alias void function (GLenum light, GLenum pname, GLint param)	fp_glFragmentLightiEXT;
			alias void function (GLenum light, GLenum pname, GLint* params)	fp_glFragmentLightivEXT;
			alias void function (GLenum face, GLenum pname,  GLfloat param)	fp_glFragmentMaterialfEXT;
			alias void function (GLenum face, GLenum pname,  GLfloat* params)	fp_glFragmentMaterialfvEXT;
			alias void function (GLenum face, GLenum pname,  GLint param)	fp_glFragmentMaterialiEXT;
			alias void function (GLenum face, GLenum pname,  GLint* params)	fp_glFragmentMaterialivEXT;
			alias void function (GLenum light, GLenum pname, GLfloat* params)	fp_glGetFragmentLightfvEXT;
			alias void function (GLenum light, GLenum pname, GLint* params)	fp_glGetFragmentLightivEXT;
			alias void function (GLenum face, GLenum pname,  GLfloat* params)	fp_glGetFragmentMaterialfvEXT;
			alias void function (GLenum face, GLenum pname,  GLint* params)	fp_glGetFragmentMaterialivEXT;
			alias void function (GLenum pname, GLint param)	fp_glLightEnviEXT;
		}
	}
	public {
void FragmentColorMaterial(GL gl_, ParameterTypeTuple!(fp_glFragmentColorMaterialEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFragmentColorMaterialEXT)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "FragmentColorMaterial", funcPtr, params__);
		}
void FragmentLightModelf(GL gl_, ParameterTypeTuple!(fp_glFragmentLightModelfEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFragmentLightModelfEXT)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "FragmentLightModelf", funcPtr, params__);
		}
void FragmentLightModelfv(GL gl_, ParameterTypeTuple!(fp_glFragmentLightModelfvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFragmentLightModelfvEXT)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "FragmentLightModelfv", funcPtr, params__);
		}
void FragmentLightModeli(GL gl_, ParameterTypeTuple!(fp_glFragmentLightModeliEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFragmentLightModeliEXT)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "FragmentLightModeli", funcPtr, params__);
		}
void FragmentLightModeliv(GL gl_, ParameterTypeTuple!(fp_glFragmentLightModelivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFragmentLightModelivEXT)(gl.extFuncs[extensionId__][4]);
			return checkedCall(gl_, "FragmentLightModeliv", funcPtr, params__);
		}
void FragmentLightf(GL gl_, ParameterTypeTuple!(fp_glFragmentLightfEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFragmentLightfEXT)(gl.extFuncs[extensionId__][5]);
			return checkedCall(gl_, "FragmentLightf", funcPtr, params__);
		}
void FragmentLightfv(GL gl_, ParameterTypeTuple!(fp_glFragmentLightfvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFragmentLightfvEXT)(gl.extFuncs[extensionId__][6]);
			return checkedCall(gl_, "FragmentLightfv", funcPtr, params__);
		}
void FragmentLighti(GL gl_, ParameterTypeTuple!(fp_glFragmentLightiEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFragmentLightiEXT)(gl.extFuncs[extensionId__][7]);
			return checkedCall(gl_, "FragmentLighti", funcPtr, params__);
		}
void FragmentLightiv(GL gl_, ParameterTypeTuple!(fp_glFragmentLightivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFragmentLightivEXT)(gl.extFuncs[extensionId__][8]);
			return checkedCall(gl_, "FragmentLightiv", funcPtr, params__);
		}
void FragmentMaterialf(GL gl_, ParameterTypeTuple!(fp_glFragmentMaterialfEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFragmentMaterialfEXT)(gl.extFuncs[extensionId__][9]);
			return checkedCall(gl_, "FragmentMaterialf", funcPtr, params__);
		}
void FragmentMaterialfv(GL gl_, ParameterTypeTuple!(fp_glFragmentMaterialfvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFragmentMaterialfvEXT)(gl.extFuncs[extensionId__][10]);
			return checkedCall(gl_, "FragmentMaterialfv", funcPtr, params__);
		}
void FragmentMateriali(GL gl_, ParameterTypeTuple!(fp_glFragmentMaterialiEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFragmentMaterialiEXT)(gl.extFuncs[extensionId__][11]);
			return checkedCall(gl_, "FragmentMateriali", funcPtr, params__);
		}
void FragmentMaterialiv(GL gl_, ParameterTypeTuple!(fp_glFragmentMaterialivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glFragmentMaterialivEXT)(gl.extFuncs[extensionId__][12]);
			return checkedCall(gl_, "FragmentMaterialiv", funcPtr, params__);
		}
void GetFragmentLightfv(GL gl_, ParameterTypeTuple!(fp_glGetFragmentLightfvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetFragmentLightfvEXT)(gl.extFuncs[extensionId__][13]);
			return checkedCall(gl_, "GetFragmentLightfv", funcPtr, params__);
		}
void GetFragmentLightiv(GL gl_, ParameterTypeTuple!(fp_glGetFragmentLightivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetFragmentLightivEXT)(gl.extFuncs[extensionId__][14]);
			return checkedCall(gl_, "GetFragmentLightiv", funcPtr, params__);
		}
void GetFragmentMaterialfv(GL gl_, ParameterTypeTuple!(fp_glGetFragmentMaterialfvEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetFragmentMaterialfvEXT)(gl.extFuncs[extensionId__][15]);
			return checkedCall(gl_, "GetFragmentMaterialfv", funcPtr, params__);
		}
void GetFragmentMaterialiv(GL gl_, ParameterTypeTuple!(fp_glGetFragmentMaterialivEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glGetFragmentMaterialivEXT)(gl.extFuncs[extensionId__][16]);
			return checkedCall(gl_, "GetFragmentMaterialiv", funcPtr, params__);
		}
void LightEnvi(GL gl_, ParameterTypeTuple!(fp_glLightEnviEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glLightEnviEXT)(gl.extFuncs[extensionId__][17]);
			return checkedCall(gl_, "LightEnvi", funcPtr, params__);
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
		void*[] funcAddr = new void*[18];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_EXT_fragment_lighting")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glFragmentColorMaterialEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glFragmentLightModelfEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glFragmentLightModelfvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glFragmentLightModeliEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[4] = getExtensionFuncPtr(cast(char*)"glFragmentLightModelivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[5] = getExtensionFuncPtr(cast(char*)"glFragmentLightfEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[6] = getExtensionFuncPtr(cast(char*)"glFragmentLightfvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[7] = getExtensionFuncPtr(cast(char*)"glFragmentLightiEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[8] = getExtensionFuncPtr(cast(char*)"glFragmentLightivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[9] = getExtensionFuncPtr(cast(char*)"glFragmentMaterialfEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[10] = getExtensionFuncPtr(cast(char*)"glFragmentMaterialfvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[11] = getExtensionFuncPtr(cast(char*)"glFragmentMaterialiEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[12] = getExtensionFuncPtr(cast(char*)"glFragmentMaterialivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[13] = getExtensionFuncPtr(cast(char*)"glGetFragmentLightfvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[14] = getExtensionFuncPtr(cast(char*)"glGetFragmentLightivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[15] = getExtensionFuncPtr(cast(char*)"glGetFragmentMaterialfvEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[16] = getExtensionFuncPtr(cast(char*)"glGetFragmentMaterialivEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[17] = getExtensionFuncPtr(cast(char*)"glLightEnviEXT"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
