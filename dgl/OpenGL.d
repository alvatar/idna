module dgl.OpenGL;

private {
	version( D_Version2 ) {
		import std.path;
		import std.file;
		import std.string;
		import std.stdio : writeln;
		import std.conv;

		import sys.SharedLib;
	} else {
		import tango.io.FileScan;
;
		import tango.text.Util;
		import tango.stdc.stringz;
		import tango.util.PathUtil;
		import tango.sys.SharedLib;
		import tango.io.Stdout;

		alias char[] string;
	}
	
	import dgl.Common;
	import dgl.Exceptions;
	import dgl.LoaderCommon;
	import dgl.GLExt;
}

public {
	import dgl.GLUFunctions;
	import dgl.GLFunctions;
}


version (DogNoExtSupportAsserts) {
} else {
	version = DogExtSupportAsserts;
}


struct ExtContext {
	version (DogExtSupportAsserts) {
		GLHandle	glh;
		ushort[30]	extList;
		ushort		numExt;
	}
	
	bool supported;
	
	bool opIn(void delegate() dg) {
		if (supported) {
			version (DogNoExtSupportAsserts) {
				dg();
			}
			version (DogExtSupportAsserts) {
				foreach (e; extList[0..numExt]) {
					++glh.extEnabled[e];
				}
				dg();
				foreach (e; extList[0..numExt]) {
					--glh.extEnabled[e];
				}
			}
			return true;
		} else {
			return false;
		}
	}
}


ExtContext ext(GL gl, ushort[] extList ...) {
	bool supported = true;
	foreach (e; extList) {
		auto f = __extSupportCheckingFuncs[e];
		assert (f !is null);
		if (!f(gl)) {
			supported = false;
			break;
		}
	}

	ExtContext res = void;
	
	if (supported) {
		res.supported = true;
		
		version (DogExtSupportAsserts) {
			res.glh = _getGL(gl);
			assert (extList.length < 30, `will any more be needed? :P`);
			res.extList[0..extList.length] = extList;
			res.numExt = cast(ushort)extList.length;
		}
	} else {
		res.supported = false;
	}
	
	return res;
}



version (Windows) {
	public import xf.dog.platform.Win32;
}
else version (Posix) {
	version (linux) {
		public import dgl.platform.GLX;
	}
	else version (darwin) {
		public import dgl.platform.OSX;
	}
}
else {
	static assert (false);		// TODO
}



private {
	void loadGLFunctionsFromLib_(void* function(char*) loadFuncFromLib) {
		loadPlatformFunctions_(loadFuncFromLib);
		loadCoreFunctions_(loadFuncFromLib);
	}

	SharedLib	glLib;
	SharedLib	gluLib;


	bool loadGlLib_(string src) {
		unloadGlLib_();
		try {
			glLib = SharedLib.load(src);
			return glLib !is null;
		} catch (SharedLibException e) {
			return false;
		}
	}
	
	
	void unloadGlLib_() {
		if (glLib !is null) {
			glLib.unload();
			glLib = null;
		}
	}


	bool loadGluLib_(string src) {
		unloadGluLib_();
		try {
			gluLib = SharedLib.load(src);
			return gluLib !is null;
		} catch (SharedLibException) {
			return false;
		}
	}
	
	
	void unloadGluLib_() {
		if (gluLib !is null) {
			gluLib.unload();
			gluLib = null;
		}
	}
}



private Object loaderMutex;
static this() {
	loaderMutex = new Object;
}

void findAndLoadLibs() {
	synchronized (loaderMutex) {
		static bool loaded = false;
		if (loaded) return;
		scope (success) loaded = true;
		
		void load(string[] namesList, void delegate() loadFunc, bool function(string) loadLibFunc) {
			foreach (path; libSearchPaths) {
				if (0 == path.length) {		// load from default locations
					foreach (name; namesList) {
						if (loadLibFunc(name)) {
							loadFunc();
							return;
						} else {
							continue;
						}
					}
				}
				version( D_Version2 ) {
					auto rootPath = basename(path);
					if (exists(path) && isdir(path)) {
						foreach (filePath; listdir(rootPath)) {
							try {
								if (isdir(filePath)) continue;
							} catch {
								continue;
							}

							foreach (name; namesList) {
								if( fnmatch(filePath, name) ) {
									if (loadLibFunc(path.join(path, filePath))) {
										loadFunc();
										return;
									} else {
										continue;
									}
								}
							}
						}
					}
				} else {
					auto rootPath = FilePath(path);
					if (rootPath.exists && rootPath.isFolder) {
						foreach (filePath; rootPath.toList) {
							try {
								if (filePath.isFolder) continue;
							} catch {
								continue;
							}

							foreach (name; namesList) {
								if (tango.util.PathUtil.patternMatch(filePath.file, name)) {
									if (loadLibFunc(FilePath().join(path, filePath.file))) {
										loadFunc();
										return;
									} else {
										continue;
									}
								}
							}
						}
					}
				}
			}
			
			handleLibNotFound(namesList, libSearchPaths);
		}

		load(libNames, (){ loadGLFunctionsFromLib_(&loadFuncFromLib); }, &loadGlLib_);
		load(gluLibNames, (){ loadGluFunctions_(&loadFuncFromGluLib); }, &loadGluLib_);
	}
}


bool extractVersionNumbers(string str, char delim, int* major, int* minor) {
	version( D_Version2 ) {
		int dot = str.indexOf(delim);
	} else {
		int dot = str.locate(delim);
	}
	if (dot+1 >= str.length || 0 == dot) return false;
	
	char d1 = str[dot-1];
	char d2 = str[dot+1];
	
	if (d1 > '9' || d1 < '0' || d2 > '9' || d2 < '0') return false;
	
	*major = d1 - '0';
	*minor = d2 - '0';
	
	return true;
}


bool isOpenGLVersionSupported(string versionStr, char delim) {
	int implMajor, implMinor;
	int chkMajor, chkMinor;
	
	version( D_Version2 ) {
		debug(verbose) writeln(to!(string)(fp_glGetString(dgl.Common.GL_VERSION)));
		if	(	extractVersionNumbers(to!(string)(fp_glGetString(dgl.Common.GL_VERSION)), '.', &implMajor, &implMinor) &&
				extractVersionNumbers(versionStr, delim, &chkMajor, &chkMinor))
		{
			if (implMajor > chkMajor) return true;
			if (implMajor == chkMajor && implMinor >= chkMinor) return true;
		}
	} else {
		debug(verbose) Stdout.formatln(fromStringz(fp_glGetString(xf.dog.Common.GL_VERSION)));
		if	(	extractVersionNumbers(fromStringz(fp_glGetString(dgl.Common.GL_VERSION)), '.', &implMajor, &implMinor) &&
				extractVersionNumbers(versionStr, delim, &chkMajor, &chkMinor))
		{
			if (implMajor > chkMajor) return true;
			if (implMajor == chkMajor && implMinor >= chkMinor) return true;
		}
	}
	
	return false;
}


void* loadFuncFromLib(char* name) {
	void* func = glLib.getSymbol(name);
	
	if (func is null) {
		handleMissingProc(name);
		return null;
	} else {
		return func;
	}
}


void* loadFuncFromGluLib(char* name) {
	void* func = gluLib.getSymbol(name);
	
	if (func is null) {
		handleMissingProc(name);
		return null;
	} else {
		return func;
	}
	return null;
}
