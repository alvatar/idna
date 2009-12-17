module util.dynamic_class;

class DynamicMethodException: Exception {
  this(string msg) { super(msg); }
}

template MakeClassDynamic() {

	alias typeof(this) D;

	private {
		import std.variant;
		import std.conv;

		import util.container.HashMap;
	}

	alias Variant delegate(Variant[]) MethodType;
	alias HashMap!(string,MethodType) MethodsMap;

	private MethodsMap __dynamicMethods;

	MethodsMap __getDynamicMethods() {
		return __dynamicMethods;
	}

	MethodsMap __setDynamicMethods( MethodsMap funcs ) {
		return __dynamicMethods = funcs;
	}

	string[] __getDynamicMethodsNames() {
		// Note: improve implementation, extend Hashmap
		string[] result;
		foreach( f; __dynamicMethods ) {
			string key;
			if( __dynamicMethods.keyOf(f,key) )
				result ~= key;
		}
		return result;
	}

	void __bindMethod(
			Ret:Variant,
			Args:Variant[]
			)( string fname, Ret delegate(Args) f ) {

		if( __dynamicMethods is null ) {
			__dynamicMethods = new MethodsMap;
		}

		__dynamicMethods[fname] = f;
	}

	void __bindMethod(
			Ret,
			Args...
			)( string fname, Ret delegate(Args) f ) {

		if( __dynamicMethods is null ) {
			__dynamicMethods = new MethodsMap;
		}

		Variant vf(Variant[] iargs) {
			Args targs;
			debug if( iargs.length != targs.length )
				throw new Exception(
						"Incorrect number of arguments, expected: "
						~ to!(string)(targs.length)
						~ ", passed: "
						~ to!(string)(iargs.length)
						);
			else
				foreach( i, a; targs ) {
					targs[i] = iargs[i].get!(Args[i]);
				}
				static if( is( Ret == void ) ) {
					f(targs);
					return Variant(0);
				} else 
					return Variant( f(targs) );
		}

		__dynamicMethods[fname] = &vf;
	}

/******************* IMPLEMENTACION GENERICA: QUEDA CHEQUEOS
	void __bindMethod(T)( string fname, T t ) {

		if( __dynamicMethods is null ) {
			__dynamicMethods = new MethodsMap;
		}

		Variant vf(Variant[] iargs) {
			return t(iargs[0]);
		}

		__dynamicMethods[fname] = &vf;
	}

	void __unbindMethod(string fname) {
		__dynamicMethods.removeKey(fname);
	}

	bool __containsMethod(string fname) {
		return __dynamicMethods.containsKey(fname);
	}
*************************/

	/++
	 + Call statically (known name) a dynamically binded function
	 + Uses normal function call syntax
	 + 
	 + Examples:
	 + instance.func0();
	 + instance.func2( 1,2 );
	 + Bugs:
	 + Compiler doesn't currently understand variadic template for opDispatch
	 +/
	Variant opDispatch(string fname,Args...)(Args args) {
		debug {
			if( __dynamicMethods.containsKey( fname ) )
				return __dynamicMethods[fname]( variantArray(args) );
			else
				throw new DynamicMethodException (
						" Error calling dynamic method. Method "
						~ fname
						~ " has not been binded to class "
						~ typeof(this).stringof );
		} else {
			return __dynamicMethods[fname]( variantArray(args) );
		}
	}

	/++
	 + Call statically (known name) a dynamically binded function with
	 + Variant varargs, checked at runtime. Uses normal function call syntax
	 + 
	 + Examples:
	 + instance.func0();
	 + instance.func2( variantArray(1,2) );
	 +/
	Variant opDispatch(string fname,T : Variant[])(Variant[] args) {
		debug {
			if( __dynamicMethods.containsKey( fname ) )
				return __dynamicMethods[fname]( args );
			else
				throw new DynamicMethodException (
						" Error calling dynamic method. Method "
						~ fname
						~ " has not been binded to class "
					 	~ typeof(this).stringof );
		} else {
			return __dynamicMethods[fname]( args );
		}
	}

	Variant opIndex(string fname) {
		return __call(fname);
	}

	void opIndexAssign(Ret,Args...)(Ret delegate(Args) m, string fname) {
		__bindMethod(fname,m);
	}

	 /********************
	@property void opDispatch(string fname)(MethodType m) {
		this[fname] = m;
	}
	@property Variant opDispatch(string fname,Args...)(Args args)
		if(
			Args.length
			&& !( is(Args[0] == MethodType) && Args.length == 1)
			) {
		debug {
			if( __dynamicMethods.containsKey( fname ) )
				return __dynamicMethods[fname]( variantArray(args) );
			else
				throw new DynamicMethodException (
						" Error calling dynamic method. Method "
						~ fname
						~ " has not been binded to class "
						~ typeof(this).stringof );
		} else {
			return __dynamicMethods[fname]( variantArray(args) );
		}
		//this.__call(fname,args);
	}

	Variant opIndex(string fname) {
		return __call(fname);
	}

	void opIndexAssign(Ret,Args...)(Ret delegate(Args) m, string fname) {
		__bindMethod(fname,m);
	}
	***********************/

	 /++
	 + Call dynamically (unknown name) a dynamically binded function with
	 + templatized arguments, it takes care of conversion to Variants
	 +
	 + Examples:
	 + _ui.output.__call("foo",1.0,2.0);
	 +/
	Variant __call(
			Args...
			)(string fname, Args args) {
		debug {
			if( auto f = __dynamicMethods.containsKey( fname ) )
				return __dynamicMethods[fname]( variantArray(args[0..$]) );
			else
				throw new DynamicMethodException (
						" Error calling dynamic method. Method "
						~ fname
						~ " has not been binded to class "
					 	~ typeof(this).stringof );
		} else {
			return __dynamicMethods[fname]( variantArray(args[0..$]) );
		}
	}

	/++
	 + Call dynamically (unknown name) a dynamically binded function with
	 + Variant varargs, checked at runtime
	 +
	 + Examples:
	 + _ui.output.__call("foo",variantArray(1.0,2.0));
	 +/
	Variant __call(
			Args:Variant[]
			)(string fname, Args args) {
		debug {
			if( __dynamicMethods.containsKey( fname ) )
				return __dynamicMethods[fname]( args );
			else
				throw new DynamicMethodException (
						" Error calling dynamic method. Method "
						~ fname
						~ " has not been binded to class "
					 	~ typeof(this).stringof );
		} else {
			return __dynamicMethods[fname]( args );
		}
	}
}
