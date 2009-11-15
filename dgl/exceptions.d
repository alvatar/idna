module dgl.exceptions;

private {
	version( D_Version2 ) {
		import std.string;
		import std.conv;
	} else {
		import tango.stdc.stringz;
		import tango.text.convert.Format;

		alias char[] string;
	}
}



void handleMissingProc(char* name) {
	version( D_Version2 ) {
		throw new Exception(`Proc not found: ` ~ to!(string)(name));
	} else {
		throw new Exception(`Proc not found: ` ~ fromStringz(name));
	}
}



void handleInvalidLib(char* name) {
	version( D_Version2 ) {
		throw new Exception("Invalid library: " ~ to!(string)(name));
	} else {
		throw new Exception("Invalid library: " ~ fromStringz(name));
	}
}



void handleLibNotFound(string[] libNames, string[] searchPaths) {
	string[] quote(string[] a) {
		string[] res;
		foreach (ref x; a) {
			res ~= '"' ~ x ~ '"';
		}
		return res;
	}

	//scope s = new Sprint!(char);
	version( D_Version2 ) {
		throw new Exception(format("OpenGL library not found. Tried {} in {}", quote(libNames), quote(searchPaths)));
	} else {
		throw new Exception(Format("OpenGL library not found. Tried {} in {}", quote(libNames), quote(searchPaths)));
	}
}
