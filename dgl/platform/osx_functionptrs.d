module dgl.platform.osx_functionptrs;

public {
	import dgl.common;
	import dgl.loadercommon;
}

void loadPlatformFunctions_(void* function(char*) loadFuncFromLib) {
}

public void* getExtensionFuncPtr(char* name) {
	return null;
}

static this() {
	appendLibSearchPaths(`/Library/Frameworks/OpenGL.framework/`, `/System/Library/Frameworks/OpenGL.framework`);
	appendLibNames(`OpenGL`);
	appendGluLibNames(`OpenGL`);
}
