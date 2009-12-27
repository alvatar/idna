module pattern.iterator;

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
