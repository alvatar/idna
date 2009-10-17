module dgl.ext.GLX_ARB_create_context;
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



private ushort extensionId__ = 136;
alias extensionId__ GLX_ARB_create_context;

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
			const GLenum GLX_CONTEXT_DEBUG_BIT_ARB = 0x0001;
			const GLenum GLX_CONTEXT_FORWARD_COMPATIBLE_BIT_ARB = 0x0002;
			const GLenum GLX_CONTEXT_MAJOR_VERSION_ARB = 0x2091;
			const GLenum GLX_CONTEXT_MINOR_VERSION_ARB = 0x2092;
			const GLenum GLX_CONTEXT_FLAGS_ARB = 0x2094;
	}
	private {
		extern (System) {
			alias GLXContext function (Display* dpy, GLXFBConfig config, GLXContext share_context, Bool direct,  int *attrib_list)	fp_glXCreateContextAttribsARB;
		}
	}
	public {
GLXContext XCreateContextAttribs(GL gl_, ParameterTypeTuple!(fp_glXCreateContextAttribsARB) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_glXCreateContextAttribsARB)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "XCreateContextAttribs", funcPtr, params__);
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
		void*[] funcAddr = new void*[1];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GLX_ARB_create_context")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"glXCreateContextAttribsARB"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
