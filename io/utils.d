module io.utils;

private {
	import std.stdio;
	import std.utf;

	import io.input.Input;
}

string getStringFromKeySym( KeyboardInput[] kinput ) {

	if( !kinput ) return "";

	dchar[] extracted;
	foreach( k; kinput ) {
		extracted ~= k.unicode;
	}
	auto result = toUTF8(extracted);

	return result;
}
