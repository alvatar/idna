module io.utils;

private {
	import std.stdio;
	import std.utf;

	import io.input.input;
	import io.input.KeySym;
}

string getUnicodeFromInput( KeyboardInput[] kinput ) {
	if( !kinput ) return "";
	dchar[] extracted;
	foreach( k; kinput )
		extracted ~= k.unicode;
	return toUTF8(extracted);
}

int[] getKeySymsFromInput( KeyboardInput[] kinput ) {
	if( !kinput ) return [];
	io.input.KeySym.KeySym[] extracted;
	foreach( k; kinput )
		extracted ~= k.keySym;
	return cast(int[])extracted;
}
