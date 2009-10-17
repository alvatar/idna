module dgl.backend.Native;


public {
	import dgl.GLContext;
	
	version (Windows) {
		import dgl.backend.native.Win32 : GLWindow;
	}
	else version (Posix) {
		version(linux) {
			import dgl.backend.native.GLX : GLWindow;
		}
		else version(darwin) {
			import dgl.backend.native.OSX : GLWindow;
		}
	}
	else {
		static assert (false);		// TODO
	}
}
