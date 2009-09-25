module idna.tools.Compat;

version( D_Version2 ) {
	private import std.stdio;
	alias writeln stdout;
} else {
	public alias char[] string;
	
	private import tango.io.Stdout;
	void stdout( T... ) (T input) {
		Stdout.formatln( input );
	}
}

