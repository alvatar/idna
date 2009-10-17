module xf.dog.Cg;

public {
	import xf.dog.cg.Consts;
	import xf.dog.cg.Functions;
	
	import tango.sys.SharedLib;
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


void initDogCg() {
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
