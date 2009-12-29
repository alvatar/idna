module meta.numeric;

private {
	import std.traits;

	import meta.char_funcs;
	import meta.string_funcs;
}

/++ Compile-time conversion of numeric values to string +/
pure string ctToString(T)(T value) {

	static if( isFloatingPoint!(T) ) {
		/*
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
		*/
		return floatToDec(value);
	} else {
		//return to!(string)(value);
		return intToDec(value);
	}
}

unittest {
	static assert( isSomeString!( typeof(ctToString(1.1234)) ) );
}

/++ Converts the given integer to its hexadecimal string +/
pure string intToHex (long i) {
	if (i < 0)
		return "-" ~ intToHex (-i);
	if (i < 16)
		return "" ~ intToHexDigit (i);
	else
		return intToHex (i / 16) ~ intToHexDigit (i % 16); 
}

/++ Converts the given integer to its decimal string +/
pure string intToDec (long i) {
	if (i < 0)
		return "-" ~ intToDec (-i);
	if (i < 10)
		return "" ~ intToDecDigit (i);
	else
		return intToDec (i / 10) ~ intToDecDigit (i % 10);
}

alias intToDec itoa;

/++
 + Packs the parsed integer and its index
 +/
struct ParsedDecInt {
	long number;
	uint index;
}

/++ Parses a given string, beginning with a hexadecimal integer and returns it +/
pure ParsedDecInt parseHexInt (string str, string ignore = "_") {
	if (str.length == 0)
		return ParsedDecInt(0,0);

	uint index;
	int i = 0;
	byte sign = 1;
	if (str[0] == '+')
		i = 1;
	else if (str[0] == '-') {
		i = 1;
		sign = -1;
	}

	long result = 0;
	foreach (c; str[i .. $]) {
		if (isHexDigit (c)) {
			result *= 16;
			result += hexDigitToInt (c);
			i++;
			index = i;
		} else if (ignore.contains (c)) {
			i++;
		} else break;
	}
	return ParsedDecInt( sign * result, index);
}

/++ Parses a given string, beginning with a decimal integer and returns it +/
pure ParsedDecInt parseDecInt (string str, string ignore = "_") {
	if (str.length == 0)
		return ParsedDecInt(0,0);
	
	uint index;
	int i = 0;
	byte sign = 1;
	if (str[0] == '+')
		i = 1;
	else if (str[0] == '-') {
		i = 1;
		sign = -1;
	}

	long result = 0;
	int last_ignored = 0;
	foreach (c; str[i .. $]) {
		if (isDecDigit (c)) {
			result *= 10;
			result += decDigitToInt (c);
			i++;
			index = i;
		} else if (ignore.contains (c)) {
			i++;
		} else break;
	}
	return ParsedDecInt( sign * result, index );
}

/++ Converts a given hexadecimal string to an integer value +/
pure long hexToInt (string str, string ignore = "_") {
	return parseHexInt (str, ignore).number;
}

/++ Converts a given decimal string to an integer value +/
pure long decToInt (string str, string ignore = "_") {
	return parseDecInt (str, ignore).number;
}

/++ Returns true of the given string is a hexadecimal number +/
pure bool isHexInt (string str, string ignore = "_") {
	auto parsed = parseHexInt (str, ignore);
	return parsed.index == str.length;
}

/++ Returns true of the given string is a decimal number +/
pure bool isDecInt (string str, string ignore = "_") {
	auto parsed = parseDecInt (str, ignore);
	return parsed.index == str.length;
}

/++ Returns the remaining string after parsing a hexadecimal number +/
pure string consumeHexInt (string str, string ignore = "_") {
	auto parsed = parseHexInt (str, ignore);
	return str[parsed.index..$];
}

/++ Returns the remaining string after parsing a decimal number +/
pure string consumeDecInt (string str, string ignore = "_") {
	auto parsed = parseDecInt (str, ignore);
	return str[parsed.index..$];
}

/++ Returns the absolute value of a given integer +/
pure long abs (long v) {
	if (v >= 0)
		return v;
	else
		return -v;
}

unittest {
	static assert (intToHex (0xFF) == "FF");
	static assert (intToDec (-255) == "-255");
	static assert (hexToInt ("FF") == 0xFF);
	static assert (decToInt ("-255") == -255);
	static assert (isHexInt ("FF"));
	static assert (!isDecInt ("FF"));
	static assert (isDecInt ("42"));
	static assert (isHexInt ("42"));
	static assert (consumeHexInt ("0123456789abcdefgh") == "gh");
	static assert (consumeDecInt ("0123456789abcdefgh") == "abcdefgh");
	static assert (abs(10) == 10);
	static assert (abs(-10) == 10);
}

/++ Converts a given float to a decimal string +/
pure string floatToDec (real _f) {
	real f = _f;
	if (f !<>= 0)
		return "NaN";
	if (f < 0)
		return "-" ~ floatToDec (-f);
	if (f == real.infinity)
		return "infinity";
	if (f == 0.0)
		return "0.0";
	if (f < 0.001 || f >= 10000000) {
		int exponent = 0;
		while (f >= 10.0) {
			f /= 10.0;
			exponent++;
		}
		while (f < 1.0) {
			f *= 10.0;
			exponent--;
		}
		return floatToDec (f) ~ " E" ~ intToDec (exponent);
	}

	long mantissa = cast (long) f;
	f -= mantissa;
	
	string buffer = ".";
	while (f != 0 && buffer.length < real.dig) {
		f *= 10;
		buffer ~= intToDecDigit(cast (long) f);
		f -= cast (long) f;
	}
	buffer = intToDec (mantissa) ~ chomp (buffer ~ "0", cast(immutable(char))'0');
	return (buffer[$-1] == '.') ? buffer ~ "0" : buffer;
}

/++ Converts a given float to a hexadecimal string +/
pure string floatToHex (real _f) {
	real f = _f;
	if (f !<>= 0)
		return "NaN";
	if (f < 0)
		return "-" ~ floatToHex (-f);
	if (f == real.infinity)
		return "infinity";
	if (f == 0.0)
		return "0.0";
	
	if (f < 0.00390625 || f >= 0xffffffff) {
		int exponent = 0;
		while (f >= 16.0) {
			f /= 16.0;
			exponent++;
		}
		while (f < 1.0) {
			f *= 16.0;
			exponent--;
		}
		return floatToHex (f) ~ " E" ~ intToHex (exponent);
	}

	long mantissa = cast (long) f;
	f -= mantissa;
	
	string buffer = ".";
	while (f != 0 && buffer.length < (4*real.dig)/5) {
		f *= 16;
		buffer ~= intToHexDigit(cast (long) f);
		f -= cast (long) f;
	}
	buffer = intToHex (mantissa) ~ chomp (buffer ~ "0", cast(immutable(char))'0');
	return (buffer[$-1] == '.') ? buffer ~ "0" : buffer;
}

unittest {
	static assert (floatToDec (0.0) == "0.0");
	static assert (floatToDec (real.nan) == "NaN");
	static assert (floatToDec (real.infinity) == "infinity");
	static assert (floatToDec (-real.infinity) == "-infinity");
	static assert (floatToDec (3.1456) == "3.1456");
	static assert (floatToDec (-3.1456) == "-3.1456");
	static assert (floatToDec (1200000000000) == "1.2 E12");
	static assert (floatToDec (-0.000000003145) == "-3.145 E-9");

	static assert (floatToHex (0xff) == "FF.0");
}
