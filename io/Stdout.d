module io.Stdout;

version( D_Version2 ) {
	private import std.stdio : stdout = writeln;
} else {
	public alias char[] string;
	
	private import tango.io.Stdout;
	void stdout( T... ) (T input) {
		Stdout.formatln( input );
	}
}

