module meta.string;

private {
	import std.traits;
	import std.conv;
}


/+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Compile-time conversion of numeric values to string
 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
string ctToString(T)(T value) {

	static if( isFloatingPoint!(T) ) {
		string result;
		// Handle negative case and parse integer part
		if( value < 0 ) {
			value = -value;
			result = "-" ~ to!(string)( cast(int)value );
		} else {
			result = to!(string)( cast(int)value );
		}
		
		// Parse decimal part
		value -= cast(int)value;
		result ~= ".";
		for( int i = 0; i < value.dig; ++i ) {
			value *= 10;
			auto index = cast(int)value;
			result ~= "0123456789"[index];
			value -= index;
		}
		return result;
	} else {
		return to!(string)(value);
	}
}


unittest {
	static assert( isSomeString!( typeof(ctToString(1.1234)) ) );
}
