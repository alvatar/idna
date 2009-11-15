module math.vector;

private {
	import std.conv;
	import std.stdio;
	import std.traits;
	import std.math : isNaN, sqrt, abs;

	import math.algebra;
	import meta.typetuple;
	import meta.tuplecons;
	import meta.stringfuncs;
	import meta.numeric;
}

/++
 + Create a vector specifying the type
 +/
TVector!(T,U[].length) Vector(T, U...)() {
	ReturnType!(Vector) result;
	static if( is(typeof([U]) == T[U[].length] ) ) {
		result.array = [U];
	} else {
		result.array = cast(T[])[U];
	}
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

/++
 + Check whether is a vector or not
 +/
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

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Template class for n-dimensional vectors
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
struct TVector( _type, int _dim ) {

	alias _type type;
	static immutable(int) dim = _dim;

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

	/++
	 + Check the vector's integrity
	 +/
	immutable(bool) check() {
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

			// Generate assert in debug
			debug {
				result ~= "assert( v.check() );\n";
			}

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
	static TVector opCall(R...)( R values ) {
		string codegen() {
			string result;

			// Use the minimum dimension among the two involved vectors
			static if( dim < values.length ) {
				int mindim = dim;
			} else {
				int mindim = values.length;
				int zerofill = dim - mindim;
			}

			// Generate assert in debug
			debug {
				result ~= "assert( ";
				for( int i=0; i<(mindim-1); i++ ) {
					result ~= "!isNaN(values[" ~ ctToString(i) ~ "]) && ";
				}
				result ~= "!isNaN(values[" ~ ctToString(mindim-1) ~ "]) );\n";
			}

			result ~= "TVector v = void;\n";
			for( int i=0; i<mindim; i++ ) {
				result ~= "v.array[" ~ ctToString(i) ~ "] = scalar!(type)(values[" ~ ctToString(i) ~ "]);\n";
			}
			for( int i=0; i<zerofill; i++ ) {
				result ~= "v.array[" ~ ctToString(i+mindim) ~ "] = scalar!(type)(0);\n";
			}

			result ~= "return v;";
			return result;

		}

		mixin(codegen());
	}

	/++
	 + opIndex: assign values
	 +/
	TVector opIndex(R...)( R values ) {
		string codegen() {
			string result;

			// Use the minimum dimension among the two involved vectors
			static if( dim < values.length )
				int mindim = dim;
			else
				int mindim = values.length;

			// Generate assert in debug
			debug {
				result ~= "assert( ";
				for( int i=0; i<(mindim-1); i++ ) {
					result ~= "!isNaN(values[" ~ ctToString(i) ~ "]) && ";
				}
				result ~= "!isNaN(values[" ~ ctToString(mindim-1) ~ "]) );\n";
			}

			for( int i=0; i<mindim; i++ ) {
				result ~= "array[" ~ ctToString(i) ~ "] = scalar!(type)(values[" ~ ctToString(i) ~ "]);\n";
			}
			result ~= "return this;";
			return result;

		}

		mixin(codegen());
	}

	/++
	 + toString: conversion to string
	 +/
	string toString() {
		string codegen() {
			string result = `string result = "[" `;
			for( int i=0; i<(dim-1); i++ ) {
				result ~= `~ to!(string)(array[` ~ ctToString(i) ~ `]) ~ "," `;
			}
			result ~= `~ to!(string)(array[` ~ ctToString(dim-1) ~ `]) `;
			result ~= `~ "]"; return result;`;
			return result;

		}

		mixin(codegen());
	}
	
	/++
	 + Basic arithmetic operators
	 +/
	private template opXAssign( string op ) {
		void opXAssign(T)(T rhs) {

			string codegen() {
				string result;
				debug result ~= "assert( check() );\n";
				// If already defined from the other type
				result ~= "static if( is(typeof(rhs.opVecMul_r(*this)) : Vector) ) {\n";
				result ~= "    *this = rhs.opVecMul_r(*this);\n";
				// If Vector type
				result ~= "} else static if (isVectorType!(T, dim)) {\n";
				debug result ~= "    debug assert( rhs.check() );\n";
				for( int i=0; i<(dim-1); i++ ) {
					result ~= "    array[" ~ ctToString(i) ~ "] = array[" ~ ctToString(i)
						~ "] " ~ op ~ " rhs.array[" ~ ctToString(i) ~ "];\n";
				}
				result ~= "    array[" ~ ctToString(dim-1) ~ "] = array[" ~ ctToString(dim-1)
					~ "] " ~ op ~ " rhs.array[" ~ ctToString(dim-1) ~ "];\n";
				// If primitive type
				result ~= "} else {\n";
				debug result ~= "    debug assert( !isNaN(rhs) );\n";
				for( int i=0; i<(dim-1); i++ ) {
					result ~= "    array[" ~ ctToString(i) ~ "] = array[" ~ ctToString(i)
						~ "] " ~ op ~ " rhs;\n";
				}
				result ~= "    array[" ~ ctToString(dim-1) ~ "] = array[" ~ ctToString(dim-1)
					~ "] " ~ op ~ " rhs;\n";
				result ~= "}";
				return result;
			}
			mixin( codegen() );
		}
	}
	
	private template opX( alias op ) {
		TVector opX(T)(T rhs) {
			auto res = this;
			res.opXAssign!(op)(rhs);
			return res;
		}
	}

	alias opXAssign!("+") opAddAssign;
	alias opXAssign!("-") opSubAssign;
	alias opXAssign!("*") opMulAssign;
	alias opXAssign!("/") opDivAssign;

	alias opX!("+") opAdd;
	alias opX!("-") opSub;
	alias opX!("*") opMul;
	alias opX!("/") opDiv;

	/+
	 + Length of the vector
	 +/
	immutable(type) length() {
		string codegen() {
			string result = `sqrt( scalar!(real)(`;
			for( int i=0; i<(dim-1); i++ ) {
				result ~= `array[` ~ ctToString(i) ~ `] * array[` ~ ctToString(i) ~ `] + `;
			}
			result ~= `array[` ~ ctToString(dim-1) ~ `] * array[` ~ ctToString(dim-1) ~ `]) )`;
			result = `return scalar!(type)( ` ~ result ~ ` );`;
			return result;

		}

		mixin(codegen());
	}

	/+
	 + Squared length of the vector
	 +/
	type sqLength() {
		string codegen() {
			string result;
			for( int i=0; i<(dim-1); i++ ) {
				result ~= `array[` ~ ctToString(i) ~ `] * array[` ~ ctToString(i) ~ `] + `;
			}
			result ~= `array[` ~ ctToString(dim-1) ~ `] * array[` ~ ctToString(dim-1) ~ `]`;
			result = `return ` ~ result ~ `;`;
			return result;

		}

		mixin(codegen());
	}

	/++
	 + Normalize the vector
	 +/
	TVector normalize(bool fast = false)() {
		static if( fast ) {
			float invSqrt(float x) {
				float xhalf = 0.5f * x;
				int i = *cast(int*)&x;
				i = 0x5f375a86 - (i >> 1);
				x = *cast(float*)&i;
				x = x*(1.5f - xhalf * x * x);
				return x;
			}
			type inv = scalar!(type)( invSqrt(scalar!(float)(sqLength)) );
			this *= inv;
		} else static if( isFloatingPoint!(type) ) {
			immutable(type) len = length();
			type inv = scalar!(type)(iscalar!(type, 1) / len);
			this *= inv;
		} else static if( isIntegral!(type) ) {
			static assert( false, "Normalize is not defined for integral types" );
		} else {
			immutable(type) len = length();
			this /= len;
		}
		return this;
	}

	/++
	 + Check whether it is an unit vector
	 +/
	bool isUnit() {
		return abs(scalar!(real)(sqLength()) - 1.0) < real.epsilon;
	}
}

/+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ Free functions
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
/++
 + Create normalized vector from another one
 +/
pure static T normalized( bool fast = true, T )(T v) {
	Vector res = v;
	v.normalize();
	return res;
}

/++
 + Cross product (defined for 3 and 7 dimensions)
 +/
pure static T cross(T)(T a, T b) {
	static assert( (a.dim == 3 && b.dim == 3) || (a.dim == 7 && b.dim == 7)
		, "Cross product is only mathematically defined for
		pairs of Vectors of dimension 3 and 7" );
	//debug assert (a.check() && b.check());
	T result;
	result.x = a.y * b.z - b.y * a.z;
	result.y = a.z * b.x - b.z * a.x;
	result.z = a.x * b.y - b.x * a.y;
	return result;
}

/++
 + Dot product
 +/
pure static T.type dot(T)(T a, T b) {
	alias T.dim dim;
	string codegen() {
		string result;
		//debug result ~= "assert( a.check() && b.check() );\nreturn ";
		debug result ~= "return ";
		for( int i=0; i<(dim-1); i++ ) {
			result ~= "a.array[" ~ ctToString(i) ~ "] * b.array[" ~ ctToString(i) ~ "] + ";
		}
		result ~= "a.array[" ~ ctToString(dim-1) ~ "] * b.array[" ~ ctToString(dim-1) ~ "]";
		result ~= ";";
		return result;
	}

	mixin(codegen());
}

/++
 + Create a bidimensional vector rotated 90º
 +/
static T rotatedHalfPi(T)(T v) {
	static assert( v.dim == 2 );
	debug assert( v.check() );

	T res = void;
	res.x = -v.y;
	res.y = v.x;
	return res;
}

/++
 + Create a bidimensional vector rotated -90º
 +/
static T rotatedMinusHalfPi(T)(T v) {
	static assert( v.dim == 2 );
	debug assert( v.check() );

	T res = void;
	res.x = v.y;
	res.y = -v.x;
	return res;
}


unittest {
	// Correct creation tests
	alias TVector!(int, 3) i3;
	static assert( !__traits(compiles, TVector!(int,0)) );
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
	auto inplace = Vector!(111,222,333);
	auto inplace2 = Vector!(-11.1234567891,0.1,-0.1,999999.999999);
	auto inplace3 = Vector!(double, 0.1,0.1,0.1,0.1);
	auto inplace4 = Vector!(int, 0,0,0,0);

	// Operations
	alias TVector!(double, 6) vec6d;
	auto withopcall = vec6d(1,2,2,3);
	assert( withopcall.toString == Vector!(double, 1,2,2,3,0,0).toString );
	inplace[ 0,0 ];
	inplace[ 2,2,2,2,2,2,2,2,2,2,2 ];
	assert( inplace.toString == "[2,2,2]" );
	assert( Vector!(3,4).length == 5 );
	assert( Vector!(3.0,4.0).length == 5.0 );
	assert( cross(inplace,inplace) == Vector!(0,0,0) );
	assert( dot(inplace,inplace) == inplace.sqLength );
	assert( rotatedHalfPi(Vector!(2,1)) == Vector!(-1,2) );
	assert( rotatedMinusHalfPi(Vector!(2,1)) == Vector!(1,-2) );
	auto test = Vector!(1,2,3); test += 2; assert( test == Vector!(3,4,5) );
	test = Vector!(3,4,5); test -= 2; assert( test == Vector!(1,2,3) );
	test = Vector!(1,2,3); test *= 2; assert( test == Vector!(2,4,6) );
	test = Vector!(2,4,6); test /= 2; assert( test == Vector!(1,2,3) );
	assert( (Vector!(1,2,3) + 2) == Vector!(3,4,5) );
	assert( (Vector!(3,4,5) - 2) == Vector!(1,2,3) );
	assert( (Vector!(1,2,3) * 2) == Vector!(2,4,6) );
	assert( (Vector!(2,4,6) / 2) == Vector!(1,2,3) );
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Common vector types
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
alias TVector!(int,2) vec2i;
alias TVector!(int,3) vec3i;
alias TVector!(int,4) vec4i;
alias TVector!(float,2) vec2f;
alias TVector!(float,3) vec3f;
alias TVector!(float,4) vec4f;
alias TVector!(real,2) vec2r;
alias TVector!(real,3) vec3r;
alias TVector!(real,4) vec4r;
