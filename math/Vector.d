module math.Vector;

private {
	import std.conv;
	import std.stdio;
	import std.traits;
	import std.math : isNaN;

	import math.Algebra;
	import meta.typetuple;
	import meta.tuplecons;
	import meta.string;
}


/++
 + Create a vector specifying the type
 +/
TVector!(T,U[].length) Vector(T, U...)() {
	ReturnType!(Vector) result;
	result.array = [U];
	return result;
}

/++
 + Create a vector deducing all values as integers
 +/
template Vector(U...)
	if( allSatisfy!( isIntegral, typeof(U)) && !is(U[0]==typeof(U)[0]) ) {

        TVector!(int,U[].length) Vector() {
                ReturnType!(Vector) result;
                result.array = [U];
                return result;
        }
}

/++
 + Create a vector deducing all values as reals
 +/
template Vector(U...)
	if( allSatisfy!( isFloatingPoint, typeof(U)) && !is(U[0]==typeof(U)[0]) ) {

        TVector!(real,U[].length) Vector() {
                ReturnType!(Vector) result;
                result.array = [U];
                return result;
        }
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Template class for n-dimensional vectors
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
struct TVector( _type, uint _dim ) {

	alias _type type;
	static immutable(uint) dim = _dim;

	static assert( _dim > 1, "Vector dimension should be at least 2" );
	static assert(
		isRingType!(type),
		"Vector type should be a ring time, i.e. it should allow addition,
		substraction and multiplication"
		);

	union {
		type[dim] array;
		alias BuildTuple!(type, dim) VectorTuple;
		VectorTuple tuple;
		static if( dim >= 1 && dim <= 4 ) {
			struct {
				static if (dim >= 1) union { type x; type r; }
				static if (dim >= 2) union { type y; type g; }
				static if (dim >= 3) union { type z; type b; }
				static if (dim >= 4) union { type w; type a; }
			}
		}
	}

	// Predefined vector constants
	/*static immutable Vector one = { array : TupleToArray!( With!(type).BuildValueTuple!(1,dim) ) };*/
	/*static immutable TVector zero =
		{ array : cast(type[dim])[ With!(type).BuildValueTuple!(immutable_scalar!(type,0),dim) ] };*/
	mixin( GArrayStatic!(type, "zero").Repeat(iscalar!(type,0), dim) );
	mixin( GArrayStatic!(type, "one").Repeat(iscalar!(type,1), dim) );

	static if( dim >= 1 )
		mixin( GArrayStatic!(type, "unitX")
				.RepeatAndSpecifyOne(iscalar!(type,0), dim, iscalar!(type,1), 0) );
	static if( dim >= 2 )
		mixin( GArrayStatic!(type, "unitY")
				.RepeatAndSpecifyOne(iscalar!(type,0), dim, iscalar!(type,1), 1) );
	static if( dim >= 3 )
		mixin( GArrayStatic!(type, "unitZ")
				.RepeatAndSpecifyOne(iscalar!(type,0), dim, iscalar!(type,1), 2) );
	static if( dim >= 4 )
		mixin( GArrayStatic!(type, "unitW")
				.RepeatAndSpecifyOne(iscalar!(type,0), dim, iscalar!(type,1), 3) );

	// TODO: More n-dimensional unit vectors

	/++
	 + Check the vector's integrity
	 +/
	bool check() {
		string codegen() {
			string result;
			for( int i=0; i<this.array.length; i++ ) {
				result ~= "if ( isNaN(this.array[" ~ ctToString(i) ~ "]) ) return false;\n";
			}
			result ~= "return true;";
			return result;
		}

		mixin(codegen());
	}

	/++
	 + Set the vector
	 +/
	TVector set( TVector v ) {
		string codegen() {
			static assert( dim == v.dim );
			string result;
			for( int i=0; i<this.array.length; i++ ) {
				result ~= "this.array[" ~ ctToString(i) ~ "] = scalar!(type)(v.array[" ~ ctToString(i) ~ "]);\n";
			}
			result ~= "return this;";
			return result;
		}

		mixin(codegen());
	}

	/++
	 + opCall: assign values
	 +/
	TVector opCall(R...)( R v ) {
		string codegen() {
			string result;

			// Use the minimum dimension among the two involved vectors
			static if( dim < v.length )
				int mindim = dim;
			else
				int mindim = v.length;

			for( int i=0; i<mindim; i++ ) {
				result ~= "array[" ~ ctToString(i) ~ "] = scalar!(type)(v[" ~ ctToString(i) ~ "]);\n";
			}
			result ~= "return this;";
			return result;

		}

		mixin(codegen());
	}
}


unittest {
	// Correct creation tests
	static assert( !__traits(compiles, TVector!(int,0)) );
	alias TVector!(int, 3) i3;
	static assert( i3.sizeof == 3 * int.sizeof );
	static assert( __traits(compiles, i3.r = 1) );
	static assert( __traits(compiles, i3.g = 1) );
	static assert( __traits(compiles, i3.b = 1) );
	static assert( !__traits(compiles, i3.a = 1) );
	static assert( __traits(compiles, i3.x = 1) );
	static assert( __traits(compiles, i3.y = 1) );
	static assert( __traits(compiles, i3.z = 1) );
	static assert( !__traits(compiles, i3.w = 1) );
	alias TVector!(int, 10) i10;
	static assert( i10.sizeof == 10 * int.sizeof );
	static assert( !__traits(compiles, i10.x = 1) );
	TVector!(double,4) vec4i;
	assert( vec4i.one == [1.0,1.0,1.0,1.0] );
	auto inplace = Vector!(111,222,333,444);
	auto inplace2 = Vector!(-11.1234567891,0.1,-0.1,999999.999999);
	auto inplace3 = Vector!(double, 0.1,0.1,0.1,0.1);
	auto inplace4 = Vector!(int, 0,0,0,0);

	// Operations
	inplace( 0,0 );
	writeln(inplace.array);
}
