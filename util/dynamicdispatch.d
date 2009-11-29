module util.dynamicdispatch;

template MakeDynamicDispatch() {

	private {
		import std.variant;
		import util.container.HashMap;
	}

	alias Variant delegate(Variant[]) VariantDelegate;
	alias HashMap!(string,VariantDelegate) FunctionsMap;
	//alias VariantDelegate[string] FunctionsMap;

	private FunctionsMap __dynamicFunctions;

	FunctionsMap getDynamicFunctions() {
		return __dynamicFunctions;
	}

	FunctionsMap setDynamicFunctions( FunctionsMap funcs ) {
		return __dynamicFunctions = funcs;
	}

	string[] getDynamicFunctionsNames() {
		// Note: terrible implementation, extend Hashmap
		string[] result;
		foreach( f; __dynamicFunctions ) {
			string key;
			if( __dynamicFunctions.keyOf(f,key) )
				result ~= key;
		}
		return result;
	}

	Variant opDispatch(string fname)(Variant[] args...) {
		return __dynamicFunctions[fname]( args );
	}

	Variant opCall(
			Args...
			)(string fname, Args args) {
		debug {
			if( __dynamicFunctions.containsKey( fname ) )
				return __dynamicFunctions[fname]( variantArray(args[0..$]) );
			else
				assert( false,
						"Function "
						~ fname
						~ " has not been attached to "
						~ typeof(this).stringof );
		} else {
			return __dynamicFunctions[fname]( variantArray(args[0..$]) );
		}
	}

	Variant opCall(
			Args:Variant[]
			)(string fname, Args args) {
		debug {
			if( __dynamicFunctions.containsKey( fname ) )
				return __dynamicFunctions[fname]( args );
			else
				assert( false,
						"Function "
						~ fname
						~ " has not been attached to "
						~ typeof(this).stringof );
		} else {
			return __dynamicFunctions[fname]( args );
		}
	}

	void attachDynamicFunction(
			Ret:Variant,
			Args:Variant[]
			)( string fname, Ret delegate(Args) f ) {

		if( __dynamicFunctions is null ) {
			__dynamicFunctions = new FunctionsMap;
		}

		__dynamicFunctions[fname] = f;
	}

	void attachDynamicFunction(
			Ret,
			Args...
			)( string fname, Ret delegate(Args) f ) {

		if( __dynamicFunctions is null ) {
			__dynamicFunctions = new FunctionsMap;
		}

		Variant vf(Variant[] iargs) {
			Args targs;
			debug if( iargs.length != targs.length )
				throw new Exception("Bad number of arguments");
			foreach( i, a; targs ) {
				targs[i] = iargs[i].get!(Args[i]);
			}
			return Variant( f(targs) );
		}

		__dynamicFunctions[fname] = &vf;
	}
}
