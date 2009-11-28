module util.dynamicdispatch;

private{
	import std.variant;

	import util.container.HashMap;
}
	
alias Variant delegate(Variant[]) VariantDelegate;
alias HashMap!(string,VariantDelegate) FunctionsMap;
//alias VariantDelegate[string] FunctionsMap;

template MakeDynamicDispatch() {

	private import std.variant;

	private FunctionsMap _dynamicFunctions;

	FunctionsMap getDynamicFunctions() {
		return _dynamicFunctions;
	}

	FunctionsMap setDynamicFunctions( FunctionsMap funcs ) {
		return _dynamicFunctions = funcs;
	}

	string[] getDynamicFunctionsNames() {
		// Note: terrible implementation, extend Hashmap
		string[] result;
		foreach( f; _dynamicFunctions ) {
			string key;
			if( _dynamicFunctions.keyOf(f,key) )
				result ~= key;
		}
		return result;
	}

	void opCall(T...)(string fname, T args) {
		try {
			_dynamicFunctions[fname]( variantArray(args[0..$]) );
		} catch( Throwable e ) {
			assert( false,
					"Function "
					~ fname
					~ " has not been attached to "
					~ typeof(this).stringof );
		}
	}

	void addDynamicFunction(Ret,Args...)( string fname, Ret delegate(Args) f ) {

		if( _dynamicFunctions is null ) {
			_dynamicFunctions = new FunctionsMap;
		}

		Variant vf(Variant[] iargs) {
			Args targs;
			foreach( i, a; targs ) {
				targs[i] = iargs[i].get!(Args[i]);
			}
			return Variant( f(targs) );
		}

		_dynamicFunctions[fname] = &vf;
	}
}
