module dgl.platform.glx_functionptrs;

public {
	import dgl.common;
	import dgl.loadercommon;
}

private {
	import sys.x11.xutil;
	version( D_Version2 ) {
		import std.traits : ParameterTypeTuple;
		template ParameterTupleOf(alias dg) {
			alias ParameterTypeTuple!(dg) ParameterTupleOf;
		}
	} else {
		import tango.core.Traits : ParameterTupleOf;
	}
}


public static extern(C) {
// 	int function(void *, uint, int *) fp_glXDrawableAttribARB;
// 	int function(void *, uint, int) fp_glXReleaseTexImageARB;
// 	int function(void *, uint, int) fp_glXBindTexImageARB;
// 	uint function(void *, int, void *) fp_glXGetMemoryOffsetMESA;
// 	void function(void *, int, void *) fp_glXFreeMemoryMESA;
// 	void * function(void *, int, uint, float, float, float) fp_glXAllocateMemoryMESA;
// 	void function(void *) fp_glXFreeMemoryNV;
// 	void * function(int, float, float, float) fp_glXAllocateMemoryNV;
	void function() function(char *) fp_glXGetProcAddress;
	void function(void *, uint, uint *) fp_glXGetSelectedEvent;
	void function(void *, uint, uint) fp_glXSelectEvent;
	int function(void *, void *, int, int *) fp_glXQueryContext;
	void * function() fp_glXGetCurrentDisplay;
	uint function() fp_glXGetCurrentReadDrawable;
	int function(void *, uint, uint, void *) fp_glXMakeContextCurrent;
	void * function(void *, void *, int, void *, int) fp_glXCreateNewContext;
	void function(void *, uint, int, uint *) fp_glXQueryDrawable;
	void function(void *, uint) fp_glXDestroyPbuffer;
	uint function(void *, void *, int *) fp_glXCreatePbuffer;
	void function(void *, uint) fp_glXDestroyPixmap;
	uint function(void *, void *, uint, int *) fp_glXCreatePixmap;
	void function(void *, uint) fp_glXDestroyWindow;
	uint function(void *, void *, uint, int *) fp_glXCreateWindow;
	XVisualInfo * function(void *, void *) fp_glXGetVisualFromFBConfig;
	int function(void *, void *, int, int *) fp_glXGetFBConfigAttrib;
	void * * function(void *, int, int *, int *) fp_glXChooseFBConfig;
	void * * function(void *, int, int *) fp_glXGetFBConfigs;
	char * function(void *, int) fp_glXQueryExtensionsString;
	char * function(void *, int, int) fp_glXQueryServerString;
	char * function(void *, int) fp_glXGetClientString;
	void function() fp_glXWaitX;
	void function() fp_glXWaitGL;
	void function(uint, int, int, int) fp_glXUseXFont;
	void function(void *, uint) fp_glXSwapBuffers;
	int function(void *, int *, int *) fp_glXQueryVersion;
	int function(void *, int *, int *) fp_glXQueryExtension;
	int function(void *, uint, void *) fp_glXMakeCurrent;
	int function(void *, void *) fp_glXIsDirect;
	uint function() fp_glXGetCurrentDrawable;
	void * function() fp_glXGetCurrentContext;
	int function(void *, XVisualInfo *, int, int *) fp_glXGetConfig;
	void function(void *, uint) fp_glXDestroyGLXPixmap;
	void function(void *, void *) fp_glXDestroyContext;
	uint function(void *, XVisualInfo *, uint) fp_glXCreateGLXPixmap;
	void * function(void *, XVisualInfo *, void *, int) fp_glXCreateContext;
	void function(void *, void *, void *, uint) fp_glXCopyContext;
	XVisualInfo * function(void *, int, int *) fp_glXChooseVisual;
}

public final {
// 	int glXDrawableAttribARB(GL gl, ParameterTupleOf!(fp_glXDrawableAttribARB) params__) {
// 		return fp_glXDrawableAttribARB(params__);
// 	}
// 	int glXReleaseTexImageARB(GL gl, ParameterTupleOf!(fp_glXReleaseTexImageARB) params__) {
// 		return fp_glXReleaseTexImageARB(params__);
// 	}
// 	int glXBindTexImageARB(GL gl, ParameterTupleOf!(fp_glXBindTexImageARB) params__) {
// 		return fp_glXBindTexImageARB(params__);
// 	}
// 	uint glXGetMemoryOffsetMESA(GL gl, ParameterTupleOf!(fp_glXGetMemoryOffsetMESA) params__) {
// 		return fp_glXGetMemoryOffsetMESA(params__);
// 	}
// 	void glXFreeMemoryMESA(GL gl, ParameterTupleOf!(fp_glXFreeMemoryMESA) params__) {
// 		return fp_glXFreeMemoryMESA(params__);
// 	}
// 	void * glXAllocateMemoryMESA(GL gl, ParameterTupleOf!(fp_glXAllocateMemoryMESA) params__) {
// 		return fp_glXAllocateMemoryMESA(params__);
// 	}
// 	void glXFreeMemoryNV(GL gl, ParameterTupleOf!(fp_glXFreeMemoryNV) params__) {
// 		return fp_glXFreeMemoryNV(params__);
// 	}
// 	void * glXAllocateMemoryNV(GL gl, ParameterTupleOf!(fp_glXAllocateMemoryNV) params__) {
// 		return fp_glXAllocateMemoryNV(params__);
//  }
	void * glXGetProcAddress(GL gl, ParameterTupleOf!(fp_glXGetProcAddress) params__) {
		return fp_glXGetProcAddress(params__);
	}
	void glXGetSelectedEvent(GL gl, ParameterTupleOf!(fp_glXGetSelectedEvent) params__) {
		return fp_glXGetSelectedEvent(params__);
	}
	void glXSelectEvent(GL gl, ParameterTupleOf!(fp_glXSelectEvent) params__) {
		return fp_glXSelectEvent(params__);
	}
	int glXQueryContext(GL gl, ParameterTupleOf!(fp_glXQueryContext) params__) {
		return fp_glXQueryContext(params__);
	}
	void * glXGetCurrentDisplay(GL gl, ParameterTupleOf!(fp_glXGetCurrentDisplay) params__) {
		return fp_glXGetCurrentDisplay(params__);
	}
	uint glXGetCurrentReadDrawable(GL gl, ParameterTupleOf!(fp_glXGetCurrentReadDrawable) params__) {
		return fp_glXGetCurrentReadDrawable(params__);
	}
	int glXMakeContextCurrent(GL gl, ParameterTupleOf!(fp_glXMakeContextCurrent) params__) {
		return fp_glXMakeContextCurrent(params__);
	}
	void * glXCreateNewContext(GL gl, ParameterTupleOf!(fp_glXCreateNewContext) params__) {
		return fp_glXCreateNewContext(params__);
	}
	void glXQueryDrawable(GL gl, ParameterTupleOf!(fp_glXQueryDrawable) params__) {
		return fp_glXQueryDrawable(params__);
	}
	void glXDestroyPbuffer(GL gl, ParameterTupleOf!(fp_glXDestroyPbuffer) params__) {
		return fp_glXDestroyPbuffer(params__);
	}
	uint glXCreatePbuffer(GL gl, ParameterTupleOf!(fp_glXCreatePbuffer) params__) {
		return fp_glXCreatePbuffer(params__);
	}
	void glXDestroyPixmap(GL gl, ParameterTupleOf!(fp_glXDestroyPixmap) params__) {
		return fp_glXDestroyPixmap(params__);
	}
	uint glXCreatePixmap(GL gl, ParameterTupleOf!(fp_glXCreatePixmap) params__) {
		return fp_glXCreatePixmap(params__);
	}
	void glXDestroyWindow(GL gl, ParameterTupleOf!(fp_glXDestroyWindow) params__) {
		return fp_glXDestroyWindow(params__);
	}
	uint glXCreateWindow(GL gl, ParameterTupleOf!(fp_glXCreateWindow) params__) {
		return fp_glXCreateWindow(params__);
	}
	XVisualInfo * glXGetVisualFromFBConfig(GL gl, ParameterTupleOf!(fp_glXGetVisualFromFBConfig) params__) {
		return fp_glXGetVisualFromFBConfig(params__);
	}
	int glXGetFBConfigAttrib(GL gl, ParameterTupleOf!(fp_glXGetFBConfigAttrib) params__) {
		return fp_glXGetFBConfigAttrib(params__);
	}
	void * * glXChooseFBConfig(GL gl, ParameterTupleOf!(fp_glXChooseFBConfig) params__) {
		return fp_glXChooseFBConfig(params__);
	}
	void * * glXGetFBConfigs(GL gl, ParameterTupleOf!(fp_glXGetFBConfigs) params__) {
		return fp_glXGetFBConfigs(params__);
	}
	char * glXQueryExtensionsString(GL gl, ParameterTupleOf!(fp_glXQueryExtensionsString) params__) {
		return fp_glXQueryExtensionsString(params__);
	}
	char * glXQueryServerString(GL gl, ParameterTupleOf!(fp_glXQueryServerString) params__) {
		return fp_glXQueryServerString(params__);
	}
	char * glXGetClientString(GL gl, ParameterTupleOf!(fp_glXGetClientString) params__) {
		return fp_glXGetClientString(params__);
	}
	void glXWaitX(GL gl, ParameterTupleOf!(fp_glXWaitX) params__) {
		return fp_glXWaitX(params__);
	}
	void glXWaitGL(GL gl, ParameterTupleOf!(fp_glXWaitGL) params__) {
		return fp_glXWaitGL(params__);
	}
	void glXUseXFont(GL gl, ParameterTupleOf!(fp_glXUseXFont) params__) {
		return fp_glXUseXFont(params__);
	}
	void glXSwapBuffers(GL gl, ParameterTupleOf!(fp_glXSwapBuffers) params__) {
		return fp_glXSwapBuffers(params__);
	}
	int glXQueryVersion(GL gl, ParameterTupleOf!(fp_glXQueryVersion) params__) {
		return fp_glXQueryVersion(params__);
	}
	int glXQueryExtension(GL gl, ParameterTupleOf!(fp_glXQueryExtension) params__) {
		return fp_glXQueryExtension(params__);
	}
	int glXMakeCurrent(GL gl, ParameterTupleOf!(fp_glXMakeCurrent) params__) {
		return fp_glXMakeCurrent(params__);
	}
	int glXIsDirect(GL gl, ParameterTupleOf!(fp_glXIsDirect) params__) {
		return fp_glXIsDirect(params__);
	}
	uint glXGetCurrentDrawable(GL gl, ParameterTupleOf!(fp_glXGetCurrentDrawable) params__) {
		return fp_glXGetCurrentDrawable(params__);
	}
	void * glXGetCurrentContext(GL gl, ParameterTupleOf!(fp_glXGetCurrentContext) params__) {
		return fp_glXGetCurrentContext(params__);
	}
	int glXGetConfig(GL gl, ParameterTupleOf!(fp_glXGetConfig) params__) {
		return fp_glXGetConfig(params__);
	}
	void glXDestroyGLXPixmap(GL gl, ParameterTupleOf!(fp_glXDestroyGLXPixmap) params__) {
		return fp_glXDestroyGLXPixmap(params__);
	}
	void glXDestroyContext(GL gl, ParameterTupleOf!(fp_glXDestroyContext) params__) {
		return fp_glXDestroyContext(params__);
	}
	uint glXCreateGLXPixmap(GL gl, ParameterTupleOf!(fp_glXCreateGLXPixmap) params__) {
		return fp_glXCreateGLXPixmap(params__);
	}
	void * glXCreateContext(GL gl, ParameterTupleOf!(fp_glXCreateContext) params__) {
		return fp_glXCreateContext(params__);
	}
	void glXCopyContext(GL gl, ParameterTupleOf!(fp_glXCopyContext) params__) {
		return fp_glXCopyContext(params__);
	}
	XVisualInfo * glXChooseVisual(GL gl, ParameterTupleOf!(fp_glXChooseVisual) params__) {
		return fp_glXChooseVisual(params__);
	}
}

void loadPlatformFunctions_(void* function(char*) loadFuncFromLib) {
	if(fp_glXGetProcAddress !is null) return;
	//*cast(void**)&fp_glXDrawableAttribARB = loadFuncFromLib(cast(char*)"glXDrawableAttribARB");
	//*cast(void**)&fp_glXReleaseTexImageARB = loadFuncFromLib(cast(char*)"glXReleaseTexImageARB");
	//*cast(void**)&fp_glXBindTexImageARB = loadFuncFromLib(cast(char*)"glXBindTexImageARB");
	//*cast(void**)&fp_glXGetMemoryOffsetMESA = loadFuncFromLib(cast(char*)"glXGetMemoryOffsetMESA");
	//*cast(void**)&fp_glXFreeMemoryMESA = loadFuncFromLib(cast(char*)"glXFreeMemoryMESA");
	//*cast(void**)&fp_glXAllocateMemoryMESA = loadFuncFromLib(cast(char*)"glXAllocateMemoryMESA");
	//*cast(void**)&fp_glXFreeMemoryNV = loadFuncFromLib(cast(char*)"glXFreeMemoryNV");
	//*cast(void**)&fp_glXAllocateMemoryNV = loadFuncFromLib(cast(char*)"glXAllocateMemoryNV");
	*cast(void**)&fp_glXGetProcAddress = loadFuncFromLib(cast(char*)"glXGetProcAddress");
	*cast(void**)&fp_glXGetSelectedEvent = loadFuncFromLib(cast(char*)"glXGetSelectedEvent");
	*cast(void**)&fp_glXSelectEvent = loadFuncFromLib(cast(char*)"glXSelectEvent");
	*cast(void**)&fp_glXQueryContext = loadFuncFromLib(cast(char*)"glXQueryContext");
	*cast(void**)&fp_glXGetCurrentDisplay = loadFuncFromLib(cast(char*)"glXGetCurrentDisplay");
	*cast(void**)&fp_glXGetCurrentReadDrawable = loadFuncFromLib(cast(char*)"glXGetCurrentReadDrawable");
	*cast(void**)&fp_glXMakeContextCurrent = loadFuncFromLib(cast(char*)"glXMakeContextCurrent");
	*cast(void**)&fp_glXCreateNewContext = loadFuncFromLib(cast(char*)"glXCreateNewContext");
	*cast(void**)&fp_glXQueryDrawable = loadFuncFromLib(cast(char*)"glXQueryDrawable");
	*cast(void**)&fp_glXDestroyPbuffer = loadFuncFromLib(cast(char*)"glXDestroyPbuffer");
	*cast(void**)&fp_glXCreatePbuffer = loadFuncFromLib(cast(char*)"glXCreatePbuffer");
	*cast(void**)&fp_glXDestroyPixmap = loadFuncFromLib(cast(char*)"glXDestroyPixmap");
	*cast(void**)&fp_glXCreatePixmap = loadFuncFromLib(cast(char*)"glXCreatePixmap");
	*cast(void**)&fp_glXDestroyWindow = loadFuncFromLib(cast(char*)"glXDestroyWindow");
	*cast(void**)&fp_glXCreateWindow = loadFuncFromLib(cast(char*)"glXCreateWindow");
	*cast(void**)&fp_glXGetVisualFromFBConfig = loadFuncFromLib(cast(char*)"glXGetVisualFromFBConfig");
	*cast(void**)&fp_glXGetFBConfigAttrib = loadFuncFromLib(cast(char*)"glXGetFBConfigAttrib");
	*cast(void**)&fp_glXChooseFBConfig = loadFuncFromLib(cast(char*)"glXChooseFBConfig");
	*cast(void**)&fp_glXGetFBConfigs = loadFuncFromLib(cast(char*)"glXGetFBConfigs");
	*cast(void**)&fp_glXQueryExtensionsString = loadFuncFromLib(cast(char*)"glXQueryExtensionsString");
	*cast(void**)&fp_glXQueryServerString = loadFuncFromLib(cast(char*)"glXQueryServerString");
	*cast(void**)&fp_glXGetClientString = loadFuncFromLib(cast(char*)"glXGetClientString");
	*cast(void**)&fp_glXWaitX = loadFuncFromLib(cast(char*)"glXWaitX");
	*cast(void**)&fp_glXWaitGL = loadFuncFromLib(cast(char*)"glXWaitGL");
	*cast(void**)&fp_glXUseXFont = loadFuncFromLib(cast(char*)"glXUseXFont");
	*cast(void**)&fp_glXSwapBuffers = loadFuncFromLib(cast(char*)"glXSwapBuffers");
	*cast(void**)&fp_glXQueryVersion = loadFuncFromLib(cast(char*)"glXQueryVersion");
	*cast(void**)&fp_glXQueryExtension = loadFuncFromLib(cast(char*)"glXQueryExtension");
	*cast(void**)&fp_glXMakeCurrent = loadFuncFromLib(cast(char*)"glXMakeCurrent");
	*cast(void**)&fp_glXIsDirect = loadFuncFromLib(cast(char*)"glXIsDirect");
	*cast(void**)&fp_glXGetCurrentDrawable = loadFuncFromLib(cast(char*)"glXGetCurrentDrawable");
	*cast(void**)&fp_glXGetCurrentContext = loadFuncFromLib(cast(char*)"glXGetCurrentContext");
	*cast(void**)&fp_glXGetConfig = loadFuncFromLib(cast(char*)"glXGetConfig");
	*cast(void**)&fp_glXDestroyGLXPixmap = loadFuncFromLib(cast(char*)"glXDestroyGLXPixmap");
	*cast(void**)&fp_glXDestroyContext = loadFuncFromLib(cast(char*)"glXDestroyContext");
	*cast(void**)&fp_glXCreateGLXPixmap = loadFuncFromLib(cast(char*)"glXCreateGLXPixmap");
	*cast(void**)&fp_glXCreateContext = loadFuncFromLib(cast(char*)"glXCreateContext");
	*cast(void**)&fp_glXCopyContext = loadFuncFromLib(cast(char*)"glXCopyContext");
	*cast(void**)&fp_glXChooseVisual = loadFuncFromLib(cast(char*)"glXChooseVisual");
}


public void* getExtensionFuncPtr(char* name) {
	return fp_glXGetProcAddress(name);
}


static this() {
	appendLibSearchPaths(`.`, ``, `/usr/lib`, `/usr/local/lib`, `/usr/lib/xorg/modules/extensions`, `/usr/local/lib/xorg/modules/extensions`);
	appendLibNames(`libGL.so`, `libGL.so.1`, `libGL.so.1.*`, `libGL.so.*`);
	appendGluLibNames(`libGLU.so`, `libGLU.so.1.*`, `libGLU.so.*`);
	//appendGlxLibNames(`libglx.so`, `libglx.so.1`, `libglx.so.1.*`);
}
