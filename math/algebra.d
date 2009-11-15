module math.algebra;

private import std.traits;

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Create immutable scalar from value
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
template iscalar(T, real value) {
	static if (is(typeof(T.ctFromReal!(value)) == T)) {
		immutable(T) iscalar = T.ctFromReal!(value);
	} else static if (is(typeof(T.fromReal(value)) == T)) {
		immutable(T) iscalar = T.fromReal(value);
	} else {
		immutable(T) iscalar = cast(T)value;
	}
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Convert to scalar
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
template scalar(T) {
	T scalar(S)(S value) {
		static if (is(T == S)) {
			return value;
		} else static if (is(typeof(T.fromReal(value)) == T)) {
			return T.fromReal(value);
		} else {
			return cast(T)value;
		}
	}
}

unittest {
	static assert( iscalar!(float,0) == 0 );
	static assert( iscalar!(int,2) == 2 );
	static assert( scalar!(int)(1.9) == 1.0 );
	static assert( scalar!(float)(0.999) == 0.999 );
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Creates an instance of the type
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
template makeInstance(T) {
	T makeInstance;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Checks whether the type supports multiplication, addition and subtraction.
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
template isRingType(T) {
	static if (
		is(typeof(T.init * T.init) : T) &&
		is(typeof(T.init + T.init) : T) &&
		is(typeof(T.init - T.init) : T) &&
		is(typeof(makeInstance!(T) *= T.init)) &&
		is(typeof(makeInstance!(T) += T.init)) &&
		is(typeof(makeInstance!(T) -= T.init))
	) {
		immutable(bool) isRingType = true;
	} else {
		immutable(bool) isRingType = false;
	}
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Checks whether the type is a ring type and supports also division
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
template isFieldType(T) {
	static if (
		isRingType!(T) &&
		is(typeof(T.init * T.init) : T) &&
		is(typeof(makeInstance!(T) *= T.init))
	) {
		immutable(bool) isFieldType = true;
	} else {
		immutable(bool) isFieldType = false;
	}
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Check whether the type is a vector
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
template isVectorType(T, int dim) {
	static if (
		is(typeof(T.dim)) &&
		is(typeof(T.dim == dim)) &&
		T.dim == dim
	) {
		immutable(bool) isVectorType = true;
	} else {
		immutable(bool) isVectorType = false;
	}
}

unittest {
	static assert(isRingType!(int));
	static assert(isRingType!(long));
	static assert( !isRingType!(Object) );
	// Is casted to int to perform operations:
	// cast(int)cast(ubyte)0u * cast(int)cast(ubyte)0u
	// static assert (isRingType!(ubyte));

	static assert(isFieldType!(float));
	static assert(isFieldType!(double));
	static assert(isFieldType!(real));
}
