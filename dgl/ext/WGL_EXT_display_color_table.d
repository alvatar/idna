module dgl.ext.WGL_EXT_display_color_table;
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



private ushort extensionId__ = 280;
alias extensionId__ WGL_EXT_display_color_table;

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

version (Windows) {
	public {
	}
	private {
		extern (System) {
			alias GLboolean function (GLushort id)	fp_wglBindDisplayColorTableEXT;
			alias GLboolean function (GLushort id)	fp_wglCreateDisplayColorTableEXT;
			alias void function (GLushort id)	fp_wglDestroyDisplayColorTableEXT;
			alias GLboolean function (GLushort* table, GLuint length)	fp_wglLoadDisplayColorTableEXT;
		}
	}
	public {
GLboolean wglBindDisplayColorTable(GL gl_, ParameterTypeTuple!(fp_wglBindDisplayColorTableEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglBindDisplayColorTableEXT)(gl.extFuncs[extensionId__][0]);
			return checkedCall(gl_, "wglBindDisplayColorTable", funcPtr, params__);
		}
GLboolean wglCreateDisplayColorTable(GL gl_, ParameterTypeTuple!(fp_wglCreateDisplayColorTableEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglCreateDisplayColorTableEXT)(gl.extFuncs[extensionId__][1]);
			return checkedCall(gl_, "wglCreateDisplayColorTable", funcPtr, params__);
		}
void wglDestroyDisplayColorTable(GL gl_, ParameterTypeTuple!(fp_wglDestroyDisplayColorTableEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglDestroyDisplayColorTableEXT)(gl.extFuncs[extensionId__][2]);
			return checkedCall(gl_, "wglDestroyDisplayColorTable", funcPtr, params__);
		}
GLboolean wglLoadDisplayColorTable(GL gl_, ParameterTypeTuple!(fp_wglLoadDisplayColorTableEXT) params__) {
			auto gl = _getGL(gl_);
			version (DogExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);
			auto funcPtr = cast(fp_wglLoadDisplayColorTableEXT)(gl.extFuncs[extensionId__][3]);
			return checkedCall(gl_, "wglLoadDisplayColorTable", funcPtr, params__);
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
import dgl.ext.WGL_EXT_extensions_string : wglGetExtensionsString, WGL_EXT_extensions_string;
	private void*[] loadFunctions__(GL gl) {
		void*[] funcAddr = new void*[4];
		{
			string extStr;
			gl.ext(WGL_EXT_extensions_string) in {
				char* extP = wglGetExtensionsString(gl);
				version( D_Version2 ) {
					if (extP !is null) extStr = to!(string)(extP);
				} else {
					if (extP !is null) extStr = fromStringz(extP);
				}
			};
			if (!extStr.containsPattern("WGL_EXT_display_color_table")) { funcAddr[0] = null; return funcAddr; }
		}
		if (null is (funcAddr[0] = getExtensionFuncPtr(cast(char*)"wglBindDisplayColorTableEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[1] = getExtensionFuncPtr(cast(char*)"wglCreateDisplayColorTableEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[2] = getExtensionFuncPtr(cast(char*)"wglDestroyDisplayColorTableEXT"))) { funcAddr[0] = null; return funcAddr; }
		if (null is (funcAddr[3] = getExtensionFuncPtr(cast(char*)"wglLoadDisplayColorTableEXT"))) { funcAddr[0] = null; return funcAddr; }
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
