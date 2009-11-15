module dgl.loadercommon;


package {
	version( D_Version2 ) {
	} else {
		alias char[] string;
	}
	string[] libSearchPaths;
	string[] libNames;
	string[] gluLibNames;
}



void prependLibSearchPaths(string[] paths ...) {
	libSearchPaths = paths ~ libSearchPaths;
}

void appendLibSearchPaths(string[] paths ...) {
	libSearchPaths ~= paths;
}


void prependLibNames(string[] names ...) {
	libNames = names ~ libNames;
}

void appendLibNames(string[] names ...) {
	libNames ~= names;
}


void prependGluLibNames(string[] names ...) {
	gluLibNames = names ~ gluLibNames;
}

void appendGluLibNames(string[] names ...) {
	gluLibNames ~= names;
}
