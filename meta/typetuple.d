module meta.typetuple;

private import std.typetuple;


template BuildTuple(T, int count) {
	
	static if (!count) {
		alias TypeTuple!() BuildTuple;
	} else {
		alias TypeTuple!(T, BuildTuple!(T, count-1)) BuildTuple;
	}
}
