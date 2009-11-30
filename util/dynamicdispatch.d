module util.dynamicdispatch;

template MakeDynamicDispatch() {

	private {
		import std.variant;

		import meta.numeric;
		import util.container.HashMap;
	}

	alias Variant delegate(Variant[]) VariantDelegate;
	alias HashMap!(string,VariantDelegate) MethodsMap;

	private MethodsMap __dynamicMethods;

	MethodsMap __getDynamicMethods() {
		return __dynamicMethods;
	}

	MethodsMap __setDynamicMethods( MethodsMap funcs ) {
		return __dynamicMethods = funcs;
	}

	string[] __getDynamicMethodsNames() {
		// Note: terrible implementation, extend Hashmap
		string[] result;
		foreach( f; __dynamicMethods ) {
			string key;
			if( __dynamicMethods.keyOf(f,key) )
				result ~= key;
		}
		return result;
	}

	Variant opDispatch(string fname)(Variant[] args...) {
		debug {
			try {
				return __dynamicMethods[fname]( args );
			} catch (Exception e) {
				assert(0, " Error calling dynamic method. Method "
							~ fname
							~ " has not been attached to class "
					 		~ typeof(this).stringof );
			}
		} else {
			return __dynamicMethods[fname]( args );
		}
	}

	Variant __call(
			Args...
			)(string fname, Args args) {
		debug {
			if( __dynamicMethods.containsKey( fname ) )
				return __dynamicMethods[fname]( variantArray(args[0..$]) );
			else
				assert( false,
						"Method "
						~ fname
						~ " has not been attached to "
						~ typeof(this).stringof );
		} else {
			return __dynamicMethods[fname]( variantArray(args[0..$]) );
		}
	}

	Variant __call(
			Args:Variant[]
			)(string fname, Args args) {
		debug {
			if( __dynamicMethods.containsKey( fname ) )
				return __dynamicMethods[fname]( args );
			else
				assert( false,
						"Method "
						~ fname
						~ " has not been attached to "
						~ typeof(this).stringof );
		} else {
			return __dynamicMethods[fname]( args );
		}
	}

	void __attachMethod(
			Ret:Variant,
			Args:Variant[]
			)( string fname, Ret delegate(Args) f ) {

		if( __dynamicMethods is null ) {
			__dynamicMethods = new MethodsMap;
		}

		__dynamicMethods[fname] = f;
	}

	void __attachMethod(
			Ret,
			Args...
			)( string fname, Ret delegate(Args) f ) {

		if( __dynamicMethods is null ) {
			__dynamicMethods = new MethodsMap;
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

		__dynamicMethods[fname] = &vf;
	}

	bool __detachMethod( string fname ) {
		return __dynamicMethods.removeKey(fname);
	}

	bool __containsMethod( string fname ) {
		return __dynamicMethods.containsKey(fname);
	}
}
