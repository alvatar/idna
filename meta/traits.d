module meta.traits;

/// TODO: clean
template ElemType(T) {
	alias typeof((function() {
		foreach (elem; Init!(T)) return elem; assert(false);
	})()) ElemType;
}

template KeyType(T) {
	alias typeof((function() {
		foreach (key, elem; Init!(T)) return key; assert(false);
	})()) KeyType;
}

template assocArrayVal (AA) {
	alias typeof(AA.init.values[0]) assocArrayVal;
}

template assocArrayKey (AA) {
	alias typeof(AA.init.keys[0]) assocArrayKey;
}

template isCallableType(T) {
	const bool isCallableType = is( T == function )
		|| is( typeof(*T) == function )
		|| is( T == delegate )
		|| is( typeof(T.opCall) == function );
}

unittest {
	assert (is (assocArrayVal!(int[long]) == int));
	assert (is (assocArrayKey!(int[long]) == long));
}
