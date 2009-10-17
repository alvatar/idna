module dgl.ext.GLX_EXT_import_context;
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



private ushort extensionId__ = 345;
alias extensionId__ GLX_EXT_import_context;

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

version (Posix) {
	public {
			const GLenum GLX_SHARE_CONTEXT_EXT = 0x800A;
			const GLenum GLX_VISUAL_ID_EXT = 0x800B;
			const GLenum GLX_SCREEN_EXT = 0x800C;
			alias XID GLXContextID;
	}
	private {
		extern (System) {
			alias void function (Display* dpy, GLXContext context)	fp_glXFreeContextEXT;
			alias GLXContextID function ( GLXContext context)	fp_glXGetContextIDEXT;
			alias GLXContext function (Display* dpy, GLXContextID contextID)	fp_glXImportContextEXT;
			alias int function (Display* dpy, GLXContext context, int attribute,int *value)	fp_glXQueryContextInfoEXT;
		}
	}
	public {
void XFreeContext(GL gl_, ParameterTypeTuple!(fp_glXFreeContextEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXFreeContextEXT)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "XFreeContext", funcPtr, params__);
		}
GLXContextID XGetContextID(GL gl_, ParameterTypeTuple!(fp_glXGetContextIDEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXGetContextIDEXT)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "XGetContextID", funcPtr, params__);
		}
GLXContext XImportContext(GL gl_, ParameterTypeTuple!(fp_glXImportContextEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXImportContextEXT)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "XImportContext", funcPtr, params__);
		}
int XQueryContextInfo(GL gl_, ParameterTypeTuple!(fp_glXQueryContextInfoEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXQueryContextInfoEXT)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "XQueryContextInfo", funcPtr, params__);
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
		void*[] funcAddr = new void*[4];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GLX_EXT_import_context")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glXFreeContextEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"glXGetContextIDEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"glXImportContextEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"glXQueryContextInfoEXT"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
