module meta.traits;

private {
	import meta.demangle; 
}

/++
 + For a given class type, returns the name of it's constructor,
 + prefixed by the fully qualified class name
 +/
template constructorNameOf (T)
{
	static assert (is (T == class), "constructorNameOf needs a class as parameter.");
	string constructorNameOf = toString (demangleType !(T), false, 0, 0) ~ ".__ctor";
}

/++
 + For a given class type, returns the name of it's destructor,
 + prefixed by the fully qualified class name
 +/
template destructorNameOf (T)
{
	static assert (is (T == class), "destructorNameOf needs a class as parameter.");
	string destructorNameOf = toString (demangleType !(T), false, 0, 0) ~ ".__dtor";
}

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

unittest {
	assert (is (assocArrayVal!(int[long]) == int));
}

template assocArrayKey (AA) {
	alias typeof(AA.init.keys[0]) assocArrayKey;
}

unittest {
	assert (is (assocArrayKey!(int[long]) == long));
}


template isCallableType(T) {
	const bool isCallableType = is( T == function )
		|| is( typeof(*T) == function )
		|| is( T == delegate )
		|| is( typeof(T.opCall) == function );
}
