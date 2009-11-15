module dgl.backend.native;


public {
	import dgl.glcontext;
	
	version (Windows) {
		import dgl.backend.win32 : GLWindow;
	}
	else version (Posix) {
		version(linux) {
			import dgl.backend.glx : GLWindow;
		}
		else version(darwin) {
			import dgl.backend.osx : GLWindow;
		}
	}
	else {
		static assert (false);		// TODO
	}
}
