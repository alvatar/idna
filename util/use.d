module util.use;

private {
	version( D_Version2 ) {
		import std.traits;
	} else {
		import tango.core.Traits : ParameterTypeTuple = ParameterTupleOf, ReturnType = ReturnTypeOf;
	}
}



private struct UseInStruct(T) {
	private {
		alias ParameterTypeTuple!(T.useInHandler) argsT;
		alias ReturnType!(T.useInHandler) retT;
		
		static assert (1 == argsT.length);
		retT delegate(argsT[0]) handler;
	}
	
	public {
		retT opIn(argsT[0] dg) {
			return handler(dg);
		}
		
		static if (is(argsT[0] Func == delegate)) {
			private alias ParameterTypeTuple!(argsT[0]) FuncParams;
			
			retT opIn(retT function(FuncParams) fn) {
				// inline delegates crash DMD 1.020 here :/
				struct Foo {
					retT func(FuncParams params) {
						return fn(params);
					}
					
					retT function(FuncParams) fn;
				}
				
				Foo foo = void;
				foo.fn = fn;
				return handler(&foo.func);
			}
		}
	}
}


/**
	Provides controlled execution of code blocks.

	Usage:
		use (someObject) in [(args)] {
		};
	
	Result:
		calls someObject.useInHandler, giving it the provided delegate as an argument.
		
	Example:
		class SomeClass {
			void useInHandler(int delegate(int x, float y) dg) {
				writefln("pre");
				writefln("result: ", dg(3, 1.33));
				writefln("post");
			}
		}

		auto sc = new SomeClass;
		use (sc) in (int x, float y) {
			writefln("x inside: %s  y inside: %s", x, y);
			return x * x;
		};
*/

UseInStruct!(T) use(T)(ref T x) {
	static if (is(T : Object)) {
		assert (x !is null);
	}
	
	UseInStruct!(T) s = void;
	s.handler = &x.useInHandler;
	return s;
}
