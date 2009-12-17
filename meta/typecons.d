module meta.typecons;

private {
	import std.conv;
	import std.typetuple;
	import std.traits;

	import meta.numeric;
	import meta.string_funcs;
	alias TypeTuple Tuple;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Type creation
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
/++
 + Build a values tuple
 +/
template BuildValueTuple(value, int count) {
	static if (!count)
		alias Tuple!() BuildValueTuple;
	else
		alias Tuple!(typeof(value), BuildValueTuple!(value,count-1)) BuildValueTuple;
}

/++
 + Build a tuple repeating a type
 +/
template RepeatType(T, int count) {
	static if
		(!count) alias Tuple!() RepeatType;
	else
		alias Tuple!(T, RepeatType!(T, count-1)) RepeatType;
}

/++
 + Build a struct with given members
 +/
typeof(return) structtuple(T ...)(T t) {
	return Stuple!(UnstaticAll!(T))(t);
}

private template StructTupleMembers(T...) {
	static if (T.length) {
		const int id=T[0..$-1].length;
		const string str=StructTupleMembers!(T[0..$-1]).str~"Unstatic!(T["~id.stringof~"]) _"~id.stringof~"; ";
	} else const string str="";
}

private struct Stuple(T...) {
	alias Tuple!() StupleMarker;
	mixin(StructTupleMembers!(T).str);

	// TODO: generalizable?
	string Format(T...)(T t) {
		string res;
		foreach (i, elem; t) {
			alias typeof(elem) E;
			static if (is(E: string)) res ~= elem; else
				//static if (isPointer!(E)) res ~= fmtPointer(cast(void*) elem); else
					static if (isArray!(E)) {
						res ~= "[";
						foreach (i2, v; elem) {
							res ~= Format(v);
							if (i2 < elem.length - 1) res ~= ", ";
						}
						res ~= "] ";
					} else static if (is(typeof(elem.keys))) {
							res ~= "[";
							bool first=true;
							foreach (key, value; elem) {
								if (first) first=false;
								else res ~= ", ";
								res ~= Format(key, ": ", value);
							}
							res ~= "] ";
						} else static if (is(typeof(elem.toString()): string)) {
								res ~= elem.toString();
							} else static if (is(E: long)) res ~= fmtLong(elem); else
									static if (is(E: real)) res ~= fmtReal(elem); else
										res ~= "[Unsupported: "~E.stringof~"] ";
		}
		return res;
	}

	string toString() {
		string res="stuple(";
		foreach (id, entry; this.tupleof) {
			if (id) res ~= ", ";
			res ~= Format(entry);
		}
		return res~")";
	}
	
	
	Ret opShr(Ret, Par ...)(Ret delegate(Par) dg) {
		return dg(this.tupleof);
	}
	
	Ret opShr(Ret, Par ...)(Ret function(Par) dg) {
		return dg(this.tupleof);
	}
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Type conversions
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
/++
 + Create tuple from array
 +/
template TupleToArray(T...) {
	immutable typeof(T[0])[T[].length] result = cast(typeof(T[0])[T[].length])([T]);
}

/++
 + Delegate to function conversion without extra allocations
 +/
pure Ret delegate(Par) functionToDelegate(Ret, Par ...)(Ret function(Par) func) {
	struct Foo {
		void* _placeholder;
		static assert (Foo.sizeof == typeof(func).sizeof);
		Ret wrapper(Par p) {
			return (cast(Ret function(Par))this)(p);
		}
	}
	return &(cast(Foo*)cast(void*)func).wrapper;
}

/++
 + Build a struct with members of type T from a tuple U, and assign values
 +/
typeof(return) toTStuple(T, U...)(U u) {
	Stuple!(Repeat!(T, U.length)) res = void;
	foreach (i, v; u)
		res.tupleof[i] = cast(T) v;
	return res;
}

/++
 + Remove static qualifier
 +/
template Unstatic(T){
	alias T Unstatic;
}
template Unstatic(T: T[]){
	alias T[] Unstatic;
}
template UnstaticAll(T ...){
	static if (T.length > 1) {
		alias Tuple!(UnstaticAll!(T[0..$-1]), Unstatic!(T[$-1])) UnstaticAll;
	} else {
		alias Unstatic!(T[0]) UnstaticAll;
	}
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Strings for code generation
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
/++
 + Generates name[0],name[1],name[2]...name[n] from (name,n)
 +/
string indexedItemsString(string thingyName, int num) {
	string res;
	for (int i = 0; i < num; ++i) {
		if (i > 0) res ~= `,`;
		res ~= thingyName ~ `[` ~ ctToString(i) ~ `]`;
	}
	return res;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Code generation
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
/++
 + Generate code for an array variable
 +/
template GArray(T, string name) {

	/++
	 + Create a list of equal values
	 +/
	pure string Repeat( T value, int count ) {
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
	pure string RepeatAndSpecifyOne( T value
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

/++
 + Generate code for a static array variable
 +/
template GArrayStatic(T, string name) {

	/++
	 + Create a list of equal values
	 +/
	pure string Repeat( T value, int count ) {
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
	pure string RepeatAndSpecifyOne( T value
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

/+
 + Generate code for a Fruct (iteration proxy)
 +
 + Example:
 + private int _edgeHEdges(Element* first, int delegate(ref Element*, ref bool doMore) dg) {
 +     // Iteration is performed here. Fruct will create the necessary proxy
 +     bool doMore = first.doMore;
 +     for (Element* cur = first.next; cur != first; cur = cur.next) {
 +         if (auto r = dg(cur, doMore)) {
 +             return r;
 +         }
 +         doMore ^= cur.hasMore;
 +     }
 +     return 0;
 + }
 + mixin createFructIterator!(`edgeHEdges`);
 +/
template GFructIterator(string name) {
	private {
		mixin(`
			static if (!is(typeof(this._`~name~`))) {
				static assert (false, "class `
					~typeof(this).stringof
					~` does not contain a function _`
					~name~` required for the fruct");
			} else {
				mixin GFructIteratorImpl!(name);
			}
		`);
	}

	mixin(`_Fruct `~name~`(_Params[0..$-1] params) {
		return _Fruct(this, params);
	}`);
}

private template GFructIteratorImpl(string name) {
	mixin("alias ParameterTupleType!(this._"~name~") _Params;");
	alias typeof(this) _ThisType;
	
	static int function(_Params) _getIterFunc() {
		return mixin("&_ThisType._" ~ name);
	}
	
	struct _Fruct {
		_ThisType				_this;
		_Params[0..$-1]	params;

		int opApply(_Params[$-1] dg) {
			int delegate(_Params) handler;
			handler.funcptr = _getIterFunc;
			handler.ptr = cast(void*)_this;
			return handler(params, dg);
		}
	}
}

/++
 + Apply a function to each one of the input.params or its members (accessed through
 + `semantic`)
 +
 + Example:
 + applyEach(input.params).member!(`semantic`) >> (string name, int idx) {
 + }
 + applyEach(input.params) >> (string name, int idx) {
 + }
 +/
typeof(return) applyEach(Arg)(Arg[] args) {
	return ApplyEachProxy!(Arg)(args);
}

private struct ApplyEachProxy(Arg, string sc=``) {

	Arg[] args;
	
	void opShr(Ret, Par ...)(Ret delegate(Par) dg) {
		static if (1 == Par.length) {
			foreach (a; args) {
				mixin(`dg(a` ~ sc ~ `);`);
			}
		} else {
			foreach (a; args) {
				mixin(`dg(a` ~ sc ~ `.tupleof);`);
			}
		}
	}
	
	ApplyEachProxy!(Arg, sc~`.`~mname) member(string mname)() {
		return ApplyEachProxy!(Arg, sc~`.`~mname)(this.args);
	}
}

/++
 + Get access (through `semantic`) to all members of an iterable object (one that defines opApply)
 +
 + Example:
 + foreach (name, idx; eachMember!(`semantic`)(input.params)) {
 + }
 +/
template eachMember(string membername) {
	typeof(return) eachMember(Iterable)(Iterable it) {
		return EachMemberProxy!(membername, Iterable)(it);
	}
}

private struct EachMemberProxy(string mname, Iterable) {
	Iterable it;
	
	static if (is(typeof(it.opApply))) {
		static assert (false, `TODO`);
	} else {
		mixin(`alias typeof(Iterable.init[0].` ~ mname ~ `) IterType;`);
	}
	alias typeof(IterType.tupleof) IterTypeTupleOf;

	mixin(`int opApply(int delegate(` ~ indexedItemsString("ref IterTypeTupleOf", IterTypeTupleOf.length) ~ `) dg) {
		foreach (ref i; it) {
			if (auto r = dg(i.`~mname~`.tupleof)) return r;
		}
		return 0;
	}`);
}
