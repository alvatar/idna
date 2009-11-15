module dgl.platform.win32_functionptrs;

public {
	import dgl.common;
	import dgl.loadercommon;
	import platform.win32.windef;
	import platform.win32.wingdi : LAYERPLANEDESCRIPTOR, COLORREF, GLYPHMETRICSFLOAT, PIXELFORMATDESCRIPTOR;

	version( D_Version2 ) {
		import std.traits : ParameterTypeTuple;
		template ParameterTupleOf(alias dg) {
			alias ParameterTypeTuple!(dg) ParameterTupleOf;
		}
	} else {
		import tango.core.Traits :  ReturnTypeOf, ParameterTupleOf;
	}
}



public static extern (System) {
	BOOL function(HGLRC,HGLRC) fp_wglCopyContext;
	HGLRC function(HDC) fp_wglCreateContext;
	HGLRC function(HDC,int) fp_wglCreateLayerContext;
	BOOL function(HGLRC) fp_wglDeleteContext;
	BOOL function(HDC,int,int,UINT,LAYERPLANEDESCRIPTOR*) fp_wglDescribeLayerPlane;
	HGLRC function() fp_wglGetCurrentContext;
	HDC function() fp_wglGetCurrentDC;
	int function(HDC,int,int,int,COLORREF*) fp_wglGetLayerPaletteEntries;
	FARPROC function(LPCSTR) fp_wglGetProcAddress;
	BOOL function(HDC,HGLRC) fp_wglMakeCurrent;
	BOOL function(HDC,int,BOOL) fp_wglRealizeLayerPalette;
	int function(HDC,int,int,int,COLORREF*) fp_wglSetLayerPaletteEntries;
	BOOL function(HGLRC,HGLRC) fp_wglShareLists;
	BOOL function(HDC,UINT) fp_wglSwapLayerBuffers;
	BOOL function(HDC,int, PIXELFORMATDESCRIPTOR*) fp_wglSetPixelFormat;
	BOOL function(HDC,DWORD,DWORD,DWORD) fp_wglUseFontBitmapsA;
	BOOL function(HDC,DWORD,DWORD,DWORD,FLOAT,FLOAT,int,GLYPHMETRICSFLOAT*) fp_wglUseFontOutlinesA;
	BOOL function(HDC,DWORD,DWORD,DWORD) fp_wglUseFontBitmapsW;
	BOOL function(HDC,DWORD,DWORD,DWORD,FLOAT,FLOAT,int,GLYPHMETRICSFLOAT*) fp_wglUseFontOutlinesW;
}


public final {
	BOOL  wglCopyContext(GL gl, ParameterTupleOf!(fp_wglCopyContext) params__) {
		return fp_wglCopyContext(params__);
	}
	HGLRC  wglCreateContext(GL gl, ParameterTupleOf!(fp_wglCreateContext) params__) {
		return fp_wglCreateContext(params__);
	}
	HGLRC  wglCreateLayerContext(GL gl, ParameterTupleOf!(fp_wglCreateLayerContext) params__) {
		return fp_wglCreateLayerContext(params__);
	}
	BOOL  wglDeleteContext(GL gl, ParameterTupleOf!(fp_wglDeleteContext) params__) {
		return fp_wglDeleteContext(params__);
	}
	BOOL  wglDescribeLayerPlane(GL gl, ParameterTupleOf!(fp_wglDescribeLayerPlane) params__) {
		return fp_wglDescribeLayerPlane(params__);
	}
	HGLRC  wglGetCurrentContext(GL gl, ParameterTupleOf!(fp_wglGetCurrentContext) params__) {
		return fp_wglGetCurrentContext(params__);
	}
	HDC  wglGetCurrentDC(GL gl, ParameterTupleOf!(fp_wglGetCurrentDC) params__) {
		return fp_wglGetCurrentDC(params__);
	}
	int  wglGetLayerPaletteEntries(GL gl, ParameterTupleOf!(fp_wglGetLayerPaletteEntries) params__) {
		return fp_wglGetLayerPaletteEntries(params__);
	}
	FARPROC  wglGetProcAddress(GL gl, ParameterTupleOf!(fp_wglGetProcAddress) params__) {
		return fp_wglGetProcAddress(params__);
	}
	BOOL  wglMakeCurrent(GL gl, ParameterTupleOf!(fp_wglMakeCurrent) params__) {
		return fp_wglMakeCurrent(params__);
	}
	BOOL  wglRealizeLayerPalette(GL gl, ParameterTupleOf!(fp_wglRealizeLayerPalette) params__) {
		return fp_wglRealizeLayerPalette(params__);
	}
	int  wglSetLayerPaletteEntries(GL gl, ParameterTupleOf!(fp_wglSetLayerPaletteEntries) params__) {
		return fp_wglSetLayerPaletteEntries(params__);
	}
	BOOL  wglShareLists(GL gl, ParameterTupleOf!(fp_wglShareLists) params__) {
		return fp_wglShareLists(params__);
	}
	BOOL  wglSwapLayerBuffers(GL gl, ParameterTupleOf!(fp_wglSwapLayerBuffers) params__) {
		return fp_wglSwapLayerBuffers(params__);
	}
	BOOL wglSetPixelFormat(GL gl, ParameterTupleOf!(fp_wglSetPixelFormat) params__) {
		return fp_wglSetPixelFormat(params__);
	}
	BOOL  wglUseFontBitmapsA(GL gl, ParameterTupleOf!(fp_wglUseFontBitmapsA) params__) {
		return fp_wglUseFontBitmapsA(params__);
	}
	BOOL  wglUseFontOutlinesA(GL gl, ParameterTupleOf!(fp_wglUseFontOutlinesA) params__) {
		return fp_wglUseFontOutlinesA(params__);
	}
	BOOL  wglUseFontBitmapsW(GL gl, ParameterTupleOf!(fp_wglUseFontBitmapsW) params__) {
		return fp_wglUseFontBitmapsW(params__);
	}
	BOOL  wglUseFontOutlinesW(GL gl, ParameterTupleOf!(fp_wglUseFontOutlinesW) params__) {
		return fp_wglUseFontOutlinesW(params__);
	}
}


void loadPlatformFunctions_(void* function(char*) loadFuncFromLib) {
	// could check all but what the hell...
	if (fp_wglUseFontOutlinesW !is null) return;

	*cast(void**)&fp_wglCopyContext = loadFuncFromLib(cast(char*)"wglCopyContext");
	*cast(void**)&fp_wglCreateContext = loadFuncFromLib(cast(char*)"wglCreateContext");
	*cast(void**)&fp_wglCreateLayerContext = loadFuncFromLib(cast(char*)"wglCreateLayerContext");
	*cast(void**)&fp_wglDeleteContext = loadFuncFromLib(cast(char*)"wglDeleteContext");
	*cast(void**)&fp_wglDescribeLayerPlane = loadFuncFromLib(cast(char*)"wglDescribeLayerPlane");
	*cast(void**)&fp_wglGetCurrentContext = loadFuncFromLib(cast(char*)"wglGetCurrentContext");
	*cast(void**)&fp_wglGetCurrentDC = loadFuncFromLib(cast(char*)"wglGetCurrentDC");
	*cast(void**)&fp_wglGetLayerPaletteEntries = loadFuncFromLib(cast(char*)"wglGetLayerPaletteEntries");
	*cast(void**)&fp_wglGetProcAddress = loadFuncFromLib(cast(char*)"wglGetProcAddress");
	*cast(void**)&fp_wglMakeCurrent = loadFuncFromLib(cast(char*)"wglMakeCurrent");
	*cast(void**)&fp_wglRealizeLayerPalette = loadFuncFromLib(cast(char*)"wglRealizeLayerPalette");
	*cast(void**)&fp_wglSetLayerPaletteEntries = loadFuncFromLib(cast(char*)"wglSetLayerPaletteEntries");
	*cast(void**)&fp_wglShareLists = loadFuncFromLib(cast(char*)"wglShareLists");
	*cast(void**)&fp_wglSwapLayerBuffers = loadFuncFromLib(cast(char*)"wglSwapLayerBuffers");
	*cast(void**)&fp_wglSetPixelFormat = loadFuncFromLib(cast(char*)"wglSetPixelFormat");
	*cast(void**)&fp_wglUseFontBitmapsA = loadFuncFromLib(cast(char*)"wglUseFontBitmapsA");
	*cast(void**)&fp_wglUseFontOutlinesA = loadFuncFromLib(cast(char*)"wglUseFontOutlinesA");
	*cast(void**)&fp_wglUseFontBitmapsW = loadFuncFromLib(cast(char*)"wglUseFontBitmapsW");
	*cast(void**)&fp_wglUseFontOutlinesW = loadFuncFromLib(cast(char*)"wglUseFontOutlinesW");
}


public void* getExtensionFuncPtr(char* name) {
	return fp_wglGetProcAddress(name);
}


static this() {
	appendLibSearchPaths(`.`, ``);
	appendLibNames(`opengl32.dll`);
	appendGluLibNames(`glu32.dll`);
}
