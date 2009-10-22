module meta.tuplecons;

private {
	import std.conv;
	import std.typetuple;
	import std.traits;

	import meta.string;
	alias TypeTuple Tuple;
}


/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Generate code for an array variable
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
template GArray(T, string name) {

	/++
	 + Create a list of equal values
	 +/
	string Repeat( T value, int count ) {
		string array = T.stringof ~ "[" ~ "] " ~ name ~ " = [";
		for( int i=0; i<(count-1); ++i) {
			array ~= (ctToString(value) ~ ",");
		}
		array ~= (ctToString(value) ~ "];");
		return array;
	}

	/++
	 + Create a list of equal values with a specific position with a different value
	 +/
	string RepeatAndSpecifyOne( T value
			, int count
			, T spec_value
			, int spec_index ) {
		string array = T.stringof ~ "[" ~ "] " ~ name ~ " = [";
		for( int i=0; i<count; ++i) {
			if( i == spec_index ) {
				array ~= ctToString(spec_value);
			} else {
				array ~= ctToString(value);
			}
			if( i <(count-1) ) array ~= ",";
		}
		array ~= "];";
		return array;
	}
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Generate code for a static array variable
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
template GArrayStatic(T, string name) {

	/++
	 + Create a list of equal values
	 +/
	string Repeat( T value, int count ) {
		string array = "static " ~ T.stringof ~ "[" ~ "] " ~ name ~ " = [";
		for( int i=0; i<(count-1); ++i) {
			array ~= (ctToString(value) ~ ",");
		}
		array ~= (ctToString(value) ~ "];");
		return array;
	}

	/++
	 + Create a list of equal values with a specific position with a different value
	 +/
	string RepeatAndSpecifyOne( T value
			, int count
			, T spec_value
			, int spec_index ) {
		string array = "static " ~ T.stringof ~ "[" ~ "] " ~ name ~ " = [";
		for( int i=0; i<count; ++i) {
			if( i == spec_index ) {
				array ~= ctToString(spec_value);
			} else {
				array ~= ctToString(value);
			}
			if( i <(count-1) ) array ~= ",";
		}
		array ~= "];";
		return array;
	}
}

unittest {
}

template TupleToArray(T...) {
	const typeof(T[0])[T[].length] result = cast(typeof(T[0])[T[].length])([T]);
}

template With(T) {
	template BuildValueTuple(T value, int count) {
		static if (!count) {
			alias Tuple!() BuildValueTuple;
		} else {
			alias Tuple!(value, BuildValueTuple!(value,count-1)) BuildValueTuple;
		}
	}
}

