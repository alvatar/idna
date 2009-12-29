module xf.dgl.cg;

public {
	import xf.dgl.cg.consts;
	import xf.dgl.cg.functions;
	
	import tango.sys.sharedlib;
}


version (Windows) {
	char[] cgDyLibFileName = "cg.dll";
} else {
    char[] cgDyLibFileName  = "libCg.so";
}

version (Windows) {
	char[] cgGLDyLibFileName = "cgGL.dll";
} else {
	char[] cgGLDyLibFileName = "libCgGL.so";
}

private {
	SharedLib cgDyLib;
	SharedLib cgGLDyLib;
}


void initDglCg() {
	if (cgDyLib !is null) {
		cgDyLib.unload();
	}
	cgDyLib = SharedLib.load(cgDyLibFileName);

	if (cgGLDyLib !is null) {
		cgGLDyLib.unload();
	}
	cgGLDyLib = SharedLib.load(cgGLDyLibFileName);
	
	
	loadCgFunctions_(function void*(char* n) {
		return cgDyLib.getSymbol(n);
	});

	loadCgGLFunctions_(function void*(char* n) {
		return cgGLDyLib.getSymbol(n);
	});
}
